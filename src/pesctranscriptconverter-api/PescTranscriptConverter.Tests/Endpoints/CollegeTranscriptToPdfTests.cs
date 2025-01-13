namespace PescTranscriptConverter.Tests.Endpoints;

[ParallelLimiter<DafParallelLimit>]
[ClassDataSource<Daf>(Shared = SharedType.None)]
public class CollegeTranscriptToPdfTests
{
    private readonly Daf _daf;

    public CollegeTranscriptToPdfTests(Daf daf)
    {
        _daf = daf;
    }

    [Test]
    [Arguments("Canada.Ontario.College.CollegeTranscript.xml", "en-CA")]
    [Arguments("Canada.Ontario.University.UniversityTranscript.xml", "en-CA")]
    [Arguments("Canada.Ontario.University.UniversityTranscript2.xml", "en-CA")]
    [Arguments("Canada.Nova_Scotia.University.UniversityTranscript1.xml", "en-CA")]
    [Arguments("Canada.Nova_Scotia.University.UniversityTranscript2.xml", "en-CA")]
    public async Task Should_convert_college_pesc_to_pdf(string pescXml, string locale)
    {
        // Arrange
        var apiClient = _daf.GetApiClient();
        var notificationService = _daf.GetNotificationService();

        var request = new CollegeTranscriptToPdfRequest
        {
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Locale = locale
        };

        await notificationService.WaitForResourceAsync("api", KnownResourceStates.Running).WaitAsync(TimeSpan.FromSeconds(30));

        // Act
        var response = await apiClient!.CollegeTranscriptToPdfAsync(request);

        // Assert
        await Assert.That(response).IsNotNull();
        var headersLength = Convert.ToInt64(response.Headers["Content-Length"].First());
        using var memStream = new MemoryStream();
        await response.Stream.CopyToAsync(memStream);
        await Assert.That(memStream.Length).IsEqualTo(headersLength);
    }
}
