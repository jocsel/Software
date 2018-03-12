alter proc sp_lavado
(
	@i_placa nvarchar(10),
	@i_cedulaEmpleado nvarchar(16),
	@i_idVehiculo int,
	@i_operacion char(1),
	@idLavado int = '',
	@total money
)
as
declare @fecha datetime
if @i_operacion = 'I'
begin
	select @fecha = GETDATE()
	insert into DBAutoLavado..lavado([total],[fecha],[placa],[idVehiculoLavado],[cedulaEmpleado])
	values (@total,@fecha,@i_placa,@i_idVehiculo,@i_cedulaEmpleado)
end

if @i_operacion = 'U'
begin
	/*select @total = ser.precio from tipoVehiculoLavado inner join servicioLavado ser on
	tipoVehiculoLavado.idServicioLavado = ser.idServicioLavado where tipoVehiculoLavado.idVehiculoLavado = @i_idVehiculo*/
	update DBAutoLavado..lavado set placa = @i_placa, idVehiculoLavado = @i_idVehiculo,
	 cedulaEmpleado = @i_cedulaEmpleado, total = @total
	where idLavado = @idLavado
end

if @i_operacion = 'S'
begin
	select lavado.fecha, empleado.nombres + ' ' + empleado.apellidos as Empleado, tipoVehiculoLavado.vehiculoLavado,
	 lavado.placa ,servicioLavado.servicioLavado, servicioLavado.precio
	from servicioLavado inner join tipoVehiculoLavado on servicioLavado.idServicioLavado = tipoVehiculoLavado.idServicioLavado
	inner join lavado on tipoVehiculoLavado.idVehiculoLavado = lavado.idVehiculoLavado inner join empleado on
	lavado.cedulaEmpleado = empleado.cedula
end

exec sp_lavado
@i_placa = 'vhh66',
@i_cedulaEmpleado = '478',
@i_idVehiculo = 2,
@i_operacion= 'U',
@idLavado = 5,
@total = 100
select * from lavado
select * from empleado
select * from tipoVehiculoLavado
select * from servicioLavado
