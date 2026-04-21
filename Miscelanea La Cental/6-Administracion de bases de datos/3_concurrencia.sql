-- PROBLEMA:
-- Solamente queda 1 litro de leche y dos vendedores v1 y v2 AL MISMO TIEMPO, venden ese litro de leche. Entonces un cliente se va a quedar sin leche pero la leche se vendió y se pagó.

-- Solución 1: Transacciones
START TRANSACTION;

SELECT id, nombre, stock
FROM productos
WHERE id = 1
LIMIT 1
FOR UPDATE;

INSERT ventas (cliente_id, fecha, tipo, total, estado_pago)
VALUES (1, CURDATE(), 'detal', 7000, 'pagado');

SET @venta_id = (SELECT MAX(id) FROM ventas);

INSERT INTO detalle_ventas (venta_id, producto_id, cantidad, precio_unitario)
VALUES(@venta_id, 1, 2, 3500);

UPDATE productos
SET stock = stock - 2
WHERE id = 1;

COMMIT;