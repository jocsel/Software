--create database DBAutoLavadox on primary
--(
--	name = __DBAutoLavadox_fisico,
--	filename='D:\10mo Cuatrimestres\Ingenieria de software\DbAutoLavado\Script\DBAutoLavado.mdf',
--	size = 5mb,
--	filegrowth = 3mb
--)
--log on
--(
-- name = DBAutoLavadox_logica,
--	filename='D:\10mo Cuatrimestres\Ingenieria de software\DbAutoLavado\Script\DBAutoLavado.ldf',
--	size = 5mb,
--	filegrowth = 3mb
--)
--go
--use DbAutoLavado

use DBautolavadoOfficial
go

create table clientes
(
	idCliente int identity,
	nombres nvarchar(120) not null,
	apellido nvarchar(120) not null,
	cedula nvarchar(16) primary key not null,
	correo nvarchar(80) not null,
	celular int,
	estado nvarchar(10) not null -------
	
)
go
create table empleado
(
	fechaNac datetime not null,
	celular int,
	direccion nvarchar(90) not null,
	idEmpleado int identity  not null,
	cedula nvarchar(16) primary key,
	apellidos nvarchar(120) not null,
	nombres nvarchar(80) not null,
	salario money not null,
	estado nvarchar(10) not null -----------
)
go
create table Usuario
(
	usuario nvarchar(100) primary key not null,
	Password nvarchar(max) not null,
	cedula nvarchar(16) references empleado
)
go
create table permiso
(
	usuario nvarchar(100) references Usuario,
	venta bit null,
	mantenimiento bit null,
	lavado bit null,
	compra bit null,
	empleado bit null,
	Tusuario bit null,
	producto bit null,
	proveedor bit null,
	Password bit null
)
go
create table venta
(
	idVenta int identity primary key not null,
	fechaFac datetime,
	cedulaCliente nvarchar(16) references clientes,
	cedulaEmpleado nvarchar(16) references empleado,
	total decimal(18,2) 
)
go
create table productos
(
	idProducto int identity primary key not null,
	marca nvarchar(50),
	nombre nvarchar(50),
	existencia int,
	precioVenta decimal,
	precioCompra decimal,
	estado nvarchar(15),
)
go
create table detalleventa
(
	cantidad int,
	idVenta int references venta,
	idProducto int references productos,
	totaldetalle decimal(18,2)
	
)
go
create table proveedor
(
	apellidos nvarchar(120),
	nombres nvarchar(80) not null,
	nombreempresa nvarchar(80) ,
	direccion nvarchar(150) not null,
	cedula nvarchar(16) not null,
	idProveedor int identity primary key not null,
	telefono int,
	correo nvarchar(80) not null,
	estado nvarchar(15)
)
go
create table compra
(
	fechaCompra datetime,
	idCompra int identity primary key not null,
	idProveedor int references proveedor,
	total decimal(18,2)
)
go
create table detallecompra
(
	cantidad int not null,
	idCompra int references compra,
	idProducto int references productos,
	totaldetalle money not null
)
go
create table servicioMantenimiento
(
	precio money,
	idServicioMantenimiento int identity primary key not null,
	servicioMantenimiento nvarchar(50)
)
go
create table tipoVehiculoMantenimiento
(
	idVehiculoMantenimiento int identity primary key not null,
	vehiculoMantenimiento nvarchar(50),
	idServicioMantenimiento int references servicioMantenimiento
)
go
create table grupomantenimiento
(
	idpersona int identity(1,1) primary key ,
	codigoGrupo nvarchar(15)  not null,
	cedulaEmpleado nvarchar(16) references empleado
)
go
create table mantenimiento
(
	idMantenimiento int identity primary key not null,
	cedula nvarchar(16) references empleado,
	total money not null,
	fecha datetime,
	placa nvarchar(10) not null,
	idVehiculoMantenimiento int references tipoVehiculoMantenimiento,
	idpersona int references grupomantenimiento,
	--usuario nvarchar(100) references Usuario
		
)
go

create table grupolavado
(
	idpersona int identity(1,1) primary key ,
	codigoGrupo nvarchar(15)  not null,
	cedulaEmpleado nvarchar(16) references empleado
)

create table servicioLavado
(
	precio money,
	idServicioLavado int identity primary key not null,
	servicioLavado nvarchar(50)
)
go
create table tipoVehiculoLavado
(
	idVehiculoLavado int identity primary key not null,
	vehiculoLavado nvarchar(50),
	idServicioLavado int references servicioLavado
)
go
create table lavado
(
	idLavado int identity primary key not null,
	cedula nvarchar(16) references empleado,
	total money not null,
	fecha datetime,
	placa nvarchar(10) not null,
	idVehiculoLavado int references tipoVehiculoLavado,
	idpersona int references grupolavado,
	--usuario nvarchar(100) references Usuario,
	
)

