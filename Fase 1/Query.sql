Use master;
DROP DATABASE   IF EXISTS  OneSolution;
Create database seminariodos201801263;


Use seminariodos201801263;
Go;

SET ANSI_NULLS ON;
GO;

SET QUOTED_IDENTIFIER ON;
GO;
SET ANSI_PADDING ON
GO;

set dateformat dmy;
--SET DATEFORMAT MDY
Go;


	
CREATE TABLE [dbo].[VentasTemp](
	[Fecha] [varchar](100) NULL,	
	[CodigoCliente] [varchar] (50) NULL,	
	[NombreCliente] [varchar] (200) NULL,	
	[TipoCliente] [varchar] (50) NULL,
	[DireccionCliente] [varchar] (200) NULL,		
	[NumeroCliente] [varchar] (8) NULL,			
	[CodVendedor] [varchar] (50) NULL,			
	[NombreVendedor] [varchar] (200) NULL,			
	[Vacacionista] [varchar] (200) NULL,			
	[CodProducto] [varchar] (50) NULL,			
	[NombreProducto] [varchar] (200) NULL,		
	[MarcaProducto] [varchar] (200) NULL,			
	[Categoria] [varchar] (200) NULL,			
	[SodSuSursal] [varchar] (50) NULL,			
	[NombreSucursal] [varchar] (200) NULL,			
	[DireccionSucursal] [varchar] (200) NULL,			
	[Region] [varchar] (200) NULL,			
	[Departamento] [varchar] (200) NULL,			
	[Unidades] [varchar] (200) NULL,		
	[PrecioUnitario] [varchar] (200) NULL
);




CREATE TABLE [dbo].[ComprasTemp](	
	[Fecha] [varchar](100) NULL,	
	[CodProveedor] [varchar] (50) NULL,	
	[NombreProveedor] [varchar] (200) NULL,
	[DireccionProveedor] [varchar] (200) NULL,		
	[NumeroProveedor] [varchar] (8) NULL,	
	[WebProveedor] [varchar] (1) NULL,			
	[CodProducto] [varchar] (50) NULL,			
	[NombreProducto] [varchar] (200) NULL,		
	[MarcaProducto] [varchar] (200) NULL,			
	[Categoria] [varchar] (200) NULL,			
	[CodSucursal] [varchar] (50) NULL,			
	[NombreSucursal] [varchar] (200) NULL,			
	[DireccionSucursal] [varchar] (200) NULL,			
	[Region] [varchar] (200) NULL,			
	[Departamento] [varchar] (200) NULL,			
	[Unidades] [varchar] (200) NULL,		
	[CostoU] [varchar] (200) NULL
);



--TABLAS MODELO CONSTELACIÓN


------------------------------------------------DIMENSIONES--------------------------------------------------------------------------------
CREATE TABLE [dbo].[Producto](
	idProducto int identity Primary Key,
	[CodProducto] [varchar] (50) NULL,			
	[NombreProducto] [varchar] (200) NULL,		
	[MarcaProducto] [varchar] (200) NULL,			
	[Categoria] [varchar] (200) NULL,
);

CREATE TABLE [dbo].[Proveedor](
	idProveedor int identity Primary Key,	
	[CodProveedor] [varchar] (50) NULL,	
	[NombreProveedor] [varchar] (200) NULL,
	[DireccionProveedor] [varchar] (200) NULL,		
	[NumeroProveedor] [varchar] (8) NULL,	
	[WebProveedor] [varchar] (1) NULL
);

CREATE TABLE [dbo].[Sucursal](
	idSucursal int identity Primary Key,	
	[CodSucursal] [varchar] (50) NULL,			
	[NombreSucursal] [varchar] (200) NULL,			
	[DireccionSucursal] [varchar] (200) NULL,			
	[Departamento] [varchar] (200) NULL,	
	[Region] [varchar] (200) NULL	
);

CREATE TABLE [dbo].[Cliente](
	idCliente int identity Primary Key,
	[CodigoCliente] [varchar] (50) NULL,	
	[NombreCliente] [varchar] (200) NULL,	
	[TipoCliente] [varchar] (50) NULL,
	[DireccionCliente] [varchar] (200) NULL,		
	[NumeroCliente] [varchar] (8) NULL
);

CREATE TABLE [dbo].[Vendedor](
	idVendedor int identity Primary Key,			
	[CodVendedor] [varchar] (50) NULL,			
	[NombreVendedor] [varchar] (200) NULL,			
	[Vacacionista] [varchar] (1) NULL
);

CREATE TABLE [dbo].[Tiempo](
	idTiempo int identity Primary Key,			
	[Fecha] [date] 
);

------------------------------------------------DIMENSIONES--------------------------------------------------------------------------------

CREATE TABLE [dbo].[Compra](
	idCompra int identity Primary Key,	
	[Unidades] [int]  NULL,			
	[CostoU] [int]  NULL,
	idProveedor int NOT NULL,
	idProducto int NOT NULL,
	idTiempo int NOT NULL,
	idSucursal int NOT NULL
);

CREATE TABLE [dbo].[Venta](		
	idVenta int identity Primary Key,	
	[Unidades] [int]  NULL,			
	[PrecioUnitario] [int]  NULL,
	idProducto int NOT NULL,
	idCliente int NOT NULL,
	idVendedor int NOT NULL,
	idTiempo int NOT NULL,
	idSucursal int NOT NULL
);

drop table VentasTemp;
drop table ComprasTemp;
drop table Proveedor;
drop table Producto;
drop table Cliente;
drop table Vendedor;
drop table Sucursal;
drop table Compra;
drop table Venta;
drop table Tiempo;