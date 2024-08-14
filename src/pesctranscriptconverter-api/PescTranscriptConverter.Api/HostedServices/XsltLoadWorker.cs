using System.Xml.Xsl;
using FastEndpoints;
using FluentStorage.Blobs;
using Microsoft.Extensions.Options;
using PescTranscriptConverter.Api.Config;

namespace PescTranscriptConverter.Api.HostedServices;

internal sealed class XsltLoadWorker(
    IServiceProvider serviceProvider,
    IOptions<CdlAssetsOptions> cdlOptions,
    IOptions<PdfAssetsOptions> pdfOptions,
    ILogger<XsltLoadWorker> logger) : IHostedService
{
    public async Task StartAsync(CancellationToken cancellationToken)
    {
        using var scope = serviceProvider.CreateScope();

        await CopyAssetsIfPresent(scope, "CdlStorage", cdlOptions.Value.RootDirectory, cancellationToken);
        await CopyAssetsIfPresent(scope, "PdfStorage", pdfOptions.Value.RootDirectory, cancellationToken);

        // Prime the XSLT transform singleton instances by resolving them first on startup
        scope.Resolve<XslCompiledTransform>("CollegeTranscript");
        scope.Resolve<XslCompiledTransform>("HighSchoolTranscript");
    }

    private async Task CopyAssetsIfPresent(IServiceScope scope, string keyedServiceName, string destinationAssetsDirectory, CancellationToken cancellationToken)
    {
        var blobStorage = ResolveKeyedBlobStorageAssets(scope, keyedServiceName);

        if (blobStorage is not null)
        {
            await CopyBlobFilesToDestinationAssets(blobStorage, destinationAssetsDirectory, cancellationToken);
        }
    }

    private IBlobStorage? ResolveKeyedBlobStorageAssets(IServiceScope scope, string keyedServiceName)
    {
        var storage = scope.TryResolve<IBlobStorage>(keyedServiceName);

        if (storage is null)
        {
            logger.LogWarning($"Blob storage connection string was not set for {keyedServiceName}. Defaults will be used.");
        }

        return storage;
    }

    private async Task CopyBlobFilesToDestinationAssets(IBlobStorage blobStorage, string destinationAssetsDirectory, CancellationToken cancellationToken)
    {
        var blobs = await blobStorage.ListAsync(recurse: true, cancellationToken: cancellationToken);
        foreach (var blob in blobs)
        {
            var blobPath = $"{destinationAssetsDirectory.TrimEnd('/', '\\')}{blob.FullPath}"; // blob FullPath already has a leading slash, so we trim all the destination directory slashes
            if (blob.IsFolder)
            {
                Directory.CreateDirectory(blobPath);
            }
            else if (blob.IsFile)
            {
                await blobStorage.ReadToFileAsync(blob.FullPath, blobPath, cancellationToken);
            }
        }
    }

    public Task StopAsync(CancellationToken cancellationToken)
    {
        return Task.CompletedTask;
    }
}
