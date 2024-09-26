php ecommerce-fr-erd-v2-data-sqlite.php ecommerce-fr-erd-v2-data-mysql.php ecommerce-fr-erd-v2-data-postgres.php 
mysqldump filrouge > ecommerce-fr-erd-v2-mysql-EXPORT.sql
pg_dump filrouge > ecommerce-fr-erd-v2-postgres-EXPORT.sql
sqlite3 ecommerce-fr-erd-v2.sqlite .dump > ecommerce-fr-erd-v2-sqlite-EXPORT.sql
