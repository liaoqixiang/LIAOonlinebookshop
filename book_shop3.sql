USE [master]
GO

/****** Object:  Database [book_shop3]    Script Date: 1/04/2017 4:53:46 PM ******/
CREATE DATABASE [book_shop3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookshop', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.LEO2012SEVER\MSSQL\DATA\bookshop.mdf' , SIZE = 11264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bookshop_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.LEO2012SEVER\MSSQL\DATA\bookshop_log.ldf' , SIZE = 26816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [book_shop3] SET COMPATIBILITY_LEVEL = 90
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [book_shop3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [book_shop3] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [book_shop3] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [book_shop3] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [book_shop3] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [book_shop3] SET ARITHABORT OFF 
GO

ALTER DATABASE [book_shop3] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [book_shop3] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [book_shop3] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [book_shop3] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [book_shop3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [book_shop3] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [book_shop3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [book_shop3] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [book_shop3] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [book_shop3] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [book_shop3] SET  DISABLE_BROKER 
GO

ALTER DATABASE [book_shop3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [book_shop3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [book_shop3] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [book_shop3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [book_shop3] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [book_shop3] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [book_shop3] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [book_shop3] SET RECOVERY FULL 
GO

ALTER DATABASE [book_shop3] SET  MULTI_USER 
GO

ALTER DATABASE [book_shop3] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [book_shop3] SET DB_CHAINING OFF 
GO

ALTER DATABASE [book_shop3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [book_shop3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [book_shop3] SET  READ_WRITE 
GO

