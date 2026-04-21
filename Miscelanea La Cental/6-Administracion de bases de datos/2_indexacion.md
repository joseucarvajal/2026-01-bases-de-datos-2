----índice de fecha en ventas-----
indice(fecha)

2025-03-01: 1, 5 (id = 5), 7, 9: Separa todas las ventas de esta fecha: 2025-03-01
2025-03-02: 4, 6
2025-03-03: 8, 10, 15

SELECT *
from venta
where fecha = 2025-03-03



----- índice de clientes en ventas----
cli-pepito: v1, v5, v987
cli-maria: v56, v98

SELECT *
from venta
where cliente_id = cli-pepito

