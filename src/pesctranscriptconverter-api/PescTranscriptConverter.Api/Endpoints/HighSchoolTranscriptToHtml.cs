using FastEndpoints;
using PescTranscriptConverter.Api.Commands;

namespace PescTranscriptConverter.Api.Endpoints;

public class HighSchoolTranscriptToHtml : Endpoint<HighSchoolTranscriptToHtmlRequest, HighSchoolTranscriptToHtmlResponse>
{
    public override void Configure()
    {
        Post("/highschool-transcript/to-html");
        Options(o => o.WithTags("High School Transcripts"));
        AllowAnonymous();
    }

    public override async Task HandleAsync(HighSchoolTranscriptToHtmlRequest req, CancellationToken ct)
    {
        var html = await new TransformToHtml
        {
            Pesc = req.Pesc,
            Locale = req.Locale,
            Xslt = "HighSchoolTranscript"
        }.ExecuteAsync(ct);

        await Send.OkAsync(new HighSchoolTranscriptToHtmlResponse { Html = html }, cancellation: ct);
    }
}

public class HighSchoolTranscriptToHtmlRequest
{
    public string Pesc { get; set; } = default!;
    public string Locale { get; set; } = default!;
}

public class HighSchoolTranscriptToHtmlResponse
{
    public string Html { get; set; } = default!;
}
