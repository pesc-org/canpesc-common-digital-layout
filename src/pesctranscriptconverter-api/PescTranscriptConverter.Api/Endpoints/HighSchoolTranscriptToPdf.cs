using FastEndpoints;
using Gotenberg.Sharp.API.Client;
using Gotenberg.Sharp.API.Client.Domain.Builders;
using Gotenberg.Sharp.API.Client.Domain.Builders.Faceted;
using Microsoft.AspNetCore.Mvc;
using PescTranscriptConverter.Api.Commands;
using PescTranscriptConverter.Api.Services;

namespace PescTranscriptConverter.Api.Endpoints;

public class HighSchoolTranscriptToPdf : Endpoint<HighSchoolTranscriptToPdfRequest>
{
    public override void Configure()
    {
        Post("/highschool-transcript/to-pdf");
        Options(o => o.WithTags("High School Transcripts"));
        Description(d => d.Produces(200, typeof(FileResult), "application/pdf"));
        AllowAnonymous();
    }

    public override async Task HandleAsync(HighSchoolTranscriptToPdfRequest req, CancellationToken ct)
    {
        var gotenbergClient = TryResolve<GotenbergSharpClient>();

        if (gotenbergClient is null)
        {
            ThrowError("The Gotenberg Http Client (for Pdf conversion) has not been configured. Please configure it in appsettings.json or the k8s environment. Then try again.");
        }

        var html = await new TransformToHtml
        {
            Pesc = req.Pesc,
            Locale = req.Locale,
            Xslt = "HighSchoolTranscript"
        }.ExecuteAsync(ct);

        var footerHtml = await Resolve<FetchCdlAssets.PdfFooter>().Invoke();
        var headerHtml = await Resolve<FetchCdlAssets.PdfHeader>().Invoke();

        var builder = new HtmlRequestBuilder()
            .AddDocument(doc =>
                doc.SetBody(html)
                    .SetHeader(headerHtml)
                    .SetFooter(footerHtml)
            ).WithDimensions(dims =>
            {
                dims.SetPaperSize(PaperSizes.Letter)
                    .LandScape()
                    .SetMargins(Margins.Normal)
                    .SetScale(.99);
            });

        var request = await builder.BuildAsync();

        var result = await gotenbergClient.HtmlToPdfAsync(request, ct);

        await SendStreamAsync(stream: result, fileLengthBytes: result.Length, contentType: "application/pdf", fileName: $"HighSchoolTranscript_{DateTime.Now.ToString("yyyyMMdd_hhMMss")}.pdf", cancellation: ct);
    }
}

public class HighSchoolTranscriptToPdfRequest
{
    public string Pesc { get; set; } = default!;
    public string Locale { get; set; } = default!;
}
