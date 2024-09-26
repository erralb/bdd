<?php
//For SQLite
$pdo = new PDO('sqlite:ecommerce-fr-erd-v2.sqlite');
$sql = file_get_contents('ecommerce-fr-erd-v2-sqlite.sql');
$pdo->exec($sql);
include 'ecommerce-fr-erd-v2-data.php';
?>
