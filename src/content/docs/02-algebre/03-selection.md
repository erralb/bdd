---
title: Sélection
description: L'opérateur algébrique de sélection
---

## La sélection
Opérandes :
Une relation R de schéma X
Une condition C
Résultat : une relation R0 de schéma X ne contenant que les lignes telles que la condition C est vraie
Notation : R : C   ou   σC(R)
Condition : la condition est aussi appelée critère de sélection. C'est une expression composée :
de valeur, e.g., “Marie”
de nom de colonnes ou d'attributs, e.g., “SALAIRE”
d'opérateurs arithmétiques (<, >, =, <=, , ) ;
d'opérateurs logiques ∧, ∨, ￢
Equivalence SQL : WHERE [condition] 
Sigma

La sélection
Donner les informations relatives aux employés habitant Grenoble
EMPLOYE : (ADRESSE = “Grenoble”)
ou
σ Adresse = “Grenoble” (EMPLOYE)

La sélection
Donner les informations relatives aux employés dont le salaire est supérieur à 1500€
EMPLOYE : (SALAIRE ≥ 1500 )
ou
σ SALAIRE ≥ 1500 (EMPLOYE)


La sélection
Que produit la requête : 
EMPLOYE : (NOM = “Marie”) 
ou 
σ NOM = “Marie” (EMPLOYE)

La sélection
Que produit la requête : 
EMPLOYE : (NOM = “Marie”) 
ou 
σ NOM = “Marie” (EMPLOYE)

La sélection
Que produit la requête : 
EMPLOYE : (NOM = “Marie” ∧ ADRESSE ≠ “St-Egrève” ∧ SALAIRE < 3000 ) ?
ou
σ NOM = “Marie” ∧ ADRESSE ≠ “St-Egrève” ∧ SALAIRE < 3000 (EMPLOYE)


La sélection
Que produit la requête : 
EMPLOYE : (NOM = “Marie” ∧ ADRESSE ≠ “St-Egrève” ∧ SALAIRE < 3000 ) ?
ou
σ NOM = “Marie” ∧ ADRESSE ≠ “St-Egrève” ∧ SALAIRE < 3000 (EMPLOYE)

