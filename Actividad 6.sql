/*
TRABAJO FINAL DE SQL SERVER BÁSICO 2023

ALUMNO: TOLENTINO LEÓN ERNESTO MIHAEL 
DNI: 16140258 
*/

USE ESP_SQL_MOD_BAS

/*Actividad 6: Asimismo, realizar una agrupación por fecha_compra de la cantidad de libros
vendidos, así como las ganancias obtenidas por las ventas, y guardarlo en una vista*/
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

--REVISIÓN

SELECT * FROM Ventas_Ganancias