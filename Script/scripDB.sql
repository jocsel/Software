create database DBAutoLavado on primary
(
	name = __DBAutoLavado_fisico,
	filename='D:\10mo Cuatrimestres\Ingenieria de software\DbAutoLavado\Script\DBAutoLavado.mdf',
	size = 5mb,
	filegrowth = 3mb
)
log on
(
 name = DBAutoLavado_logica,
	filename='D:\10mo Cuatrimestres\Ingenieria de software\DbAutoLavado\Script\DBAutoLavado.ldf',
	size = 5mb,
	filegrowth = 3mb
)
go
use DbAutoLavado
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
create table venta
(
	idVenta int identity primary key not null,
	fechaFac datetime,
	cedulaCliente nvarchar(16) references clientes,
	cedulaEmpleado nvarchar(16) references empleado
)
go
create table productos
(
	idProducto int identity primary key not null,
	marca nvarchar(50),
	nombre nvarchar(50),
	existencia int,
	precioUnidad decimal
)
go
create table productoVenta
(
	cantidad int,
	precio money,
	idVenta int references venta,
	idProducto int references productos,
	precioUnidad money,
	total money,
	iva money,
	subTotal money
)
go
create table proveedor
(
	apellidos nvarchar(120),
	nombres nvarchar(80) not null,
	direccion nvarchar(150) not null,
	cedula nvarchar(16) not null,
	idProveedor int identity primary key not null,
	telefono int,
	correo nvarchar(80) not null,
)
go
create table compra
(
	fechaCompra datetime,
	idCompra int identity primary key not null,
	idProveedor int references proveedor
)
go
create table productoCompra
(
	cantidad int not null,
	precio money not null,
	idCompra int references compra,
	idProducto int references productos,
	total money not null,
	subTotal money not null,
	iva decimal not null,
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
create table mantenimiento
(
	idMantenimiento int identity primary key not null,
	total money not null,
	fecha datetime,
	placa nvarchar(10) not null,
	idVehiculoMantenimiento int references tipoVehiculoMantenimiento,
	cedulaEmpleado nvarchar(16) references empleado
)
go
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
	total money not null,
	fecha datetime,
	placa nvarchar(10) not null,
	idVehiculoLavado int references tipoVehiculoLavado,
	cedulaEmpleado nvarchar(16) references empleado
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