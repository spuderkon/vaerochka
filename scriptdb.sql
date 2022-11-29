USE [master]
GO
/****** Object:  Database [vaerochka]    Script Date: 29.11.2022 17:19:58 ******/
CREATE DATABASE [vaerochka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vaerochka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\vaerochka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vaerochka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\vaerochka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [vaerochka] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vaerochka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vaerochka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vaerochka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vaerochka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vaerochka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vaerochka] SET ARITHABORT OFF 
GO
ALTER DATABASE [vaerochka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vaerochka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vaerochka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vaerochka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vaerochka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vaerochka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vaerochka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vaerochka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vaerochka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vaerochka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [vaerochka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vaerochka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vaerochka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vaerochka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vaerochka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vaerochka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vaerochka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vaerochka] SET RECOVERY FULL 
GO
ALTER DATABASE [vaerochka] SET  MULTI_USER 
GO
ALTER DATABASE [vaerochka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vaerochka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vaerochka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vaerochka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vaerochka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vaerochka] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'vaerochka', N'ON'
GO
ALTER DATABASE [vaerochka] SET QUERY_STORE = OFF
GO
USE [vaerochka]
GO
/****** Object:  Table [dbo].[aircraft]    Script Date: 29.11.2022 17:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aircraft](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](100) NULL,
	[business_seats] [int] NULL,
	[economy_seats] [int] NULL,
	[max_seats] [int] NULL,
 CONSTRAINT [PK_plane] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[airline]    Script Date: 29.11.2022 17:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airline](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_airlines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[airport]    Script Date: 29.11.2022 17:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[city_id] [int] NULL,
 CONSTRAINT [PK_airport] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 29.11.2022 17:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
	[country_id] [int] NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 29.11.2022 17:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[surname] [nvarchar](100) NULL,
	[lastname] [nvarchar](100) NULL,
	[sex] [nvarchar](50) NULL,
	[passport_id] [int] NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 29.11.2022 17:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[number] [nvarchar](30) NULL,
 CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 29.11.2022 17:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flight]    Script Date: 29.11.2022 17:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aircraft_id] [int] NULL,
	[boarding_gate] [nvarchar](30) NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[start_airport_id] [int] NULL,
	[end_airport_id] [int] NULL,
 CONSTRAINT [PK_flight] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[passport]    Script Date: 29.11.2022 17:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[birthdate] [date] NULL,
	[citizenship_id] [int] NULL,
	[number] [nvarchar](50) NULL,
	[country_of_issue_id] [int] NULL,
	[validity_period] [date] NULL,
 CONSTRAINT [PK_passport] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration]    Script Date: 29.11.2022 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[route_id] [int] NULL,
	[client_id] [int] NULL,
	[contact_id] [int] NULL,
	[tariff_id] [int] NULL,
	[seat] [nvarchar](10) NULL,
	[insurance] [bit] NULL,
	[total_price] [money] NULL,
 CONSTRAINT [PK_registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[route]    Script Date: 29.11.2022 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[route](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[airline_id] [int] NULL,
	[price] [money] NULL,
	[code] [nvarchar](50) NULL,
 CONSTRAINT [PK_route] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[route-flight]    Script Date: 29.11.2022 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[route-flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[route_id] [int] NULL,
	[flight_id] [int] NULL,
 CONSTRAINT [PK_route-flight] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tariff]    Script Date: 29.11.2022 17:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tariff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[airline_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[hand_luggage] [bit] NULL,
	[luggage] [bit] NULL,
	[rebooking] [bit] NULL,
	[refund] [bit] NULL,
	[markup] [int] NULL,
 CONSTRAINT [PK_tariff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[airport]  WITH CHECK ADD  CONSTRAINT [city_to_city_id] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([id])
GO
ALTER TABLE [dbo].[airport] CHECK CONSTRAINT [city_to_city_id]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [country_to_country_id] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [country_to_country_id]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [passport_to_client_passport_id] FOREIGN KEY([passport_id])
REFERENCES [dbo].[passport] ([id])
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [passport_to_client_passport_id]
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD  CONSTRAINT [aircraft_to_aircraft_id] FOREIGN KEY([aircraft_id])
REFERENCES [dbo].[aircraft] ([id])
GO
ALTER TABLE [dbo].[flight] CHECK CONSTRAINT [aircraft_to_aircraft_id]
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD  CONSTRAINT [airport_to_end_airport_id] FOREIGN KEY([end_airport_id])
REFERENCES [dbo].[airport] ([id])
GO
ALTER TABLE [dbo].[flight] CHECK CONSTRAINT [airport_to_end_airport_id]
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD  CONSTRAINT [airport_to_start_airport_id] FOREIGN KEY([start_airport_id])
REFERENCES [dbo].[airport] ([id])
GO
ALTER TABLE [dbo].[flight] CHECK CONSTRAINT [airport_to_start_airport_id]
GO
ALTER TABLE [dbo].[passport]  WITH CHECK ADD  CONSTRAINT [country_to_citizenship_id] FOREIGN KEY([citizenship_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[passport] CHECK CONSTRAINT [country_to_citizenship_id]
GO
ALTER TABLE [dbo].[passport]  WITH CHECK ADD  CONSTRAINT [country_to_countryofissue_id] FOREIGN KEY([country_of_issue_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[passport] CHECK CONSTRAINT [country_to_countryofissue_id]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [client_to_regisration_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [client_to_regisration_client_id]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [contact_to_registration_contact_id] FOREIGN KEY([contact_id])
REFERENCES [dbo].[contact] ([id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [contact_to_registration_contact_id]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [FK_registration_route] FOREIGN KEY([route_id])
REFERENCES [dbo].[route] ([id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [FK_registration_route]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [tariff_to_registration_tariff_id] FOREIGN KEY([tariff_id])
REFERENCES [dbo].[tariff] ([id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [tariff_to_registration_tariff_id]
GO
ALTER TABLE [dbo].[route]  WITH CHECK ADD  CONSTRAINT [FK_route_airline] FOREIGN KEY([airline_id])
REFERENCES [dbo].[airline] ([id])
GO
ALTER TABLE [dbo].[route] CHECK CONSTRAINT [FK_route_airline]
GO
ALTER TABLE [dbo].[route-flight]  WITH CHECK ADD  CONSTRAINT [FK_route-flight_flight1] FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight] ([id])
GO
ALTER TABLE [dbo].[route-flight] CHECK CONSTRAINT [FK_route-flight_flight1]
GO
ALTER TABLE [dbo].[route-flight]  WITH CHECK ADD  CONSTRAINT [FK_route-flight_route] FOREIGN KEY([route_id])
REFERENCES [dbo].[route] ([id])
GO
ALTER TABLE [dbo].[route-flight] CHECK CONSTRAINT [FK_route-flight_route]
GO
ALTER TABLE [dbo].[tariff]  WITH CHECK ADD  CONSTRAINT [airline_to_tariff_airline_id] FOREIGN KEY([airline_id])
REFERENCES [dbo].[airline] ([id])
GO
ALTER TABLE [dbo].[tariff] CHECK CONSTRAINT [airline_to_tariff_airline_id]
GO
USE [master]
GO
ALTER DATABASE [vaerochka] SET  READ_WRITE 
GO
