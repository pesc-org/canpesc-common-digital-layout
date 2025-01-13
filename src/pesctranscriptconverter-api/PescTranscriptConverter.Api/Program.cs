using System.Text.Json;
using System.Text.Json.Serialization;
using FastEndpoints;
using FastEndpoints.ClientGen;
using FastEndpoints.Swagger;
using PescTranscriptConverter.Api.HostedServices;

namespace PescTranscriptConverter.Api;

public class Program
{
    public static async Task<int> Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // override XmlException: Resolving of external URIs was prohibited.
        AppContext.SetSwitch("Switch.System.Xml.AllowDefaultResolver", true);

        // Add service defaults & Aspire components.
        builder.AddServiceDefaults();

        // Add services to the container.
        builder.Services.AddProblemDetails();
        builder.Services.AddFastEndpoints()
            .SwaggerDocument(o =>
            {
                o.DocumentSettings = s =>
                {
                    s.DocumentName = "latest";
                    s.Title = "PESC Transcript Converter API";
                    s.Version = "v1";
                };
                o.AutoTagPathSegmentIndex = 0; // disable auto-tagging
                o.ShortSchemaNames = true;
                o.RemoveEmptyRequestSchema = true;
            })
            .ConfigureHttpJsonOptions(o =>
            {
                o.SerializerOptions.Converters.Add(new JsonStringEnumConverter(JsonNamingPolicy.CamelCase));
            });

        builder.AddCustomFluentStorage("CdlStorage");
        builder.AddCustomFluentStorage("PdfStorage");
        builder.AddCustomApplicationServices();
        builder.Services.AddHostedService<XsltLoadWorker>();

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        app.UseExceptionHandler();

        app.MapDefaultEndpoints();

        app.UseFastEndpoints(c =>
        {
            c.Endpoints.ShortNames = true;
            c.Errors.UseProblemDetails();
            c.Serializer.Options.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull;
        });
        app.UseOpenApi();
        app.MapScalarUi();

        await app.GenerateClientsAndExitAsync(
                "latest", app.Configuration["NSwagGeneratorOutputPath"] ?? Directory.GetCurrentDirectory(),
                csSettings: c =>
                {
                    c.ClassName = "PescTranscriptConverterClient";
                    c.CSharpGeneratorSettings.Namespace = "PescTranscriptConverter.Tests";
                    c.CSharpGeneratorSettings.JsonLibrary = NJsonSchema.CodeGeneration.CSharp.CSharpJsonLibrary.SystemTextJson;

                    c.GenerateClientInterfaces = true;
                    c.GenerateOptionalParameters = true;
                    c.UseBaseUrl = false;
                },
                tsSettings: null
            );

        app.Run();

        return 0;
    }
}
