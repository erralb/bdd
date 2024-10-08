```mermaid
erDiagram

    PRODUIT {
        int NPRO PK
        string NOMP
        int QTP
        string COULEUR
    }

    VENTE {
        int NVEN PK
        string NOMC
        int NPRV FK
        int QTV
        date DATEV
    }

    ACHAT {
        int NACH PK
        string NOMF
        int NPRA FK
        int QTA
        date DATEA
    }

    ACHAT }o--|| PRODUIT : "concerne un"
    VENTE }o--|| PRODUIT : "est concerné par une"

```


