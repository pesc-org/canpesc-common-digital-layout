# PESC Transcript Common Digital Layout

A toolkit to help users of the PESC transcript standards generate layouts (i.e. HTML, PDF) of transcripts they send/receive to facilitate an easy-to-read and easy-to-print layout.

## Introduction

The goal of the CanPESC Common Digital Layout Working Group is to reduce the effort other institutions and transcript hubs to implement a transcript-to-pdf solution.  This is a common need for organizations adopting the PESC standards and it would be good to not have to reinvent the wheel!

This repository demonstrates primarily taking an XML file and generating HTML using an XSL transform.  Combining HTML with CSS styling allows the user to create a visually appealing and printable document in PDF form.

See our whitepaper on the PESC.org website:

[Electronic Transcript Data Exchange: Building Common Digital
Layout(s) for PESC XML Transcripts](https://nebula.wsimg.com/756901b746edc14b984e33cd7f067efd?AccessKeyId=4CF7FAE11697F99C9E6B&disposition=0&alloworigin=1)

### Goals

- Support High School and Post-Secondary (College) transcripts
- Be flexible to be reused for multiple versions of PESC standards

## Getting Started

### Demonstrating the HTML Transformation

In order to demonstrate generating an HTML document from a transcript XML file, multiple tools can be used.  Here is a short sample of tools that could be used

### Demonstrating PDF Render

This repository includes a sample command-line tool for transforming PESC XML transcripts into PDF by way of HTML.  For more details on this tool see its [README](./src/pesctranscriptconverter/Readme.md).

## Roadmap and Enhancements

Please see the Projects tab to see list of planned and completed enhancements to the CDL:

[CDL Enhancements](https://github.com/pesc/canpesc-common-digital-layout/projects/1)

## Contribute & Feedback

We would love to hear what you think. Complete our short questionnaire at <https://forms.gle/9PiMcy7kfCLmk8V6A>

Also you can start a discussion or report an issue in the respective sections here in the repository.

## Contact Us

To contact the CanPESC user group, please see <https://www.pesc.org/canadian-pesc-user-group.html>
