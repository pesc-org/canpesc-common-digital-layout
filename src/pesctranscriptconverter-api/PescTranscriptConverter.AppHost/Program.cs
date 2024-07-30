var builder = DistributedApplication.CreateBuilder(args);

var gotenberg = builder.AddContainer("gotenberg", "gotenberg/gotenberg", "8")
    .WithHttpEndpoint(name: "gotenberg", port: 3000, targetPort: 3000);

var apiService = builder.AddProject<Projects.PescTranscriptConverter_Api>("api")
    .WithReference(gotenberg.GetEndpoint("gotenberg"));

builder.Build().Run();
