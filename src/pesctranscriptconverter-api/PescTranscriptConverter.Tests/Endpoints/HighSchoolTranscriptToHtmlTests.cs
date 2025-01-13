namespace PescTranscriptConverter.Tests.Endpoints;

[ParallelLimiter<DafParallelLimit>]
[ClassDataSource<Daf>(Shared = SharedType.None)]
public class HighSchoolTranscriptToHtmlTests
{
    private readonly Daf _daf;

    public HighSchoolTranscriptToHtmlTests(Daf daf)
    {
        _daf = daf;
    }

    [Test]
    [Arguments("Canada.Ontario.HighSchool.HighSchoolTranscript.xml", "en-CA", "<html")]
    [Arguments("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript.xml", "en-CA", "<html")]
    [Arguments("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript2.xml", "en-CA", "<html")]
    [Arguments("Canada.Nova_Scotia.HighSchool.HighSchoolTranscript3.xml", "en-CA", "<html")]
    public async Task Should_convert_highschool_pesc_to_html(string pescXml, string locale, string assertContains)
    {
        // Arrange
        var apiClient = _daf.GetApiClient();
        var notificationService = _daf.GetNotificationService();

        var request = new HighSchoolTranscriptToHtmlRequest
        {
            Pesc = SampleHelper.ReadResourceAsString(pescXml),
            Locale = locale
        };

        await notificationService.WaitForResourceAsync("api", KnownResourceStates.Running).WaitAsync(TimeSpan.FromSeconds(30));

        // Act
        var response = await apiClient!.HighSchoolTranscriptToHtmlAsync(request);

        // Assert
        await Assert.That(response).IsNotNull();
        await Assert.That(response.Html).Contains(assertContains);
    }
}
