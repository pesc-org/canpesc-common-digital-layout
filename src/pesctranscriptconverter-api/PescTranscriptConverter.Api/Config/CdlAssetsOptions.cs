namespace PescTranscriptConverter.Api.Config;

public class CdlAssetsOptions
{
    public static string SectionName = "CdlAssets";
    public string RootDirectory { get; set; } = default!;
    public string PdfHeader { get; set; } = default!;
    public string PdfFooter { get; set; } = default!;
}
