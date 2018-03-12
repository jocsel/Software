create proc sp_productos
(
	@i_marca nvarchar(50),	
	@i_nombre nvarchar(50),	
	@i_existencia int = '',
	@idProducto int = '',
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into DBAutoLavado..productos ([marca],[nombre],[existencia])
values (@i_marca,@i_nombre,@i_existencia)
end

if @i_operacion = 'U'
begin
update DBAutoLavado..productos set marca = @i_marca,nombre = @i_nombre ,existencia = @i_existencia
where idProducto = @idProducto
end

if @i_operacion = 'S'
begin
select nombre, marca, /*precioUnidad*/ existencia from productos
end

exec sp_productos
	@i_marca = 'Isuzu',	
	@i_nombre = 'Foco',	
	@i_existencia = 2,
	@idProducto = 4 ,
	@i_operacion = 'U'

select * from productos