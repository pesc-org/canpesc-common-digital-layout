using Microsoft.Extensions.DependencyInjection;
using PescTranscriptConverter.Api.Commands;

namespace PescTranscriptConverter.Tests.Commands;

public class TransformToHtmlHandlerTest(Fixture App) : TestBase<Fixture>
{
    [Theory]
    [InlineData("Canada.Ontario.College.CollegeTranscript.xml", "CollegeTranscript", "en-CA", "Last Name:")]
    [InlineData("Canada.Ontario.College.CollegeTranscript.xml", "CollegeTranscript", "en-US", "Surname:")]
    [InlineData("Canada.Ontario.College.CollegeTranscript.xml", "CollegeTranscript", "fr-CA", "Nom :")]
    public async Task Should_localize_conversion(string pescXml, string xslt, string locale, string assertContains)
    {
        // Arrange
        var handler = App.Services.GetRequiredService<TransformToHtmlHandler>();
        var request = new TransformToHtml
        {
            Locale = locale,
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Xslt = xslt
        };

        // Act
        var html = await handler.ExecuteAsync(request, CancellationToken.None);

        // Assert
        html.Should().Contain(assertContains);
    }
}
