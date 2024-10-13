```mermaid
erDiagram

    Personnes {
        int numero PK
        string nom
        int responsable FK
    }
    
    Personnes |o--o{ Personnes : "responsable"

```
