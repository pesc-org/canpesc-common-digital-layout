using Microsoft.Extensions.DependencyInjection;

namespace PescTranscriptConverter.Tests.Endpoints;

public class Fixture : IAsyncLifetime
{
    private DistributedApplication? _app;
    private ResourceNotificationService? _notificationService;

    public ValueTask DisposeAsync()
    {
        _app?.Dispose();

        return ValueTask.CompletedTask;
    }

    public async ValueTask InitializeAsync()
    {
        var appHost = await DistributedApplicationTestingBuilder.CreateAsync<Projects.PescTranscriptConverter_AppHost>();

        _app = await appHost.BuildAsync();
        _notificationService = _app.Services.GetRequiredService<ResourceNotificationService>();
        await _app.StartAsync();
        await _notificationService.WaitForResourceAsync("api", KnownResourceStates.Running).WaitAsync(TimeSpan.FromSeconds(30));
    }

    public PescTranscriptConverterClient GetApiClient() => new PescTranscriptConverterClient(_app!.CreateHttpClient("api"));
}
