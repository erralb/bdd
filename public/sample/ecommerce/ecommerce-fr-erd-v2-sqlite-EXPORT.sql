PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
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
INSERT INTO Clients VALUES(1,'Lebreton','Éléonore','6, avenue Françoise Olivier','59778','Guillot-la-Forêt','0776059929','A1',10000.0);
INSERT INTO Clients VALUES(2,'Vasseur','Georges','54, avenue Jean','66941','Jacquot','+33 1 44 68 49 74','B2',1903.0);
INSERT INTO Clients VALUES(3,'Da Costa','Léon','boulevard Brigitte Faivre','42827','Leclercq','0568740044','C3',-1500.0);
INSERT INTO Clients VALUES(4,'Rey','Michel','49, avenue de Adam','58442','Mathieu-sur-Colin',NULL,'B1',3251.0);
INSERT INTO Clients VALUES(5,'Weiss','Dominique','boulevard Remy','58458','Dias-la-Forêt',NULL,'B2',0.0);
INSERT INTO Clients VALUES(6,'Berlioz','Diane','27 avenue de la Chartreuse','42827','Leclercq',NULL,NULL,123094.0);
CREATE TABLE Commandes ( 
    numero INT,
    numeroClient INT,
    dateCommande DATE,
    statut VARCHAR(255),
    PRIMARY KEY (numero),
    FOREIGN KEY(numeroClient) REFERENCES Clients(numero)
);
INSERT INTO Commandes VALUES(1,1,'2024-02-01','livrée');
INSERT INTO Commandes VALUES(2,1,'2024-03-15','livrée');
INSERT INTO Commandes VALUES(3,3,'2024-04-28','livrée');
INSERT INTO Commandes VALUES(4,4,'2024-05-24','annulée');
INSERT INTO Commandes VALUES(5,5,'2024-06-30','en cours');
INSERT INTO Commandes VALUES(6,5,'2024-07-12','en cours');
INSERT INTO Commandes VALUES(7,4,'2024-08-19','annulée');
CREATE TABLE Produits ( 
    numero INT,
    nom VARCHAR(255),
    prix double,
    stock INT,
    PRIMARY KEY (numero)
);
INSERT INTO Produits VALUES(1,'T-shirt',25.0,30);
INSERT INTO Produits VALUES(2,'Pantalon',60.0,50);
INSERT INTO Produits VALUES(3,'Chaussures',120.0,100);
INSERT INTO Produits VALUES(4,'Casquette',15.0,10);
INSERT INTO Produits VALUES(5,'Sac à dos',80.0,5);
CREATE TABLE Details ( 
    numeroCommande INT,
    numeroProduit INT,
    quantite INT,
    PRIMARY KEY (numeroCommande,numeroProduit),
    FOREIGN KEY(numeroCommande) REFERENCES Commandes(numero),
    FOREIGN KEY(numeroProduit) REFERENCES Produits(numero)
);
INSERT INTO Details VALUES(1,1,3);
INSERT INTO Details VALUES(1,2,1);
INSERT INTO Details VALUES(1,3,1);
INSERT INTO Details VALUES(2,4,1);
INSERT INTO Details VALUES(2,5,1);
INSERT INTO Details VALUES(3,1,4);
INSERT INTO Details VALUES(3,2,1);
INSERT INTO Details VALUES(3,3,2);
INSERT INTO Details VALUES(3,4,1);
INSERT INTO Details VALUES(3,5,1);
INSERT INTO Details VALUES(4,1,7);
INSERT INTO Details VALUES(4,2,1);
INSERT INTO Details VALUES(5,1,2);
INSERT INTO Details VALUES(5,2,1);
INSERT INTO Details VALUES(5,3,1);
INSERT INTO Details VALUES(6,1,10);
INSERT INTO Details VALUES(7,1,1);
COMMIT;
