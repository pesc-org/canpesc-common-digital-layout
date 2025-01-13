using PescTranscriptConverter.Api.Commands;

namespace PescTranscriptConverter.Tests.Commands;

[ClassDataSource<Waf>(Shared = SharedType.None)]
public class TransformToHtmlTests
{
    private readonly Waf _waf;

    public TransformToHtmlTests(Waf waf)
    {
        _waf = waf;
    }

    [Test]
    [Arguments("Canada.Ontario.College.CollegeTranscript.xml", "CollegeTranscript", "en-CA", "Last Name:")]
    [Arguments("Canada.Ontario.College.CollegeTranscript.xml", "CollegeTranscript", "en-US", "Surname:")]
    [Arguments("Canada.Ontario.College.CollegeTranscript.xml", "CollegeTranscript", "fr-CA", "Nom :")]
    public async Task Should_localize_conversion(string pescXml, string xslt, string locale, string assertContains)
    {
        // Arrange
        using var scope = _waf.Services.CreateScope();
        var handler = scope.ServiceProvider.GetRequiredService<TransformToHtmlHandler>();
        var request = new TransformToHtml
        {
            Locale = locale,
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Xslt = xslt
        };

        // Act
        var html = await handler.ExecuteAsync(request, CancellationToken.None);

        // Assert
        await Assert.That(html).Contains(assertContains);
    }

    public class Waf : IDisposable
    {
        private WebApplicationFactory<Api.Program> _app;

        public IServiceProvider Services => _app.Services;

        public Waf()
        {
            _app = new WebApplicationFactory<Api.Program>().WithWebHostBuilder(
                b =>
                {
                    b.UseEnvironment("Testing");
                    b.ConfigureServices(s =>
                    {
                        s.AddTransient<TransformToHtmlHandler>();
                    });
                });
        }

        public HttpClient CreateClient() => _app.CreateClient();

        public void Dispose() => _app.Dispose();
    }
}
