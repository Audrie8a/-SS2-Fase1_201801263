Use master;
use OneSolution;

Select count (*) from ComprasTemp;
Select count (*) from VentasTemp;
Select count (*) from Proveedor; --115
Select count (*) from Producto; --250
Select count (*) from Sucursal; --120
Select count (*) from Cliente; --299
Select count (*) from Vendedor; --69
Select count (*) from Tiempo;	--366
Select count (*) from Compra; --113
Select count (*) from Venta;  --347


Select * from Compra;

Select T.Fecha, P.CodProveedor, P.NombreProveedor, Po.CodProducto, Po.NombreProducto, S.CodSucursal, S.NombreSucursal,C.Unidades, C.CostoU
from Compra as C, Proveedor as P, Tiempo as T, Sucursal as S, Producto as Po
WHERE C.idProducto=Po.idProducto
AND C.idProveedor=P.idProveedor
AND C.idTiempo=T.idTiempo
AND C.idSucursal = S.idSucursal;

Select T.Fecha, C.CodigoCliente, C.NombreCliente, Po.CodProducto, Po.NombreProducto, S.CodSucursal, S.NombreSucursal,V.Unidades, V.PrecioUnitario
from Venta as V, Cliente as C, Tiempo as T, Sucursal as S, Producto as Po
WHERE V.idProducto=Po.idProducto
AND V.idCliente=C.idCliente
AND V.idTiempo=T.idTiempo
AND V.idSucursal = S.idSucursal;


SELECT Fecha from Tiempo 
UNION
SELECT Convert(Date,Fecha) FROM VentasTemp;

Select * from Proveedor order by CodProveedor asc;
Select  YEAR(Fecha),MONTH(Fecha), DAY(Fecha)  from Tiempo order by  YEAR(Fecha),MONTH(Fecha), DAY(Fecha) asc;

--Comprobando que no se repiten elementos

Select CodProveedor, NombreProveedor, count(*) from Proveedor
Group by CodProveedor, NombreProveedor
order by NombreProveedor asc;

Select CodProducto, NombreProducto, count(*) from Producto
Group by CodProducto,  NombreProducto
order by NombreProducto asc;

Select CodigoCliente, NombreCliente, count(*) from Cliente
Group by CodigoCliente, NombreCliente
order by NombreCliente asc;

Select CodVendedor, NombreVendedor, count(*) from Vendedor
Group by CodVendedor, NombreVendedor
order by NombreVendedor asc;

Select CodSucursal, NombreSucursal, count(*) from Sucursal
Group by CodSucursal, NombreSucursal
order by NombreSucursal asc;

Select * from Proveedor order by CodProveedor asc;


Select Fecha, count(*) from VentasTemp
Group by Fecha
order by YEAR(Fecha),MONTH(Fecha), DAY(Fecha) asc;

Select Fecha, count(*) from ComprasTemp
Group by Fecha
order by YEAR(Fecha),MONTH(Fecha), DAY(Fecha) asc;


SELECT YEAR(Fecha),MONTH(Fecha), DAY(Fecha) FROM VentasTemp
UNION
SELECT  YEAR(Fecha),MONTH(Fecha), DAY(Fecha) FROM ComprasTemp
ORDER BY   YEAR(Fecha),MONTH(Fecha), DAY(Fecha) asc;

SELECT Fecha FROM VentasTemp
UNION
SELECT  Fecha FROM ComprasTemp;