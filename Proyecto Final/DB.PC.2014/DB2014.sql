USE [master]
GO
/****** Object:  Database [DBAutoLavado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
CREATE DATABASE [DBAutoLavado]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'__DBAutoLavado_fisico', FILENAME = N'D:\Sp\DBAutoLavado.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 3072KB )
 LOG ON 
( NAME = N'DBAutoLavado_logica', FILENAME = N'D:\Sp\DBAutoLavado.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 3072KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBAutoLavado].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBAutoLavado] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBAutoLavado] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBAutoLavado] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBAutoLavado] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBAutoLavado] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBAutoLavado] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBAutoLavado] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBAutoLavado] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBAutoLavado] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBAutoLavado] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBAutoLavado] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBAutoLavado] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBAutoLavado] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBAutoLavado] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBAutoLavado] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBAutoLavado] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBAutoLavado] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBAutoLavado] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBAutoLavado] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBAutoLavado] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBAutoLavado] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBAutoLavado] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBAutoLavado] SET RECOVERY FULL 
GO
ALTER DATABASE [DBAutoLavado] SET  MULTI_USER 
GO
ALTER DATABASE [DBAutoLavado] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBAutoLavado] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBAutoLavado] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBAutoLavado] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBAutoLavado] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBAutoLavado', N'ON'
GO
USE [DBAutoLavado]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DBAutoLavado]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [nvarchar](120) NOT NULL,
	[apellido] [nvarchar](120) NOT NULL,
	[cedula] [nvarchar](16) NOT NULL,
	[correo] [nvarchar](80) NOT NULL,
	[celular] [int] NULL,
	[estado] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[compra]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[fechaCompra] [datetime] NULL,
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[idProveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empleado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[fechaNac] [datetime] NOT NULL,
	[celular] [int] NULL,
	[direccion] [nvarchar](90) NOT NULL,
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [nvarchar](16) NOT NULL,
	[apellidos] [nvarchar](120) NOT NULL,
	[nombres] [nvarchar](80) NOT NULL,
	[salario] [money] NOT NULL,
	[estado] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lavado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lavado](
	[idLavado] [int] IDENTITY(1,1) NOT NULL,
	[total] [money] NOT NULL,
	[fecha] [datetime] NULL,
	[placa] [nvarchar](10) NOT NULL,
	[idVehiculoLavado] [int] NULL,
	[cedulaEmpleado] [nvarchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLavado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mantenimiento]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mantenimiento](
	[idMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[total] [money] NOT NULL,
	[fecha] [datetime] NULL,
	[placa] [nvarchar](10) NOT NULL,
	[idVehiculoMantenimiento] [int] NULL,
	[cedulaEmpleado] [nvarchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[permiso]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[usuario] [nvarchar](100) NULL,
	[venta] [bit] NULL,
	[mantenimiento] [bit] NULL,
	[lavado] [bit] NULL,
	[compra] [bit] NULL,
	[empleado] [bit] NULL,
	[Tusuario] [bit] NULL,
	[producto] [bit] NULL,
	[proveedor] [bit] NULL,
	[Password] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productoCompra]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productoCompra](
	[cantidad] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[idCompra] [int] NULL,
	[idProducto] [int] NULL,
	[total] [money] NOT NULL,
	[subTotal] [money] NOT NULL,
	[iva] [decimal](18, 0) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productos]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[marca] [nvarchar](50) NULL,
	[nombre] [nvarchar](50) NULL,
	[existencia] [int] NULL,
	[precioUnidad] [decimal](18, 0) NULL,
	[estado] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productoVenta]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productoVenta](
	[cantidad] [int] NULL,
	[precio] [money] NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[precioUnidad] [money] NULL,
	[total] [money] NULL,
	[iva] [money] NULL,
	[subTotal] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[apellidos] [nvarchar](120) NULL,
	[nombres] [nvarchar](80) NOT NULL,
	[direccion] [nvarchar](150) NOT NULL,
	[cedula] [nvarchar](16) NOT NULL,
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[telefono] [int] NULL,
	[correo] [nvarchar](80) NOT NULL,
	[estado] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicioLavado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicioLavado](
	[precio] [money] NULL,
	[idServicioLavado] [int] IDENTITY(1,1) NOT NULL,
	[servicioLavado] [nvarchar](50) NULL,
	[estado] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idServicioLavado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicioMantenimiento]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicioMantenimiento](
	[precio] [money] NULL,
	[idServicioMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[servicioMantenimiento] [nvarchar](50) NULL,
	[estado] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idServicioMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipoVehiculoLavado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoVehiculoLavado](
	[idVehiculoLavado] [int] IDENTITY(1,1) NOT NULL,
	[vehiculoLavado] [nvarchar](50) NULL,
	[idServicioLavado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVehiculoLavado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipoVehiculoMantenimiento]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoVehiculoMantenimiento](
	[idVehiculoMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[vehiculoMantenimiento] [nvarchar](50) NULL,
	[idServicioMantenimiento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVehiculoMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[usuario] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[cedula] [nvarchar](16) NULL,
	[estado] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[venta]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[fechaFac] [datetime] NULL,
	[cedulaCliente] [nvarchar](16) NULL,
	[cedulaEmpleado] [nvarchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[lavado]  WITH CHECK ADD FOREIGN KEY([cedulaEmpleado])
REFERENCES [dbo].[empleado] ([cedula])
GO
ALTER TABLE [dbo].[lavado]  WITH CHECK ADD FOREIGN KEY([idVehiculoLavado])
REFERENCES [dbo].[tipoVehiculoLavado] ([idVehiculoLavado])
GO
ALTER TABLE [dbo].[mantenimiento]  WITH CHECK ADD FOREIGN KEY([cedulaEmpleado])
REFERENCES [dbo].[empleado] ([cedula])
GO
ALTER TABLE [dbo].[mantenimiento]  WITH CHECK ADD FOREIGN KEY([idVehiculoMantenimiento])
REFERENCES [dbo].[tipoVehiculoMantenimiento] ([idVehiculoMantenimiento])
GO
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuario] ([usuario])
GO
ALTER TABLE [dbo].[productoCompra]  WITH CHECK ADD FOREIGN KEY([idCompra])
REFERENCES [dbo].[compra] ([idCompra])
GO
ALTER TABLE [dbo].[productoCompra]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[productos] ([idProducto])
GO
ALTER TABLE [dbo].[productoVenta]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[productos] ([idProducto])
GO
ALTER TABLE [dbo].[productoVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[venta] ([idVenta])
GO
ALTER TABLE [dbo].[tipoVehiculoLavado]  WITH CHECK ADD FOREIGN KEY([idServicioLavado])
REFERENCES [dbo].[servicioLavado] ([idServicioLavado])
GO
ALTER TABLE [dbo].[tipoVehiculoMantenimiento]  WITH CHECK ADD FOREIGN KEY([idServicioMantenimiento])
REFERENCES [dbo].[servicioMantenimiento] ([idServicioMantenimiento])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([cedula])
REFERENCES [dbo].[empleado] ([cedula])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([cedulaCliente])
REFERENCES [dbo].[clientes] ([cedula])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([cedulaEmpleado])
REFERENCES [dbo].[empleado] ([cedula])
GO
/****** Object:  StoredProcedure [dbo].[sp_Actualizarclientes]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Actualizarclientes]
(
    @idcliente int = '',
	@i_nombres nvarchar(120),
	@i_apellido nvarchar(120),
	@i_cedula nvarchar(16) = '',
	@i_correo nvarchar(80) = '',
	@i_celular int = '',
	@i_estado nvarchar(10)
	
)
as

/* S begin
	insert into DBAutoLavado..clientes([nombres],[apellido],[cedula],[correo],[celular],[estado]) 
	values(@i_nombres, @i_apellido,@i_cedula,@i_correo,@i_celular,@i_estado)
end*/
 
begin
	update  DBAutoLavado..clientes  set nombres = @i_nombres, apellido = @i_apellido,
	cedula = @i_cedula, correo = @i_correo, celular = @i_celular, estado = @i_estado
	where idCliente = @idcliente
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Actualizarcompra]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Actualizarcompra]
(
	@i_idproveedor int = '',
	@idCompra int = ''
)
as
/*declare @fecha datetime
---if @i_operacion = 'I'
begin
select @fecha = GETDATE()
insert into DBAutoLavado..compra([fechaCompra],[idProveedor]) values
(@fecha, @i_idproveedor)
end*/

---if @i_operacion = 'U'
begin
	update DBAutoLavado..compra set idProveedor = @i_idproveedor where idCompra = @idCompra
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarEmpleado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ActualizarEmpleado]
(
	@i_fechaNac date,
	@i_celular int = '',
	@i_direccion nvarchar(90),
	@i_cedula nvarchar(16),
	@i_apellidos nvarchar(120),
	@i_nombres nvarchar(80),
	@i_salario money,
	@i_estado nvarchar(10) = '',
	@idEmpleado int = ''
)
as
---if @i_operacion = 'I'
/*begin
insert into DBAutoLavado..empleado([fechaNac],[celular],[direccion],
			[cedula],[apellidos],[nombres],[salario],[estado]) values 
			(@i_fechaNac,@i_celular,@i_direccion,@i_cedula,@i_apellidos,
			@i_nombres,@i_salario,@i_estado)
end

if @i_operacion = 'U'*/
begin
update DBAutoLavado..empleado set fechaNac = @i_fechaNac, celular = @i_celular, direccion = @i_direccion,
		cedula = @i_cedula, apellidos = @i_apellidos, nombres = @i_nombres, salario = @i_salario,
		estado = @i_estado where idEmpleado = @idEmpleado
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarLavado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ActualizarLavado]
(
	@i_placa nvarchar(10),
	@i_cedulaEmpleado nvarchar(16),
	@i_idVehiculo int,
	@idLavado int = '',
	@total money
)
as
/*declare @fecha datetime
---if @i_operacion = 'I'
begin
	select @fecha = GETDATE()
	insert into DBAutoLavado..lavado([total],[fecha],[placa],[idVehiculoLavado],[cedulaEmpleado])
	values (@total,@fecha,@i_placa,@i_idVehiculo,@i_cedulaEmpleado)
end
if @i_operacion = 'U'*/

begin
	/*select @total = ser.precio from tipoVehiculoLavado inner join servicioLavado ser on
	tipoVehiculoLavado.idServicioLavado = ser.idServicioLavado where tipoVehiculoLavado.idVehiculoLavado = @i_idVehiculo*/
	update DBAutoLavado..lavado set placa = @i_placa, idVehiculoLavado = @i_idVehiculo,
	 cedulaEmpleado = @i_cedulaEmpleado, total = @total
	where idLavado = @idLavado
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarMantenimiento]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ActualizarMantenimiento]
(
	@i_total money,
	@i_placa nvarchar(10),
	@i_iVehiculodMantenimiento int,
	@i_cedulaEmpleado nvarchar(16),
	@idMatenimiento int = ''
)
as
/*declare @fecha datetime
--if @i_operacion = 'I'
begin
select @fecha = GETDATE()
insert into DBAutoLavado..mantenimiento([total],[fecha],[placa],[idVehiculoMantenimiento],[cedulaEmpleado])
values (@i_total, @fecha,@i_placa,@i_iVehiculodMantenimiento,@i_cedulaEmpleado)
end

if @i_operacion = 'U'*/
begin
	update DBAutoLavado..mantenimiento set total = @i_total, placa = @i_placa,
	idVehiculoMantenimiento = @i_iVehiculodMantenimiento, cedulaEmpleado = @i_cedulaEmpleado
	where idMantenimiento = @idMatenimiento
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarProductoCompra]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ActualizarProductoCompra]
(
	@i_cantidad int,
	@i_precio money,
	@i_idCompra int,
	@i_idProducto int,
	@i_total money,
	@i_subtotal money,
	@i_iva decimal
)
as
--if @i_operacion = 'I'
/*begin
insert into DBAutoLavado..productoCompra([cantidad],[precio],[idCompra],[idProducto],[total],[subTotal],[iva])
values (@i_cantidad, @i_precio, @i_idCompra, @i_idProducto, @i_total, @i_subtotal, @i_iva)
end 

if @i_operacion = 'U'*/
begin
update DBAutoLavado..productoCompra set cantidad = @i_cantidad, precio =  @i_precio 
, idProducto = @i_idProducto, total = @i_total, subTotal = @i_subtotal,
iva = @i_iva where idCompra = @i_idCompra
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarProductos]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ActualizarProductos]
(
	@i_marca nvarchar(50),	
	@i_nombre nvarchar(50),	
	@i_existencia int = '',
	@idProducto int = ''
)
as
--if @i_operacion = 'I'
/*begin
insert into DBAutoLavado..productos ([marca],[nombre],[existencia])
values (@i_marca,@i_nombre,@i_existencia)
end

if @i_operacion = 'U'*/
begin
update DBAutoLavado..productos set marca = @i_marca,nombre = @i_nombre ,existencia = @i_existencia
where idProducto = @idProducto
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUsuario]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ActualizarUsuario]
(
	@i_usuario nvarchar(100),
	@i_password nvarchar(max),
	@i_cedula nvarchar(16) = '',
	@i_Pusuario nvarchar(100),
	@i_venta bit,
	@i_mantenimiento bit,
	@i_lavado bit,
	@i_compra bit,
	@i_empleado bit,
	@i_Tusuario bit,
	@i_producto bit,
	@i_proveedor bit,
	@i_estado nvarchar(10)
	--@i_operacion char(1)
)
as
---if @i_operacion = 'I'
/*begin
	insert into DBAutoLavado..usuario([usuario],Password,[cedula])
	values(@i_usuario,@i_password,@i_cedula)

	insert into DBAutoLavado..permiso(usuario,venta,mantenimiento,
	lavado,compra,empleado,Tusuario,producto,proveedor) values
	(@i_Pusuario,@i_venta,@i_mantenimiento,@i_lavado,
	@i_compra,@i_empleado,@i_Tusuario,@i_producto,@i_proveedor)
end

if @i_operacion = 'U'*/
begin
	update DBAutoLavado..usuario set Password = @i_password, estado = @i_estado where usuario = @i_usuario
	update DBAutoLavado..permiso set venta = @i_venta, mantenimiento = @i_mantenimiento,
	lavado = @i_lavado, compra = @i_compra, empleado = @i_empleado, Tusuario = @i_Tusuario,
	producto = @i_producto, proveedor = @i_proveedor where usuario = @i_Pusuario
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Insertarclientes]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Insertarclientes]
(
    @idcliente int = '',
	@i_nombres nvarchar(120),
	@i_apellido nvarchar(120),
	@i_cedula nvarchar(16) = '',
	@i_correo nvarchar(80) = '',
	@i_celular int = '',
	@i_estado nvarchar(10)
	
)
as

begin
	insert into DBAutoLavado..clientes([nombres],[apellido],[cedula],[correo],[celular],[estado]) 
	values(@i_nombres, @i_apellido,@i_cedula,@i_correo,@i_celular,@i_estado)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Insertarcompra]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Insertarcompra]
(
	@i_idproveedor int = '',
	@idCompra int = ''
)
as
declare @fecha datetime
---if @i_operacion = 'I'
begin
select @fecha = GETDATE()
insert into DBAutoLavado..compra([fechaCompra],[idProveedor]) values
(@fecha, @i_idproveedor)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Insertarempleado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Insertarempleado]
(
	@i_fechaNac date,
	@i_celular int = '',
	@i_direccion nvarchar(90),
	@i_cedula nvarchar(16),
	@i_apellidos nvarchar(120),
	@i_nombres nvarchar(80),
	@i_salario money,
	@i_estado nvarchar(10) = '',
	@idEmpleado int = ''
)
as
---if @i_operacion = 'I'
begin
insert into DBAutoLavado..empleado([fechaNac],[celular],[direccion],
			[cedula],[apellidos],[nombres],[salario],[estado]) values 
			(@i_fechaNac,@i_celular,@i_direccion,@i_cedula,@i_apellidos,
			@i_nombres,@i_salario,@i_estado)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarLavado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertarLavado]
(
	@i_placa nvarchar(10),
	@i_cedulaEmpleado nvarchar(16),
	@i_idVehiculo int,
	@idLavado int = '',
	@total money
)
as
declare @fecha datetime
---if @i_operacion = 'I'
begin
	select @fecha = GETDATE()
	insert into DBAutoLavado..lavado([total],[fecha],[placa],[idVehiculoLavado],[cedulaEmpleado])
	values (@total,@fecha,@i_placa,@i_idVehiculo,@i_cedulaEmpleado)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarMantenimiento]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertarMantenimiento]
(
	@i_total money,
	@i_placa nvarchar(10),
	@i_iVehiculodMantenimiento int,
	@i_cedulaEmpleado nvarchar(16),
	@idMatenimiento int = ''
)
as
declare @fecha datetime
--if @i_operacion = 'I'
begin
select @fecha = GETDATE()
insert into DBAutoLavado..mantenimiento([total],[fecha],[placa],[idVehiculoMantenimiento],[cedulaEmpleado])
values (@i_total, @fecha,@i_placa,@i_iVehiculodMantenimiento,@i_cedulaEmpleado)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarProductoCompra]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertarProductoCompra]
(
	@i_cantidad int,
	@i_precio money,
	@i_idCompra int,
	@i_idProducto int,
	@i_total money,
	@i_subtotal money,
	@i_iva decimal
)
as
--if @i_operacion = 'I'
begin
insert into DBAutoLavado..productoCompra([cantidad],[precio],[idCompra],[idProducto],[total],[subTotal],[iva])
values (@i_cantidad, @i_precio, @i_idCompra, @i_idProducto, @i_total, @i_subtotal, @i_iva)
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarProductos]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertarProductos]
(
	@i_marca nvarchar(50),	
	@i_nombre nvarchar(50),	
	@i_existencia int = '',
	@idProducto int = ''
)
as
--if @i_operacion = 'I'
begin
insert into DBAutoLavado..productos ([marca],[nombre],[existencia])
values (@i_marca,@i_nombre,@i_existencia)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarUsuario]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertarUsuario]
(
	@i_usuario nvarchar(100),
	@i_password nvarchar(max),
	@i_cedula nvarchar(16) = '',
	@i_Pusuario nvarchar(100),
	@i_venta bit,
	@i_mantenimiento bit,
	@i_lavado bit,
	@i_compra bit,
	@i_empleado bit,
	@i_Tusuario bit,
	@i_producto bit,
	@i_proveedor bit,
	@i_estado nvarchar(10)
	--@i_operacion char(1)
)
as
---if @i_operacion = 'I'
begin
	insert into DBAutoLavado..usuario([usuario],Password,[cedula],[estado]) 
	values(@i_usuario,@i_password,@i_cedula,@i_estado)

	insert into DBAutoLavado..permiso(usuario,venta,mantenimiento,
	lavado,compra,empleado,Tusuario,producto,proveedor) values
	(@i_Pusuario,@i_venta,@i_mantenimiento,@i_lavado,
	@i_compra,@i_empleado,@i_Tusuario,@i_producto,@i_proveedor)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Listarclientes]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Listarclientes]
as
begin
select [nombres],[apellido],[cedula],[correo],[celular],[estado] from clientes where estado = 'activo'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Listarcompra]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Listarcompra]
as
begin
select  productos.nombre, productos.marca, productoCompra.precio, productoCompra.cantidad,
		productoCompra.subTotal, productoCompra.iva, productoCompra.total, compra. fechaCompra
		from productos inner join productoCompra on productos.idProducto = productoCompra.idProducto
		inner join compra on productoCompra.idCompra = compra.idCompra
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarEmpleado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarEmpleado]
/*(
	@i_fechaNac date,
	@i_celular int = '',
	@i_direccion nvarchar(90),
	@i_cedula nvarchar(16),
	@i_apellidos nvarchar(120),
	@i_nombres nvarchar(80),
	@i_salario money,
	@i_estado nvarchar(10) = '',
	@idEmpleado int = ''
)*/
as
---if @i_operacion = 'I'
/*begin
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

if @i_operacion = 'S'*/
begin
select [nombres],[apellidos],[fechaNac],[cedula],[direccion],[celular],[salario],[estado] from empleado where estado = 'activo'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarLavado]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarLavado]
as
begin
	select lavado.fecha, empleado.nombres + ' ' + empleado.apellidos as Empleado, tipoVehiculoLavado.vehiculoLavado,
	 lavado.placa ,servicioLavado.servicioLavado, servicioLavado.precio
	from servicioLavado inner join tipoVehiculoLavado on servicioLavado.idServicioLavado = tipoVehiculoLavado.idServicioLavado
	inner join lavado on tipoVehiculoLavado.idVehiculoLavado = lavado.idVehiculoLavado inner join empleado on
	lavado.cedulaEmpleado = empleado.cedula
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarMantenimiento]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarMantenimiento]
as
begin
select mantenimiento.fecha, empleado.nombres + ' ' + empleado.apellidos as Empleado,
servicioMantenimiento.servicioMantenimiento,tipoVehiculoMantenimiento.vehiculoMantenimiento, 
mantenimiento.placa, mantenimiento.total  from empleado inner join mantenimiento on
empleado.cedula = mantenimiento.cedulaEmpleado inner join tipoVehiculoMantenimiento on
mantenimiento.idMantenimiento = tipoVehiculoMantenimiento.idVehiculoMantenimiento inner join
servicioMantenimiento on tipoVehiculoMantenimiento.idServicioMantenimiento = servicioMantenimiento.idServicioMantenimiento

end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarProductoCompra]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarProductoCompra]
as
begin
select productos.nombre,productos.marca,productoCompra.precio, productoCompra.cantidad,
productoCompra.subTotal,productoCompra.iva, productoCompra.total from productos inner join
productoCompra on productos.idProducto = productoCompra.idProducto
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarProductos]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarProductos]
as
begin
select nombre, marca, precioUnidad,existencia from productos
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarUsuario]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarUsuario]
as
begin
	select empleado.nombres + ' ' + empleado.apellidos as Empleado, permiso.usuario,
	permiso.venta, permiso.mantenimiento, permiso.lavado, permiso.compra, permiso.empleado,
	permiso.Tusuario,permiso.producto,permiso.proveedor,usuario.estado from empleado inner join usuario on 
	empleado.cedula = usuario.cedula inner join permiso on usuario.usuario = permiso.usuario 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_validarUsuario]    Script Date: 14/03/2018 01:38:51 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_validarUsuario]
(
	@usuario nvarchar(max),
	@password nvarchar(max)
)
as
begin
select empleado.nombres, Usuario.Password,
               permiso.usuario,permiso.venta, permiso.mantenimiento, permiso.lavado,
               permiso.compra, permiso.empleado,permiso.Tusuario,permiso.producto,permiso.proveedor
                from empleado inner join usuario on empleado.cedula = usuario.cedula inner join
               permiso on usuario.usuario = permiso.usuario where permiso.usuario = @usuario and usuario.Password = @password
end
GO
USE [master]
GO
ALTER DATABASE [DBAutoLavado] SET  READ_WRITE 
GO
