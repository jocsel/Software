alter proc sp_empleado
(
	@i_fechaNac date,
	@i_celular int = '',
	@i_direccion nvarchar(90),
	@i_cedula nvarchar(16),
	@i_apellidos nvarchar(120),
	@i_nombres nvarchar(80),
	@i_salario money,
	@i_estado nvarchar(10) = '',
	@i_operacion char(1),
	@idEmpleado int = ''
)
as
if @i_operacion = 'I'
begin
insert into DBAutoLavado..empleado([fechaNac],[celular],[direccion],
			[cedula],[apellidos],[nombres],[salario],[estado]) values 
			(@i_fechaNac,@i_celular,@i_direccion,@i_cedula,@i_apellidos,
			@i_nombres,@i_salario,@i_estado)
end

if @i_operacion = 'U'
begin
update DBAutoLavado..empleado set fechaNac = @i_fechaNac, celular = @i_celular, direccion = @i_direccion,
		cedula = @i_cedula, apellidos = @i_apellidos, nombres = @i_nombres, salario = @i_salario,
		estado = @i_estado where idEmpleado = @idEmpleado
end

if @i_operacion = 'S'
begin
select [nombres],[apellidos],[fechaNac],[cedula],[direccion],[celular],[salario],[estado] from empleado where estado = 'activo'
end

exec DBAutoLavado..sp_empleado
@i_operacion = 'U',
@i_fechaNac = '06/12/1999',
@i_celular  = 57570289,
@i_direccion = 'probando',
@i_cedula = '478',
@i_apellidos = 'treminio',
@i_nombres = 'Bladimir',
@i_salario = 12000 ,
@i_estado = 'activo',
@idEmpleado = 3 -- SOLO PARA MODIFICAR	

select * from empleado