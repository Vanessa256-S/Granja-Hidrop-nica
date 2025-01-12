USE [master]
GO
/****** Object:  Database [Hidroponica]    Script Date: 29/10/2024 10:39:10 a. m. ******/
CREATE DATABASE [Hidroponica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hidroponica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hidroponica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hidroponica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hidroponica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hidroponica] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hidroponica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hidroponica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hidroponica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hidroponica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hidroponica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hidroponica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hidroponica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hidroponica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hidroponica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hidroponica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hidroponica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hidroponica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hidroponica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hidroponica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hidroponica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hidroponica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hidroponica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hidroponica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hidroponica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hidroponica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hidroponica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hidroponica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hidroponica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hidroponica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hidroponica] SET  MULTI_USER 
GO
ALTER DATABASE [Hidroponica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hidroponica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hidroponica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hidroponica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hidroponica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hidroponica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hidroponica] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hidroponica] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hidroponica]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29/10/2024 10:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[correo] [varchar](100) NULL,
	[telefono] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cultivo]    Script Date: 29/10/2024 10:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cultivo](
	[id_cultivo] [int] IDENTITY(1,1) NOT NULL,
	[tipo_planta] [varchar](100) NOT NULL,
	[fecha_siembra] [date] NOT NULL,
	[estado_crecimiento] [varchar](50) NULL,
	[rendimiento_esperado] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cultivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 29/10/2024 10:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Venta](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[venta_id] [int] NULL,
	[cultivo_id] [int] NULL,
	[cantidad] [decimal](10, 2) NOT NULL,
	[subtotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insumo]    Script Date: 29/10/2024 10:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insumo](
	[id_insumo] [int] IDENTITY(1,1) NOT NULL,
	[tipo_insumo] [varchar](100) NOT NULL,
	[cantidad_disponible] [decimal](10, 2) NOT NULL,
	[fecha_caducidad] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_insumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 29/10/2024 10:39:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NULL,
	[fecha_venta] [datetime] NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id_cliente], [nombre], [correo], [telefono]) VALUES (1, N'Juan Pérez', N'juan.perez@example.com', N'1234567890')
INSERT [dbo].[Cliente] ([id_cliente], [nombre], [correo], [telefono]) VALUES (2, N'María López', N'maria.lopez@example.com', N'0987654321')
INSERT [dbo].[Cliente] ([id_cliente], [nombre], [correo], [telefono]) VALUES (3, N'Carlos Rueda', N'carlos.rueda@example.com', N'1122334455')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Cultivo] ON 

INSERT [dbo].[Cultivo] ([id_cultivo], [tipo_planta], [fecha_siembra], [estado_crecimiento], [rendimiento_esperado]) VALUES (1, N'Tomate', CAST(N'2024-03-01' AS Date), N'Crecimiento', CAST(100.50 AS Decimal(10, 2)))
INSERT [dbo].[Cultivo] ([id_cultivo], [tipo_planta], [fecha_siembra], [estado_crecimiento], [rendimiento_esperado]) VALUES (2, N'Lechuga', CAST(N'2024-04-15' AS Date), N'Cosecha', CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[Cultivo] ([id_cultivo], [tipo_planta], [fecha_siembra], [estado_crecimiento], [rendimiento_esperado]) VALUES (3, N'Maíz', CAST(N'2024-02-20' AS Date), N'Cosecha', CAST(150.25 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Cultivo] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle_Venta] ON 

INSERT [dbo].[Detalle_Venta] ([id_detalle], [venta_id], [cultivo_id], [cantidad], [subtotal]) VALUES (1, 1, 1, CAST(10.00 AS Decimal(10, 2)), CAST(50.25 AS Decimal(10, 2)))
INSERT [dbo].[Detalle_Venta] ([id_detalle], [venta_id], [cultivo_id], [cantidad], [subtotal]) VALUES (2, 1, 2, CAST(15.00 AS Decimal(10, 2)), CAST(75.50 AS Decimal(10, 2)))
INSERT [dbo].[Detalle_Venta] ([id_detalle], [venta_id], [cultivo_id], [cantidad], [subtotal]) VALUES (3, 2, 2, CAST(5.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[Detalle_Venta] ([id_detalle], [venta_id], [cultivo_id], [cantidad], [subtotal]) VALUES (4, 3, 3, CAST(8.00 AS Decimal(10, 2)), CAST(45.25 AS Decimal(10, 2)))
INSERT [dbo].[Detalle_Venta] ([id_detalle], [venta_id], [cultivo_id], [cantidad], [subtotal]) VALUES (5, 3, 1, CAST(5.00 AS Decimal(10, 2)), CAST(80.25 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Detalle_Venta] OFF
GO
SET IDENTITY_INSERT [dbo].[Insumo] ON 

INSERT [dbo].[Insumo] ([id_insumo], [tipo_insumo], [cantidad_disponible], [fecha_caducidad]) VALUES (1, N'Fertilizante', CAST(500.00 AS Decimal(10, 2)), CAST(N'2025-12-31' AS Date))
INSERT [dbo].[Insumo] ([id_insumo], [tipo_insumo], [cantidad_disponible], [fecha_caducidad]) VALUES (2, N'Sustrato', CAST(300.00 AS Decimal(10, 2)), CAST(N'2024-11-15' AS Date))
INSERT [dbo].[Insumo] ([id_insumo], [tipo_insumo], [cantidad_disponible], [fecha_caducidad]) VALUES (3, N'Pesticida', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-10' AS Date))
SET IDENTITY_INSERT [dbo].[Insumo] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([id_venta], [cliente_id], [fecha_venta], [total]) VALUES (1, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(150.75 AS Decimal(10, 2)))
INSERT [dbo].[Venta] ([id_venta], [cliente_id], [fecha_venta], [total]) VALUES (2, 2, CAST(N'2024-09-10T00:00:00.000' AS DateTime), CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[Venta] ([id_venta], [cliente_id], [fecha_venta], [total]) VALUES (3, 3, CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(125.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Cliente__2A586E0B5CD38207]    Script Date: 29/10/2024 10:39:10 a. m. ******/
ALTER TABLE [dbo].[Cliente] ADD UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [fecha_venta]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD FOREIGN KEY([cultivo_id])
REFERENCES [dbo].[Cultivo] ([id_cultivo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD FOREIGN KEY([venta_id])
REFERENCES [dbo].[Venta] ([id_venta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Cliente] ([id_cliente])
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [Hidroponica] SET  READ_WRITE 
GO
