USE ESP_SQL_MOD_BAS

-- PARTE 1
SELECT * FROM ESP_SQL_C7.PRODUCTOS
SELECT * FROM ESP_SQL_C7.ALMACEN
SELECT * FROM ESP_SQL_C7.PRODUCTO_ALMACEN

-- PARTE 2
SELECT 
	COD_PRODUCTO,
	TIPO
FROM ESP_SQL_C7.PRODUCTOS

-- PARTE 3
SELECT TOP 3
	NOM_ALMACEN,
	AREA
FROM ESP_SQL_C7.ALMACEN

-- PARTE 4
SELECT 
	*,
	[PRECIO]*1.2  AS PROYECCION 
FROM [ESP_SQL_C7].[PRODUCTOS]

-- PARTE 5
SELECT DISTINCT 
	TIPO
FROM [ESP_SQL_C7].[PRODUCTOS]

-- PARTE 6
SELECT 
	*
FROM [ESP_SQL_C7].[PRODUCTOS]
WHERE
	TIPO = 'COMIDA'

-- PARTE 7
SELECT 
	*,
	CASE
	WHEN PRECIO <= 4 THEN 'MENOR O IGUAL A 4 SOLES'
	ELSE
		'MAYOR DE 4 SOLES'
	END AS FLAG_4_SOLES
FROM [ESP_SQL_C7].[PRODUCTOS]

-- PARTE 8
SELECT
	*,
	CASE
		WHEN AREA BETWEEN 250 AND 400 THEN 'DENTRO DEL RANGO'
	ELSE 
		'FUERA DEL RANGO'
	END AS FLAG_RANGO
FROM [ESP_SQL_C7].[ALMACEN]

-- PARTE 9
SELECT * FROM ESP_SQL_C7.PRODUCTOS ORDER BY PRECIO DESC
SELECT * FROM ESP_SQL_C7.ALMACEN ORDER BY AREA DESC

-- PARTE 10

SELECT * FROM ESP_SQL_C7.PRODUCTOS
SELECT * FROM ESP_SQL_C7.ALMACEN

SELECT 
	B.COD_PRODUCTO,
	B.NOM_PRODUCTO,
	B.TIPO,
	C.COD_ALMACEN,
	C.NOM_ALMACEN,
	C.AREA,
	A.STOCK,
	A.FECHA_ACTUALIZACION
FROM ESP_SQL_C7.PRODUCTO_ALMACEN A
INNER JOIN ESP_SQL_C7.PRODUCTOS B
ON
	A.FK_PRODUCTO = B.PK_PRODUCTO
INNER JOIN ESP_SQL_C7.ALMACEN C
ON
	A.FK_ALMACEN = C.PK_ALMACEN

-- PARTE 11
SELECT 
	C.COD_ALMACEN,
	C.NOM_ALMACEN,
	AVG(A.STOCK) AS PROMEDIO_STOCK -- AVG CALCULA PROMEDIO
FROM ESP_SQL_C7.PRODUCTO_ALMACEN A
INNER JOIN ESP_SQL_C7.PRODUCTOS B
ON
	A.FK_PRODUCTO = B.PK_PRODUCTO
INNER JOIN ESP_SQL_C7.ALMACEN C
ON
	A.FK_ALMACEN = C.PK_ALMACEN
GROUP BY
	C.COD_ALMACEN,
	C.NOM_ALMACEN


-- PARTE 12
SELECT 
B.NOM_PRODUCTO, 
A.STOCK,
       CASE 
           WHEN STOCK < 3000 THEN 'D�ficit'
           WHEN STOCK BETWEEN 3000 AND 6000 THEN 'Normal'
           ELSE 'Superavit'
       END AS CLASIFICACION
FROM ESP_SQL_C7.PRODUCTOS B
INNER JOIN ESP_SQL_C7.PRODUCTO_ALMACEN A
ON
    B.PK_PRODUCTO = A.FK_PRODUCTO

	--PARTE 13
SELECT 
    CASE 
        WHEN STOCK < 3000 THEN 'D�ficit'
        WHEN STOCK BETWEEN 3000 AND 6000 THEN 'Normal'
        ELSE 'Superavit'
    END AS CLASIFICACION,
    COUNT(*) AS CANT_REGISTROS
FROM 
    ESP_SQL_C7.PRODUCTO_ALMACEN
GROUP BY 
    CASE 
        WHEN STOCK < 3000 THEN 'D�ficit'
        WHEN STOCK BETWEEN 3000 AND 6000 THEN 'Normal'
        ELSE 'Superavit'
    END

--PARTE 14
DELETE 
FROM ESP_SQL_C7.PRODUCTO_ALMACEN
WHERE 
STOCK > 10000


--PARTE 15 

--No encuentro porqu� no cambia. 

--1� Forma
UPDATE A
SET A.STOCK = 6000
FROM ESP_SQL_C7.PRODUCTO_ALMACEN A
INNER JOIN ESP_SQL_C7.PRODUCTOS B 
ON 
  B.PK_PRODUCTO = A.FK_PRODUCTO
INNER JOIN ESP_SQL_C7.ALMACEN C
ON 
  C.PK_ALMACEN=A.FK_ALMACEN
WHERE
  C.NOM_ALMACEN = 'ALM. ACHO' AND B.NOM_PRODUCTO = 'MANZANAS'

 --2da Forma
UPDATE ESP_SQL_C7.PRODUCTO_ALMACEN
SET STOCK = 6000
WHERE 
FK_PRODUCTO=(SELECT PK_PRODUCTO FROM ESP_SQL_C7.PRODUCTOS 
WHERE 
NOM_PRODUCTO = 'MANZANAS') 
AND 
FK_ALMACEN = 
(SELECT 
PK_ALMACEN 
FROM ESP_SQL_C7.ALMACEN 
WHERE 
NOM_ALMACEN = 'ALM. ACHO')