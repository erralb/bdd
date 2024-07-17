---
title: Produit & Jointure
description: L'opérateur algébrique de produit cartésien
---

## Le produit cartésien
Opérandes :
Une relation R de schéma X
Une relation S de schéma Y
Résultat : une relation T dont le schéma est la concaténation de X et de Y contenant tous les couples d'éléments de R et S
Notation : R x S


Le produit cartésien
Quel est le produit cartésien des tables EMPLOYE et RESPONSABLE ?
EMPLOYE x RESPONSABLE

La jointure
Opérandes :
Une relation R de schéma X
Une relation S de schéma Y
Une condition C
Résultat : une relation T dont le schéma est la concaténation de X et de Y contenant tous les couples d'éléments de R et S tels que C est vraie
Notation : R(C) x S   ou   R ⨝ S
Condition : la condition est aussi appelée critère de jointure
Équivalent SQL : JOIN ou WHERE

La jointure
La condition est une expression composée de :
de valeur, e.g., “Marie”
de nom de colonnes ou d'attributs, e.g., “SALAIRE”
d'opérateurs arithmétiques (<, >, =, <=, , ) ;
d'opérateurs logiques ∧, ∨, ￢
Remarques :
Propriété : R(C) x S = (R x S) : C

La jointure
Pour chaque employé, donner son responsable :

EMPLOYE (EMPLOYE.SERVICE = RESPONSABLE.SERVICE ) x RESPONSABLE
ou
π EMPLOYE.SERVICE = RESPONSABLE.SERVICE (EMPLOYE) x RESPONSABLE
Le résultat présenté ici ajoute une projection. Dans l'absolu toutes les colonnes devrait être affichées si on écrivait la requête algébrique tel quel

La jointure
La jointure = mise en correspondance de 2 tables selon un critère

La jointure

Propriété : R(C) x S = (R x S) : C
Exemple :
