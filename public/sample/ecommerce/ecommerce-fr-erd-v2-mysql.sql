-- SQL script generated from Mermaid JS ERD to MySQL
-- Schema: Fil Rouge

CREATE DATABASE IF NOT EXISTS filrouge;
USE filrouge;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Commandes;
DROP TABLE IF EXISTS Produits;
DROP TABLE IF EXISTS Details;


CREATE TABLE Clients ( 
    numero INT,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    rue VARCHAR(255),
    codePostal VARCHAR(255),
    ville VARCHAR(255),
    telephone VARCHAR(16),
    categorie VARCHAR(2),
    PRIMARY KEY (numero)
);

CREATE TABLE Commandes ( 
    numero INT,
    numeroClient INT,
    dateCommande DATE,
    statut VARCHAR(255),
    PRIMARY KEY (numero),
    INDEX numeroClient_idx (numeroClient),
    FOREIGN KEY(numeroClient) REFERENCES Clients(numero)
);

CREATE TABLE Produits ( 
    numero INT,
    nom VARCHAR(255),
    prix double,
    stock INT,
    PRIMARY KEY (numero)
);

CREATE TABLE Details ( 
    numeroCommande INT,
    numeroProduit INT,
    quantite INT,
    PRIMARY KEY (numeroCommande,numeroProduit),
    FOREIGN KEY(numeroCommande) REFERENCES Commandes(numero),
    FOREIGN KEY(numeroProduit) REFERENCES Produits(numero)
);


SET FOREIGN_KEY_CHECKS=1;
