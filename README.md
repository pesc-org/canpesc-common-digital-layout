# PESC Transcript Common Digital Layout

A developer friendly toolkit to help users of the PESC transcript standards generate layouts (i.e. HTML, PDF) of transcripts they send/receive to facilitate an easy-to-read and easy-to-print layout.


## Table of Contents

- [Quick Start](#quick-start)
- [Introduction](#introduction)
  - [Goals](#goals)
- [Getting Started](#getting-started)
  - [API](#api)
  - [CLI](#cli)
- [Roadmap and Enhancements](#roadmap-and-enhancements)
- [Contribute \& Feedback](#contribute--feedback)
- [Contact Us](#contact-us)

## Quick Start

Open a terminal and run the following command:

```
docker run --rm -p 4000:8080 ghcr.io/pesc-org/canpesc-common-digital-layout/pesc-cdl-api:latest
```

Then navigate to <http://localhost:4000/> and try the to-html endpoints. The to-pdf endpoints need additional configuration to work. See the [docs](https://pesc-org.github.io/canpesc-common-digital-layout/) for details.

---

For more information, please visit the [official docs](https://pesc-org.github.io/canpesc-common-digital-layout/).

---


## Introduction

The goal of the CanPESC Common Digital Layout Working Group is to reduce the effort other institutions and transcript hubs to implement a transcript-to-pdf solution.  This is a common need for organizations adopting the PESC standards and it would be good to not have to reinvent the wheel!

This repository demonstrates primarily taking an XML file and generating HTML using an XSL transform.  Combining HTML with CSS styling allows the user to create a visually appealing and printable document in PDF form.

See our whitepaper on the PESC.org website:

[Electronic Transcript Data Exchange: Building Common Digital
Layout(s) for PESC XML Transcripts](https://pesc.org/wp-content/uploads/2025/05/Building-CDL-for-XML-Transcripts.pdf)

### Goals

- Support High School and Post-Secondary (College) transcripts
- Be flexible to be reused for multiple versions of PESC standards
- Provide both sample code and a lightweight tool to generate PDFs from XML transcripts

## Getting Started

There are 2 solutions provided for rendering a PESC transcript to HTML or PDF

### API

Uses docker containers to expose a simple HTTP server with 4 endpoints. 2 endpoints for high school and 2 for college transcripts.

Pros:
- uses docker containerization
- runs on any platform
- uses gotenberg for pdf conversion, with no limitations and scalable

Cons:
- requires skills to host and run docker infrastructure (although made easier with cloud datacentre providers)

Head to the [documentation](https://pesc-org.github.io/canpesc-common-digital-layout/) to learn about all the features.

[Now Published on Docker Hub!](https://hub.docker.com/r/canpesc/cdl)

### CLI

This was the original tool provided in this repository, and uses XSLT to transform into html, and then the Free community version of [SelectPdf](https://selectpdf.com/)
to render a PDF. For more details on this tool see its [README](./src/pesctranscriptconverter-cli/Readme.md).

Pros:
- Ran without docker (although could be argued as a con)
- more cost effective, ran/uses compute power only when cli is excuted

Cons:
- Runs on windows only
- limited to community edition restructions of SelectPdf, but you could drop in a different html to pdf converter, and/or pay licence fee for no restrictions

## Roadmap and Enhancements

Please see the Projects tab to see list of planned and completed enhancements to the CDL:

[CDL Enhancements](https://github.com/pesc/canpesc-common-digital-layout/projects/1)

## Contribute & Feedback

If you have contributions such as sample transcripts or alternative ways of implementing the CDL, please reach out.

We would love to hear what you think. Complete our short questionnaire at <https://forms.gle/9PiMcy7kfCLmk8V6A>

Also you can start a discussion or report an issue in the respective sections here in the repository.

## Contact Us

To contact the CanPESC user group, please see <https://pesc.org/canadian-pesc-user-group/>
