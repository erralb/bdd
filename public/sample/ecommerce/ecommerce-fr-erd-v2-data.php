<?php
require_once 'vendor/autoload.php';

// Scénario de données
// Le client 1 a commandé tous les produits en 2 commandes (la commande 1 et 2)
// Le client 2 n'a rien commandé
// Le client 3 a commandé tous les produits en 1 commande (la commande 3)
// Le client 4 a commandé 2 produits en 1 commande (la commande 4)
// Le client 5 a commandé 3 produits en 1 commande (la commande 5)

//connect to database
$pdo = new PDO('sqlite:ecommerce-fr-erd-v2.sqlite');

//create tables
$sql = file_get_contents('ecommerce-fr-erd-v2-sqlite.sql');
$pdo->exec($sql);

$clients = [
    ['1', 'Lebreton', 'Éléonore', '6, avenue Françoise Olivier', '59778', 'Guillot-la-Forêt'],
    ['2', 'Vasseur', 'Georges', '54, avenue Jean', '66941', 'Jacquot'],
    ['3', 'Da Costa', 'Léon', 'boulevard Brigitte Faivre', '42827', 'Leclercq'],
    ['4', 'Rey', 'Michel', '49, avenue de Adam', '58442', 'Mathieu-sur-Colin'],
    ['5', 'Weiss', 'Dominique', 'boulevard Remy', '58458', 'Dias-la-Forêt'],
];

foreach ($clients as $client) {
    $stmt = $pdo->prepare("INSERT INTO CLIENTS (numero, nom, prenom, rue, codePostal, ville) VALUES (:numero, :nom, :prenom, :rue, :codePostal, :ville)");
    $stmt->bindParam(":numero", $client[0], PDO::PARAM_INT);
    $stmt->bindParam(":nom", $client[1], PDO::PARAM_STR);
    $stmt->bindParam(":prenom", $client[2], PDO::PARAM_STR);
    $stmt->bindParam(":rue", $client[3], PDO::PARAM_STR);
    $stmt->bindParam(":codePostal", $client[4], PDO::PARAM_STR);
    $stmt->bindParam(":ville", $client[5], PDO::PARAM_STR);
    $stmt->execute();
}

//Produits data
//liste de noms de produits réalistes
$produits = [
    ['1', 'T-shirt', 25, 30],
    ['2', 'Pantalon', 60, 50],
    ['3', 'Chaussures', 120, 100],
    ['4', 'Casquette', 15, 10],
    ['5', 'Sac à dos', 80, 5]
];

foreach ($produits as $produit) {
    $stmt = $pdo->prepare("INSERT INTO PRODUITS (numero, nom, prix, stock) VALUES (:numero, :nom, :prix, :stock)");
    $stmt->bindParam(":numero", $produit[0], PDO::PARAM_INT);
    $stmt->bindParam(":nom", $produit[1], PDO::PARAM_STR);
    $stmt->bindParam(":prix", $produit[2], PDO::PARAM_INT);
    $stmt->bindParam(":stock", $produit[3], PDO::PARAM_INT);
    $stmt->execute();
}

//Commandes data
$commandes = [
    ['1', '1', '2024-02-01', 'livrée'],
    ['2', '1', '2024-03-15', 'livrée'],
    ['3', '3', '2024-04-28', 'livrée'],
    ['4', '4', '2024-05-24', 'annulée'],
    ['5', '5', '2024-06-30', 'en cours'],
    ['6', '5', '2024-07-12', 'en cours'],
    ['7', '4', '2024-08-19', 'annulée'],
];

foreach ($commandes as $commande) {
    $stmt = $pdo->prepare("INSERT INTO COMMANDES (numero, numeroClient, dateCommande, statut) VALUES (:numero, :numeroClient, :dateCommande, :statut)");
    $stmt->bindParam(":numero", $commande[0], PDO::PARAM_INT);
    $stmt->bindParam(":numeroClient", $commande[1], PDO::PARAM_INT);
    $stmt->bindParam(":dateCommande", $commande[2], PDO::PARAM_STR);
    $stmt->bindParam(":statut", $commande[3], PDO::PARAM_STR);
    $stmt->execute();
}

// Details data
$details = [
    ['1', '1', '3'],
    ['1', '2', '1'],
    ['1', '3', '1'],
    ['2', '4', '1'],
    ['2', '5', '1'],
    ['3', '1', '1'],
    ['3', '2', '1'],
    ['3', '3', '1'],
    ['3', '4', '1'],
    ['3', '5', '1'],
    ['4', '1', '1'],
    ['4', '2', '1'],
    ['5', '1', '1'],
    ['5', '2', '1'],
    ['5', '3', '1'],
    ['6', '1', '1'],
    ['7', '1', '1'],
];

foreach ($details as $detail) {
    $stmt = $pdo->prepare("INSERT INTO DETAILS (numeroCommande, numeroProduit, quantite) VALUES (:numeroCommande, :numeroProduit, :quantite)");
    $stmt->bindParam(":numeroCommande", $detail[0], PDO::PARAM_INT);
    $stmt->bindParam(":numeroProduit", $detail[1], PDO::PARAM_INT);
    $stmt->bindParam(":quantite", $detail[2], PDO::PARAM_INT);
    $stmt->execute();
}

echo 'Données insérées avec succès' . "\n";
