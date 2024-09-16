---
title: Projection
description: L'opérateur algébrique de projection
---

## La projection

Opérandes :
Une relation R de schéma X
A une sous-liste de X
Résultat : une relation R0 réduite aux colonnes listées dans A
Notation : R[A] ou πA(R)
Équivalence SQL : SELECT [colonnes]

La projection
Soit les relations suivantes :
EMPLOYE (NOM, SALAIRE, SERVICE, ADRESSE)
RESPONSABLE (NOM, SERVICE)
Questions
Donner la liste des noms de tous les employés
Pour chaque employé, donner son service et son adresse
Pour chaque employé, donner son salaire
Donner la liste des noms des responsables de service

La projection
Donner la liste des noms de tous les employés :

EMPLOYE[NOM]      
ou
π NOM (EMPLOYE)

La projection
Pour chaque employé, donner son service et son adresse

EMPLOYE[NOM, SERVICE, ADRESSE]      
ou
π NOM, SERVICE, ADRESSE (EMPLOYE)

La projection
Pour chaque employé, donner son salaire

EMPLOYE[NOM, SALAIRE]      
ou
π NOM, SALAIRE (EMPLOYE)


La projection
Donner la liste des noms de tous responsables de service

RESPONSABLE[NOM]      
ou
π NOM (RESPONSABLE)
