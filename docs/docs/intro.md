---
sidebar_position: 1
---

# What is PESC CDL?

A fully-functional, self-contained service for converting PESC XML transcripts (for College/University and High School) into a standardized, localizable, human-readable PDF format.

## Standardization

The goal of the CanPESC Common Digital Layout (CDL) Working Group (WG) is to devise a standard for presenting transcripts from diverse issuers, enabling admissions staff and others to efficiently find the information they need within a transcript, regardless of source.

This layout standard is presented here, taken from the whitepaper written by the CanPESC CDL Working Group:
![Sample layout of PDF Transcript](img/sample-layout-landscape.png)

From this, the WG created sample tooling to be able to take XML Transcript data such as this:

![PESC XML College Transcript Sample](img/demo-college-xml-sample.png)

And render it into a human-readable PDF format such as this:

![PDF College Transcript Sample](img/demo-college-pdf-sample.png)

For more information about the origin of the Working Group and the CDL, please see the whitepaper hosted on pesc.org.

[Electronic Transcript Data Exchange: Building Common Digital
Layout(s) for PESC XML Transcripts](https://pesc.org/wp-content/uploads/2025/05/Building-CDL-for-XML-Transcripts.pdf)

## Containerization

This project takes the tooling one step further and packages the API to render PDFs from Transcripts into containers that can be hosted by any organization without having to develop their own CDL tooling.

For details on how to run and use the containers, start at [Installation](getting-started/installation)
