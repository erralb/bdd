---
title: Tables, lignes et colonnes
description: Un point sur les tables des bases de données
---

### Tables

- Les **données** d'une base de données sont **organisées** sous la forme de **tables**
- Une table contient une **collection de lignes** stockées sur un support physique
  - e.g., un disque dur

### Lignes

- Une **ligne** est une **suite de valeurs** d'un **type déterminé**
  - e.g., integer, string
- Une ligne regroupe des informations concernant un objet, un individu ou un événement, etc.
- Une ligne **représente** un concept du monde réel, appelé **entité** ou fait
- Les lignes d'une même table ont le même format ou structure

### Colonnes

- **L'ensemble des valeurs de même type** correspondant à une même propriété s'appelle **colonne**

### Exemple d'une table

<table>
    <tr><th colspan="4">Clients</th></tr>
  <tr><th>numéro</th><th>nom</th><th>adresse</th><th>localité</th></tr>
  <tr><td>B512</td><td>GILLET</td><td>14, r. de l'Eté</td><td>Toulouse</td></tr>
  <tr><td>C400</td><td>FERARD</td><td>65, r. du Tertre</td><td>Poitiers</td></tr>
</table>
