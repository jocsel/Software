alter proc sp_mantenimiento
(
	@i_total money,
	@i_placa nvarchar(10),
	@i_iVehiculodMantenimiento int,
	@i_cedulaEmpleado nvarchar(16),
	@idMatenimiento int = '',
	@i_operacion char(1)
)
as
declare @fecha datetime
if @i_operacion = 'I'
begin
select @fecha = GETDATE()
insert into DBAutoLavado..mantenimiento([total],[fecha],[placa],[idVehiculoMantenimiento],[cedulaEmpleado])
values (@i_total, @fecha,@i_placa,@i_iVehiculodMantenimiento,@i_cedulaEmpleado)
end

if @i_operacion = 'U'
begin
	update DBAutoLavado..mantenimiento set total = @i_total, placa = @i_placa,
	idVehiculoMantenimiento = @i_iVehiculodMantenimiento, cedulaEmpleado = @i_cedulaEmpleado
	where idMantenimiento = @idMatenimiento
end

if @i_operacion = 'S'
begin
select mantenimiento.fecha, empleado.nombres + ' ' + empleado.apellidos as Empleado,
servicioMantenimiento.servicioMantenimiento,tipoVehiculoMantenimiento.vehiculoMantenimiento, 
mantenimiento.placa, mantenimiento.total  from empleado inner join mantenimiento on
empleado.cedula = mantenimiento.cedulaEmpleado inner join tipoVehiculoMantenimiento on
mantenimiento.idMantenimiento = tipoVehiculoMantenimiento.idVehiculoMantenimiento inner join
servicioMantenimiento on tipoVehiculoMantenimiento.idServicioMantenimiento = servicioMantenimiento.idServicioMantenimiento

end

exec sp_mantenimiento
@i_operacion = 'S',
@i_total = 500,
@i_placa = 'M5879',
@i_iVehiculodMantenimiento = 6,
@i_cedulaEmpleado = '478',
@idMatenimiento = 6

select * from mantenimiento
select * from servicioMantenimiento
select * from tipoVehiculoMantenimiento
