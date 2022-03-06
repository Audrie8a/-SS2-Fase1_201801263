USE [master]
GO

CREATE DATABASE [Clase4]

GO
USE [Clase4]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulos](
	[IdProducto] [varchar](50) NULL,
	[NombreProducto] [varchar](50) NULL,
	[Proveedor] [varchar](50) NULL,
	[Categoria] [varchar](50) NULL,
	[Perecedero] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Clase4] SET  READ_WRITE 
GO
