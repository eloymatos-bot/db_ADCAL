USE dl_ADCAL;

/* INSERTAR CLIENTES */
INSERT INTO CLIENTE (nombre, tipo_cliente, telefono, direccion, activo) VALUES
('Juan Perez', 'acopiador', '987654321', 'Lima', 1),
('Maria Lopez', 'mayorista', '912345678', 'Arequipa', 1);

/* INSERTAR PRODUCTOS*/
INSERT INTO PRODUCTO (nombre, descripcion, unidad_medida, precio_base, activo) VALUES
('Leche', 'Leche fresca', 'litro', 1.50, 1),
('Papa', 'Papa blanca', 'kg', 0.80, 1),
('Camote', 'Camote amarillo', 'kg', 0.90, 1),
('Maiz', 'Maiz seco', 'kg', 1.20, 1);

/* INSERTAR EMPLEADOS */
INSERT INTO EMPLEADO (nombre, cargo, telefono, activo) VALUES
('Carlos Ruiz', 'Vendedor', '999888777', 1);

/* INSERTAR INVENTARIO */
INSERT INTO INVENTARIO (id_producto, stock_actual, fecha_actualizacion) VALUES
(1, 500, NOW()),
(2, 300, NOW()),
(3, 200, NOW()),
(4, 400, NOW());

/* INSERTAR VENTA */
INSERT INTO VENTA (fecha, id_cliente, id_empleado, total, estado) VALUES
(NOW(), 1, 1, 0, 'completado');

/* INSERTAR DETALLE DE VENTA */
INSERT INTO DETALLE_VENTA (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 10, 1.50, 15.00),
(1, 2, 20, 0.80, 16.00);

/* ACTUALIZAR TOTAL DE VENTA */
UPDATE VENTA
SET total = (
    SELECT SUM(subtotal)
    FROM DETALLE_VENTA
    WHERE id_venta = 1
)
WHERE id_venta = 1;

/* CONSULTAS (SELECT) */

/* Ver clientes */
SELECT * FROM CLIENTE;

/* Ver productos */
SELECT * FROM PRODUCTO;

/* Ver ventas con cliente y empleado */
SELECT v.id_venta, v.fecha, c.nombre AS cliente, e.nombre AS empleado, v.total
FROM VENTA v
JOIN CLIENTE c ON v.id_cliente = c.id_cliente
JOIN EMPLEADO e ON v.id_empleado = e.id_empleado;

/* Ver detalle de ventas */
SELECT d.id_detalle, p.nombre AS producto, d.cantidad, d.precio_unitario, d.subtotal
FROM DETALLE_VENTA d
JOIN PRODUCTO p ON d.id_producto = p.id_producto;

/*  ACTUALIZAR DATOS */

/* Cambiar teléfono de cliente */
UPDATE CLIENTE
SET telefono = '900000000'
WHERE id_cliente = 1;

/* ELIMINAR DATOS */

/* Eliminar un detalle de venta */
DELETE FROM DETALLE_VENTA
WHERE id_detalle = 2;
