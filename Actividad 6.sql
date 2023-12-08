/*
TRABAJO FINAL DE SQL SERVER B�SICO 2023

ALUMNO: TOLENTINO LE�N ERNESTO MIHAEL 
DNI: 16140258 
*/

USE ESP_SQL_MOD_BAS

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