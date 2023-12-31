/*
TRABAJO FINAL DE SQL SERVER B�SICO 2023

ALUMNO: TOLENTINO LE�N ERNESTO MIHAEL 
DNI: 16140258 
*/

USE ESP_SQL_MOD_BAS

/*Actividad 3: Crear las tablas identificadas en la Actividad 2 en SQL Server, con el esquema �TF�
(en caso de no existir crear el esquema)*/
--
--Creaci�n del esquema ya que no exist�a.
CREATE SCHEMA TF 

--Creaci�n de las tabla Cliente
CREATE TABLE TF.Cliente(
    id_cliente INT PRIMARY KEY IDENTITY (1,1),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL
)

--Creaci�n de las tabla libro
CREATE TABLE TF.Libro(
    id_libro INT PRIMARY KEY IDENTITY (1,1),
    titulo VARCHAR(100) UNIQUE NOT NULL,
    autor VARCHAR(100) NOT NULL,
    editorial VARCHAR(50) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    precio DECIMAL(10,2) NOT NULL
)

--Creaci�n de las tabla Compra
CREATE TABLE TF.Compra(
    id_compra INT PRIMARY KEY IDENTITY (1,1),
    fecha_compra DATE NOT NULL,
    id_libro INT FOREIGN KEY (id_libro) REFERENCES TF.Libro(id_libro),
    id_cliente INT FOREIGN KEY (id_cliente) REFERENCES TF.Cliente(id_cliente),
    num_libros_comprados INT NOT NULL
)

/*Actividad 4: Alimentar las tablas con datos a su criterio (m�nimo 6 registros por tabla). */
--
--Llenado de la tabla Libro
INSERT INTO TF.Libro(titulo, autor, editorial, fecha_publicacion, precio)
VALUES
    ('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Francisco de Robles', '1605-01-16', 22.99),
    ('El amor en los tiempos del c�lera', 'Gabriel Garc�a M�rquez', 'Oveja Negra', '1985-03-06', 15.75),
    ('La isla del tesoro','Robert Louis Stevenson','Octaedro','1883-11-14', 10.25),
    ('Cien a�os de soledad', 'Gabriel Garc�a M�rquez', 'Sudamericana', '1967-05-30', 18.50),
    ('El principito', 'Antoine de Saint-Exup�ry', 'Reynal & Hitchcock', '1943-04-06', 12.99),
    ('1984', 'George Orwell', 'Secker & Warburg', '1949-06-08', 14.75),
    ('La metamorfosis', 'Franz Kafka', 'Kurt Wolff Verlag', '1915-10-15', 8.95)
    

--Llenado de la tabla Cliente
INSERT INTO TF.Cliente(nombre, apellido, direccion, correo_electronico)
VALUES
    ('Mar�a', 'Rodr�guez', 'Av. Cabildo 949', 'maria.rodriguez@gmail.com'),
    ('Luis', 'G�mez', 'Los Olivos 789', 'luis.gomez@gmail.com'),
    ('Martin', 'Torrez', 'Av. San Martin 123', 'martin.torrez@gmail.com'),
    ('Natalia', 'Yataco', 'Morales Duarez 234', 'Natalia.Yataco@gmail.com'),
    ('Pedro', 'S�nchez', 'Calle San Mart�n 456', 'pedro.sanchez@yahoo.com'),
    ('Laura', 'D�az', 'Av. Belgrano 789', 'laura.diaz@hotmail.com'),
    ('Carlos', 'Mart�nez', 'San Isidro 553', 'carlos.martinez@hotmail.com')
    
-- Llenado de la tabla Compra
INSERT INTO TF.Compra(fecha_compra, id_libro, id_cliente, num_libros_comprados)
VALUES
    ('2023-02-01', 7, 3, 2),
	('2023-02-19', 2, 6, 1),
	('2023-03-06', 5, 1, 2),
	('2023-03-12', 1, 4, 1),
	('2023-03-20', 3, 3, 3),
	('2023-03-28', 3, 2, 1),
	('2023-04-05', 1, 5, 2),
	('2023-04-21', 4, 7, 3),
	('2023-04-25', 2, 2, 1),
	('2023-04-30', 4, 5, 2),
	('2023-05-03', 6, 6, 1),
	('2023-05-12', 5, 1, 2)
    
--REVISI�N DE CADA TABLA
SELECT * FROM TF.Cliente
SELECT * FROM TF.Compra
SELECT * FROM TF.Libro


/*Actividad 5: Crear un query para obtener una lista de todas las compras realizadas junto con el
nombre del cliente, el t�tulo del libro y la fecha de compra, y guardarlo en una vista*/
--
CREATE VIEW Compras_Realizadas 
AS
SELECT 
A.nombre AS nombre_cliente, 
B.titulo AS titulo_libro, 
C.fecha_compra
FROM TF.Compra C
INNER JOIN TF.Cliente A 
ON 
C.id_cliente = A.id_cliente
INNER JOIN TF.Libro B 
ON 
C.id_libro = B.id_libro

-- REVISI�N: 

SELECT * FROM Compras_Realizadas


/*Actividad 6: Asimismo, realizar una agrupaci�n por fecha_compra de la cantidad de libros
vendidos, as� como las ganancias obtenidas por las ventas, y guardarlo en una vista*/
--
CREATE VIEW Ventas_Ganancias 
AS
SELECT 
C.fecha_compra, 
SUM(C.num_libros_comprados) AS cantidad_libros, 
SUM(C.num_libros_comprados * B.precio) AS ganancias
FROM TF.Compra C
JOIN TF.Libro B 
ON 
C.id_libro = B.id_libro
GROUP BY C.fecha_compra

--REVISI�N

SELECT * FROM Ventas_Ganancias