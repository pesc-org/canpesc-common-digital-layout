namespace PescTranscriptConverter.Tests.Endpoints;

[ParallelLimiter<DafParallelLimit>]
[ClassDataSource<Daf>(Shared = SharedType.None)]
public class CollegeTranscriptToHtmlTests
{
    private readonly Daf _daf;

    public CollegeTranscriptToHtmlTests(Daf daf)
    {
        _daf = daf;
    }

    [Test]
    [Arguments("Canada.Ontario.College.CollegeTranscript.xml", "en-CA", "<html")]
    [Arguments("Canada.Ontario.University.UniversityTranscript.xml", "en-CA", "<html")]
    [Arguments("Canada.Ontario.University.UniversityTranscript2.xml", "en-CA", "<html")]
    [Arguments("Canada.Nova_Scotia.University.UniversityTranscript1.xml", "en-CA", "<html")]
    [Arguments("Canada.Nova_Scotia.University.UniversityTranscript2.xml", "en-CA", "<html")]
    public async Task Should_convert_college_pesc_to_html(string pescXml, string locale, string assertContains)
    {
        // Arrange
        var apiClient = _daf.GetApiClient();
        var notificationService = _daf.GetNotificationService();

        var request = new CollegeTranscriptToHtmlRequest
        {
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Locale = locale
        };

        await notificationService.WaitForResourceAsync("api", KnownResourceStates.Running).WaitAsync(TimeSpan.FromSeconds(30));

        // Act
        var response = await apiClient!.CollegeTranscriptToHtmlAsync(request);

        // Assert
        await Assert.That(response).IsNotNull();
        await Assert.That(response.Html).Contains(assertContains);
    }
}
