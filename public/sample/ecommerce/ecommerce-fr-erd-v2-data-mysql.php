<?php
// For MySQL
// $pdo = new PDO('mysql:host=localhost;dbname=filrouge', 'username', 'password');
$pdo = new PDO('mysql:host=localhost;dbname=filrouge', 'phpmy', 'phpmy');
$sql = file_get_contents('ecommerce-fr-erd-v2-mysql.sql');
$pdo->exec($sql);
include 'ecommerce-fr-erd-v2-data.php';
?>
