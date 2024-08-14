namespace PescTranscriptConverter.Api.Config;

public class PdfAssetsOptions
{
    public static string SectionName = "PdfAssets";
    public string RootDirectory { get; set; } = default!;
    public string PdfHeader { get; set; } = default!;
    public string PdfFooter { get; set; } = default!;
}
