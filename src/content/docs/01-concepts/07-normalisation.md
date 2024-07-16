---
title: Normalisation
description: Règles de décomposition des tables de bases de données
---

## Objectifs de la normalisation

> Définir des règles pour décomposer les relations tout en préservant les DF (Dépendances Fonctionnelles), sans perdre d’informations afin de représenter les objets et les associations canoniques du monde réel
* Éviter les anomalies de mises à jour
* Éviter les réponses erronées
* Outils :
    * Dépendances fonctionnelles
    * Décompositions
    * Formes normales (voir [Wikipedia](https://fr.wikipedia.org/wiki/Forme_normale_bases_de_donn%C3%A9es_relationnelles)) pour définition plus détaillées)


## La normalisation

> La décomposition d’une relation (d'une table) est le remplacement d’une relation R par un ensemble de relations R1,..., Rn tel que :
> * Les attributs de R sont égaux à l’union de tous les attributs des Ri
> * Ri est obtenu à partir de R par projection sur les attributs de Ri
> * Décomposition sans perte de sorte que l’on puisse retrouver exactement l’information de départ
> * Une décomposition est sans perte si et seulement si elle préserve les dépendances fonctionnelles

## 1ère forme normale (1FN ou 1NF)

### Définition
> Une relation est dite de première forme normale, si elle admet une clé et que tous ses attributs contiennent une valeur atomique
Exemple
PILOT (ID, NOM, AVIONS)


Column A | Column B | Column C
---------|----------|---------
 A1 | B1 | C1
 A2 | B2 | C2
 A3 | B3 | C3


La relation PILOT n’est pas en première forme normale (1FN ou 1NF)
elle possède une clé 
mais l’attribut AVIONS n’est pas atomique

Exemple de 1ère forme normale : 


## 2ème forme normale (2FN ou 2NF)

> Une relation est en deuxième forme normale (2FN ou 2NF) ssi :
> 1. Elle est en première forme normale
> 2. Tout attribut non clé ne dépend pas d’une partie de clé

Exemple

Soit la relation PILOTE :
* PILOTE (ID, NOM, LICENCE, DATE_OBTENTION)
Avec les dépendances fonctionnelles suivantes :
* ID -> NOM
* LICENCE -> DATE_OBTENTION

La relation PILOTE n’est pas en deuxième forme normale car

Une telle relation doit être décomposée en
* PILOT (ID, NOM, LICENCE)
* LICENCE PILOT (LICENCE, DATE_OBTENTION)

Exemple de violation de 2e forme normale : 

IMAGE

## 3ème forme normale (3FN ou 3NF)

> Une relation est en troisième forme ssi :
> 1. Elle est en deuxième forme normale
> 2. Tout attribut n'appartenant pas à une clé, ne dépend pas d’un autre attribut non clé

Exemple
AVION (ID, CONSTRUCTEUR, TYPE, PUISSANCE, AUTONOMIE)
n’est pas en troisième forme normale car
ID --> CONSTRUCTEUR, TYPE
TYPE --> PUISSANCE, AUTONOMIE
Une telle relation doit être décomposée en
AVION (ID, CONSTRUCTEUR, TYPE)
MODELE (TYPE, PUISSANCE, AUTONOMIE)

Exemple de violation de 3e forme normale : 

IMAGE

### La troisième forme normale :

* Retire les redondances dues aux dépendances transitives
* Permet de ne pas perdre d’information
* Permet de ne pas perdre des dépendances


> Un modèle relationnel doit être de troisième forme normale

La troisième forme normale est la plus utilisée du fait de son équilibre entre redondance et performance.

On pourra remarquer que pour certains systèmes (surtout distribués, e.g. pour certaines bases NoSQL), la redondance n’est pas un problème. 
Dans ces cas, on pourra se passer de la normalisation pour augmenter les performances.

### Forme normale de Boyce-Codd (FNBC ou BCNF)

> est en 3NF
> Tous les attributs non-clé ne sont pas source de dépendance fonctionnelle (DF) pour une partie de la clé.

EXEMPLE à REVOIR

Exemple :
* Personne (**N°SS, Pays**, Nom, Région) 
Soit les DF suivantes sur cette relation :
* N°SS,Pays → Nom
* N°SS,Pays → Région
* Région → Pays

Il existe une DF qui n'est pas issue d'une clé et qui détermine un attribut appartenant à une clé.
Cette relation est en 3NF, mais pas en BCNF (car en BCNF toutes les DFE sont issues d'une clé).

Pour avoir un schéma relationnel en BCNF, il faut décomposer Personne :

* Personne(N°SS, Region, Nom) 
* Region(Region, Pays)

Remarquons que les DF n'ont pas été préservées par la décomposition puisque N°SS et Pays ne déterminent plus la Région.

Simplicité : La BCNF est la forme normale la plus facile à appréhender intuitivement et formellement, puisque les seules DF existantes sont de la forme K→A où K est une clé.

Attention : Une décomposition en BCNF ne préserve pas toujours les DF.

## La normalisation… Quand est-ce qu'on s’arrête ?

* Il existe les 4, 5 et 6ème formes normales. Elles évitent principalement la redondance d’information et sont plus précises
* En pratique, la 3FN est suffisante
* En effet, les projections et les jointures sont coûteuses pour le système, ainsi une trop forte normalisation diminue fortement les performances

## Conclusion

Tant que l’ensemble des attributs n’est pas vide, on doit successivement :

1. Choisir un attribut X qui n’est le but d’aucune dépendance fonctionnelle
2. Construire une relation dont X est la clé et qui comporte tous les attributs qui sont déterminés fonctionnellement par X
3. Renouveler cette opération pour toutes les dépendances complexes auxquelles l’attribut X participe
4. Supprimer toutes les dépendances qui ont été prises en compte, ainsi que tous les attributs figurant dans ces dépendances et qui ne sont eux-mêmes sources d’aucune nouvelle dépendance (attributs isolés)
