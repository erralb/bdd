<?php
//For Postgres
$pdo = new PDO('pgsql:host=127.0.0.1;port=5432;dbname=filrouge', 'postgres', ''); //Connect
$sql = file_get_contents('ecommerce-fr-erd-v2-postgres.sql'); //Run database creation (deletes tables and data !)
$pdo->exec($sql); //Execute
include 'ecommerce-fr-erd-v2-data.php'; //generate data
?>
