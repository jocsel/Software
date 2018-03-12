create proc sp_productoCompra
(
	@i_cantidad int,
	@i_precio money,
	@i_idCompra int,
	@i_idProducto int,
	@i_total money,
	@i_subtotal money,
	@i_iva decimal,
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into DBAutoLavado..productoCompra([cantidad],[precio],[idCompra],[idProducto],[total],[subTotal],[iva])
values (@i_cantidad, @i_precio, @i_idCompra, @i_idProducto, @i_total, @i_subtotal, @i_iva)
end 

if @i_operacion = 'U'
begin
update DBAutoLavado..productoCompra set cantidad = @i_cantidad, precio =  @i_precio 
, idProducto = @i_idProducto, total = @i_total, subTotal = @i_subtotal,
iva = @i_iva where idCompra = @i_idCompra
end

if @i_operacion = 'S'
begin
select productos.nombre,productos.marca,productoCompra.precio, productoCompra.cantidad,
productoCompra.subTotal,productoCompra.iva, productoCompra.total from productos inner join
productoCompra on productos.idProducto = productoCompra.idProducto
end

exec sp_productoCompra
	@i_cantidad = 5,
	@i_precio = 85,
	@i_idCompra = 1,
	@i_idProducto = 1 ,
	@i_total= 425,
	@i_subtotal = 390 ,
	@i_iva = 10,
	@i_operacion = 'S'

select * from productoCompra
select * from productos
select * from compra