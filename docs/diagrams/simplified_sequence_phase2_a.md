sequenceDiagram
    actor User
    participant CryptoTool
    participant Client
    participant Server 
    participant DB@{ "type" : "database" }
    Note over User, DB: Phase 2: Continuing Usage in untrusted network
    Note over User, DB: Authentication (Are you who you say you are)
    
    activate User
    User -->> Client: I want to login! 
    activate Client
    Client -->> User: Show login window
    User -->> Client: Username
    User ->> CryptoTool: Image
    deactivate User
    activate CryptoTool
    CryptoTool ->> CryptoTool: 1. Calculate Image Hash h<br>2. Generate random Number n <br>3. Generate Hash H(h + n)
    CryptoTool ->> Client: Hash H, Number n
    deactivate CryptoTool
    Client ->> Server: Login Request with <br>Username, Hash H, Number n
    deactivate Client
    activate Server
    Server ->> DB: Fetch Image Hash of Username
    activate DB
    DB ->> DB:  Users database lookup
    DB ->> Server: Serve original Image Hash h 
    deactivate DB
    Server ->> Server: 1. Calculate new Hash H'(h+n)<br>2. Check if Hashes H and H' equal 
    alt Hash H equals Hash H' 
        Server -->> Client: Login successful, begin key agreement
    else Hash H does not equal Hash H' 
        Server -->> Client: Login unsuccessful, close connection
    deactivate Server
    end