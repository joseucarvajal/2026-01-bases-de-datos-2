-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS miscelanea_la_central;

-- Crear la tabla "categorias"
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

-- Insertar datos en "categorias"
INSERT INTO categorias (nombre, descripcion) VALUES 
('Lácteos', 'Productos a base de leche como: leche, queso, yogurt, manteniquilla... etc'),
('Granos y Legumbres', 'Arroz, frijoles, lentejas, maíz'),
('Bebidas', 'Jugos, gaseosas, agua, café'),
('Aceites y Grasas', 'Aceite vegetal, manteca'),
('Enlatados', 'Atún, sardinas, tomate enlatado'),
('Panadería', 'Pan, galletas, cereales'),
('Condimentos', 'Sal, azúcar, especias, salsas');

-- Crear la tabla de "productos"
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    categoria_id INT NOT NULL,
    precio_compra DECIMAL(10,2) NOT NULL,
    precio_venta_detal DECIMAL(10,2) NOT NULL,
    precio_venta_mayor DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    stock_minimo INT NOT NULL DEFAULT 5,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- insertar datos en "productos"
INSERT INTO productos (nombre, categoria_id, precio_compra, precio_venta_detal, precio_venta_mayor, stock, stock_minimo) VALUES
('Leche entera 1L', 1, 2800, 3500, 3100, 120, 20),
('Queso blanco 500g', 1, 8000, 10000, 9000, 45, 10),
('Arroz blanco 1kg', 2, 2200, 2800, 2500, 200, 30),
('Frijoles negros 500g', 2, 1800, 2400, 2100, 150, 20),
('Gaseosa Cola 2L', 3, 3500, 4500, 4000, 80, 15),
('Jugo de naranja 1L', 3, 3000, 4000, 3500, 60, 10),
('Agua 600ml', 3, 600, 1000, 800, 200, 30),
('Aceite vegetal 1L', 4, 7000, 9000, 8000, 70, 10),
('Atún en lata 160g', 5, 3500, 4500, 4000, 90, 15),
('Galletas soda x12', 6, 2500, 3200, 2900, 110, 20),
('Azúcar 1kg', 7, 2600, 3200, 2900, 180, 25),
('Sal 500g', 7, 800, 1200, 1000, 160, 20),
('Café molido 250g', 3, 5500, 7000, 6200, 55, 10),
('Sardinas en lata 125g', 5, 2800, 3500, 3100, 75, 10),
('Lentejas 500g', 2, 2000, 2600, 2300, 130, 20);
