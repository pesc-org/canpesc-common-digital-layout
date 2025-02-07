using Microsoft.Extensions.DependencyInjection;

namespace PescTranscriptConverter.Tests.Endpoints;

[CollectionDefinition(nameof(HighSchoolTranscriptToHtmlTests))]
public class HighSchoolTranscriptToHtmlTestsCollection : ICollectionFixture<Fixture>;

[Collection(nameof(HighSchoolTranscriptToHtmlTests))]
public class HighSchoolTranscriptToHtmlTests
{
    private PescTranscriptConverterClient? _apiClient;

    public HighSchoolTranscriptToHtmlTests(Fixture fixture)
    {
        _apiClient = fixture.GetApiClient();
    }

    [Theory]
    [InlineData("Canada.Ontario.HighSchool.HighSchoolTranscript.xml", "en-CA", "<html")]
    [InlineData("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript.xml", "en-CA", "<html")]
    [InlineData("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript2.xml", "en-CA", "<html")]
    [InlineData("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript3.xml", "en-CA", "<html")]
    public async Task Should_convert_highschool_pesc_to_html(string pescXml, string locale, string assertContains)
    {
        // Arrange
        var request = new HighSchoolTranscriptToHtmlRequest
        {
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Locale = locale
        };

        // Act
        var response = await _apiClient!.HighSchoolTranscriptToHtmlAsync(request);

        // Assert
        response.Should().NotBeNull();
        response.Html.Should().Contain(assertContains);
    }
}
