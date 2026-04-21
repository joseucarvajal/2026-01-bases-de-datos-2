Backup de Esquema y datos

Backup de sólo Esquema
/Applications/XAMPP/xamppfiles/bin/mysqldump -u root -p --no-data miscelanea_la_central > "/Users/joseucarvajal/Documents/UM/2026/Bases de datos 2/bases-de-datos-II/Miscelanea La Cental/6-Administracion de bases de datos/backup_solo_esquema_20250420.sql"

Backup de sólo Datos
/Applications/XAMPP/xamppfiles/bin/mysqldump -u root -p --no-create-info miscelanea_la_central > "/Users/joseucarvajal/Documents/UM/2026/Bases de datos 2/bases-de-datos-II/Miscelanea La Cental/6-Administracion de bases de datos/backup_solo_datos_20250420.sql"


Backup de ÚNICAMENTE ventas
/Applications/XAMPP/xamppfiles/bin/mysqldump -u root -p miscelanea_la_central ventas detalle_ventas > "/Users/joseucarvajal/Documents/UM/2026/Bases de datos 2/bases-de-datos-II/Miscelanea La Cental/6-Administracion de bases de datos/backup_solo_ventas_20250420.sql"
