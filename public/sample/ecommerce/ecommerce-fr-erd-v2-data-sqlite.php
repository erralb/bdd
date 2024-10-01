<?php
//For SQLite
$pdo = new PDO('sqlite:ecommerce-fr-erd-v2.sqlite'); //Connect
$sql = file_get_contents('ecommerce-fr-erd-v2-sqlite.sql'); //Run database creation (deletes tables and data !)
$pdo->exec($sql);
include 'ecommerce-fr-erd-v2-data.php'; //generate data
?>
