/*
TRABAJO FINAL DE SQL SERVER BÁSICO 2023

ALUMNO: TOLENTINO LEÓN ERNESTO MIHAEL 
DNI: 16140258 
*/

USE ESP_SQL_MOD_BAS


/*Actividad 5: Crear un query para obtener una lista de todas las compras realizadas junto con el
nombre del cliente, el título del libro y la fecha de compra, y guardarlo en una vista*/
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

-- REVISIÓN: 

SELECT * FROM Compras_Realizadas

