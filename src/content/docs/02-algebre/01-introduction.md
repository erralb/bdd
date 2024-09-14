---
title: Introduction
description: Introduction à l'algèbre relationnelle
---

# Que vient faire l'algèbre dans les bases de données ?

* Jusqu'à présent nous nous sommes concentrés sur les concepts de la structuration des données
* On va maintenant s'intéresser à comment interroger une base de données pour obtenir les informations qui y sont stockées
* La solution est de définir un langage à base d'opérateurs algébriques pour manipuler les tables et les relations
* Ce langage est l'algèbre relationnelle

# Un exemple : la gestion des étudiants

Une gestion d'étudiants à l'université pourrait se résumer, de manière simple, aux entités suivantes :

* **Étudiants** : nom, prénom, numero, date de naissance, date de première inscription, régime de sécurité sociale, etc.
* **Enseignants** : numero de sécurité sociale, nom, prénom, date de naissance, emploi occupé, salaire, catégorie, date de titularisation, nombre d'enfants, adresse, téléphone, etc.
* **UFR (Unité de Formation et de Recherche)** : nom, responsable, bâtiment, téléphone, secrétariat, diplômes préparés, modules, cours, etc.
* **Inscriptions** : étudiants, UFR, cours et diplômes, etc.
* **Affectation des enseignants** : calcul des services d'enseignement, congés, modification de salaires, etc

## Exemples de questions qui pourraient être posées

1. Qui suit le cours de BDD et qui le donne ?
2. À quels cours est inscrit Lulu ?
3. Qui donne les cours de Droit ?
4. Quels sont les professeurs de Toto et de Zoé ?
5. Quels sont les étudiants inscrits à au moins un cours ?
6. Quels sont les étudiants qui suivent tous les cours ?
7. Quel est le nombre d'étudiants inscrits au cours de BD ?
8. Quels sont les étudiants de Michel et de Roland ?

# Algèbre : Rappel

:::note[Définition d'une algèbre]
Une algèbre est un ensemble d'opérateurs de base formellement définis, qui peuvent être combinés à souhait pour construire des expressions algébriques
:::

Les opérateurs arithmétiques : +, - , x, /
les opérateurs logiques : ∧, ∨, ￢ (AND, OR, NOT) (ET, OU, NON)
Chaque opérateur à une arité
Exemples d'opérateurs binaires : +, - , *, /
Exemple d'opérateurs unaires :  ￢, -
Règles de construction des opérateurs ou axiomes
Axiomes pour +, x (associativité, commutativité, distributivité, etc.)
Axiomes (loi de Morgan) pour ∧ et ∨
Une algèbre est dite fermée si le résultat de tout opérateur est du même type que les opérandes (ce qui est indispensable pour construire des expressions)

L'algèbre relationnelle
L'algèbre relationnelle a été proposée par Codd en 1970
Elle est composée d'une collection d'opérateurs algébriques unaires ou binaires
Possibilité de composition des opérateurs (propriétés de fermeture de l'algèbre relationnelle)
Une requête relationnelle est la composition d'un nombre fini d'opérateurs algébriques
L'ordre d'évaluation des opérateurs a un impact sur le temps de réponse du SGBD
Principe de l'optimisation des requêtes
Il existe 2 notations : avec des symboles mathématiques ( π, σ, ⍴ ) (Pi, Sigma, Rho) ou bien une notation textuelle. Les deux sont correctes, vous pouvez utiliser celle que vous préférez.

Les opérateurs de l'algèbre relationnelle
 Les opérateurs ensemblistes
1. Union : R ∪ S
2. Intersection : R ∩ S
3. Différence : R - S (ou R ≏ S)
4. Complément : −R
Les autres opérateurs
1. La projection : R[A] ( aussi représentée avec le symbole Pi : π )
2. La sélection : R : (C) ( aussi représentée avec le symbole Sigma : σ )
3. Le produit cartésien : x
4. La jointure : R(C) x S ( aussi représentée avec le symbole Noeud Papillon : ⋈ )
5. Division : R/S
6. Le renommage : R[A|B] ( aussi symbolisé par Rho : ρa|b )

Rappel de vocabulaire
Une TABLE = une RELATION
On pourra faire référence à un attribut d'une relation en utilisant la notation : Relation.Attribut

La projection
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

La sélection
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


Le produit cartésien
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


La division
Opérandes :
Une relation R de schéma X
Une relation S de schéma Y
Résultat : 
une relation T de schéma X - Y (les attributs de Y sont retirés de X) ne contenant aucune des lignes (v1, v2,..., vn), telles que pour chaque ligne (w1, w2,..., wn) de S, R contient les lignes (v1, v2,..., vn, w1, w2,..., wn)
Notation : R/S

La division
La division est une opération binaire (c.à.d portant sur deux relations)
La division de R1 par R2, sachant que R1 et R2 ont au moins un attribut commun (de même nom et domaine)
produit un relation R3 qui comporte les attributs appartenant à R1 mais n'appartenant pas à R2 
et l'ensemble des tuples (lignes) qui concaténés à ceux de R2 donnent toujours un tuple de R1

La division
Soients les relations suivantes :
ETUDIANT (NUMET , NOM, PRENOM)
MATIERE (NUMMAT, LIBELLE)
EPREUVE (NUMEPR , NUMMAT, DATE)
INSCRIPTION (NUMET, NUMMAT)
RESULTAT (NUMET, NUMEPR , NOTE)
Questions
Quels sont les étudiants inscrits dans toutes les matières ?
Quels sont les étudiants ayant une note à chacune des épreuves ?

La division
Quels sont les étudiants inscrits dans toutes les matières ?

La division
Quels sont les étudiants ayant obtenu une note à chacune des épreuves ?

La division + une jointure
Si l'on veut maintenant les noms et prénoms des étudiants ayant obtenus une note à chacune des épreuves :

L'union
Opérandes :
Une relation R de schéma X
Une relation S de schéma X
Résultat : une relation T de schéma X contenant toutes lignes de R et de S
Notation : R ∪ S
Remarque : R et S doivent avoir le même schéma

L'union
Remarques :
La ligne [d, e, f] n'apparaît qu'une seule fois dans la relation R ∪ S
Une union définit un ensemble


L'intersection
Opérandes :
Une relation R de schéma X
Une relation S de schéma X
Résultat : une relation T de schéma X ne contenant que les lignes qui sont à la fois dans R et dans S
Notation : R ∩ S
Remarque : R et S doivent avoir le même schéma

L'intersection

La différence
Opérandes :
Une relation R de schéma X
Une relation S de schéma X
Résultat : une relation T de schéma X contenant que les lignes de R qui ne sont pas dans S
Notation : R - S
Remarque : R et S doivent avoir le même schéma

La différence

Le complément
Opérandes :
Une relation R de schéma X
Résultat : une relation R0 de schéma X regroupant exclusivement toutes les occurrences possibles créées à partir des valeurs d'attributs présentes dans la relation R, à l'exception des occurrences de R
Notation : -R
Remarques :
Comme l'ensemble des valeurs possibles pour chaque attribut est généralement inconnu ou infini, seules les valeurs déjà présentes dans un attribut de R sont utilisées, dans cet attribut, pour créer de nouvelles occurrences
Si R est vide, la relation qui résulte du complément est vide
Propriété :   - - R = R

Le complément

Règles permettant l'optimisation des requêtes
L'ordre dans lequel s'effectue les opérateurs ont un impact sur les performances des SGBD
A savoir : 
Les sélections diminuent le nombre de lignes et donc la taille des tables
Les projections diminuent un peu la taille des tables
Les produits cartésien et les jointures augmentent considérablement la taille des tables
Pour ces raisons, il est important d'effectuer les opérateurs dans l'ordre suivant :
1. Sélections (qui diminuent beaucoup la taille des tables)
2. Projections (qui diminuent un peu la taille des tables)
3. jointures et produits (qui augmentent beaucoup la taille des tables)

Aide pour formuler des requêtes complexes en algèbre relationnelle
Quand on rédige des requêtes complexes en algèbre relationnelle, la lecture et l'écriture deviennent vite fastidieuses. Pour faciliter la tâche, on pourra s'aider de ce tableau qui permet de placer les différents éléments de la requête avant de la rédiger en algèbre relationnelle.

Rédaction des requêtes
Lorsqu'une requête est complexe ou nécessite beaucoup d'étapes, on peut la découper en plusieurs requêtes. Par exemple :

R1 = EMPLOYE (EMPLOYE.SERVICE = RESPONSABLE.SERVICE ) x RESPONSABLE
R2 = R1[NOM]

Ici, au lieu de projeter la colonne NOM directement, on a d'abord nommé la jointure R1. On pourra ensuite utiliser R1 dans la suite de notre écriture. Cet exemple est très simple, mais il est possible de définir autant de Rn relations et de les utiliser ensuite.

Ressources supplémentaires
Algèbre relationnelle sur Wikipédia
Un autre cours sur l'algèbre relationnelle
Encore un autre cours  avec des exercices

Exercice 1
Soit le schéma relationnel de la base de données d'une agence de voyage :
CLIENT (NUMCLIENT, NOM, PRENOM, E-MAIL, NUMCB)
RESERVATION (NUMCLIENT, CODEVOYAGE, DATERES)
VOYAGE (CODEVOYAGE, DESTINATION, DUREE, PRIX)

Formuler en algèbre relationnelle les requêtes suivantes :
1. Nom, prénom et e-mail des clients ayant une réservation en cours
2. Nom, prénom et e-mail des clients n'ayant aucune réservation en cours
3. Destination et liste des clients ayant réservés pour un voyage de plus de 10 jours et coûtant moins de 1000e
4. Numéros de tous les clients ayant réservés sur tous les voyages proposés

Exercice 2
Soit le schéma relationnel de la base de données d'un cinéma : 
VILLE (CODEPOSTAL, NOMVILLE) 
CINEMA (NUMCINE, NOMCINE, ADRESSE, CODEPOSTAL) 
SALLE (NUMSALLE, CAPACITE, NUMCIN E) 
FILM (NUMEXP, TITRE, DUREE, CODEDIST) 
PROJECTION (NUMEXP, NUMSALLE, NUMSEMAINE, NBENTREE) 
Formuler en algèbre relationnelle les requêtes suivantes : 
1. Titre des films dont la durée est supérieure ou égale à deux heures 
2. Nom des villes abritant un cinéma nommé “Le Capitole” 
3. Nom des cinémas situés à Lyon ou contenant au moins une salle de plus 100 places 
4. Nom, adresse et ville des cinémas dans lesquels on joue le film “Hypnose” la semaine 18 
5. Numéro d'exploitation des films projetés dans toutes les salles 
6. Titre des films qui n'ont pas été projetés
