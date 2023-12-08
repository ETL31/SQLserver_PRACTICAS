/*
TRABAJO FINAL DE SQL SERVER BÁSICO 2023

ALUMNO: TOLENTINO LEÓN ERNESTO MIHAEL 
DNI: 16140258 
*/

USE ESP_SQL_MOD_BAS

/*Actividad 4: Alimentar las tablas con datos a su criterio (mínimo 6 registros por tabla). */
--
--Llenado de la tabla Libro
INSERT INTO TF.Libro(titulo, autor, editorial, fecha_publicacion, precio)
VALUES
    ('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Francisco de Robles', '1605-01-16', 22.99),
    ('El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Oveja Negra', '1985-03-06', 15.75),
    ('La isla del tesoro','Robert Louis Stevenson','Octaedro','1883-11-14', 10.25),
    ('Cien años de soledad', 'Gabriel García Márquez', 'Sudamericana', '1967-05-30', 18.50),
    ('El principito', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock', '1943-04-06', 12.99),
    ('1984', 'George Orwell', 'Secker & Warburg', '1949-06-08', 14.75),
    ('La metamorfosis', 'Franz Kafka', 'Kurt Wolff Verlag', '1915-10-15', 8.95)
    

--Llenado de la tabla Cliente
INSERT INTO TF.Cliente(nombre, apellido, direccion, correo_electronico)
VALUES
    ('María', 'Rodríguez', 'Av. Cabildo 949', 'maria.rodriguez@gmail.com'),
    ('Luis', 'Gómez', 'Los Olivos 789', 'luis.gomez@gmail.com'),
    ('Martin', 'Torrez', 'Av. San Martin 123', 'martin.torrez@gmail.com'),
    ('Natalia', 'Yataco', 'Morales Duarez 234', 'Natalia.Yataco@gmail.com'),
    ('Pedro', 'Sánchez', 'Calle San Martín 456', 'pedro.sanchez@yahoo.com'),
    ('Laura', 'Díaz', 'Av. Belgrano 789', 'laura.diaz@hotmail.com'),
    ('Carlos', 'Martínez', 'San Isidro 553', 'carlos.martinez@hotmail.com')
    
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
    
--REVISIÓN DE CADA TABLA
SELECT * FROM TF.Cliente
SELECT * FROM TF.Compra
SELECT * FROM TF.Libro

