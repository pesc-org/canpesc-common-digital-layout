namespace PescTranscriptConverter.Tests.Endpoints;

[ParallelLimiter<DafParallelLimit>]
[ClassDataSource<Daf>(Shared = SharedType.None)]
public class HighSchoolTranscriptToPdfTests
{
    private readonly Daf _daf;

    public HighSchoolTranscriptToPdfTests(Daf daf)
    {
        _daf = daf;
    }

    [Test]
    [Arguments("Canada.Ontario.HighSchool.HighSchoolTranscript.xml", "en-CA")]
    [Arguments("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript.xml", "en-CA")]
    [Arguments("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript2.xml", "en-CA")]
    [Arguments("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript3.xml", "en-CA")]
    public async Task Should_convert_highschool_pesc_to_pdf(string pescXml, string locale)
    {
        // Arrange
        var apiClient = _daf.GetApiClient();
        var notificationService = _daf.GetNotificationService();

        var request = new HighSchoolTranscriptToPdfRequest
        {
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Locale = locale
        };

        await notificationService.WaitForResourceAsync("api", KnownResourceStates.Running).WaitAsync(TimeSpan.FromSeconds(30));

        // Act
        var response = await apiClient!.HighSchoolTranscriptToPdfAsync(request);

        // Assert
        await Assert.That(response).IsNotNull();
        var headersLength = Convert.ToInt32(response.Headers["Content-Length"].First());
        using var memStream = new MemoryStream();
        await response.Stream.CopyToAsync(memStream);
        await Assert.That(memStream.Length).IsEqualTo(headersLength);
    }
}
