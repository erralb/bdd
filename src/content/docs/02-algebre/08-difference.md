---
title: Différence
description: L'opérateur algébrique de la différence
---

## La différence
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
