-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 25 sep. 2024 à 17:06
-- Version du serveur : 9.0.1
-- Version de PHP : 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `filRouge`
--

-- --------------------------------------------------------

--
-- Structure de la table `Clients`
--

CREATE TABLE `Clients` (
  `numero` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `codePostal` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Clients`
--

INSERT INTO `Clients` (`numero`, `nom`, `prenom`, `rue`, `codePostal`, `ville`) VALUES
(1, 'Lebreton', 'Éléonore', '6, avenue Françoise Olivier', '59778', 'Guillot-la-Forêt'),
(2, 'Vasseur', 'Georges', '54, avenue Jean', '66941', 'Jacquot'),
(3, 'Da Costa', 'Léon', 'boulevard Brigitte Faivre', '42827', 'Leclercq'),
(4, 'Rey', 'Michel', '49, avenue de Adam', '58442', 'Mathieu-sur-Colin'),
(5, 'Weiss', 'Dominique', 'boulevard Remy', '58458', 'Dias-la-Forêt');

-- --------------------------------------------------------

--
-- Structure de la table `Commandes`
--

CREATE TABLE `Commandes` (
  `numero` int NOT NULL,
  `numeroClient` int DEFAULT NULL,
  `dateCommande` date DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Commandes`
--

INSERT INTO `Commandes` (`numero`, `numeroClient`, `dateCommande`, `statut`) VALUES
(1, 1, '2024-02-01', 'livrée'),
(2, 1, '2024-03-15', 'livrée'),
(3, 3, '2024-04-28', 'livrée'),
(4, 4, '2024-05-24', 'annulée'),
(5, 5, '2024-06-30', 'en cours'),
(6, 5, '2024-07-12', 'en cours'),
(7, 4, '2024-08-19', 'annulée');

-- --------------------------------------------------------

--
-- Structure de la table `Details`
--

CREATE TABLE `Details` (
  `numeroCommande` int NOT NULL,
  `numeroProduit` int NOT NULL,
  `quantite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Details`
--

INSERT INTO `Details` (`numeroCommande`, `numeroProduit`, `quantite`) VALUES
(1, 1, 3),
(1, 2, 1),
(1, 3, 1),
(2, 4, 1),
(2, 5, 1),
(3, 1, 1),
(3, 2, 1),
(3, 3, 1),
(3, 4, 1),
(3, 5, 1),
(4, 1, 1),
(4, 2, 1),
(5, 1, 1),
(5, 2, 1),
(5, 3, 1),
(6, 1, 1),
(7, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Produits`
--

CREATE TABLE `Produits` (
  `numero` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `stock` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Produits`
--

INSERT INTO `Produits` (`numero`, `nom`, `prix`, `stock`) VALUES
(1, 'T-shirt', 25, 30),
(2, 'Pantalon', 60, 50),
(3, 'Chaussures', 120, 100),
(4, 'Casquette', 15, 10),
(5, 'Sac à dos', 80, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`numero`);

--
-- Index pour la table `Commandes`
--
ALTER TABLE `Commandes`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `numeroClient_idx` (`numeroClient`);

--
-- Index pour la table `Details`
--
ALTER TABLE `Details`
  ADD PRIMARY KEY (`numeroCommande`,`numeroProduit`),
  ADD KEY `numeroProduit` (`numeroProduit`);

--
-- Index pour la table `Produits`
--
ALTER TABLE `Produits`
  ADD PRIMARY KEY (`numero`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Commandes`
--
ALTER TABLE `Commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`numeroClient`) REFERENCES `Clients` (`numero`);

--
-- Contraintes pour la table `Details`
--
ALTER TABLE `Details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`numeroCommande`) REFERENCES `Commandes` (`numero`),
  ADD CONSTRAINT `details_ibfk_2` FOREIGN KEY (`numeroProduit`) REFERENCES `Produits` (`numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
