php ecommerce-fr-erd-v2-data-sqlite.php
sqlite3 ecommerce-fr-erd-v2.sqlite .dump > ecommerce-fr-erd-v2-sqlite-EXPORT.sql

php ecommerce-fr-erd-v2-data-mysql.php
mysqldump filrouge > ecommerce-fr-erd-v2-mysql-EXPORT.sql

php ecommerce-fr-erd-v2-data-postgres.php 
pg_dump filrouge > ecommerce-fr-erd-v2-postgres-EXPORT.sql

