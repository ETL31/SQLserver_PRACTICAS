-- ENTRADA : REGION Y PRODUCTO
-- SALIDA : HAY 5 REGISTROS DE LA REGION EAST Y PRODUCTO PENCIL

ALTER PROCEDURE CONSULTA_VENTAS 
	@region varchar(20),
	@producto varchar(20)
AS
BEGIN
	DECLARE @n_registros INT

	SET @n_registros = (SELECT
							COUNT(1)  
						FROM VENTAS
						WHERE
							REGION = @region AND
							PRODUCTO = @producto)

	/* Guardando resultados en una tabla temporal
	SELECT
		*
	INTO #TMP_VENTAS
	FROM VENTAS
	WHERE
		REGION = @region AND
		PRODUCTO = @producto
	*/

	PRINT('HAY ' + CAST(@n_registros AS VARCHAR(4)) + ' REGISTROS DE LA REGION ' + @region + ' Y PRODUCTO ' + @producto)
	PRINT('')

	SELECT
		*
	FROM VENTAS
	WHERE
		REGION = @region AND
		PRODUCTO = @producto
END

EXEC CONSULTA_VENTAS 'East' , 'Pencil'