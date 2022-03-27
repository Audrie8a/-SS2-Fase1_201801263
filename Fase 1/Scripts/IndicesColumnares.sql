use seminariodosColumnar201801263;

CREATE NONCLUSTERED COLUMNSTORE INDEX ProveedorC ON dbo.Proveedor (idProveedor,CodProveedor, NombreProveedor, DireccionProveedor, NumeroProveedor, WebProveedor );
CREATE NONCLUSTERED COLUMNSTORE INDEX ProductoC ON dbo.Producto (idProducto, CodProducto, NombreProducto, MarcaProducto, Categoria);
CREATE NONCLUSTERED COLUMNSTORE INDEX ClienteC ON dbo.Cliente (idCliente,CodigoCliente, NombreCliente, TipoCliente, DireccionCliente, NumeroCliente);
CREATE NONCLUSTERED COLUMNSTORE INDEX VendedorC ON dbo.Vendedor(idVendedor, CodVendedor, NombreVendedor, Vacacionista);
CREATE NONCLUSTERED COLUMNSTORE INDEX SucursalC ON dbo.Sucursal(idSucursal, CodSucursal, NombreSucursal, DireccionSucursal,Departamento,Region);
CREATE NONCLUSTERED COLUMNSTORE INDEX TiempoC ON dbo.Tiempo (idTiempo, Fecha, Anio, Mes, Dia);
CREATE NONCLUSTERED COLUMNSTORE INDEX CompraC ON dbo.Compra (idCompra, idProveedor, idProducto, idTiempo, idSucursal, Unidades, CostoU);
CREATE NONCLUSTERED COLUMNSTORE INDEX VentaC ON dbo.Venta (idVenta, idProducto, idCliente, idVendedor, idSucursal, idTiempo,Unidades, PrecioUnitario);


select idProveedor from Proveedor;
select * from Proveedor;

DROP INDEX ProveedorC ON dbo.Proveedor ;
DROP INDEX ProductoC ON dbo.Producto ;
DROP INDEX ClienteC ON dbo.Cliente ;
DROP INDEX VendedorC ON dbo.Vendedor ;
DROP INDEX SucursalC ON dbo.Sucursal ;
DROP INDEX TiempoC ON dbo.Tiempo ;
DROP INDEX CompraC ON dbo.Compra ;
DROP INDEX VentaC ON dbo.Venta ;
