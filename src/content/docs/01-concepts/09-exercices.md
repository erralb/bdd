---
title: Exercices
description: Exercices introductifs
---

Vérifier si les schémas suivant sont normalisés.
Si nécessaire, les décomposer en tables normalisées :

## Exercice 1 :

Soit la relation :

```mermaid
erDiagram
    VENTE {
    int NPRO
    int CLIENT
    date DATE
    int QUANTITE
    text ADRESSE
    text DELEGUE
    text REGION
    }
```

Et les dépendances fonctionnelles :

CLIENT → ADRESSE, DELEGUE
DELEGUE → REGION

### Questions

1. Est-ce que cette relation est en 2NF ? En 3NF ? Pourquoi ?
2. Décomposer la relation en 3NF

### Solutions

## Exercice 2 :

Soit la relation :

```mermaid
erDiagram
COMMANDE {
    int NCOM
    int NCLI
    text NOM
    date DATE
    int NPRO
    text LIBELLE
}
```

Et les dépendances fonctionnelles :

* NCLI → NOM
* NPRO → LIBELLE

### Questions

1. Est-ce que cette relation est en 2NF ? En 3NF ? Pourquoi ?
2. Décomposer la relation en 3NF

### Solutions

