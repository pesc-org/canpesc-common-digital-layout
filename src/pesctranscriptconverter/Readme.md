# PESC Transcript Converter utility

## Introduction

This is a console app that can be used to convert PESC formatted XML Transcripts to HTML and convert HTML transcripts to PDF documents.

This tool is for demonstration purposes only and comes with no warranty from CanPESC, PESC, or its contributors.

## Getting Started

### Prerequisites

Requires .NET 6.0
<https://dotnet.microsoft.com/en-us/download/dotnet/6.0>

### Build

Build solution in Visual Studio Code

- from the command line: `dotnet build`
- from Visual Studio Code: `Ctrl+Shift+B`

### Limitations

This tool uses a free edition of [SelectPdf PDF Library for .NET](https://selectpdf.com/pdf-library-for-net/) which is limited in the number of pages it can convert.

## Usage

From a command prompt or terminal run the pesctranscriptconvert.exe with desired parameters:

### Converting XML to HTML

Use "tohtml" switch with 4 parameters:

1. Path to XML file to be converted
2. Intended name of the HTML file to generate
3. Path to the primary XSLT file for the transformation (note that any Includes do not need to be explicitly added)
4. Optional locale (default "en-CA")

#### Example HTML Conversion

`pesctranscriptconvert.exe tohtml "CollegeTranscript.xml" "CollegeTranscript.html" "CollegeTranscript.xsl" fr-CA`

### Converting HTML to PDF

Use "topdf" switch with 2 parameters:

1. Path to HTML file to be converted
2. Intended name of the PDF file to generate

#### Example PDF Conversion

`pesctranscriptconvert.exe topdf "CollegeTranscript.html" "CollegeTranscript.pdf"`

#### Samples Generation

```ps

.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Ontario\University\UniversityTranscript.xml" "samples\Canada\Ontario\University\UniversityTranscript_en-CA.html" "xslt\CollegeTranscript.xsl" en-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Ontario\University\UniversityTranscript_en-CA.html" "samples\Canada\Ontario\University\UniversityTranscript_en-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Ontario\University\UniversityTranscript.xml" "samples\Canada\Ontario\University\UniversityTranscript_fr-CA.html" "xslt\CollegeTranscript.xsl" fr-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Ontario\University\UniversityTranscript_fr-CA.html" "samples\Canada\Ontario\University\UniversityTranscript_fr-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Ontario\University\UniversityTranscript2.xml" "samples\Canada\Ontario\University\UniversityTranscript2_en-CA.html" "xslt\CollegeTranscript.xsl" en-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Ontario\University\UniversityTranscript2_en-CA.html" "samples\Canada\Ontario\University\UniversityTranscript2_en-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Ontario\University\UniversityTranscript2.xml" "samples\Canada\Ontario\University\UniversityTranscript2_fr-CA.html" "xslt\CollegeTranscript.xsl" fr-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Ontario\University\UniversityTranscript2_fr-CA.html" "samples\Canada\Ontario\University\UniversityTranscript2_fr-CA.pdf" 

.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Ontario\College\CollegeTranscript.xml" "samples\Canada\Ontario\College\CollegeTranscript_en-CA.html" "xslt\CollegeTranscript.xsl" en-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Ontario\College\CollegeTranscript_en-CA.html" "samples\Canada\Ontario\College\CollegeTranscript_en-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Ontario\College\CollegeTranscript.xml" "samples\Canada\Ontario\College\CollegeTranscript_fr-CA.html" "xslt\CollegeTranscript.xsl" fr-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Ontario\College\CollegeTranscript_fr-CA.html" "samples\Canada\Ontario\College\CollegeTranscript_fr-CA.pdf" 

.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Ontario\HighSchool\HighSchoolTranscript.xml" "samples\Canada\Ontario\HighSchool\HighSchoolTranscript_en-CA.html" "xslt\HighSchoolTranscript.xsl" en-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Ontario\HighSchool\HighSchoolTranscript_en-CA.html" "samples\Canada\Ontario\HighSchool\HighSchoolTranscript_en-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Ontario\HighSchool\HighSchoolTranscript.xml" "samples\Canada\Ontario\HighSchool\HighSchoolTranscript_fr-CA.html" "xslt\HighSchoolTranscript.xsl" fr-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Ontario\HighSchool\HighSchoolTranscript_fr-CA.html" "samples\Canada\Ontario\HighSchool\HighSchoolTranscript_fr-CA.pdf" 

.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\University\UniversityTranscript1.xml" "samples\Canada\Nova Scotia\University\UniversityTranscript1_en-CA.html" "xslt\CollegeTranscript.xsl" en-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\University\UniversityTranscript1_en-CA.html" "samples\Canada\Nova Scotia\University\UniversityTranscript1_en-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\University\UniversityTranscript1.xml" "samples\Canada\Nova Scotia\University\UniversityTranscript1_fr-CA.html" "xslt\CollegeTranscript.xsl" fr-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\University\UniversityTranscript1_fr-CA.html" "samples\Canada\Nova Scotia\University\UniversityTranscript1_fr-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\University\UniversityTranscript2.xml" "samples\Canada\Nova Scotia\University\UniversityTranscript2_en-CA.html" "xslt\CollegeTranscript.xsl" en-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\University\UniversityTranscript2_en-CA.html" "samples\Canada\Nova Scotia\University\UniversityTranscript2_en-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\University\UniversityTranscript2.xml" "samples\Canada\Nova Scotia\University\UniversityTranscript2_fr-CA.html" "xslt\CollegeTranscript.xsl" fr-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\University\UniversityTranscript2_fr-CA.html" "samples\Canada\Nova Scotia\University\UniversityTranscript2_fr-CA.pdf" 

.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript.xml" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript_en-CA.html" "xslt\HighSchoolTranscript.xsl" en-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript_en-CA.html" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript_en-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript.xml" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript_fr-CA.html" "xslt\HighSchoolTranscript.xsl" fr-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript_fr-CA.html" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript_fr-CA.pdf" 

.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript2.xml" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript2_en-CA.html" "xslt\HighSchoolTranscript.xsl" en-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript2_en-CA.html" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript2_en-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript2.xml" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript2_fr-CA.html" "xslt\HighSchoolTranscript.xsl" fr-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript2_fr-CA.html" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript2_fr-CA.pdf" 

.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript3.xml" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript3_en-CA.html" "xslt\HighSchoolTranscript.xsl" en-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript3_en-CA.html" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript3_en-CA.pdf" 
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe tohtml "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript3.xml" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript3_fr-CA.html" "xslt\HighSchoolTranscript.xsl" fr-CA
.\src\pesctranscriptconverter\bin\Debug\net6.0\pesctranscriptconvert.exe topdf "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript3_fr-CA.html" "samples\Canada\Nova Scotia\HighSchool\HighSchoolTranscript3_fr-CA.pdf" 
```
