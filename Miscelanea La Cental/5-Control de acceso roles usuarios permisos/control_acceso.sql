-- Paso 1: Crear roles
CREATE ROLE IF NOT EXISTS 'rol_admin';
CREATE ROLE IF NOT EXISTS 'rol_vendedor';
CREATE ROLE IF NOT EXISTS 'rol_bodeguero';
CREATE ROLE IF NOT EXISTS 'rol_contador';
CREATE ROLE IF NOT EXISTS 'rol_socio';

-- Paso 2: Asignar privilegios a cada rol
-- 2.1 Role admin
GRANT ALL PRIVILEGES ON miscelanea_la_central.* TO 'rol_admin';

--El rol tendría todos los privilegios en TODAS las bases de datos
GRANT ALL PRIVILEGES ON *.* TO 'rol_admin';

-- 2.2 Rol Vendedor
GRANT SELECT ON miscelanea_la_central.productos TO 'rol_vendedor';
GRANT SELECT ON miscelanea_la_central.categorias TO 'rol_vendedor';
GRANT SELECT, INSERT, UPDATE ON miscelanea_la_central.clientes TO 'rol_vendedor';
GRANT SELECT, INSERT ON miscelanea_la_central.ventas TO 'rol_vendedor';
GRANT SELECT, INSERT ON miscelanea_la_central.abonos_clientes TO 'rol_vendedor';
GRANT UPDATE (stock) ON miscelanea_la_central.productos TO 'rol_vendedor';

-- 2.3 Rol Bodeguero
GRANT SELECT, UPDATE ON miscelanea_la_central.productos TO 'rol_bodeguero';
GRANT SELECT ON miscelanea_la_central.categorias TO 'rol_bodeguero';
GRANT SELECT ON miscelanea_la_central.proveedores TO 'rol_bodeguero';
GRANT SELECT, INSERT ON miscelanea_la_central.compras TO 'rol_bodeguero';
GRANT SELECT, INSERT ON miscelanea_la_central.detalle_compras TO 'rol_bodeguero';
GRANT SELECT, INSERT ON miscelanea_la_central.abonos_proveedores TO 'rol_bodeguero';

-- 2.4. Rol Contador
GRANT SELECT ON miscelanea_la_central.ventas TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.detalle_ventas TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.compras TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.detalle_compras TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.gastos TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.tipos_gasto TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.clientes TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.abonos_clientes TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.proveedores TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.abonos_proveedores TO 'rol_contador';
GRANT SELECT ON miscelanea_la_central.trabajadores TO 'rol_contador';

--2.5. Rol Socio
GRANT SELECT ON miscelanea_la_central.ventas TO 'rol_socio';
GRANT SELECT ON miscelanea_la_central.compras TO 'rol_socio';
GRANT SELECT ON miscelanea_la_central.gastos TO 'rol_socio';
GRANT SELECT ON miscelanea_la_central.tipos_gasto TO 'rol_socio';

-- Paso 3: Crear usuarios
CREATE USER IF NOT EXISTS 'admin_luis'@'localhost' IDENTIFIED BY 'Admin#2025!';
CREATE USER IF NOT EXISTS 'vendedor_ana'@'localhost' IDENTIFIED BY 'Venta#2025!';
CREATE USER IF NOT EXISTS 'vendedor_pedro'@'localhost' IDENTIFIED BY 'Venta#20251!';
CREATE USER IF NOT EXISTS 'bodeguero_miguel'@'localhost' IDENTIFIED BY 'Bodega#2025!';
CREATE USER IF NOT EXISTS 'socio_uno'@'localhost' IDENTIFIED BY 'Socio#2025!';
CREATE USER IF NOT EXISTS 'socio_dos'@'localhost' IDENTIFIED BY 'Socio#2025!';
CREATE USER IF NOT EXISTS 'contador'@'localhost' IDENTIFIED BY 'Contador#2025!';


-- Paso 4: Asignar roles a usuarios
GRANT 'rol_admin' TO 'admin_luis'@'localhost';
GRANT 'rol_vendedor' TO 'vendedor_ana'@'localhost';
GRANT 'rol_vendedor' TO 'vendedor_pedro'@'localhost';
GRANT 'rol_bodeguero' TO 'bodeguero_miguel'@'localhost';
GRANT 'rol_contador' TO 'contador'@'localhost';
GRANT 'rol_socio' TO 'socio_uno'@'localhost';
GRANT 'rol_socio' TO 'socio_dos'@'localhost';

-- Paso 5: Activar roles por defecto
SET DEFAULT ROLE 'rol_admin' FOR 'admin_luis'@'localhost';
SET DEFAULT ROLE 'rol_vendedor' FOR 'vendedor_ana'@'localhost';
SET DEFAULT ROLE 'rol_vendedor' FOR 'vendedor_pedro'@'localhost';
SET DEFAULT ROLE 'rol_bodeguero' FOR 'bodeguero_miguel'@'localhost';
SET DEFAULT ROLE 'rol_contador' FOR 'contador'@'localhost';
SET DEFAULT ROLE 'rol_socio' FOR 'socio_uno'@'localhost';
SET DEFAULT ROLE 'rol_socio' FOR 'socio_dos'@'localhost';

-- Si no asignaramos roles por defecto
SET ROLE 'rol_vendedor'

-- Si quisieramos consultar qué roles están activos en una sesión de un usuario
SELECT CURRENT_ROLE();

-- Paso 6: Verificar privilegios de los usuarios
SHOW GRANTS FOR 'vendedor_ana'@'localhost';
SHOW GRANTS FOR 'bodeguero_miguel'@'localhost';

-- Paso 7: Probar los accesos según rol
-- Programa cliente: DBeaver
-- Loguearse como vendedor: 'vendedor_ana'@'localhost';
-- Como el rol_vendedor puede consultar productos, no hay problema con la siguiente consulta:
SELECT id, nombre, precio_venta_detal, precio_venta_mayor, stock
FROM productos
LIMIT 5

--FALLA: El vendedor NO tiene acceso a compras, por lo tanto la siguiente consulta debe producir un error de acceso denegado
SELECT *
FROM compras























