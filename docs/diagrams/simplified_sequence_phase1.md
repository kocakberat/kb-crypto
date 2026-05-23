sequenceDiagram
    actor User
    participant Client
    participant Server 
    participant DB@{ "type" : "database" }
    Note over User, DB: Phase 1: Initial Setup in trusted network    
    activate User
    User -->> Client: I want to register! 
    activate Client
    Client -->> User: Shows registration window 
    User ->> Client: Username, Image
    deactivate User
    Client ->> Server: Username, Image
    deactivate Client
    activate Server
    Server ->> Server: Caluclate Image Hash
    Server ->> DB: Username, Image, Hash
    activate DB
    DB ->> DB: Insert into user database
    DB -->> Server: Success
    deactivate DB
    Server -->> Client: Success
    deactivate Server