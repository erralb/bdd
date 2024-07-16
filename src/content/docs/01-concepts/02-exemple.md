---
title: Exemple
description: Place aux concepts au travers d’un exemple
---

## Place aux concepts au travers d’un exemple

Considérons le bon de commande suivant :

![Bon de Commande 1](/public/01-01-01-BonDeCommande.png)

On peut identifier des données spécifiques à des **entités** distinctes :

![Bon de Commande 2](/public/01-01-02-BonDeCommande2.png)

### Décomposition en tables

Les bases de données relationnelles sont composées de **tables** (autrement dit des tableaux).

Essayons de décomposer ce bon de commande en tables, en fonction des entités identifiées précédemment (Données de la commande, donnéees du client, données d'un détail). 
On obtiendrait :

<table>
    <tr><th colspan="3">Commandes</th></tr>
    <tr><th>numéro</th><th>date</th><th>total</th></tr>
    <tr><td>30188</td><td>2/1/2009</td><td>97200</td></tr>
</table>

<table>
    <tr><th colspan="4">Clients</th></tr>
  <tr><th>numéro</th><th>nom</th><th>adresse</th><th>localité</th></tr>
  <tr><td>B512</td><td>GILLET</td><td>14, r. de l'Eté</td><td>Toulouse</td></tr>
</table>

<table>
    <tr><th colspan="5">Détails</th></tr>
    <tr><th>numéro</th><th>libellé</th><th>prix</th><th>quantité</th><th>total</th></tr>
    <tr><td>CS464</td><td>CHEV. SAPIN 400x6x4</td><td>220</td><td>180</td><td>39600</td></tr>
    <tr><td>PA45</td><td>POINTE ACIER 45</td><td>105</td><td>22</td><td>2310</td></tr>
    <tr><td>PA60</td><td>POINTE ACIER 60</td><td>95</td><td>70</td><td>6650</td></tr>
    <tr><td>PH222</td><td>PL. HETRE 200x20x2</td><td>230</td><td>92</td><td>21160</td></tr>
</table>

#### Cette première décomposition n'est pas satisfaisante :


* En l’état il est **impossible de reconstruire le document initial**
    * Comment récupérer le client d’une commande puisque nous avons extrait et rangé ailleurs le fragment décrivant ce client ?
    * Comment identifier la commande de laquelle nous avons extrait un détail ?
> il manque des **données de références** pour effectuer des **liaisons entre les données**
* Certaines données sont calculées, e.g., le total de la commande et les sous-totaux des détails
> il n’est pas nécessaire de les stocker

Mettons à jour nos tables en prenons ces remarques en considération.
On va aussi ajouter un bon de commande supplémentaire (soit une commande, un client et des détails en plus) pour étoffer notre exemple :

<table>
    <tr><th colspan="3">Commandes</th></tr>
    <tr><th>numéro</th><th>date</th><th>numéro client</th></tr>
    <tr><td>30188</td><td>2/1/2009</td><td>B512</td></tr>
    <tr><td>30179</td><td>22/12/2008</td><td>C400</td></tr>
</table>

<table>
    <tr><th colspan="4">Clients</th></tr>
  <tr><th>numéro</th><th>nom</th><th>adresse</th><th>localité</th></tr>
  <tr><td>B512</td><td>GILLET</td><td>14, r. de l'Eté</td><td>Toulouse</td></tr>
  <tr><td>C400</td><td>FERARD</td><td>65, r. du Tertre</td><td>Poitiers</td></tr>
</table>

<table>
    <tr><th colspan="5">Détails</th></tr>
    <tr><th>numéro commande</th><th>numéro produit</th><th>libellé</th><th>prix</th><th>quantité</th></tr>
    <tr><td>30188</td><td>CS464</td><td>CHEV. SAPIN 400x6x4</td><td>220</td><td>180</td></tr>
    <tr><td>30188</td><td>PA45</td><td>POINTE ACIER 45</td><td>105</td><td>22</td></tr>
    <tr><td>30188</td><td>PA60</td><td>POINTE ACIER 60</td><td>95</td><td>70</td></tr>
    <tr><td>30188</td><td>PH222</td><td>PL. HETRE 200x20x2</td><td>230</td><td>92</td></tr>
    <tr><td>30179</td><td>CS262</td><td>CHEV. SAPIN 200x6x2</td><td>75</td><td>60</td></tr>
    <tr><td>30179</td><td>PA60</td><td>POINTE ACIER 60</td><td>95</td><td>20</td></tr>
</table>

#### Un résultat prometteur, mais

* Certaines données sont stockées de manière redondantes dans les données de détails, e.g., libellé et prix
    * sources d’erreurs lors des mises à jours
    * inutiles et dangereux
* Il serait plus pertinent de construire une 4ème table pour stocker de manière unique les informations relatives aux produits

<table>
    <tr><th colspan="3">Commandes</th></tr>
    <tr><th>numéro</th><th>date</th><th>numéro client</th></tr>
    <tr><td>30188</td><td>2/1/2009</td><td>B512</td></tr>
    <tr><td>30179</td><td>22/12/2008</td><td>C400</td></tr>
</table>

<table>
    <tr><th colspan="4">Clients</th></tr>
  <tr><th>numéro</th><th>nom</th><th>adresse</th><th>localité</th></tr>
  <tr><td>B512</td><td>GILLET</td><td>14, r. de l'Eté</td><td>Toulouse</td></tr>
  <tr><td>C400</td><td>FERARD</td><td>65, r. du Tertre</td><td>Poitiers</td></tr>
</table>

<table>
    <tr><th colspan="5">Détails</th></tr>
    <tr><th>numéro commande</th><th>numéro produit</th><th>quantité</th></tr>
    <tr><td>30188</td><td>CS464</td><td>180</td></tr>
    <tr><td>30188</td><td>PA45</td><td>22</td></tr>
    <tr><td>30188</td><td>PA60</td><td>70</td></tr>
    <tr><td>30188</td><td>PH222</td><td>92</td></tr>
    <tr><td>30179</td><td>CS262</td><td>60</td></tr>
    <tr><td>30179</td><td>PA60</td><td>20</td></tr>
</table>

<table>
    <tr><th colspan="5">Produits</th></tr>
    <tr><th>numéro produit</th><th>libellé</th><th>prix</th></tr>
    <tr><td>CS464</td><td>CHEV. SAPIN 400x6x4</td><td>220</td></tr>
    <tr><td>PA45</td><td>POINTE ACIER 45</td><td>105</td></tr>
    <tr><td>PA60</td><td>POINTE ACIER 60</td><td>95</td></tr>
    <tr><td>PH222</td><td>PL. HETRE 200x20x2</td><td>230</td></tr>
    <tr><td>CS262</td><td>CHEV. SAPIN 200x6x2</td><td>75</td></tr>
    <tr><td>PA60</td><td>POINTE ACIER 60</td><td>95</td></tr>
</table>

#### Ce résultat est satisfaisant !

* Aucune donnée n'est dupliquée, hormis les données qui font références à d'autres tables.
* On peut reconstruire les bons de commandes originaux en utilisant les références (numéros de clients, de commandes et de produits) et en calculant les totaux en multipliant les quantités commandées par les prix des produits





### Premières conclusions

* Une **base de données** est constituée d’un **ensemble de tables** 
* Chaque **table** contient les données relatives à des **entités** de même nature 
* Chaque **ligne** d’une table reprend les données relatives à une **entité** 
* Chaque **colonne** d’une table décrit une **propriété** commune des **entités** 
* Les **lignes** d’une table sont **distinctes** 
* Le jeux de colonnes dont les valeurs sont uniques constitue un **identifiant** ou **clé primaire** de la table 
* Les lignes d’une table peuvent faire **référence** chacune à une ligne d’une autre table. On parle alors de **clé étrangère** 
* On évite de stocker les informations qui peuvent être calculées 
* On ne conserve pas dans une même table des informations relatives plusieurs entités 
* Il est nécessaire d’avoir un langage d’interrogation de la base de données
