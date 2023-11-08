using System;
using System.IO;
using System.Xml;
using System.Xml.Xsl;
using SelectPdf;

namespace pesctranscriptconverter
{
    class Program
    {
        static void Main(string[] args)
        {
            /************************************* 
             * PDF Conversion margin watermarks 
             * Modify this content if so desired 
             *************************************/
            var pageHeaderText = "Rendered by/Généré par CanPESC";
            var pageFooterRightText = "Page {page_number} of/de {total_pages}  ";
            var pageFooterLeftText = "This is not an official transcript | Ceci n'est pas une relevée de notes officielle";

            /************************************* 
             * PDF Metadata 
             * Modify this content if so desired 
             *************************************/
            var pdfTitle = "Common Digital Layout Transcript";
            var pdfAuthor = "CanPESC";

            if (args.Length < 1)
            {
                PrintUsage();
            }

            var option = args[0];
            var inputfilepath = string.Empty;
            var outputfilepath = string.Empty;
            var xsltPath = string.Empty;
            var locale = "en-CA";

            FileStream fsIn;
            TextReader textReader;

            AppContext.SetSwitch("Switch.System.Xml.AllowDefaultResolver", true);

            try
            {

                switch (option)
                {
                    case "tohtml":

                        if (args.Length < 4)
                        {
                            PrintUsage();
                            break;
                        }
                        Console.WriteLine("Beginning conversion from XML to HTML...");

                        inputfilepath = args[1];
                        outputfilepath = args[2];
                        xsltPath = args[3];

                        if (args.Length == 5) {
                            locale = args[4];
                            if (locale != "en-CA" && locale != "en-US" && locale != "fr-CA") {
                                Console.WriteLine("Locale must be either en-US, en-CA or fr-CA");
                                PrintUsage();
                                break;
                            }
                        }

                        fsIn = new FileStream(inputfilepath, FileMode.Open);
                        textReader = new StreamReader(fsIn);

                        XmlDocument xmlDocument = new XmlDocument();
                        xmlDocument.LoadXml(textReader.ReadToEnd());

                        XslCompiledTransform xslCompiledTransform = new XslCompiledTransform(true);
                        XsltArgumentList xsltArgumentList = new XsltArgumentList();
                        xsltArgumentList.AddParam("Locale", "", locale);

                        XsltSettings settings = new XsltSettings(true, false);

                        FileStream fs = new FileStream(outputfilepath, FileMode.Create, FileAccess.Write);
                        TextWriter writer = new StreamWriter(fs);

                        xslCompiledTransform.Load(xsltPath, settings, new XmlUrlResolver());
                        xslCompiledTransform.Transform(xmlDocument, xsltArgumentList, writer);

                        fs.Close();

                        Console.WriteLine("Converted to HTML");
                        break;

                    case "topdf":
                        if (args.Length != 3)
                        {
                            PrintUsage();
                            break;
                        }
                        Console.WriteLine("Beginning conversion from HTML to PDF...");
                        inputfilepath = args[1];
                        outputfilepath = args[2];

                        fsIn = new FileStream(inputfilepath, FileMode.Open);
                        textReader = new StreamReader(fsIn);

                        // instantiate the html to pdf converter
                        HtmlToPdf converter = new HtmlToPdf();

                        converter.Options.PdfPageSize = PdfPageSize.Letter;
                        converter.Options.PdfPageOrientation = PdfPageOrientation.Portrait;
                        converter.Options.CssMediaType = HtmlToPdfCssMediaType.Print;

                        converter.Options.MarginLeft = 10;
                        converter.Options.MarginRight = 10;
                        converter.Options.MarginTop = 2;
                        converter.Options.MarginBottom = 2;

                        // header settings
                        converter.Options.DisplayHeader = true;
                        converter.Header.DisplayOnFirstPage = true;
                        converter.Header.DisplayOnOddPages = true;
                        converter.Header.DisplayOnEvenPages = true;
                        converter.Header.Height = 30;

                        // footer settings
                        converter.Options.DisplayFooter = true;
                        converter.Footer.DisplayOnFirstPage = true;
                        converter.Footer.DisplayOnOddPages = true;
                        converter.Footer.DisplayOnEvenPages = true;
                        converter.Footer.Height = 30;

                        // add some html content to the footer
                        PdfHtmlSection headerHtml = new PdfHtmlSection(@$"<div style=""text-align: right; width: 100%; font-size: 8pt"">{pageHeaderText}</div>", "");
                        converter.Header.Add(headerHtml);

                        // page numbers can be added using a PdfTextSection object
                        PdfTextSection text = new PdfTextSection(-10, 10, pageFooterRightText, new System.Drawing.Font("Arial", 8));
                        text.HorizontalAlign = PdfTextHorizontalAlign.Right;
                        converter.Footer.Add(text);

                        PdfTextSection text2 = new PdfTextSection(10, 10, pageFooterLeftText, new System.Drawing.Font("Arial", 8));
                        text2.HorizontalAlign = PdfTextHorizontalAlign.Left;
                        converter.Footer.Add(text2);

                        // convert the url to pdf
                        PdfDocument doc = converter.ConvertHtmlString(textReader.ReadToEnd());

                        // PDF Options - can be configured
                        doc.DocumentInformation.Title = pdfTitle;
                        doc.DocumentInformation.Author = pdfAuthor;

                        // save pdf document
                        doc.Save(outputfilepath);

                        // close pdf document
                        doc.Close();

                        Console.WriteLine("Converted to PDF");
                        break;
                    default:
                        PrintUsage();
                        break;

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");

                PrintUsage();
            }

        }

        private static void PrintUsage()
        {
            Console.WriteLine("Usage: pesctranscriptconvert [tohtml|topdf] inputfilepath outputfilepath [xsltfilepath] [locale]");
            Console.WriteLine("Example: pesctranscriptconvert tohtml inputfile.xml outputfile.html transform.xslt fr-CA");
            Console.WriteLine("Example: pesctranscriptconvert topdf inputfile.html outputfile.pdf");
        }
    }
}
