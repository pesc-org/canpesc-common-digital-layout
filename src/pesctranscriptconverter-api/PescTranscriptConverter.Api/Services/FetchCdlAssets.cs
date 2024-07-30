namespace PescTranscriptConverter.Api.Services;

public static class FetchCdlAssets
{
    public delegate Task<string> PdfHeader();
    public delegate Task<string> PdfFooter();
}
