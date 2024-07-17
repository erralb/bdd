---
title: Conclusion
description: Conclusion sur l'algèbre relationnelle
---

## Règles permettant l'optimisation des requêtes
L'ordre dans lequel s'effectue les opérateurs ont un impact sur les performances des SGBD
A savoir : 
Les sélections diminuent le nombre de lignes et donc la taille des tables
Les projections diminuent un peu la taille des tables
Les produits cartésien et les jointures augmentent considérablement la taille des tables
Pour ces raisons, il est important d'effectuer les opérateurs dans l'ordre suivant :
1. Sélections (qui diminuent beaucoup la taille des tables)
2. Projections (qui diminuent un peu la taille des tables)
3. jointures et produits (qui augmentent beaucoup la taille des tables)

## Aide pour formuler des requêtes complexes en algèbre relationnelle
Quand on rédige des requêtes complexes en algèbre relationnelle, la lecture et l'écriture deviennent vite fastidieuses. Pour faciliter la tâche, on pourra s'aider de ce tableau qui permet de placer les différents éléments de la requête avant de la rédiger en algèbre relationnelle.

## Rédaction des requêtes
Lorsqu'une requête est complexe ou nécessite beaucoup d'étapes, on peut la découper en plusieurs requêtes. Par exemple :

R1 = EMPLOYE (EMPLOYE.SERVICE = RESPONSABLE.SERVICE ) x RESPONSABLE
R2 = R1[NOM]

Ici, au lieu de projeter la colonne NOM directement, on a d'abord nommé la jointure R1. On pourra ensuite utiliser R1 dans la suite de notre écriture. Cet exemple est très simple, mais il est possible de définir autant de Rn relations et de les utiliser ensuite.

## Ressources supplémentaires
Algèbre relationnelle sur Wikipédia
Un autre cours sur l'algèbre relationnelle
Encore un autre cours  avec des exercices
