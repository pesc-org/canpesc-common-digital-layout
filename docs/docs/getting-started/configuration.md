---
sidebar_position: 2
---

# Configuration

This API provides 2 primary functionalities.

**PESC to HTML** - Provide a pesc xml transcript and transform into a standard html transcript layout. This can be rendered in
a Website UI and localized for any language.

**PESC to PDF** - Takes the html output, and performs an additional step of rendering into a PDF to be viewed, download, and/or printed.

## PESC CDL API (to html)

CDL (Common Digital Layout) is an agreed upon style for displaying PESC xml as a transcript. This services primary functionality is taking the
PESC XML and transforming it into an html document. This docker service provides the extensibility to fully customize the transform and html
styles.

Feel free to review the default [CDL assets directory](https://github.com/pesc-org/canpesc-common-digital-layout/tree/main/assets/cdl), which
is copied verbatim into the docker image. Those assets provide all the logic to transform, layout and styling for the html output.

The following section lets you configure an additional directory where you can place any files in to override the default CDL assets.

### Environment Variables

| Name                                                                      | Default Value | Description                                                                                         |
| ------------------------------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------- |
| <span class="badge badge--secondary">ConnectionStrings__CdlStorage</span> | null          | Optional, if present, all contents are copied to the default cdl assets and overwrite if necessary. |

#### Valid Connection Strings

We leverage some Blob providers of [FluentStorage](https://github.com/robinrodricks/FluentStorage/wiki/Blob-Storage) to allow for a flexible number
of options for overriding the built in XSL Transformation, HTML and css styling of the HTML output. Our hope is that the CDL established offers
everything that is necessary, but should you want to customize it, then you will need to determine what assets to modify here, or possibly add
additional assets (For example, another language). If adding another language, we would accept a pull request and contributions, so the open
source community can benefit from the efforts.

| Provider                                                                                                            | Sample Connection String                                                                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Local Disk](https://github.com/robinrodricks/FluentStorage/wiki/Standard-Storage#local-disk)                       | <span class="badge badge--secondary">disk://path=path_to_directory</span>                                                                                                       |
| [AWS S3](https://github.com/robinrodricks/FluentStorage/wiki/AWS-S3-Storage#connection-strings)                     | <span class="badge badge--secondary">aws.s3://keyId=...;key=...;bucket=...;region=...</span>                                                                                    |
| [Google Cloud Storage](https://github.com/robinrodricks/FluentStorage/wiki/Google-Cloud-Storage#connection-strings) | <span class="badge badge--secondary">google.storage://bucket=...;cred=...</span>                                                                                    |
| [Azure File](https://github.com/robinrodricks/FluentStorage/wiki/Azure-Blob-Storage#file-shares)                    | <span class="badge badge--secondary">azure.file://account=account_name;key=secret_value</span>                                                                                  |
| [Azure Blob](https://github.com/robinrodricks/FluentStorage/wiki/Azure-Blob-Storage#blob-storage)                   | <span class="badge badge--secondary">azure.blob://account=account_name;key=secret_value</span> or<br/><span class="badge badge--secondary">azure.blob://development=true</span> |

### Example cdl assets override

We will create 2 files and a directory to look like this:

```
./your-workspace/docker-compose.yml
                /cdlassets/styles/Styles.xml
```

And first the contents of the Styles.xml, add a body tag at the top:

```xml title="footer.html"
<?xml version="1.0" encoding="utf-8"?>
<Styles>
    <Transcript>
    body {
        background-color: red;
    }
    ...Rest of default styles omitted, but should be present in your file, remember it overrites the default one
    </Transcript>
</Styles>
```

And then

```yaml title="docker-compose.yml"
services:
  # Your other services.
  
  gotenberg:
    image: gotenberg/gotenberg:8

  pesc-cdl-api:
    image: ghcr.io/pesc-org/canpesc-common-digital-layout/pesc-cdl-api:latest
    environment:
      - GotenbergSharpClient__ServiceUrl=http://gotenberg:3000
      - GotenbergSharpClient__HealthCheckUrl=http://gotenberg:3000/health
      - ConnectionStrings__pdfStorage=disk://path=/usr/local/pdf
    ports:
      - "4000:8080"
    volumes:
      - ./cdlassets:/usr/local/cdl
```

now, in that directory run the command

```cmd
docker-compose up
```

Then you should be able to navigate to http://localhost:4000, Test the html or pdf endpoint with the UI, and see the background is indeed red.

## PDF conversion (to pdf)

Very similar to the CDL assets, PDF output has some assets that are specific to generating the pdf document. They can be overridden through
the technique outlined in this section.

Feel free to review the default [PDF assets directory](https://github.com/pesc-org/canpesc-common-digital-layout/tree/main/assets/pdf), which
is copied verbatim into the docker image. As of writing this, the assets are 2 files `header.html` and `footer.html`

The following section lets you configure an additional directory where you can place any files in to override the default CDL assets.

### Environment Variables

| Name                                                                                          | Default Value | Description                                                                                         |
| --------------------------------------------------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------- |
| <span class="badge badge--secondary">ConnectionStrings__PdfStorage</span>                     | null          | Optional, if present, all contents are copied to the default pdf assets and overwrite if necessary. |
| <span class="badge badge--secondary">PdfAssets__PdfHeader</span>                              | header.html   | Set the name for the header.html file used in pdf generation                                        |
| <span class="badge badge--secondary">PdfAssets__PdfFooter</span>                              | footer.html   | Set the name for the footer.html file used in pdf generation                                        |
| <span class="badge badge--secondary">GotenbergSharpClient__ServiceUrl</span>                  | null          | Set the url where the gotenberg api is available                                                    |
| <span class="badge badge--secondary">GotenbergSharpClient__HealthCheckUrl</span>              | null          | Set the health check url where the gotenberg api is available                                       |
| <span class="badge badge--secondary">GotenbergSharpClient__RetryPolicy__Enabled</span>        | true          | Enable [Polly](https://github.com/App-vNext/Polly/wiki/Polly-and-HttpClientFactory) retry.          |
| <span class="badge badge--secondary">GotenbergSharpClient__RetryPolicy__RetryCount</span>     | 4             | Set the retry count.                                                                                |
| <span class="badge badge--secondary">GotenbergSharpClient__RetryPolicy__BackoffPower</span>   | 1.5           | Set the factor for exponential backoff on the retries                                               |
| <span class="badge badge--secondary">GotenbergSharpClient__RetryPolicy__LoggingEnabled</span> | true          | Enable logging for polly.                                                                           |

** [GotenbergSharpClient](https://github.com/ChangemakerStudios/GotenbergSharpApiClient) **
This is the client used to initiate conversion from Html to Pdf. Pdf conversion is an opt-in feature, but if you use it, there's some additional
configuration available. Leaving these values as the default is suitable for most cases. Additionally, Gotenberg container itself has
[configuration](https://gotenberg.dev/docs/configuration) as well.

#### Valid Connection Strings

We leverage some Blob providers of [FluentStorage](https://github.com/robinrodricks/FluentStorage/wiki/Blob-Storage) to allow for a flexible number
of options for overriding the built in XSL Transformation, HTML and css styling of the HTML output. Our hope is that the CDL established offers
everything that is necessary, but should you want to customize it, then you will need to determine what assets to modify here, or possibly add
additional assets (For example, another language). If adding another language, we would accept a pull request and contributions, so the open
source community can benefit from the efforts.

| Provider                                                                                                            | Sample Connection String                                                                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Local Disk](https://github.com/robinrodricks/FluentStorage/wiki/Standard-Storage#local-disk)                       | <span class="badge badge--secondary">disk://path=path_to_directory</span>                                                                                                       |
| [AWS S3](https://github.com/robinrodricks/FluentStorage/wiki/AWS-S3-Storage#connection-strings)                     | <span class="badge badge--secondary">aws.s3://keyId=...;key=...;bucket=...;region=...</span>                                                                                    |
| [Google Cloud Storage](https://github.com/robinrodricks/FluentStorage/wiki/Google-Cloud-Storage#connection-strings) | <span class="badge badge--secondary">google.storage://bucket=...;cred=...</span>                                                                                    |
| [Azure File](https://github.com/robinrodricks/FluentStorage/wiki/Azure-Blob-Storage#file-shares)                    | <span class="badge badge--secondary">azure.file://account=account_name;key=secret_value</span>                                                                                  |
| [Azure Blob](https://github.com/robinrodricks/FluentStorage/wiki/Azure-Blob-Storage#blob-storage)                   | <span class="badge badge--secondary">azure.blob://account=account_name;key=secret_value</span> or<br/><span class="badge badge--secondary">azure.blob://development=true</span> |

### Example pdf assets override

We will create 2 files and a directory to look like this:

```
./your-workspace/docker-compose.yml
                /yourpdfassets/footer.html
```

And first the contents of the footer.html:

```xml title="footer.html"
<html>
<head>
    <style>
        body {
            font-size: 8pt;
            margin: auto;
        }

        .container {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div style="margin-left: 20pt;">SOME CUSTOM FOOTER</div>
        <div style="margin-right: 20pt;">Page <span class="pageNumber"></span> of/de <span class="totalPages"></span></div>
    </div>
</body>
</html>
```

If you are wondering how the page numbers are substituted in, and more, then please review all the possible [header and footer configuration here](https://gotenberg.dev/docs/routes#header-footer-chromium).

Next create the docker compose file:

```yaml title="docker-compose.yml"
services:
  # Your other services.
  
  gotenberg:
    image: gotenberg/gotenberg:8

  pesc-cdl-api:
    image: ghcr.io/pesc-org/canpesc-common-digital-layout/pesc-cdl-api:latest
    environment:
      - GotenbergSharpClient__ServiceUrl=http://gotenberg:3000
      - GotenbergSharpClient__HealthCheckUrl=http://gotenberg:3000/health
      - ConnectionStrings__cdlStorage=disk://path=/usr/local/cdl
    ports:
      - "4000:8080"
    volumes:
      - ./yourpdfassets:/usr/local/cdl
```

now, in that directory run the command

```cmd
docker-compose up
```

Then you should be able to navigate to http://localhost:4000, Test the html or pdf endpoint with the UI, and see the footer with the changed values.

:::info

Both examples used the local disk storage, and a mounted volume. If you wanted to use one of the other storage providers, you would have
to put the file into the resource, then provide just the connection string environment variable. You would omit the mounted volume from the docker compose.

:::