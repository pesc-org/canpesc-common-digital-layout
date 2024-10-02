namespace PescTranscriptConverter.Api.Services;

public static class FetchPdfAssets
{
    public delegate Task<string> PdfHeader();
    public delegate Task<string> PdfFooter();
}
