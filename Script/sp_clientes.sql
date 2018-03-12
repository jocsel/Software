alter proc sp_clientes
(
    @idcliente int = '',
	@i_nombres nvarchar(120),
	@i_apellido nvarchar(120),
	@i_cedula nvarchar(16) = '',
	@i_correo nvarchar(80) = '',
	@i_celular int = '',
	@i_estado nvarchar(10),
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
	insert into DBAutoLavado..clientes([nombres],[apellido],[cedula],[correo],[celular],[estado]) 
	values(@i_nombres, @i_apellido,@i_cedula,@i_correo,@i_celular,@i_estado)
end
 
if @i_operacion = 'U'
begin
	update  DBAutoLavado..clientes  set nombres = @i_nombres, apellido = @i_apellido,
	cedula = @i_cedula, correo = @i_correo, celular = @i_celular, estado = @i_estado
	where idCliente = @idcliente
end

if @i_operacion = 'S'
begin
select [nombres],[apellido],[cedula],[correo],[celular],[estado] from clientes where estado = 'activo'
end

exec sp_clientes
@i_operacion = 'S',
@i_nombres = 'Joco',
@i_apellido = 'Diaz',
@i_cedula = '485-110996-1002P',
@i_correo = 'ELJOC@GMAIL.COM',
@i_celular = 57450278,
@i_estado = 'activo',
@idcliente = 3  ---SOLO PARA ACTUALIZAR

select * from clientes
