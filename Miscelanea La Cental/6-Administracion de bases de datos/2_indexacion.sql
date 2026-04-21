-- Paso 1: Consultar los indices que ya existen
SHOW INDEX FROM ventas;

-- Paso 2: Crear indice por fecha en ventas
CREATE INDEX idx_ventas_fecha ON ventas(fecha);

-- Paso 3: Análisis de impacto de la consulta con EXPLAIN

-- Hay dos formas de consultar información:
    -- 3.1. Full scan: Compara fila por fila (ALL) - Mal, es lento cuando hay muchos datos
        EXPLAIN SELECT *
        FROM productos
        WHERE stock < 10

    -- 3.2 Filtrado por índice (acceso directo - referencia)
        EXPLAIN SELECT * 
        FROM ventas
        WHERE fecha = '2025-03-07'
