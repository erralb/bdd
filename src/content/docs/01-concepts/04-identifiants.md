---
title: Identifiants et clés étrangères
description: Identifiants (clés primaires) et clés étrangères des bases de données relationnelles
---

### Identifiants
* Toutes les colonnes ne jouent pas le même rôle dans une table
* Il faut être en mesure de désigner de manière univoque une ligne décrivant une entité
* On appelle **identifiant** de la table la colonne qui l’identifie de manière unique
* L'identifiant est aussi appelé **clé primaire**

Remarque
> Un identifiant peut être composé de plusieurs colonnes
> Rien n’interdit d’imposer plus d’un identifiant par table

Reprenons notre exemple précédent en colorant les identifiants (clés primaires) en rouge :

<table>
    <tr><th colspan="3">Commandes</th></tr>
    <tr><th style="background-color:red;">numéro</th><th>date</th><th>numéro client</th></tr>
    <tr><td style="background-color:red;">30188</td><td>2/1/2009</td><td>B512</td></tr>
    <tr><td style="background-color:red;">30179</td><td>22/12/2008</td><td>C400</td></tr>
</table>

<table>
    <tr><th colspan="4">Clients</th></tr>
  <tr><th style="background-color:red;">numéro</th><th>nom</th><th>adresse</th><th>localité</th></tr>
  <tr><td style="background-color:red;">B512</td><td>GILLET</td><td>14, r. de l'Eté</td><td>Toulouse</td></tr>
  <tr><td style="background-color:red;">C400</td><td>FERARD</td><td>65, r. du Tertre</td><td>Poitiers</td></tr>
</table>

<table>
    <tr><th colspan="5">Détails</th></tr>
    <tr><th style="background-color:red;">numéro commande</th><th style="background-color:red;">numéro produit</th><th>quantité</th></tr>
    <tr><td style="background-color:red;">30188</td><td style="background-color:red;">CS464</td><td>180</td></tr>
    <tr><td style="background-color:red;">30188</td><td style="background-color:red;">PA45</td><td>22</td></tr>
    <tr><td style="background-color:red;">30188</td><td style="background-color:red;">PA60</td><td>70</td></tr>
    <tr><td style="background-color:red;">30188</td><td style="background-color:red;">PH222</td><td>92</td></tr>
    <tr><td style="background-color:red;">30179</td><td style="background-color:red;">CS262</td><td>60</td></tr>
    <tr><td style="background-color:red;">30179</td><td style="background-color:red;">PA60</td><td>20</td></tr>
</table>

<table>
    <tr><th colspan="5">Produits</th></tr>
    <tr><th style="background-color:red;">numéro produit</th><th>libellé</th><th>prix</th></tr>
    <tr><td style="background-color:red;">CS464</td><td>CHEV. SAPIN 400x6x4</td><td>220</td></tr>
    <tr><td style="background-color:red;">PA45</td><td>POINTE ACIER 45</td><td>105</td></tr>
    <tr><td style="background-color:red;">PA60</td><td>POINTE ACIER 60</td><td>95</td></tr>
    <tr><td style="background-color:red;">PH222</td><td>PL. HETRE 200x20x2</td><td>230</td></tr>
    <tr><td style="background-color:red;">CS262</td><td>CHEV. SAPIN 200x6x2</td><td>75</td></tr>
    <tr><td style="background-color:red;">PA60</td><td>POINTE ACIER 60</td><td>95</td></tr>
</table>

> On peut voir ici que chaque clé primaire a une valeur unique. C'est ce mécanisme qui permet d'assurer la cohérence des données.

* Le terme anglais de clé primaire est **primary key**
* Toutes les tables possèdent un identifiant primaire qui peut être composite (plusieurs colonnes) 
* Toutes les entités d’une table possèdent au moins un identifiant
* Pour jouer son rôle d’identification, l’identifiant doit être unique
    * Cette propriété s’appelle contrainte d’unicité
    * Elle est garantie par le SGBD au moment des ajouts dans la table
* Les identifiants doivent être renseignés

### Les clés étrangères

Une colonne, ou un ensemble de colonnes, dont le rôle est de référencer une ligne dans une autre table (dite table cible) est dénommée clé étrangère (foreign key)

Exemple :

<table>
    <tr><th colspan="3">Commandes</th></tr>
    <tr><th style="background-color:red;">numéro</th><th>date</th><th style="background-color:lightgreen;">numéro client</th></tr>
    <tr><td style="background-color:red;">30188</td><td>2/1/2009</td><td style="background-color:lightgreen;">B512</td></tr>
    <tr><td style="background-color:red;">30179</td><td>22/12/2008</td><td style="background-color:lightgreen;">C400</td></tr>
</table>

> Dans la table **Commande**, la colonne _numéro client_ fait **référence** à la table **Client**

<table>
    <tr><th colspan="5">Détails</th></tr>
    <tr><th style="background-color:lightgreen;">numéro commande</th><th style="background-color:lightgreen;">numéro produit</th><th>quantité</th></tr>
    <tr><td style="background-color:lightgreen;">30188</td><td style="background-color:lightgreen;">CS464</td><td>180</td></tr>
    <tr><td style="background-color:lightgreen;">30188</td><td style="background-color:lightgreen;">PA45</td><td>22</td></tr>
    <tr><td style="background-color:lightgreen;">30188</td><td style="background-color:lightgreen;">PA60</td><td>70</td></tr>
    <tr><td style="background-color:lightgreen;">30188</td><td style="background-color:lightgreen;">PH222</td><td>92</td></tr>
    <tr><td style="background-color:lightgreen;">30179</td><td style="background-color:lightgreen;">CS262</td><td>60</td></tr>
    <tr><td style="background-color:lightgreen;">30179</td><td style="background-color:lightgreen;">PA60</td><td>20</td></tr>
</table>


> Dans la table **Détails**, les colonnes _numéro commande_ et _numéro produit_ font **références** aux table **Commandes** et **Produits**

Ces deux colonnes forment aussi la clé primaire de la table **Détails**. Un colonne peut à la fois faire partie de la clé primaire et aussi être une clé étrangère.

#### Contrainte référentielle

* Il est nécessaire que l’ensemble des valeurs d’une clé étrangère soit un sous-ensemble des valeurs de l’identifiant cible (autrement dit de la clé primaire ciblée par la clé étrangère)
> Cette contrainte s’appelle **contrainte référentielle**

Par exemple, on ne pourrait pas créer une commande pour un numéro de client qui n'existe pas


### Deuxièmes conclusions

* Les clés primaires et étrangères permettent d’assurer l’intégrité des bases de données relationnelles
* Elles définissent des contraintes d’intégrité, qui permettront aux SGBD de détecter des erreurs lors des opérations sur la base
* Ce sont ces clés qui permettent de créer des relations entre les tables