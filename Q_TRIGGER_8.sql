USE ESP_SQL_MOD_BAS;
GO


ALTER TRIGGER GUARDA_VENTAS ON VENTAS
AFTER DELETE 
AS
BEGIN
	/*
	DELETE : deleted
	UPDATE : inserted (registro actualizado) and deleted (registro original)
	INSERT : inserted
	*/

    DECLARE @FECHA DATE
	SET @FECHA = GETDATE()
	
	IF OBJECT_ID('ESP_SQL_MOD_BAS..BK_VENTAS') IS NULL
		BEGIN
			SELECT 
				@FECHA AS FECHA , 
				Producto AS PRODUCTO 
			INTO ESP_SQL_MOD_BAS..BK_VENTAS 
			FROM deleted;

			PRINT('productos backupeado')
		END
	ELSE
		BEGIN
			INSERT 
			INTO ESP_SQL_MOD_BAS..BK_VENTAS (FECHA, PRODUCTO) 
			SELECT 
				@FECHA AS FECHA, 
				PRODUCTO AS PRODUCTO 
			FROM deleted
			PRINT('productos backupeado')
		END
END;


DELETE FROM ESP_SQL_MOD_BAS..VENTAS WHERE Producto = 'Eraser'


select * from ESP_SQL_MOD_BAS..BK_VENTAS