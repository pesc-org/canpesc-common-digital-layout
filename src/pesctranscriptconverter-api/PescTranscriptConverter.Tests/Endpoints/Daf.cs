namespace PescTranscriptConverter.Tests.Endpoints;
public class Daf : IAsyncInitializer, IAsyncDisposable
{
    private DistributedApplication _app = default!;

    public async Task InitializeAsync()
    {
        var appHost = await DistributedApplicationTestingBuilder.CreateAsync<Projects.PescTranscriptConverter_AppHost>();
        _app = await appHost.BuildAsync();
        await _app.StartAsync();
    }
    public ValueTask DisposeAsync()
    {
        return _app.DisposeAsync();
    }

    public PescTranscriptConverterClient GetApiClient() => new PescTranscriptConverterClient(_app.CreateHttpClient("api"));
    public ResourceNotificationService GetNotificationService() => _app.Services.GetRequiredService<ResourceNotificationService>();
}
