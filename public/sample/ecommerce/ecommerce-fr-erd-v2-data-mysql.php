<?php
// For MySQL
$pdo = new PDO('mysql:host=localhost;dbname=filrouge', 'username', 'password'); // Connect
$sql = file_get_contents('ecommerce-fr-erd-v2-mysql.sql'); // Run database creation (deletes tables and data !)
$pdo->exec($sql); // Execute
include 'ecommerce-fr-erd-v2-data.php'; // generate data
?>
