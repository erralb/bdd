---
title: Phénomène de redondance
description: Comment remédier au problème de redondance des données
---

<table>
    <tr><th colspan="5">Livre</th></tr>
    <tr><th>numéro</th><th>titre</th><th>auteur</th><th>isbn</th><th>date achat</th><th>rayonnage</th></tr>
    <tr></tr>
</table>

* Problème : Lorsqu'un livre existe en plusieurs exemplaires, les informations (TITRE, AUTEUR, ISBN) sont dupliquées 
* Cette situation va à l'encontre du principe fondateur des bases de données : tout fait pertinent du domaine d'application doit être enregistré une et une seule fois

## Inconvénients de la redondance 
* La table occupe un espace excessif et inutile
* Les modifications sont coûteuses puisqu'il faut mettre à jour toutes les données dupliquées 
* Comment garantir que les données dupliquées restent identiques et cohérentes ? 
* Exemples : 
    * Si le premier ajout d'un livre se fait librement, les ajouts d'un autre exemplaire doivent se faire conformément aux informations déjà saisies 
    * L'effacement du seul exemplaire d'un livre supprimerait définitivement les informations concernant son titre et son auteur 

## Dépendances fonctionnelles

Les dépendances fonctionnelles determinent les dépendances des certaines colonnes entre elles :

* Dans notre exemple précédent, il existe une contrainte entre les colonnes isbn, titre et auteur de la table LIVRE :
    * ISBN -> TITRE, AUTEUR 
    * ISBN est le **déterminant** et (TITRE, AUTEUR) les **déterminés** 
    * Autrement dit, si on possède une valeur isbn, on peut nécessairement déterminer le titre et l'auteur du livre
* Pour éviter le phénomène de redondance :
    * les dépendances fonctionnelles doivent être évitées au sein d'une même table
    * On va donc garder uniquement le déterminant isbn dans la table livre, et déplacer les détérminés titre et auteur dans une nouvelle table

## Décomposition de la table

Ouvrage
Column A | Column B | Column C
---------|----------|---------
 A1 | B1 | C1
 A2 | B2 | C2
 A3 | B3 | C3


Exemplaire
Column A | Column B | Column C
---------|----------|---------
 A1 | B1 | C1
 A2 | B2 | C2
 A3 | B3 | C3

* On a solutionné le problème de redondance en créant une deuxième table et en utilisant l'ISBN comme clé étrangère dans la table EXEMPLAIRE.
* Le procédé permettant d'éviter les redondances interne s'appelle normalisation

## Comment décomposer une table ?

![Décomposition d'une table](/public/01-06-01-DecompositionTable.png)

* Soit une table R possédant 3 colonne A, B et C
* Il existe une dépendance fonctionnelle entre B et C (Si on connait B, alors on connait nécessairement C)
    * On doit donc extraire la colonne C de la table R pour éviter la redondance interne
    * La colonne B doit être présente dans les 2 tables pour pouvoir reconstruire l'information
* On peut aussi remarquer dans cet exemple que :
    * B sera une clé étrangère dans la table R
    * B sera une clé primaire dans la table S

> Il peut exister plusieurs dépendances fonctionnelles au sein d'une même table
Il faudra alors décomposer autant de fois que nécessaire pour éviter la redondance

