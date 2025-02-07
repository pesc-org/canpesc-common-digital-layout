using Microsoft.Extensions.DependencyInjection;

namespace PescTranscriptConverter.Tests.Endpoints;

[CollectionDefinition(nameof(HighSchoolTranscriptToPdfTests))]
public class HighSchoolTranscriptToPdfTestsCollection: ICollectionFixture<Fixture>;

[Collection(nameof(HighSchoolTranscriptToPdfTests))]
public class HighSchoolTranscriptToPdfTests
{
    private PescTranscriptConverterClient? _apiClient;

    public HighSchoolTranscriptToPdfTests(Fixture fixture)
    {
        _apiClient = fixture.GetApiClient();
    }

    [Theory]
    [InlineData("Canada.Ontario.HighSchool.HighSchoolTranscript.xml", "en-CA")]
    [InlineData("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript.xml", "en-CA")]
    [InlineData("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript2.xml", "en-CA")]
    [InlineData("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript3.xml", "en-CA")]
    public async Task Should_convert_highschool_pesc_to_pdf(string pescXml, string locale)
    {
        // Arrange
        var request = new HighSchoolTranscriptToPdfRequest
        {
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Locale = locale
        };

        // Act
        var response = await _apiClient!.HighSchoolTranscriptToPdfAsync(request);

        // Assert
        response.Should().NotBeNull();
        var headersLength = Convert.ToInt32(response.Headers["Content-Length"].First());
        using var memStream = new MemoryStream();
        await response.Stream.CopyToAsync(memStream);
        memStream.Length.Should().Be(headersLength);
    }
}
