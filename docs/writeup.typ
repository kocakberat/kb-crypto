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
= The problem
A worker must leave headquarters to investigate factory issues in a country where the government controls all network traffic. HTTPS is blocked, data must flow in cleartext, and authorities inspect incoming travelers for credentials or keys. We need a solution for secure data transmission under these constraints.


== Phase 1: Initial Setup
This phase occurs in a trusted network, like the company headquarters. Data can flow securely even when unencrypted. The client registers by uploading credentials, which the server stores securely. The worker then departs for the other country.
#figure(
  image("images/flowchart_phase1.png" , width:100%),
  caption:[Simplified flowchart of the first phase]
)
#figure(
  image("images/simplified_sequence_phase1.png" , width:120%),
  caption:[Non-technical sequence diagram of phase one]
)

== Phase 2: Continuing Usage
At the airport, authorities screen the worker for credentials like keys or passwords. The worker carries nothing suspicious and is cleared. They proceed to the factory, investigate issues, and notify headquarters using the communication tool.
#figure(
  image("images/flowchart_phase2.png" , width:100%),
  caption:[Simplified flowchart of the second phase]
)
```
#figure(
  image("images/simplified_sequence_phase2.png" , width:120%),
  caption:[Non-technical sequence diagram of phase two]
)
```

```
sequenceDiagram
    actor User
    participant CryptoTool
    participant Client
    participant Server 
    participant DB@{ "type" : "database" }
    Note over User, DB: Phase 2: Continuing Usage in untrusted network
    User -->> Client: I want to login! 
    Client -->> User: Show login window
    User ->> CryptoTool: Image
    activate CryptoTool
    CryptoTool ->> CryptoTool: Calculate Image Hash
    CryptoTool ->> User: Image Hash
    deactivate CryptoTool
    User -->> Client: Username, Image Hash
    Client ->> Server: Username, Image Hash

```



== Implementation Details
=== Registration (Phase 1)
=== Credential Storage (Phase 1)
=== Authentification (Phase 2)
=== Key agreement (Phase 2)
=== Transmission (Phase 2)
=== Logging (Phase 2)

#pagebreak()
= Evaluation and Next Steps 
== Reflection on Initial Goals
== Future Improvements 