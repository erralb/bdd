<?php
/**
 * Script to populate the database with fake data
 * https://fakerphp.org/
 * You need to run :
 *  composer install 
 * 
 * before running this script in order to install Faker PHP
 */

require_once 'vendor/autoload.php';

$faker = Faker\Factory::create('fr_FR');

$pdo = new PDO('sqlite:ecommerce-fr-erd-v1.sqlite');

$sql = file_get_contents('ecommerce-fr-erd-v1.sql');
$pdo->exec($sql);

//Clients data
for ($i = 1; $i < 6; $i++) {
    $prenom = $faker->firstName();
    $nom = $faker->lastName();
    $email = strtolower($nom).'@'.$faker->freeEmailDomain();
    $nom = $prenom.' '.$nom;
    $rue = $faker->streetAddress();
    $codePostal = $faker->postcode();
    $ville = $faker->city();
    $telephone = $faker->phoneNumber();

    $stmt = $pdo->prepare("INSERT INTO CLIENTS (numero, nom, email, rue, codePostal, ville, telephone) VALUES (:numero, :nom, :email, :rue, :codePostal, :ville, :telephone)");
    $stmt->bindParam(":numero", $i, PDO::PARAM_INT);
    $stmt->bindParam(":nom", $nom, PDO::PARAM_STR);
    $stmt->bindParam(":email", $email, PDO::PARAM_STR);
    $stmt->bindParam(":rue", $rue, PDO::PARAM_STR);
    $stmt->bindParam(":codePostal", $codePostal, PDO::PARAM_STR);
    $stmt->bindParam(":ville", $ville, PDO::PARAM_STR);
    $stmt->bindParam(":telephone", $telephone, PDO::PARAM_STR);
    $stmt->execute();
}

//Commandes data
for ($i = 1; $i < 6; $i++) {
    $numero = $i;
    $numeroClient = $faker->numberBetween(1, 5);
    $dateCommande = $faker->dateTimeBetween('-12 week', 'now')->format('Y-m-d');
    $statut = $faker->randomElement(['en cours', 'livrée', 'annulée']);

    $stmt = $pdo->prepare("INSERT INTO COMMANDES (numero, numeroClient, dateCommande, statut) VALUES (:numero, :numeroClient, :dateCommande, :statut)");
    $stmt->bindParam(":numero", $numero, PDO::PARAM_INT);
    $stmt->bindParam(":numeroClient", $numeroClient, PDO::PARAM_INT);
    $stmt->bindParam(":dateCommande", $dateCommande, PDO::PARAM_STR);
    $stmt->bindParam(":statut", $statut, PDO::PARAM_STR);
    $stmt->execute();
}

//Produits data
//liste de noms de produits réalistes
$produits = ['T-shirt', 'Pantalon', 'Chaussures', 'Casquette', 'Sac à dos'];
for ($i = 1; $i < 6; $i++) {
    $numero = $i;
    $nom = $produits[$i - 1];
    $prix = $faker->numberBetween(10, 50);
    $stock = $faker->numberBetween(0, 500);

    $stmt = $pdo->prepare("INSERT INTO PRODUITS (numero, nom, prix, stock) VALUES (:numero, :nom, :prix, :stock)");
    $stmt->bindParam(":numero", $numero, PDO::PARAM_INT);
    $stmt->bindParam(":nom", $nom, PDO::PARAM_STR);
    $stmt->bindParam(":prix", $prix, PDO::PARAM_STR);
    $stmt->bindParam(":stock", $stock, PDO::PARAM_INT);
    $stmt->execute();
}

//Details data
$details_pks = [];
for ($i = 1; $i < 11; $i++) {
    
    do {
        $numeroCommande = $faker->numberBetween(1, 5);
        $numeroProduit = $faker->numberBetween(1, 5);
    } while (in_array($numeroCommande . '-' . $numeroProduit, $details_pks)); //ensure that the primary key is unique
    $details_pks[] = $numeroCommande . '-' . $numeroProduit;
    $quantite = $faker->numberBetween(1, 3);

    $stmt = $pdo->prepare("INSERT INTO DETAILS (numeroCommande, numeroProduit, quantite) VALUES (:numeroCommande, :numeroProduit, :quantite)");
    $stmt->bindParam(":numeroCommande", $numeroCommande, PDO::PARAM_INT);
    $stmt->bindParam(":numeroProduit", $numeroProduit, PDO::PARAM_INT);
    $stmt->bindParam(":quantite", $quantite, PDO::PARAM_INT);
    $stmt->execute();
}

echo 'Données insérées avec succès'."\n";

?>
