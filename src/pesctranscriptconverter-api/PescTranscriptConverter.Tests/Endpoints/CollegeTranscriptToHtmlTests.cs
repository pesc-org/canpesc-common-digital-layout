using Microsoft.Extensions.DependencyInjection;

namespace PescTranscriptConverter.Tests.Endpoints;

public class CollegeTranscriptToHtmlTests : IAsyncLifetime
{
    private DistributedApplication? _app;
    private ResourceNotificationService? _notificationService;
    private PescTranscriptConverterClient? _apiClient;

    public async Task InitializeAsync()
    {
        var appHost = await DistributedApplicationTestingBuilder.CreateAsync<Projects.PescTranscriptConverter_AppHost>();

        _app = await appHost.BuildAsync();
        _notificationService = _app.Services.GetRequiredService<ResourceNotificationService>();
        await _app.StartAsync();
        _apiClient = new PescTranscriptConverterClient(_app.CreateHttpClient("api"));
    }

    public Task DisposeAsync()
    {
        _app?.Dispose();

        return Task.CompletedTask;
    }

    [Theory]
    [InlineData("Canada.Ontario.College.CollegeTranscript.xml", "en-CA", "<html")]
    [InlineData("Canada.Ontario.University.UniversityTranscript.xml", "en-CA", "<html")]
    [InlineData("Canada.Ontario.University.UniversityTranscript2.xml", "en-CA", "<html")]
    [InlineData("Canada.Nova_Scotia.University.UniversityTranscript1.xml", "en-CA", "<html")]
    [InlineData("Canada.Nova_Scotia.University.UniversityTranscript2.xml", "en-CA", "<html")]
    public async Task Should_convert_college_pesc_to_html(string pescXml, string locale, string assertContains)
    {
        // Arrange
        var request = new CollegeTranscriptToHtmlRequest
        {
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Locale = locale
        };

        await _notificationService.WaitForResourceAsync("api", KnownResourceStates.Running).WaitAsync(TimeSpan.FromSeconds(30));

        // Act
        var response = await _apiClient!.CollegeTranscriptToHtmlAsync(request);

        // Assert
        response.Should().NotBeNull();
        response.Html.Should().Contain(assertContains);
    }
}
