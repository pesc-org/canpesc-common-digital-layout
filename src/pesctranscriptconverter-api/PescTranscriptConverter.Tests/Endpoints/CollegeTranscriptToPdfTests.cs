namespace PescTranscriptConverter.Tests.Endpoints;

[CollectionDefinition(nameof(CollegeTranscriptToPdfTests))]
public class CollegeTranscriptToPdfTestsCollection : ICollectionFixture<Fixture>;

[Collection(nameof(CollegeTranscriptToPdfTests))]
public class CollegeTranscriptToPdfTests
{
    private PescTranscriptConverterClient? _apiClient;

    public CollegeTranscriptToPdfTests(Fixture fixture)
    {
        _apiClient = fixture.GetApiClient();
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
        var response = await _apiClient!.CollegeTranscriptToPdfAsync(request, TestContext.Current.CancellationToken);

        // Assert
        response.Should().NotBeNull();
        var headersLength = Convert.ToInt32(response.Headers["Content-Length"].First());
        using var memStream = new MemoryStream();
        await response.Stream.CopyToAsync(memStream, TestContext.Current.CancellationToken);
        memStream.Length.Should().Be(headersLength);
    }
}
