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
- Provide both sample code and a lightweight tool to generate PDFs from XML transcripts

## Getting Started

### PESC Standards

For the latest version of the PESC Standards including Schemas and Implementation guides, see the following links:

- [College Transcript](https://pesc.org/college-transcript/)
- [High School Transcript](https://pesc.org/high-school-transcript/)

### Demonstrating PDF Render

This repository includes a sample command-line tool for transforming PESC XML transcripts into PDF by way of HTML.  For more details on this tool see its [README](./src/pesctranscriptconverter/Readme.md).

## Contribute & Feedback

If you have contributions such as sample transcripts or alternative ways of implementing the CDL, please reach out.

We would love to hear what you think. Complete our short questionnaire at <https://forms.gle/9PiMcy7kfCLmk8V6A>

Also you can start a discussion or report an issue in the respective sections here in the repository.

## Contact Us

To contact the CanPESC user group, please see <https://pesc.org/canadian-pesc-user-group/>
