<?php
//For Postgres
$pdo = new PDO('pgsql:host=127.0.0.1;port=5432;dbname=filrouge', 'postgres', '');
$sql = file_get_contents('ecommerce-fr-erd-v2-postgres.sql');
$pdo->exec($sql);
include 'ecommerce-fr-erd-v2-data.php';
?>
