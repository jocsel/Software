alter proc sp_compra
(
	@i_idproveedor int = '',
	@i_operacion char(1),
	@idCompra int = ''
)
as
declare @fecha datetime
if @i_operacion = 'I'
begin
select @fecha = GETDATE()
insert into DBAutoLavado..compra([fechaCompra],[idProveedor]) values
(@fecha, @i_idproveedor)
end

if @i_operacion = 'U'
begin
	update DBAutoLavado..compra set idProveedor = @i_idproveedor where idCompra = @idCompra
end

if @i_operacion = 'S'
begin
select  productos.nombre, productos.marca, productoCompra.precio, productoCompra.cantidad,
		productoCompra.subTotal, productoCompra.iva, productoCompra.total, compra. fechaCompra
		from productos inner join productoCompra on productos.idProducto = productoCompra.idProducto
		inner join compra on productoCompra.idCompra = compra.idCompra
end

exec DBAutoLavado..sp_compra
@i_operacion = 'U',
@i_idproveedor = 1,
@idCompra = 6 ---SOLO PARA ACTUALIZAR
select * from compra
select * from productoCompra
select * from proveedor
select * from productos
