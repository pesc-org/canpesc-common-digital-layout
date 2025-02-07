namespace PescTranscriptConverter.Tests.Endpoints;

[CollectionDefinition(nameof(CollegeTranscriptToHtmlTests))]
public class CollegeTranscriptToHtmlTestsCollection : ICollectionFixture<Fixture>;

[Collection(nameof(CollegeTranscriptToHtmlTests))]
public class CollegeTranscriptToHtmlTests
{
    private PescTranscriptConverterClient? _apiClient;

    public CollegeTranscriptToHtmlTests(Fixture fixture)
    {
        _apiClient = fixture.GetApiClient();
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


        // Act
        var response = await _apiClient!.CollegeTranscriptToHtmlAsync(request);

        // Assert
        response.Should().NotBeNull();
        response.Html.Should().Contain(assertContains);
    }
}
