#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  footer: context [
    #set align(center)
    #counter(page).display()
  ]
)

#set text(font: "New Computer Modern",size: 12pt)
#set par(justify: true)

#let cpp(code) = {
  let lines = code.text.split("\n")
  block(
    width: 100%,
    radius: 4pt,
    stroke: luma(200),
    clip: true,
    stack(
      block(
        fill: luma(200),
        width: 100%,
        inset: 8pt,
        text(weight: "bold", size: 1em, "C++")
      ),
      block(
        fill: luma(235),
        width: 100%,
        inset: 10pt,
        {
          set par(leading: 0.5em)
          for (i, line) in lines.enumerate() {
            box(width: 2.5em, text(fill: luma(150), str(i + 1)))
            raw(line, lang: "C++")
            linebreak()
          }
        }
      )
    )
  )
}

#align(center)[
  #block(inset: (top: 11em, bottom: 2em))[
    #text(weight: "bold", size: 2.14em)[kb-crypto] \
    #v(0.2em)
    #text(weight: "bold", size: 2.14em)[Cryptography & Networking Project] \
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(0.5em)
    #text(weight: "regular", size: 1.4em)[Berat Kocak] \
    #v(0.2em)
    #text(weight: "regular", size: 1.4em)[May 2026] \
  ]
]
#pagebreak()

#outline(
  title: "Contents",
  indent: auto,
)
#set heading(numbering: "1.")

#pagebreak()
= Project Overview 
This project implements a client-server communication tool using raw sockets over insecure HTTP, with the goal of rebuilding safe cryptography from first principles.

== Motivation & Learning Objectives
The primary objective of this project is to teach myself the programming language C++ and learn networking in detail. I aim to address the following questions:

+ #underline[Cryptography]
 - Secure Design: I will design a secure protocol on top of cleartext HTTP, including key exchange, symmetric encryption, and message authentication.
+ #underline[Networking]
 - Protocol:  I want to fully understand the HTTP protocol at the byte level, including request/response formatting, headers, and status codes.
 - Raw Sockets: I am using raw sockets instead of libraries like httplib/cpp-httplib so I can fully understand every part of the protocol.
 - Noise Reduction: I will explore techniques to reduce traffic pattern visibility, though this is not my first concern.
+ #underline[Critical Evaluation]
 - Attack Vectors: I will identify potential attack vectors (MITM, replay, timing analysis, traffic analysis, etc.), and harden the protocol based on my findings.
 - Cryptographic strength: I want to use modern cryptographic algorithms.

== Scope
The following areas are in the scope:
+ Implementing a raw socket HTTP server and client in C++ using Win32 API
+ Designing a custom cryptographic protocol layered over HTTP
+ Implementing fundamental crypto primitives (no external libraries like OpenSSL)
+ Documenting attack surfaces and mitigation strategies

The following areas are explicitly out of scope:
+ Optimizations for performance or scalability 
+ Formal cryptographic verification

#pagebreak()
= Design & Architecture

== Two-phased approach
=== Phase 1: Initial Setup

=== Phase 2: Continuing Usage
== Implementation Details

== Logging

== Challenges & Solutions

#pagebreak()
= Results & Observations
== Reflection on Initial Goals

#pagebreak()
= Future Improvements 

#pagebreak()
= Appendix
== File structure
== Images