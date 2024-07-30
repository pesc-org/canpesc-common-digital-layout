using System.Xml;
using System.Xml.Xsl;
using FluentStorage;
using Gotenberg.Sharp.API.Client;
using Gotenberg.Sharp.API.Client.Domain.Settings;
using Gotenberg.Sharp.API.Client.Extensions;
using Microsoft.Extensions.Options;
using PescTranscriptConverter.Api.Config;
using PescTranscriptConverter.Api.Services;

namespace PescTranscriptConverter.Api;

public static partial class ProgramExtensions
{
    public static void AddCustomFluentStorage(this WebApplicationBuilder builder, string connectionStringName)
    {
        var blobConnectionString = builder.Configuration.GetConnectionString(connectionStringName);

        if (string.IsNullOrWhiteSpace(blobConnectionString))
        {
            return;
        }

        switch (blobConnectionString)
        {
            case var s when s.StartsWith("disk", StringComparison.OrdinalIgnoreCase):
                break;
            case var s when s.StartsWith("aws.s3", StringComparison.OrdinalIgnoreCase):
                StorageFactory.Modules.UseAwsStorage();
                break;
            case var s when s.StartsWith("google.storage", StringComparison.OrdinalIgnoreCase):
                StorageFactory.Modules.UseGoogleCloudStorage();
                break;
            case var s when s.StartsWith("azure.file", StringComparison.OrdinalIgnoreCase):
                StorageFactory.Modules.UseAzureFilesStorage();
                break;
            case var s when s.StartsWith("azure.blob", StringComparison.OrdinalIgnoreCase):
                StorageFactory.Modules.UseAzureBlobStorage();
                break;
            default:
                throw new Exception("Please use a supported blob storage connection string. disk://, aws.s3://, google.storage://, azure.file://, azure.blob://");
        }

        builder.Services.AddKeyedTransient(connectionStringName, (p, _) => StorageFactory.Blobs.FromConnectionString(blobConnectionString));
    }

    public static void AddCustomApplicationServices(this WebApplicationBuilder builder)
    {
        builder.Services.AddKeyedSingleton("CollegeTranscript", (p, _) =>
        {
            var opts = p.GetRequiredService<IOptions<CdlAssetsOptions>>().Value;
            var transform = new XslCompiledTransform(true);
            XmlUrlResolver resolver = new XmlUrlResolver();
            XsltSettings settings = new XsltSettings(true, false);

            transform.Load(Path.Combine(opts.RootDirectory, "CollegeTranscript.xsl"), settings, new XmlUrlResolver());
            return transform;
        });

        builder.Services.AddKeyedSingleton("HighSchoolTranscript", (p, _) =>
        {
            var opts = p.GetRequiredService<IOptions<CdlAssetsOptions>>().Value;
            var transform = new XslCompiledTransform(true);
            XmlUrlResolver resolver = new XmlUrlResolver();
            XsltSettings settings = new XsltSettings(true, false);

            transform.Load(Path.Combine(opts.RootDirectory, "HighSchoolTranscript.xsl"), settings, new XmlUrlResolver());
            return transform;
        });

        var gotenbergConfig = builder.Configuration.GetSection(nameof(GotenbergSharpClient));

        if (gotenbergConfig.Get<GotenbergSharpClientOptions>()?.ServiceUrl is not null)
        {
            builder.Services.AddOptions<GotenbergSharpClientOptions>()
                .Bind(gotenbergConfig);
            builder.Services.AddGotenbergSharpClient();
        }

        var cdlAssetsConfig = builder.Configuration.GetSection(CdlAssetsOptions.SectionName);
        builder.Services.AddOptions<CdlAssetsOptions>()
            .Bind(cdlAssetsConfig);

        var pdfAssetsConfig = builder.Configuration.GetSection(PdfAssetsOptions.SectionName);
        builder.Services.AddOptions<PdfAssetsOptions>()
            .Bind(pdfAssetsConfig);

        builder.Services.AddSingleton<FetchPdfAssets.PdfFooter>(s => () =>
        {
            var opts = s.GetRequiredService<IOptions<PdfAssetsOptions>>().Value;
            return File.ReadAllTextAsync(Path.Combine(opts.RootDirectory, opts.PdfFooter));
        });
        builder.Services.AddSingleton<FetchPdfAssets.PdfHeader>(s => () =>
        {
            var opts = s.GetRequiredService<IOptions<PdfAssetsOptions>>().Value;
            return File.ReadAllTextAsync(Path.Combine(opts.RootDirectory, opts.PdfHeader));
        });
    }

    public static IEndpointConventionBuilder MapScalarUi(this IEndpointRouteBuilder endpoints)
    {
        return endpoints.MapGet("/scalar/{documentName}", (string documentName) => Results.Content($$"""
              <!doctype html>
              <html>
              <head>
                  <title>Scalar API Reference -- {{documentName}}</title>
                  <meta charset="utf-8" />
                  <meta
                  name="viewport"
                  content="width=device-width, initial-scale=1" />
              </head>
              <body>
                  <script
                  id="api-reference"
                  data-url="/swagger/{{documentName}}/swagger.json"></script>
                  <script>
                  var configuration = {
                      theme: 'purple',
                  }
              
                  document.getElementById('api-reference').dataset.configuration =
                      JSON.stringify(configuration)
                  </script>
                  <script src="https://cdn.jsdelivr.net/npm/@scalar/api-reference"></script>
              </body>
              </html>
              """, "text/html")).ExcludeFromDescription();
    }
}
