using System.Xml;
using System.Xml.Xsl;
using FastEndpoints;

namespace PescTranscriptConverter.Api.Commands;

public class TransformToHtml : ICommand<string>
{
    public string Pesc { get; set; } = default!;
    public string Locale { get; set; } = default!;
    public string Xslt { get; set; } = default!;
}

public class TransformToHtmlHandler(IServiceProvider provider) : ICommandHandler<TransformToHtml, string>
{
    public Task<string> ExecuteAsync(TransformToHtml command, CancellationToken ct)
    {
        var xslt = provider.GetRequiredKeyedService<XslCompiledTransform>(command.Xslt);

        XmlDocument xmlDocument = new XmlDocument();
        xmlDocument.LoadXml(command.Pesc);

        XsltArgumentList xsltArgumentList = new XsltArgumentList();
        xsltArgumentList.AddParam("Locale", "", command.Locale);

        using var writer = new StringWriter();

        xslt.Transform(xmlDocument, xsltArgumentList, writer);

        return Task.FromResult(writer.ToString());
    }
}
