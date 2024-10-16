<?php
/**
 * Script to populate the database data
 */

// Scénario de données
// Le client 1 a commandé tous les produits en 2 commandes (la commande 1 et 2)
// Le client 2 n'a rien commandé
// Le client 3 a commandé tous les produits en 1 commande (la commande 3)
// Le client 4 a commandé 2 produits en 1 commande (la commande 4)
// Le client 5 a commandé 3 produits en 1 commande (la commande 5)

$clients = [
    ['1', 'Lebreton', 'Éléonore', '6 avenue Françoise Olivier', '38240', 'Meylan','0776059929', 'A1', 10000],
    ['2', 'Vasseur', 'Georges', '54, avenue Jean', '38000', 'Grenoble', '+33 1 44 68 49 74', 'B2', 1903.54],
    ['3', 'Da Costa', 'Léon', '18, boulevard Brigitte Faivre', '75000', 'Paris', '0568740044', 'C3', -1500 ],
    ['4', 'Rey', 'Michel', '49, avenue de Adam', '38220', 'Vizille', NULL, 'B1', 3251 ],
    ['5', 'Weiss', 'Dominique', '98, boulevard Remy', '59000', 'Lille', NULL, 'B2', 0],
    ['6', 'Berlioz', 'Diane', '27 avenue de la Chartreuse', '75000', 'Paris', NULL, NULL, 123094 ],
    ['7', 'Lefevre', 'Jean', '12, rue de la République', '69000', 'Lyon', NULL, 'C1', -1000],
    ['9', 'Barda', 'Jérôme', '128 rue de la Paix', '75000', 'Paris', NULL, 'C1', -2000],
    ['8', 'Jacques', 'Chaoui', '1240 rue des Ateliers', '75001', 'Paris', NULL, 'C1', -1750],
];

foreach ($clients as $client) {
    $stmt = $pdo->prepare("INSERT INTO CLIENTS (numero, nom, prenom, rue, codePostal, ville, telephone, categorie, compte) VALUES (:numero, :nom, :prenom, :rue, :codePostal, :ville, :telephone, :categorie, :compte)");
    $stmt->bindParam(":numero", $client[0], PDO::PARAM_INT);
    $stmt->bindParam(":nom", $client[1], PDO::PARAM_STR);
    $stmt->bindParam(":prenom", $client[2], PDO::PARAM_STR);
    $stmt->bindParam(":rue", $client[3], PDO::PARAM_STR);
    $stmt->bindParam(":codePostal", $client[4], PDO::PARAM_STR);
    $stmt->bindParam(":ville", $client[5], PDO::PARAM_STR);
    $stmt->bindParam(":telephone", $client[6], PDO::PARAM_STR);
    $stmt->bindParam(":categorie", $client[7], PDO::PARAM_STR);
    $stmt->bindParam(":compte", $client[8], PDO::PARAM_INT);
    $stmt->execute();
}

//Produits data
//liste de noms de produits réalistes
$produits = [
    ['1', 'T-shirt', 25, 30],
    ['2', 'Pantalon', 60, 50],
    ['3', 'Chaussures', 120, 100],
    ['4', 'Casquette', 15, 10],
    ['5', 'Sac à dos', 80, 5],
    // ['6', 'Pull', 70, 150]
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
    ['4', '4', '2024-06-24', 'annulée'],
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
    ['3', '1', '4'],
    ['3', '2', '1'],
    ['3', '3', '2'],
    ['3', '4', '1'],
    ['3', '5', '1'],
    ['4', '1', '7'],
    ['4', '2', '1'],
    ['5', '1', '2'],
    ['5', '2', '1'],
    ['5', '3', '1'],
    ['6', '1', '10'],
    ['7', '1', '1'],
];

foreach ($details as $detail) {
    $stmt = $pdo->prepare("INSERT INTO DETAILS (numeroCommande, numeroProduit, quantite) VALUES (:numeroCommande, :numeroProduit, :quantite)");
    $stmt->bindParam(":numeroCommande", $detail[0], PDO::PARAM_INT);
    $stmt->bindParam(":numeroProduit", $detail[1], PDO::PARAM_INT);
    $stmt->bindParam(":quantite", $detail[2], PDO::PARAM_INT);
    $stmt->execute();
}

$classeCpt = [
    ['10000', '32000', 'A'],
    ['5000', '10000', 'B'],
    ['2000', '5000', 'C'],
    ['1000', '2000', 'D'],
    ['500', '1000', 'F'],
    ['0', '500', 'G'],
    ['-500', '0', 'U'],
    ['-1000', '-500', 'V'],
    ['-2000', '-1000', 'W'],
    ['-5000', '-2000', 'X'],
    ['-10000', '-5000', 'Y'],
    ['-32000', '-10000', 'Z'],
];

foreach ($classeCpt as $classe) {
    $stmt = $pdo->prepare("INSERT INTO Classes_Comptes (minimumCompte, maximumCompte, codeCompte) VALUES (:minimumCompte, :maximumCompte, :codeCompte)");
    $stmt->bindParam(":minimumCompte", $classe[0], PDO::PARAM_INT);
    $stmt->bindParam(":maximumCompte", $classe[1], PDO::PARAM_INT);
    $stmt->bindParam(":codeCompte", $classe[2], PDO::PARAM_STR);
    $stmt->execute();
}

echo 'Données insérées avec succès' . "\n";

?>
