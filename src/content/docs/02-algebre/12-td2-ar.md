---
title: TD2
description: Exercices d'algèbre relationelle
---

## Exercice 1
Soit le schéma relationnel de la base de données d'une agence de voyage :
CLIENT (NUMCLIENT, NOM, PRENOM, E-MAIL, NUMCB)
RESERVATION (NUMCLIENT, CODEVOYAGE, DATERES)
VOYAGE (CODEVOYAGE, DESTINATION, DUREE, PRIX)

Formuler en algèbre relationnelle les requêtes suivantes :
1. Nom, prénom et e-mail des clients ayant une réservation en cours
2. Nom, prénom et e-mail des clients n'ayant aucune réservation en cours
3. Destination et liste des clients ayant réservés pour un voyage de plus de 10 jours et coûtant moins de 1000e
4. Numéros de tous les clients ayant réservés sur tous les voyages proposés

## Exercice 2
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
