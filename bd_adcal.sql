/* Crear base de datos */
CREATE DATABASE dl_ADCAL;
USE dl_ADCAL;

/* TABLA: CLIENTE */
CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo_cliente VARCHAR(20) NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(150),
    activo BOOLEAN NOT NULL
);

/* TABLA: PRODUCTO */
CREATE TABLE PRODUCTO (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150),
    unidad_medida VARCHAR(20) NOT NULL,
    precio_base DECIMAL(10,2) NOT NULL,
    activo BOOLEAN NOT NULL
);

/* TABLA: EMPLEADO */
CREATE TABLE EMPLEADO (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    activo BOOLEAN NOT NULL
);

/* TABLA: INVENTARIO */

CREATE TABLE INVENTARIO (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    stock_actual DECIMAL(10,2) NOT NULL,
    fecha_actualizacion DATETIME NOT NULL,
    CONSTRAINT fk_inventario_producto
        FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

/* TABLA: VENTA */
CREATE TABLE VENTA (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    CONSTRAINT fk_venta_empleado
        FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado)
);

/* TABLA: DETALLE_VENTA */
CREATE TABLE DETALLE_VENTA (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_detalle_venta
        FOREIGN KEY (id_venta) REFERENCES VENTA(id_venta),
    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

