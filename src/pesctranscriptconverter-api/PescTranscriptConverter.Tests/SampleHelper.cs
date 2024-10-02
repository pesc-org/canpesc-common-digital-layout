using System.Reflection;
using System.Text;

namespace PescTranscriptConverter.Tests;
public static class SampleHelper
{
    // Reads the embedded resource as a string.
    public static string ReadResourceAsString(string resourceName)
    {
        var assembly = Assembly.GetExecutingAssembly();
        var resourcePath = $"PescTranscriptConverter.Tests.TranscriptSamples.{resourceName}";
        var a = assembly.GetManifestResourceNames();
        using (var stream = assembly.GetManifestResourceStream(resourcePath))
        {
            if (stream == null) throw new InvalidOperationException($"Resource {resourcePath} not found.");

            using (var reader = new StreamReader(stream, Encoding.UTF8))
            {
                return reader.ReadToEnd();
            }
        }
    }

    // Reads the embedded resource as a byte array.
    public static byte[] ReadResourceAsBytes(string resourceName)
    {
        var assembly = Assembly.GetExecutingAssembly();
        var resourcePath = $"PescTranscriptConverter.Tests.TranscriptSamples.{resourceName}";

        using (var stream = assembly.GetManifestResourceStream(resourcePath))
        {
            if (stream == null) throw new InvalidOperationException($"Resource {resourcePath} not found.");

            using (var memoryStream = new MemoryStream())
            {
                stream.CopyTo(memoryStream);
                return memoryStream.ToArray();
            }
        }
    }
}
