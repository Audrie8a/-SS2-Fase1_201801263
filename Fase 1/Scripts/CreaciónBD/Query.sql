Use master;
DROP DATABASE   IF EXISTS  OneSolution;
Create database seminariodos201801263;
Create database seminariodosColumnar201801263;


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


	
alter table Compra drop constraint fk_idProveedorCompra;
alter table Compra drop constraint fk_idProductoCompra;
alter table Compra drop constraint fk_idTiempoCompra;
alter table Compra drop constraint fk_idSucursalCompra;

alter table Venta drop constraint fk_idClienteVenta;
alter table Venta drop constraint fk_idProductoVenta;
alter table Venta drop constraint fk_idVendedorVenta;
alter table Venta drop constraint fk_idTiempoVenta;
alter table Venta drop constraint fk_idSucursalVenta;

TRUNCATE TABLE Proveedor;
TRUNCATE TABLE Producto;
TRUNCATE TABLE Cliente;
TRUNCATE TABLE Vendedor;
TRUNCATE TABLE Sucursal;
TRUNCATE TABLE Tiempo;
TRUNCATE TABLE Compra;
TRUNCATE TABLE Venta;
TRUNCATE TABLE ComprasTemp;
TRUNCATE TABLE VentasTemp;

alter table Venta add constraint fk_idClienteVenta foreign key (idCliente) references Cliente(idCliente);
alter table Venta add constraint fk_idProductoVenta foreign key (idProducto) references Producto(idProducto);
alter table Venta add constraint fk_idVendedorVenta foreign key (idVendedor) references Vendedor(idVendedor);
alter table Venta add constraint fk_idTiempoVenta foreign key (idTiempo) references Tiempo(idTiempo);
alter table Venta add constraint fk_idSucursalVenta foreign key (idSucursal) references Sucursal(idSucursal);


alter table Compra add constraint fk_idProveedorCompra foreign key (idProveedor) references Proveedor(idProveedor);
alter table Compra add constraint fk_idProductoCompra foreign key (idProducto) references Producto(idProducto);
alter table Compra add constraint fk_idTiempoCompra foreign key (idTiempo) references Tiempo(idTiempo);
alter table Compra add constraint fk_idSucursalCompra foreign key (idSucursal) references Sucursal(idSucursal);

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