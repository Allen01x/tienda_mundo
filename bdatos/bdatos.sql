
CREATE DATABASE IF NOT EXISTS tienda_mundo;
USE tienda_mundo;


CREATE TABLE IF NOT EXISTS t_usuarios (
  id_usuario INT(11) AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  Apellidos VARCHAR(100) NOT NULL,
  email VARCHAR(200) NOT NULL,
  password VARCHAR(200) NOT NULL,
  rol VARCHAR(11) NOT NULL,
  imagen VARCHAR(255),
  PRIMARY KEY (id_usuario),
  UNIQUE (email)
) ENGINE=InnoDB;

INSERT INTO t_usuarios values (NULL,"Admin", "Admin", "admin6@admin.com", "see232", "admin", 'imagen');

CREATE TABLE IF NOT EXISTS t_pedidos (
  id_pedido INT(11) AUTO_INCREMENT NOT NULL,
  id_usuario INT(11) NOT NULL,
  ciudad VARCHAR(100),
  direccion VARCHAR(200),
  costo FLOAT(100,2),
  estado VARCHAR(20),
  fecha DATE,
  hora TIME,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (id_usuario) REFERENCES t_usuarios(id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS t_categorias (
  id_categoria INT(11) AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(100),
  PRIMARY KEY (id_categoria)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_productos (
  id_producto INT(11) AUTO_INCREMENT NOT NULL,
  id_categoria INT(11),
  nombre VARCHAR(100),
  precio FLOAT(100,2),
  stock INT(10),
  oferta VARCHAR(20),
  fecha DATE,
  imagen VARCHAR(255),
  PRIMARY KEY (id_producto),
  FOREIGN KEY (id_categoria) REFERENCES t_categorias(id_categoria)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS t_lineapedidos (
  id_lineapedido INT(11) AUTO_INCREMENT NOT NULL,
  id_pedido INT(11) NOT NULL,
  id_producto INT(11) NOT NULL,
  unidades INT(10),
  PRIMARY KEY (id_lineapedido),
  FOREIGN KEY (id_pedido) REFERENCES t_pedidos(id_pedido)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_producto) REFERENCES t_productos(id_producto)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
