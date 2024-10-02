using FastEndpoints;
using PescTranscriptConverter.Api.Commands;

namespace PescTranscriptConverter.Api.Endpoints;

public class CollegeTranscriptToHtml : Endpoint<CollegeTranscriptToHtmlRequest, CollegeTranscriptToHtmlResponse>
{
    public override void Configure()
    {
        Post("/college-transcript/to-html");
        Options(o => o.WithTags("College Transcripts"));
        AllowAnonymous();
    }

    public override async Task HandleAsync(CollegeTranscriptToHtmlRequest req, CancellationToken ct)
    {
        var html = await new TransformToHtml
        {
            Pesc = req.Pesc,
            Locale = req.Locale,
            Xslt = "CollegeTranscript"
        }.ExecuteAsync(ct);

        await SendAsync(new CollegeTranscriptToHtmlResponse { Html = html }, cancellation: ct);
    }
}

public class CollegeTranscriptToHtmlRequest
{
    public string Pesc { get; set; } = default!;
    public string Locale { get; set; } = default!;
}

public class CollegeTranscriptToHtmlResponse
{
    public string Html { get; set; } = default!;
}
