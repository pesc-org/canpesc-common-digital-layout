using FastEndpoints;
using Gotenberg.Sharp.API.Client;
using Gotenberg.Sharp.API.Client.Domain.Builders;
using Gotenberg.Sharp.API.Client.Domain.Builders.Faceted;
using Microsoft.AspNetCore.Mvc;
using PescTranscriptConverter.Api.Commands;
using PescTranscriptConverter.Api.Services;

namespace PescTranscriptConverter.Api.Endpoints;

public class CollegeTranscriptToPdf : Endpoint<CollegeTranscriptToPdfRequest>
{
    public override void Configure()
    {
        Post("/college-transcript/to-pdf");
        Options(o => o.WithTags("College Transcripts"));
        Description(d => d.Produces(200, typeof(FileResult), "application/pdf"));
        AllowAnonymous();
    }

    public override async Task HandleAsync(CollegeTranscriptToPdfRequest req, CancellationToken ct)
    {
        var gotenbergClient = TryResolve<GotenbergSharpClient>();

        if (gotenbergClient is null)
        {
            ThrowError("The Gotenberg Http Client (for Pdf conversion) has not been configured. Please configure it first (this is a deployment infrastructure configuration). Then retry.");
        }

        var html = await new TransformToHtml
        {
            Pesc = req.Pesc,
            Locale = req.Locale,
            Xslt = "CollegeTranscript"
        }.ExecuteAsync(ct);

        var footerHtml = await Resolve<FetchPdfAssets.PdfFooter>().Invoke();
        var headerHtml = await Resolve<FetchPdfAssets.PdfHeader>().Invoke();

        var builder = new HtmlRequestBuilder()
            .AddDocument(doc =>
                doc.SetBody(html)
                    .SetHeader(headerHtml)
                    .SetFooter(footerHtml)
            ).WithDimensions(dims =>
            {
                dims.SetPaperSize(PaperSizes.Letter)
                    .SetMargins(Margins.None)
                    .SetScale(.99);
            });

        var request = await builder.BuildAsync();

        var result = await gotenbergClient.HtmlToPdfAsync(request, ct);

        await SendStreamAsync(stream: result, fileLengthBytes: result.Length, contentType: "application/pdf", fileName: $"CollegeTranscript_{DateTime.Now.ToString("yyyyMMdd_hhMMss")}.pdf", cancellation: ct);
    }
}

public class CollegeTranscriptToPdfRequest
{
    public string Pesc { get; set; } = default!;
    public string Locale { get; set; } = default!;
}
