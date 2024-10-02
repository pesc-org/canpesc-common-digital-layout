using Microsoft.Extensions.DependencyInjection;

namespace PescTranscriptConverter.Tests.Endpoints;

public class CollegeTranscriptToPdfTests : IAsyncLifetime
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
    [InlineData("Canada.Ontario.College.CollegeTranscript.xml", "en-CA")]
    [InlineData("Canada.Ontario.University.UniversityTranscript.xml", "en-CA")]
    [InlineData("Canada.Ontario.University.UniversityTranscript2.xml", "en-CA")]
    [InlineData("Canada.Nova_Scotia.University.UniversityTranscript1.xml", "en-CA")]
    [InlineData("Canada.Nova_Scotia.University.UniversityTranscript2.xml", "en-CA")]
    public async Task Should_convert_college_pesc_to_pdf(string pescXml, string locale)
    {
        // Arrange
        var request = new CollegeTranscriptToPdfRequest
        {
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Locale = locale
        };

        // Act
        var response = await _apiClient!.CollegeTranscriptToPdfAsync(request);

        // Assert
        response.Should().NotBeNull();
        var headersLength = Convert.ToInt32(response.Headers["Content-Length"].First());
        using var memStream = new MemoryStream();
        await response.Stream.CopyToAsync(memStream);
        memStream.Length.Should().Be(headersLength);
    }
}
