/*
TRABAJO FINAL DE SQL SERVER BÁSICO 2023

ALUMNO: TOLENTINO LEÓN ERNESTO MIHAEL 
DNI: 16140258 
*/

USE ESP_SQL_MOD_BAS

/*Actividad 3: Crear las tablas identificadas en la Actividad 2 en SQL Server, con el esquema “TF”
(en caso de no existir crear el esquema)*/
--
--Creación del esquema ya que no existía.
CREATE SCHEMA TF 

--Creación de las tabla Cliente
CREATE TABLE TF.Cliente(
    id_cliente INT PRIMARY KEY IDENTITY (1,1),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL
)

--Creación de las tabla libro
CREATE TABLE TF.Libro(
    id_libro INT PRIMARY KEY IDENTITY (1,1),
    titulo VARCHAR(100) UNIQUE NOT NULL,
    autor VARCHAR(100) NOT NULL,
    editorial VARCHAR(50) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    precio DECIMAL(10,2) NOT NULL
)

--Creación de las tabla Compra
CREATE TABLE TF.Compra(
    id_compra INT PRIMARY KEY IDENTITY (1,1),
    fecha_compra DATE NOT NULL,
    id_libro INT FOREIGN KEY (id_libro) REFERENCES TF.Libro(id_libro),
    id_cliente INT FOREIGN KEY (id_cliente) REFERENCES TF.Cliente(id_cliente),
    num_libros_comprados INT NOT NULL
)

