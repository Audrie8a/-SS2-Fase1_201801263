USE [master]
GO

CREATE DATABASE [Ejemplo2]

GO
USE [Ejemplo2]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temporal](
	[CodigoArticulo] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
	[Linea] [varchar](200) NULL,
	[CostoPromedio] [varchar](200) NULL
)

CREATE TABLE [dbo].[Articulos](
	idArticulo int identity Primary Key,
	[CodigoArticulo] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
	[Linea] [varchar](200) NULL,
	[CostoPromedio] decimal(18,2) NULL
) 

GO

