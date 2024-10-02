using Microsoft.Extensions.DependencyInjection;
using PescTranscriptConverter.Api.Commands;

namespace PescTranscriptConverter.Tests.Commands;
public class Fixture : AppFixture<Program>
{
    protected override void ConfigureServices(IServiceCollection s)
    {
        s.AddTransient<TransformToHtmlHandler>();
    }
}
