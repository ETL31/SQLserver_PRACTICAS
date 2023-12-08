CREATE SCHEMA ESP_SQL_C5_E1
GO
-- TABLAS QUE NO DEPENDEN DE OTRAS
-- TABLAS DEPENDIENTES DE ACUERDO A SU JERARQUIA
CREATE TABLE ESP_SQL_C5_E1.ALMACEN(
	PK_ALMACEN INT PRIMARY KEY IDENTITY(1,1),
	COD_ALMACEN VARCHAR(10) UNIQUE NOT NULL,
	NOM_ALMACEN VARCHAR(100) NOT NULL,
	DIR_ALMACEN VARCHAR(100) NOT NULL
)
GO

CREATE TABLE ESP_SQL_C5_E1.CLIENTE(
	PK_CLIENTE INT PRIMARY KEY IDENTITY(1,1),
	DNI_CLIENTE VARCHAR(10) UNIQUE NOT NULL,
	NOM_CLIENTE VARCHAR(100) NOT NULL,
	APE_CLIENTE VARCHAR(100) NOT NULL,
	EDAD INT,
	SEXO VARCHAR(10)
)
GO

CREATE TABLE ESP_SQL_C5_E1.FECHA(
	PK_FECHA INT PRIMARY KEY IDENTITY(1,1),
	FECHA DATE,
	DIA INT,
	MES INT,
	ANIO INT,
	SEMESTRE INT,
	TRIMESTRE INT,
	CUATRIMESTRE INT
)
GO

CREATE TABLE ESP_SQL_C5_E1.PRODUCTO(
	PK_PRODUCTO INT PRIMARY KEY IDENTITY(1,1),
	NOM_PRODUCTO VARCHAR(100),
	DES_PRODUCTO VARCHAR(200),
	TIPO_PRODUCTO VARCHAR(50),
	FEC_VENCIMIENTO INT FOREIGN KEY  REFERENCES ESP_SQL_C5_E1.FECHA(PK_FECHA),
	FEC_PRODUCCION INT FOREIGN KEY REFERENCES ESP_SQL_C5_E1.FECHA(PK_FECHA),
	FK_ALMACEN  INT FOREIGN KEY REFERENCES ESP_SQL_C5_E1.ALMACEN(PK_ALMACEN)
)
GO

CREATE TABLE ESP_SQL_C5_E1.PEDIDOS(
	PK_PEDIDO INT PRIMARY KEY IDENTITY(1,1),
	FECHA_PEDIDO INT FOREIGN KEY  REFERENCES ESP_SQL_C5_E1.FECHA(PK_FECHA),
	FK_PRODUCTO INT FOREIGN KEY REFERENCES ESP_SQL_C5_E1.PRODUCTO(PK_PRODUCTO),
	FK_CLIENTE INT FOREIGN KEY REFERENCES ESP_SQL_C5_E1.CLIENTE(PK_CLIENTE)
)
GO