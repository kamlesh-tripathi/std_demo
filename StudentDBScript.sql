USE [master]
GO
/****** Object:  Database [StudentDB]    Script Date: 25-08-2020 12:09:01 ******/
CREATE DATABASE [StudentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudentDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudentDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentDB] SET QUERY_STORE = OFF
GO
USE [StudentDB]
GO
/****** Object:  Table [dbo].[District]    Script Date: 25-08-2020 12:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [varchar](50) NOT NULL,
	[IsActive] [tinyint] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 25-08-2020 12:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[SchoolYear] [varchar](4) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 25-08-2020 12:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[SchoolYear] [varchar](4) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 25-08-2020 12:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DistrictId] [int] NOT NULL,
	[DateOfBirth] [date] NULL,
	[SSN] [varchar](10) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[District] ADD  CONSTRAINT [DF_District_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Students1] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Students1]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Students1] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Students1]
GO
USE [master]
GO
ALTER DATABASE [StudentDB] SET  READ_WRITE 
GO
