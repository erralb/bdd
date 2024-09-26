-- SQL script generated from Mermaid JS ERD to Postgres SQL
-- Schema: Fil Rouge

-- CREATE DATABASE filRouge;
-- USE filRouge;


DROP TABLE IF EXISTS Details;
DROP TABLE IF EXISTS Commandes;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Produits;


CREATE TABLE Clients ( 
    numero INT,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    rue VARCHAR(255),
    codePostal VARCHAR(255),
    ville VARCHAR(255),
    telephone VARCHAR(20),
    categorie VARCHAR(2),
    compte FLOAT,
    PRIMARY KEY (numero)
);

CREATE TABLE Commandes ( 
    numero INT,
    numeroClient INT,
    dateCommande DATE,
    statut VARCHAR(255),
    PRIMARY KEY (numero),
    FOREIGN KEY(numeroClient) REFERENCES Clients(numero)
);

CREATE TABLE Produits ( 
    numero INT,
    nom VARCHAR(255),
    prix FLOAT,
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
