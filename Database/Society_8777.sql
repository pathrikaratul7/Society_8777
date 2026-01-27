USE [master]
GO
/****** Object:  Database [Society_8777]    Script Date: 27-01-2026 16:23:58 ******/
CREATE DATABASE [Society_8777]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Society_8777', FILENAME = N'F:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Society_8777.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Society_8777_log', FILENAME = N'F:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Society_8777_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Society_8777].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Society_8777] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Society_8777] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Society_8777] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Society_8777] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Society_8777] SET ARITHABORT OFF 
GO
ALTER DATABASE [Society_8777] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Society_8777] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Society_8777] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Society_8777] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Society_8777] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Society_8777] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Society_8777] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Society_8777] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Society_8777] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Society_8777] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Society_8777] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Society_8777] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Society_8777] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Society_8777] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Society_8777] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Society_8777] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Society_8777] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Society_8777] SET RECOVERY FULL 
GO
ALTER DATABASE [Society_8777] SET  MULTI_USER 
GO
ALTER DATABASE [Society_8777] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Society_8777] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Society_8777] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Society_8777] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Society_8777] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Society_8777', N'ON'
GO
ALTER DATABASE [Society_8777] SET QUERY_STORE = ON
GO
ALTER DATABASE [Society_8777] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [Society_8777]
GO
/****** Object:  Table [dbo].[Tbl_Amenities]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Amenities](
	[AmenityId] [int] IDENTITY(1,1) NOT NULL,
	[AmenityName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Capacity] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AmenityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Config]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Config](
	[CID] [bigint] IDENTITY(1,1) NOT NULL,
	[ConfigName] [varchar](5000) NULL,
	[ConfigIsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ErrorLogs]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ErrorLogs](
	[ERRID] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorPage] [nvarchar](max) NULL,
	[ErrorStack] [nvarchar](max) NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[ErrorLoggedByID] [varchar](max) NULL,
	[ErrorLoggedByName] [varchar](max) NULL,
	[ErrorCreatedDateTime] [datetime] NULL,
	[IsResolve] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ERRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_FCMToken]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_FCMToken](
	[FCID] [bigint] IDENTITY(1,1) NOT NULL,
	[FcmToken] [varchar](max) NULL,
	[UpdatedOn] [datetime] NULL,
	[FlatID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Flat]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Flat](
	[FID] [bigint] IDENTITY(1,1) NOT NULL,
	[Ownername] [nvarchar](max) NULL,
	[FloorNumber] [varchar](100) NULL,
	[FlatNumber] [varchar](max) NULL,
	[FlatType] [varchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDateTime] [datetime] NULL,
	[LoginID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[FID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Flat_Audit]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Flat_Audit](
	[FFID] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NULL,
	[Ownername] [nvarchar](max) NULL,
	[FloorNumber] [varchar](100) NULL,
	[FlatNumber] [varchar](max) NULL,
	[FlatType] [varchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDateTime] [datetime] NULL,
	[LoginID] [bigint] NULL,
	[ChangeType] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Guest]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Guest](
	[GID] [bigint] IDENTITY(1,1) NOT NULL,
	[GName] [nvarchar](max) NULL,
	[GMobile] [nvarchar](max) NULL,
	[GEmail] [nvarchar](max) NULL,
	[InDateTime] [datetime] NULL,
	[OutDateTime] [datetime] NULL,
	[FID] [bigint] NULL,
	[Status] [varchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDateTime] [datetime] NULL,
	[GImagePath] [nvarchar](max) NULL,
	[CreatorMobile] [nvarchar](max) NULL,
 CONSTRAINT [PK__Tbl_Gues__C51F0F3EEFBD553A] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Guest_Audit]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Guest_Audit](
	[GHID] [bigint] IDENTITY(1,1) NOT NULL,
	[GID] [bigint] NULL,
	[GName] [nvarchar](max) NULL,
	[GMobile] [nvarchar](max) NULL,
	[GEmail] [nvarchar](max) NULL,
	[InDateTime] [datetime] NULL,
	[OutDateTime] [datetime] NULL,
	[FID] [bigint] NULL,
	[Status] [varchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDateTime] [datetime] NULL,
	[GImagePath] [nvarchar](max) NULL,
	[ChangeType] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Incident]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Incident](
	[INCID] [bigint] IDENTITY(1,1) NOT NULL,
	[INCType] [varchar](max) NULL,
	[INCImagePath] [nvarchar](max) NULL,
	[INCReportedBy] [nvarchar](max) NULL,
	[Isdeleted] [bit] NULL,
	[INCStatus] [varchar](max) NULL,
	[INCReportedDateTime] [datetime] NULL,
	[INCAssignTo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[INCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_LoginHistory]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_LoginHistory](
	[LID] [bigint] IDENTITY(1,1) NOT NULL,
	[UID] [bigint] NULL,
	[LastLoginDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Parking]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Parking](
	[ParkingId] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[VehicleNumber] [nvarchar](20) NOT NULL,
	[VehicleType] [nvarchar](20) NULL,
	[SlotNumber] [nvarchar](10) NOT NULL,
	[IsOccupied] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDateTime] [datetime] NULL,
	[VImagePath] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ParkingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Roles](
	[RoleID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
	[Isdelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_RolesMapping]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_RolesMapping](
	[RoleMappID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleID] [bigint] NULL,
	[UID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleMappID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Society]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Society](
	[SID] [bigint] IDENTITY(1,1) NOT NULL,
	[SName] [nvarchar](max) NULL,
	[SAddress] [nvarchar](max) NULL,
	[SPOC] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_User]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_User](
	[UID] [bigint] IDENTITY(1,1) NOT NULL,
	[UName] [nvarchar](max) NULL,
	[UEmail] [nvarchar](max) NULL,
	[UPass] [nvarchar](max) NULL,
	[UMobile] [nvarchar](20) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeviceID] [nvarchar](max) NULL,
	[PrivList] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[UserType] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_User_Audit]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_User_Audit](
	[UHID] [bigint] IDENTITY(1,1) NOT NULL,
	[UID] [bigint] NULL,
	[UName] [nvarchar](max) NULL,
	[UEmail] [nvarchar](max) NULL,
	[UPass] [nvarchar](max) NULL,
	[UMobile] [nvarchar](20) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeviceID] [nvarchar](max) NULL,
	[PrivList] [nvarchar](max) NULL,
	[ChangeType] [nvarchar](max) NULL,
	[UserType] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Config] ON 
GO
INSERT [dbo].[Tbl_Config] ([CID], [ConfigName], [ConfigIsActive], [CreatedDate], [UpdatedDate]) VALUES (1, N'http://10.55.244.209:8000', 0, CAST(N'2025-11-27T13:04:09.750' AS DateTime), CAST(N'2025-11-27T13:04:09.750' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_Config] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_ErrorLogs] ON 
GO
INSERT [dbo].[Tbl_ErrorLogs] ([ERRID], [ErrorPage], [ErrorStack], [ErrorMessage], [ErrorLoggedByID], [ErrorLoggedByName], [ErrorCreatedDateTime], [IsResolve]) VALUES (1, N'Test.xaml.cs', N'test', N'test', N'1', N'Atul', CAST(N'2025-10-16T15:07:28.163' AS DateTime), 0)
GO
INSERT [dbo].[Tbl_ErrorLogs] ([ERRID], [ErrorPage], [ErrorStack], [ErrorMessage], [ErrorLoggedByID], [ErrorLoggedByName], [ErrorCreatedDateTime], [IsResolve]) VALUES (2, N'Test.xaml.cs', N'test', N'test', N'1', N'Atul', CAST(N'2025-10-16T15:08:14.363' AS DateTime), 0)
GO
INSERT [dbo].[Tbl_ErrorLogs] ([ERRID], [ErrorPage], [ErrorStack], [ErrorMessage], [ErrorLoggedByID], [ErrorLoggedByName], [ErrorCreatedDateTime], [IsResolve]) VALUES (3, N'Flat Details Page', N'  at Xamarin.Forms.ShellUriHandler.GenerateRoutePaths (Xamarin.Forms.Shell shell, System.Uri request, System.Uri originalRequest, System.Boolean enableRelativeShellRoutes) [0x000d8] in D:\a\1\s\Xamarin.Forms.Core\Shell\ShellUriHandler.cs:218 
  at Xamarin.Forms.ShellUriHandler.GetNavigationRequest (Xamarin.Forms.Shell shell, System.Uri uri, System.Boolean enableRelativeShellRoutes, System.Boolean throwNavigationErrorAsException, Xamarin.Forms.ShellNavigationParameters shellNavigationParameters) [0x00018] in D:\a\1\s\Xamarin.Forms.Core\Shell\ShellUriHandler.cs:137 
  at Xamarin.Forms.ShellNavigationManager.GoToAsync (Xamarin.Forms.ShellNavigationParameters shellNavigationParameters) [0x000b7] in D:\a\1\s\Xamarin.Forms.Core\Shell\ShellNavigationManager.cs:44 
  at hybridandroid.Views.FlatDetailsPage.Button_Clicked (System.Object sender, System.EventArgs e) [0x00b5a] in D:\vs 2019 Repos\MySocAPP7\hybridandroid\hybridandroid\hybridandroid\Views\FlatDetailsPage.xaml.cs:206 ', N'Global routes currently cannot be the only page on the stack, so absolute routing to global routes is not supported. For now, just navigate to: FlatHistory', N'1', N'Atul P', CAST(N'2025-10-16T16:13:10.907' AS DateTime), 0)
GO
INSERT [dbo].[Tbl_ErrorLogs] ([ERRID], [ErrorPage], [ErrorStack], [ErrorMessage], [ErrorLoggedByID], [ErrorLoggedByName], [ErrorCreatedDateTime], [IsResolve]) VALUES (4, N'Flat Details Page', N'  at hybridandroid.Views.FlatDetailsPage.Button_Clicked (System.Object sender, System.EventArgs e) [0x00234] in D:\vs 2019 Repos\MySocAPP7\hybridandroid\hybridandroid\hybridandroid\Views\FlatDetailsPage.xaml.cs:96 ', N'Object reference not set to an instance of an object.', N'1', N'Atul P', CAST(N'2025-10-17T15:32:26.683' AS DateTime), 0)
GO
INSERT [dbo].[Tbl_ErrorLogs] ([ERRID], [ErrorPage], [ErrorStack], [ErrorMessage], [ErrorLoggedByID], [ErrorLoggedByName], [ErrorCreatedDateTime], [IsResolve]) VALUES (5, N'Flat Details Page', N'  at hybridandroid.Views.FlatDetailsPage.Button_Clicked (System.Object sender, System.EventArgs e) [0x00234] in D:\vs 2019 Repos\MySocAPP7\hybridandroid\hybridandroid\hybridandroid\Views\FlatDetailsPage.xaml.cs:96 ', N'Object reference not set to an instance of an object.', N'1', N'Atul P', CAST(N'2025-10-17T15:32:29.573' AS DateTime), 0)
GO
INSERT [dbo].[Tbl_ErrorLogs] ([ERRID], [ErrorPage], [ErrorStack], [ErrorMessage], [ErrorLoggedByID], [ErrorLoggedByName], [ErrorCreatedDateTime], [IsResolve]) VALUES (6, N'GuestRegistrationPage', N'  at hybridandroid.Views.GuestReg.btnSave_Clicked (System.Object sender, System.EventArgs e) [0x006a8] in D:\vs 2019 Repos\MySocAPP7\hybridandroid\hybridandroid\hybridandroid\Views\GuestReg.xaml.cs:279 ', N'Object reference not set to an instance of an object.', N'1', N'Atul P', CAST(N'2025-10-28T14:29:51.120' AS DateTime), 0)
GO
INSERT [dbo].[Tbl_ErrorLogs] ([ERRID], [ErrorPage], [ErrorStack], [ErrorMessage], [ErrorLoggedByID], [ErrorLoggedByName], [ErrorCreatedDateTime], [IsResolve]) VALUES (7, N'Flat Details Page', N'  at hybridandroid.Views.FlatDetailsPage.Button_Clicked (System.Object sender, System.EventArgs e) [0x00234] in D:\vs 2019 Repos\MySocAPP7\hybridandroid\hybridandroid\hybridandroid\Views\FlatDetailsPage.xaml.cs:96 ', N'Object reference not set to an instance of an object.', N'103', N'Suryaji Babar', CAST(N'2025-11-06T13:01:04.517' AS DateTime), 0)
GO
INSERT [dbo].[Tbl_ErrorLogs] ([ERRID], [ErrorPage], [ErrorStack], [ErrorMessage], [ErrorLoggedByID], [ErrorLoggedByName], [ErrorCreatedDateTime], [IsResolve]) VALUES (8, N'Flat Details Page', N'  at System.Number.ThrowOverflowOrFormatException (System.Boolean overflow, System.String overflowResourceKey) [0x0001a] in <65ee9686e7104ac1bf9d2aea72d18981>:0 
  at System.Number.ParseInt64 (System.ReadOnlySpan`1[T] value, System.Globalization.NumberStyles styles, System.Globalization.NumberFormatInfo info) [0x00016] in <65ee9686e7104ac1bf9d2aea72d18981>:0 
  at System.Int64.Parse (System.String s, System.IFormatProvider provider) [0x00017] in <65ee9686e7104ac1bf9d2aea72d18981>:0 
  at System.Convert.ToInt64 (System.String value) [0x0000c] in <65ee9686e7104ac1bf9d2aea72d18981>:0 
  at hybridandroid.Views.FlatDetailsPage.Button_Clicked (System.Object sender, System.EventArgs e) [0x002ba] in <38ff9329eb5d401d911338b2c84c7836>:0 ', N'Input string was not in a correct format.', N'103', N'Suryaji Babar', CAST(N'2025-11-06T13:09:59.127' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Tbl_ErrorLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_FCMToken] ON 
GO
INSERT [dbo].[Tbl_FCMToken] ([FCID], [FcmToken], [UpdatedOn], [FlatID]) VALUES (1, N'stritetertreteteng', CAST(N'2025-12-03T13:25:20.723' AS DateTime), 435346346)
GO
INSERT [dbo].[Tbl_FCMToken] ([FCID], [FcmToken], [UpdatedOn], [FlatID]) VALUES (2, N'teteeryeyrey', CAST(N'2025-12-03T13:27:45.067' AS DateTime), 7)
GO
SET IDENTITY_INSERT [dbo].[Tbl_FCMToken] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Flat] ON 
GO
INSERT [dbo].[Tbl_Flat] ([FID], [Ownername], [FloorNumber], [FlatNumber], [FlatType], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [LoginID]) VALUES (39, N'Suryaji Babar', N'37', N'305', N'2 BHK', NULL, NULL, CAST(N'2025-11-11T16:15:44.017' AS DateTime), N'115', CAST(N'2025-12-28T21:34:26.860' AS DateTime), 115)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Flat] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Guest] ON 
GO
INSERT [dbo].[Tbl_Guest] ([GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [CreatorMobile]) VALUES (8, N'Shivam awchar', N'6352536523', N'Shivam7@gmail.com', CAST(N'2025-11-11T00:00:00.000' AS DateTime), CAST(N'2025-11-21T00:00:00.000' AS DateTime), 39, N'OUT', NULL, N'1', CAST(N'2025-11-11T16:17:16.633' AS DateTime), N'1', CAST(N'2025-11-21T17:33:06.027' AS DateTime), N'/images/GuestImg/20251111_161643.jpg', N'9673178777')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Guest] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Guest_Audit] ON 
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (21, 5, N'Atul p', N'9856986586', N'abvd@g.com', CAST(N'2025-10-28T00:00:00.000' AS DateTime), NULL, 33, N'PENDING', 0, N'1', CAST(N'2025-10-28T18:12:22.037' AS DateTime), NULL, CAST(N'2025-10-28T18:12:22.037' AS DateTime), N'/images/GuestImg/20251028_181140.jpg', N'INSERTED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (23, 5, N'Atul p', N'9856986586', N'abvd@g.com', CAST(N'2025-10-28T00:00:00.000' AS DateTime), NULL, 33, N'PENDING', 0, N'1', CAST(N'2025-10-28T18:12:22.037' AS DateTime), NULL, CAST(N'2025-10-28T18:12:22.037' AS DateTime), N'/images/GuestImg/20251028_181140.jpg', N'DELETED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (25, 7, N'Pravin', N'9635258693', N'pra7@g.com', CAST(N'2025-10-29T00:00:00.000' AS DateTime), NULL, 36, N'PENDING', 0, N'1', CAST(N'2025-10-29T11:53:23.110' AS DateTime), NULL, CAST(N'2025-10-29T11:53:23.110' AS DateTime), N'/images/GuestImg/20251029_115248.jpg', N'INSERTED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (29, 8, N'Shivam awchar', N'6352536523', N'Shivam7@gmail.com', CAST(N'2025-11-11T00:00:00.000' AS DateTime), NULL, 39, N'PENDING', 0, N'1', CAST(N'2025-11-11T16:17:16.633' AS DateTime), NULL, CAST(N'2025-11-11T16:17:16.633' AS DateTime), N'/images/GuestImg/20251111_161643.jpg', N'INSERTED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (32, 8, N'Shivam awchar', N'6352536523', N'Shivam7@gmail.com', CAST(N'2025-11-11T00:00:00.000' AS DateTime), CAST(N'2025-11-21T00:00:00.000' AS DateTime), 39, N'OUT', NULL, N'1', CAST(N'2025-11-11T16:17:16.633' AS DateTime), N'1', CAST(N'2025-11-21T17:33:06.027' AS DateTime), N'/images/GuestImg/20251111_161643.jpg', N'UPDATED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (33, 8, N'Shivam awchar', N'6352536523', N'Shivam7@gmail.com', CAST(N'2025-11-11T00:00:00.000' AS DateTime), NULL, 39, N'APPROVE', NULL, N'1', CAST(N'2025-11-11T16:17:16.633' AS DateTime), N'1', CAST(N'2025-11-11T16:19:13.630' AS DateTime), N'/images/GuestImg/20251111_161643.jpg', N'DELETED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (22, 5, N'Atul p', N'9856986586', N'abvd@g.com', CAST(N'2025-10-28T00:00:00.000' AS DateTime), NULL, 33, N'PENDING', NULL, N'1', CAST(N'2025-10-28T18:12:22.037' AS DateTime), N'1', CAST(N'2025-10-28T18:12:30.620' AS DateTime), N'/images/GuestImg/20251028_181140.jpg', N'UPDATED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (24, 6, N'me atul', N'1234567890', N'me@g.com', CAST(N'2025-10-28T00:00:00.000' AS DateTime), NULL, 33, N'PENDING', 0, N'1', CAST(N'2025-10-28T23:11:56.193' AS DateTime), NULL, CAST(N'2025-10-28T23:11:56.193' AS DateTime), N'/images/GuestImg/20251028_231118.jpg', N'INSERTED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (30, 8, N'Shivam awchar', N'6352536523', N'Shivam7@gmail.com', CAST(N'2025-11-11T00:00:00.000' AS DateTime), NULL, 39, N'APPROVE', NULL, N'1', CAST(N'2025-11-11T16:17:16.633' AS DateTime), N'1', CAST(N'2025-11-11T16:19:13.630' AS DateTime), N'/images/GuestImg/20251111_161643.jpg', N'UPDATED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (31, 8, N'Shivam awchar', N'6352536523', N'Shivam7@gmail.com', CAST(N'2025-11-11T00:00:00.000' AS DateTime), NULL, 39, N'PENDING', 0, N'1', CAST(N'2025-11-11T16:17:16.633' AS DateTime), NULL, CAST(N'2025-11-11T16:17:16.633' AS DateTime), N'/images/GuestImg/20251111_161643.jpg', N'DELETED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (26, 7, N'Pravin', N'9635258693', N'pra7@g.com', CAST(N'2025-10-29T00:00:00.000' AS DateTime), NULL, 36, N'PENDING', 0, N'1', CAST(N'2025-10-29T11:53:23.110' AS DateTime), NULL, CAST(N'2025-10-29T11:53:23.110' AS DateTime), N'/images/GuestImg/20251029_115248.jpg', N'DELETED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (27, 6, N'me atul', N'1234567890', N'me@g.com', CAST(N'2025-10-28T00:00:00.000' AS DateTime), NULL, 33, N'PENDING', 0, N'1', CAST(N'2025-10-28T23:11:56.193' AS DateTime), NULL, CAST(N'2025-10-28T23:11:56.193' AS DateTime), N'/images/GuestImg/20251028_231118.jpg', N'DELETED')
GO
INSERT [dbo].[Tbl_Guest_Audit] ([GHID], [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [GImagePath], [ChangeType]) VALUES (28, 5, N'Atul p', N'9856986586', N'abvd@g.com', CAST(N'2025-10-28T00:00:00.000' AS DateTime), NULL, 33, N'PENDING', NULL, N'1', CAST(N'2025-10-28T18:12:22.037' AS DateTime), N'1', CAST(N'2025-10-28T18:12:30.620' AS DateTime), N'/images/GuestImg/20251028_181140.jpg', N'DELETED')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Guest_Audit] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Incident] ON 
GO
INSERT [dbo].[Tbl_Incident] ([INCID], [INCType], [INCImagePath], [INCReportedBy], [Isdeleted], [INCStatus], [INCReportedDateTime], [INCAssignTo]) VALUES (6, N'lift issue', N'/images/INCImg/20251111_162349.jpg', N'1', NULL, N'Closed Complete', CAST(N'2025-11-29T20:36:10.187' AS DateTime), N'115')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Incident] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_LoginHistory] ON 
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3490, 1, CAST(N'2025-10-28T17:46:33.920' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3491, 1, CAST(N'2025-10-28T17:46:34.953' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3492, 1, CAST(N'2025-10-28T17:47:18.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3493, 1, CAST(N'2025-10-28T17:47:18.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3494, 1, CAST(N'2025-10-28T17:47:18.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3495, 1, CAST(N'2025-10-28T17:47:36.603' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3496, 1, CAST(N'2025-10-28T17:48:03.317' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3497, 1, CAST(N'2025-10-28T17:48:08.110' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3498, 1, CAST(N'2025-10-28T17:48:08.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3499, 1, CAST(N'2025-10-28T17:48:09.343' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3500, 1, CAST(N'2025-10-28T17:48:09.547' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3501, 1, CAST(N'2025-10-28T17:48:09.700' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3502, 1, CAST(N'2025-10-28T17:48:09.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3503, 1, CAST(N'2025-10-28T17:48:10.023' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3504, 1, CAST(N'2025-10-28T17:48:10.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3505, 1, CAST(N'2025-10-28T17:48:10.370' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3506, 1, CAST(N'2025-10-28T17:48:10.600' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3507, 1, CAST(N'2025-10-28T17:48:10.777' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3508, 1, CAST(N'2025-10-28T17:48:10.963' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3509, 1, CAST(N'2025-10-28T17:48:11.153' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3510, 1, CAST(N'2025-10-28T17:48:11.353' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3511, 1, CAST(N'2025-10-28T17:48:11.980' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3512, 1, CAST(N'2025-10-28T17:48:12.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3513, 1, CAST(N'2025-10-28T17:48:12.343' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3514, 1, CAST(N'2025-10-28T17:48:12.503' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3515, 1, CAST(N'2025-10-28T17:48:12.660' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3516, 1, CAST(N'2025-10-28T17:48:12.850' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3517, 1, CAST(N'2025-10-28T17:48:13.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3518, 1, CAST(N'2025-10-28T17:48:13.373' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3519, 1, CAST(N'2025-10-28T17:48:13.550' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3520, 1, CAST(N'2025-10-28T17:48:13.710' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3521, 1, CAST(N'2025-10-28T17:48:13.890' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3522, 1, CAST(N'2025-10-28T17:48:15.213' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3523, 1, CAST(N'2025-10-28T17:48:17.120' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3524, 1, CAST(N'2025-10-28T17:50:35.093' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3525, 1, CAST(N'2025-10-28T17:50:36.633' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3526, 1, CAST(N'2025-10-28T17:51:54.390' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3527, 1, CAST(N'2025-10-28T17:52:39.140' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3528, 1, CAST(N'2025-10-28T17:55:52.050' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3529, 1, CAST(N'2025-10-28T17:55:53.570' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3530, 1, CAST(N'2025-10-28T17:56:30.390' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3531, 1, CAST(N'2025-10-28T17:57:26.780' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3532, 1, CAST(N'2025-10-28T18:07:57.590' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3533, 1, CAST(N'2025-10-28T18:07:58.513' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3534, 1, CAST(N'2025-10-28T18:08:26.953' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3535, 1, CAST(N'2025-10-28T18:08:26.953' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3536, 1, CAST(N'2025-10-28T18:08:26.953' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3537, 1, CAST(N'2025-10-28T18:08:32.813' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3538, 1, CAST(N'2025-10-28T18:08:34.050' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3539, 1, CAST(N'2025-10-28T18:08:34.053' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3540, 1, CAST(N'2025-10-28T18:08:34.057' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3541, 1, CAST(N'2025-10-28T18:08:36.460' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3542, 1, CAST(N'2025-10-28T18:08:49.900' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3543, 1, CAST(N'2025-10-28T18:09:27.020' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3544, 1, CAST(N'2025-10-28T18:09:28.690' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3545, 1, CAST(N'2025-10-28T18:09:28.690' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3546, 1, CAST(N'2025-10-28T18:09:28.690' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3547, 1, CAST(N'2025-10-28T18:09:40.460' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3548, 1, CAST(N'2025-10-28T18:09:44.173' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3549, 1, CAST(N'2025-10-28T18:09:45.313' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3550, 1, CAST(N'2025-10-28T18:09:45.317' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3551, 1, CAST(N'2025-10-28T18:09:45.320' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3552, 1, CAST(N'2025-10-28T18:09:47.853' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3553, 1, CAST(N'2025-10-28T18:09:59.850' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3554, 1, CAST(N'2025-10-28T18:10:22.393' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3555, 1, CAST(N'2025-10-28T18:10:23.507' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3556, 1, CAST(N'2025-10-28T18:10:23.507' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3557, 1, CAST(N'2025-10-28T18:10:23.507' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3558, 1, CAST(N'2025-10-28T18:10:31.053' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3559, 1, CAST(N'2025-10-28T18:10:31.870' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3560, 1, CAST(N'2025-10-28T18:10:31.870' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3561, 1, CAST(N'2025-10-28T18:10:34.237' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3562, 1, CAST(N'2025-10-28T18:10:36.173' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3563, 1, CAST(N'2025-10-28T18:10:39.947' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3564, 1, CAST(N'2025-10-28T18:10:43.657' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3565, 1, CAST(N'2025-10-28T18:10:43.663' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3566, 1, CAST(N'2025-10-28T18:10:43.670' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3567, 1, CAST(N'2025-10-28T18:10:45.630' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3568, 1, CAST(N'2025-10-28T18:10:45.637' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3569, 1, CAST(N'2025-10-28T18:11:05.267' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3570, 1, CAST(N'2025-10-28T18:11:06.260' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3571, 1, CAST(N'2025-10-28T18:11:06.263' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3572, 1, CAST(N'2025-10-28T18:11:06.263' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3573, 1, CAST(N'2025-10-28T18:11:07.483' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3574, 1, CAST(N'2025-10-28T18:11:07.483' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3575, 1, CAST(N'2025-10-28T18:11:08.623' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3576, 1, CAST(N'2025-10-28T18:11:09.463' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3577, 1, CAST(N'2025-10-28T18:11:09.467' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3578, 1, CAST(N'2025-10-28T18:11:09.470' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3579, 1, CAST(N'2025-10-28T18:11:11.520' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3580, 1, CAST(N'2025-10-28T18:11:12.477' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3581, 1, CAST(N'2025-10-28T18:11:13.230' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3582, 1, CAST(N'2025-10-28T18:11:14.043' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3583, 1, CAST(N'2025-10-28T18:11:14.947' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3584, 1, CAST(N'2025-10-28T18:11:15.827' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3585, 1, CAST(N'2025-10-28T18:11:21.267' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3586, 1, CAST(N'2025-10-28T18:11:21.270' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3587, 1, CAST(N'2025-10-28T18:11:23.247' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3588, 1, CAST(N'2025-10-28T18:11:25.690' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3589, 1, CAST(N'2025-10-28T18:11:25.697' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3590, 1, CAST(N'2025-10-28T18:11:38.170' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3591, 1, CAST(N'2025-10-28T18:11:39.117' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3592, 1, CAST(N'2025-10-28T18:11:39.120' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3593, 1, CAST(N'2025-10-28T18:11:39.120' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3594, 1, CAST(N'2025-10-28T18:11:40.477' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3595, 1, CAST(N'2025-10-28T18:11:41.580' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3596, 1, CAST(N'2025-10-28T18:11:43.720' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3597, 1, CAST(N'2025-10-28T18:11:43.723' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3598, 1, CAST(N'2025-10-28T18:11:47.547' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3599, 1, CAST(N'2025-10-28T18:11:47.550' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3600, 1, CAST(N'2025-10-28T18:11:57.163' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3601, 1, CAST(N'2025-10-28T18:12:20.860' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3602, 1, CAST(N'2025-10-28T18:12:23.177' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3603, 1, CAST(N'2025-10-28T18:12:23.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3604, 1, CAST(N'2025-10-28T18:12:23.193' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3605, 1, CAST(N'2025-10-28T18:12:24.810' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3606, 1, CAST(N'2025-10-28T18:12:24.817' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3607, 1, CAST(N'2025-10-28T18:12:30.587' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3608, 1, CAST(N'2025-10-28T18:12:31.340' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3609, 1, CAST(N'2025-10-28T18:12:31.350' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3610, 1, CAST(N'2025-10-28T18:12:32.420' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3611, 1, CAST(N'2025-10-28T18:12:49.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3612, 1, CAST(N'2025-10-28T18:12:49.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3613, 1, CAST(N'2025-10-28T18:14:51.610' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3614, 1, CAST(N'2025-10-28T18:14:55.260' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3615, 1, CAST(N'2025-10-28T18:14:55.277' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3616, 1, CAST(N'2025-10-28T18:14:55.277' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3617, 1, CAST(N'2025-10-28T18:15:28.930' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3618, 1, CAST(N'2025-10-28T18:15:29.940' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3619, 1, CAST(N'2025-10-28T18:15:33.730' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3620, 1, CAST(N'2025-10-28T18:15:33.753' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3621, 1, CAST(N'2025-10-28T18:15:33.763' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3622, 1, CAST(N'2025-10-28T18:15:36.143' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3623, 1, CAST(N'2025-10-28T18:15:36.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3624, 1, CAST(N'2025-10-28T18:15:38.463' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3625, 1, CAST(N'2025-10-28T18:20:44.100' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3626, 1, CAST(N'2025-10-28T18:20:45.600' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3627, 1, CAST(N'2025-10-28T18:20:54.570' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3628, 1, CAST(N'2025-10-28T18:20:54.600' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3629, 1, CAST(N'2025-10-28T18:21:41.713' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3630, 1, CAST(N'2025-10-28T18:22:02.757' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3631, 1, CAST(N'2025-10-28T18:22:04.000' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3632, 1, CAST(N'2025-10-28T18:22:04.013' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3633, 1, CAST(N'2025-10-28T18:22:04.057' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3634, 1, CAST(N'2025-10-28T18:22:12.880' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3635, 1, CAST(N'2025-10-28T18:22:12.883' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3636, 1, CAST(N'2025-10-28T18:22:17.060' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3637, 1, CAST(N'2025-10-28T18:22:18.073' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3638, 1, CAST(N'2025-10-28T18:22:18.077' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3639, 1, CAST(N'2025-10-28T18:22:18.080' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3640, 1, CAST(N'2025-10-28T18:22:23.543' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3641, 1, CAST(N'2025-10-28T18:22:35.200' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3642, 1, CAST(N'2025-10-28T18:22:35.200' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3643, 1, CAST(N'2025-10-28T18:23:56.390' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3644, 1, CAST(N'2025-10-28T18:23:57.133' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3645, 1, CAST(N'2025-10-28T18:23:58.033' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3646, 1, CAST(N'2025-10-28T18:24:02.223' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3647, 1, CAST(N'2025-10-28T18:24:02.230' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3648, 1, CAST(N'2025-10-28T18:24:05.750' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3649, 1, CAST(N'2025-10-28T18:24:05.753' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3650, 1, CAST(N'2025-10-28T18:24:13.933' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3651, 1, CAST(N'2025-10-28T18:24:52.957' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3652, 1, CAST(N'2025-10-28T18:24:53.987' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3653, 1, CAST(N'2025-10-28T18:24:53.993' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3654, 1, CAST(N'2025-10-28T18:24:54.000' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3655, 1, CAST(N'2025-10-28T18:24:55.353' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3656, 1, CAST(N'2025-10-28T18:24:55.363' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3657, 1, CAST(N'2025-10-28T18:25:01.460' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3658, 1, CAST(N'2025-10-28T18:25:02.303' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3659, 1, CAST(N'2025-10-28T18:25:03.390' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3660, 1, CAST(N'2025-10-28T18:25:10.497' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3661, 1, CAST(N'2025-10-28T18:25:10.507' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3662, 1, CAST(N'2025-10-28T18:25:12.563' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3663, 1, CAST(N'2025-10-28T18:25:16.197' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3664, 1, CAST(N'2025-10-28T18:25:16.200' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3665, 1, CAST(N'2025-10-28T18:25:16.230' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3666, 1, CAST(N'2025-10-28T18:25:22.860' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3667, 1, CAST(N'2025-10-28T18:25:38.883' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3668, 1, CAST(N'2025-10-28T18:25:38.890' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3669, 1, CAST(N'2025-10-28T18:25:38.897' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3670, 101, CAST(N'2025-10-28T18:27:25.260' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3671, 101, CAST(N'2025-10-28T18:27:26.717' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3672, 101, CAST(N'2025-10-28T18:27:26.850' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3673, 101, CAST(N'2025-10-28T18:27:33.970' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3674, 101, CAST(N'2025-10-28T18:27:33.973' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3675, 101, CAST(N'2025-10-28T18:27:33.973' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3676, 101, CAST(N'2025-10-28T18:27:39.590' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3677, 101, CAST(N'2025-10-28T18:27:41.357' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3678, 101, CAST(N'2025-10-28T18:27:43.910' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3679, 101, CAST(N'2025-10-28T18:27:45.507' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3680, 101, CAST(N'2025-10-28T18:27:48.623' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3681, 101, CAST(N'2025-10-28T18:27:48.630' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3682, 101, CAST(N'2025-10-28T18:27:48.637' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3683, 101, CAST(N'2025-10-28T18:27:57.077' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3684, 101, CAST(N'2025-10-28T18:27:59.060' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3685, 101, CAST(N'2025-10-28T18:28:02.923' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3686, 101, CAST(N'2025-10-28T18:28:05.500' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3687, 101, CAST(N'2025-10-28T18:31:48.800' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3688, 101, CAST(N'2025-10-28T18:31:50.283' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3689, 101, CAST(N'2025-10-28T18:49:20.570' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3690, 101, CAST(N'2025-10-28T18:49:22.067' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3691, 1, CAST(N'2025-10-28T19:39:25.463' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3692, 1, CAST(N'2025-10-28T19:39:26.540' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3693, 101, CAST(N'2025-10-28T20:40:56.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3694, 101, CAST(N'2025-10-28T20:40:56.713' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3695, 101, CAST(N'2025-10-28T20:41:16.280' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3696, 101, CAST(N'2025-10-28T20:41:16.280' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3697, 101, CAST(N'2025-10-28T20:41:16.280' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3698, 101, CAST(N'2025-10-28T20:41:19.897' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3699, 101, CAST(N'2025-10-28T20:41:28.363' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3700, 1, CAST(N'2025-10-28T20:41:40.817' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3701, 1, CAST(N'2025-10-28T20:41:42.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3702, 1, CAST(N'2025-10-28T20:41:57.800' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3703, 1, CAST(N'2025-10-28T20:41:57.803' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3704, 1, CAST(N'2025-10-28T20:41:57.803' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3705, 1, CAST(N'2025-10-28T20:42:00.700' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3706, 1, CAST(N'2025-10-28T20:52:46.827' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3707, 1, CAST(N'2025-10-28T20:52:48.280' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3708, 1, CAST(N'2025-10-28T20:55:45.410' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3709, 1, CAST(N'2025-10-28T20:55:46.313' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3710, 1, CAST(N'2025-10-28T20:58:59.187' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3711, 1, CAST(N'2025-10-28T20:59:00.633' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3712, 1, CAST(N'2025-10-28T21:06:26.347' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3713, 1, CAST(N'2025-10-28T21:06:27.833' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3714, 1, CAST(N'2025-10-28T21:06:38.743' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3715, 1, CAST(N'2025-10-28T21:06:38.743' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3716, 1, CAST(N'2025-10-28T21:06:38.760' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3717, 1, CAST(N'2025-10-28T21:06:42.260' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3718, 1, CAST(N'2025-10-28T21:06:47.453' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3719, 1, CAST(N'2025-10-28T21:06:53.200' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3720, 1, CAST(N'2025-10-28T21:06:58.400' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3721, 1, CAST(N'2025-10-28T21:07:00.420' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3722, 1, CAST(N'2025-10-28T21:07:00.423' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3723, 1, CAST(N'2025-10-28T21:07:00.427' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3724, 1, CAST(N'2025-10-28T21:07:02.853' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3725, 101, CAST(N'2025-10-28T21:07:21.373' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3726, 101, CAST(N'2025-10-28T21:07:22.897' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3727, 101, CAST(N'2025-10-28T21:07:38.427' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3728, 101, CAST(N'2025-10-28T21:07:38.427' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3729, 101, CAST(N'2025-10-28T21:07:38.427' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3730, 101, CAST(N'2025-10-28T21:07:45.807' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3731, 101, CAST(N'2025-10-28T21:07:47.573' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3732, 101, CAST(N'2025-10-28T21:07:47.573' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3733, 101, CAST(N'2025-10-28T21:07:47.577' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3734, 101, CAST(N'2025-10-28T21:07:49.977' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3735, NULL, CAST(N'2025-10-28T22:47:58.893' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3736, 1, CAST(N'2025-10-28T22:48:06.933' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3737, 1, CAST(N'2025-10-28T22:48:07.683' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3738, 1, CAST(N'2025-10-28T23:06:24.173' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3739, 1, CAST(N'2025-10-28T23:06:25.177' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3740, 1, CAST(N'2025-10-28T23:08:45.977' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3741, 1, CAST(N'2025-10-28T23:08:47.003' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3742, 1, CAST(N'2025-10-28T23:08:52.550' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3743, 1, CAST(N'2025-10-28T23:08:52.573' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3744, 1, CAST(N'2025-10-28T23:08:52.600' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3745, 1, CAST(N'2025-10-28T23:08:56.047' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3746, 1, CAST(N'2025-10-28T23:09:01.027' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3747, 1, CAST(N'2025-10-28T23:09:11.557' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3748, 1, CAST(N'2025-10-28T23:09:12.813' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3749, 1, CAST(N'2025-10-28T23:09:12.813' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3750, 1, CAST(N'2025-10-28T23:09:12.817' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3751, 1, CAST(N'2025-10-28T23:09:15.877' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3752, 1, CAST(N'2025-10-28T23:09:19.590' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3753, 1, CAST(N'2025-10-28T23:09:25.153' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3754, 1, CAST(N'2025-10-28T23:09:30.073' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3755, 1, CAST(N'2025-10-28T23:09:30.917' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3756, 1, CAST(N'2025-10-28T23:09:30.920' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3757, 1, CAST(N'2025-10-28T23:09:30.920' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3758, 1, CAST(N'2025-10-28T23:09:44.587' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3759, 1, CAST(N'2025-10-28T23:10:12.933' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3760, 1, CAST(N'2025-10-28T23:10:14.133' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3761, 1, CAST(N'2025-10-28T23:10:14.137' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3762, 1, CAST(N'2025-10-28T23:10:14.140' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3763, 1, CAST(N'2025-10-28T23:10:35.973' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3764, 1, CAST(N'2025-10-28T23:10:38.590' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3765, 1, CAST(N'2025-10-28T23:10:43.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3766, 1, CAST(N'2025-10-28T23:10:43.293' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3767, 1, CAST(N'2025-10-28T23:10:43.300' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3768, 1, CAST(N'2025-10-28T23:10:44.787' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3769, 1, CAST(N'2025-10-28T23:10:44.790' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3770, 1, CAST(N'2025-10-28T23:10:47.160' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3771, 1, CAST(N'2025-10-28T23:10:50.490' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3772, 1, CAST(N'2025-10-28T23:10:50.493' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3773, 1, CAST(N'2025-10-28T23:11:06.533' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3774, 1, CAST(N'2025-10-28T23:11:07.530' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3775, 1, CAST(N'2025-10-28T23:11:07.530' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3776, 1, CAST(N'2025-10-28T23:11:07.537' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3777, 1, CAST(N'2025-10-28T23:11:09.520' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3778, 1, CAST(N'2025-10-28T23:11:09.523' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3779, 1, CAST(N'2025-10-28T23:11:10.940' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3780, 1, CAST(N'2025-10-28T23:11:11.900' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3781, 1, CAST(N'2025-10-28T23:11:13.107' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3782, 1, CAST(N'2025-10-28T23:11:16.417' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3783, 1, CAST(N'2025-10-28T23:11:16.420' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3784, 1, CAST(N'2025-10-28T23:11:18.383' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3785, 1, CAST(N'2025-10-28T23:11:21.227' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3786, 1, CAST(N'2025-10-28T23:11:21.230' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3787, 1, CAST(N'2025-10-28T23:11:21.237' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3788, 1, CAST(N'2025-10-28T23:11:22.817' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3789, 1, CAST(N'2025-10-28T23:11:22.817' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3790, 1, CAST(N'2025-10-28T23:11:24.337' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3791, 1, CAST(N'2025-10-28T23:11:26.107' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3792, 1, CAST(N'2025-10-28T23:11:26.107' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3793, 1, CAST(N'2025-10-28T23:11:34.560' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3794, 1, CAST(N'2025-10-28T23:11:56.147' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3795, 1, CAST(N'2025-10-28T23:11:57.143' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3796, 1, CAST(N'2025-10-28T23:11:57.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3797, 1, CAST(N'2025-10-28T23:11:58.783' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3798, 1, CAST(N'2025-10-28T23:11:58.787' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3799, 1, CAST(N'2025-10-28T23:12:03.530' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3800, 1, CAST(N'2025-10-28T23:12:04.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3801, 1, CAST(N'2025-10-28T23:12:06.813' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3802, 1, CAST(N'2025-10-28T23:12:08.880' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3803, 1, CAST(N'2025-10-28T23:12:08.883' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3804, 1, CAST(N'2025-10-28T23:12:10.567' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3805, 1, CAST(N'2025-10-28T23:12:13.577' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3806, 1, CAST(N'2025-10-28T23:12:13.583' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3807, 1, CAST(N'2025-10-28T23:12:13.587' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3808, 1, CAST(N'2025-10-28T23:12:15.533' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3809, 1, CAST(N'2025-10-28T23:12:15.540' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3810, 1, CAST(N'2025-10-28T23:12:16.790' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3811, 1, CAST(N'2025-10-28T23:12:18.710' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3812, 1, CAST(N'2025-10-28T23:12:18.713' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3813, 1, CAST(N'2025-10-28T23:12:26.313' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3814, 1, CAST(N'2025-10-28T23:12:42.733' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3815, 1, CAST(N'2025-10-28T23:12:44.117' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3816, 1, CAST(N'2025-10-28T23:12:52.903' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3817, 1, CAST(N'2025-10-28T23:12:52.907' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3818, 1, CAST(N'2025-10-28T23:12:54.163' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3819, 1, CAST(N'2025-10-28T23:12:55.657' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3820, 1, CAST(N'2025-10-28T23:12:55.660' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3821, 1, CAST(N'2025-10-28T23:12:57.027' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3822, 1, CAST(N'2025-10-28T23:12:58.487' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3823, 1, CAST(N'2025-10-28T23:12:59.700' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3824, 1, CAST(N'2025-10-28T23:13:01.747' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3825, 1, CAST(N'2025-10-28T23:13:01.750' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3826, 1, CAST(N'2025-10-28T23:13:03.133' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3827, 1, CAST(N'2025-10-28T23:14:35.730' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3828, 1, CAST(N'2025-10-28T23:14:35.730' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3829, 1, CAST(N'2025-10-28T23:14:36.953' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3830, 1, CAST(N'2025-10-28T23:14:36.960' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3831, 1, CAST(N'2025-10-28T23:14:38.653' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3832, 1, CAST(N'2025-10-28T23:14:40.380' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3833, 1, CAST(N'2025-10-28T23:14:40.387' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3834, 1, CAST(N'2025-10-28T23:14:49.397' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3835, 1, CAST(N'2025-10-28T23:15:15.633' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3836, 1, CAST(N'2025-10-28T23:15:16.657' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3837, 1, CAST(N'2025-10-28T23:15:16.680' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3838, 1, CAST(N'2025-10-28T23:15:16.683' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3839, 1, CAST(N'2025-10-28T23:15:44.610' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3840, 1, CAST(N'2025-10-28T23:15:45.673' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3841, 1, CAST(N'2025-10-28T23:15:48.357' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3842, 1, CAST(N'2025-10-28T23:15:48.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3843, 1, CAST(N'2025-10-28T23:15:50.080' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3844, NULL, CAST(N'2025-10-28T23:16:11.777' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3845, 104, CAST(N'2025-10-28T23:16:53.110' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3846, 104, CAST(N'2025-10-28T23:16:54.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3847, 104, CAST(N'2025-10-28T23:16:54.620' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3848, 104, CAST(N'2025-10-28T23:17:39.963' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3849, 104, CAST(N'2025-10-28T23:17:39.963' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3850, 104, CAST(N'2025-10-28T23:17:39.963' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3851, 104, CAST(N'2025-10-28T23:17:45.000' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3852, 104, CAST(N'2025-10-28T23:17:47.713' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3853, 104, CAST(N'2025-10-28T23:17:47.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3854, 104, CAST(N'2025-10-28T23:17:47.740' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3855, 104, CAST(N'2025-10-28T23:17:51.130' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3856, 104, CAST(N'2025-10-28T23:17:51.133' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3857, 104, CAST(N'2025-10-28T23:17:51.167' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3858, 104, CAST(N'2025-10-28T23:17:53.367' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3859, 104, CAST(N'2025-10-28T23:17:53.370' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3860, 104, CAST(N'2025-10-28T23:17:53.370' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3861, 104, CAST(N'2025-10-28T23:17:55.630' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3862, 104, CAST(N'2025-10-28T23:17:55.633' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3863, 104, CAST(N'2025-10-28T23:17:56.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3864, 103, CAST(N'2025-10-28T23:18:32.993' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3865, 103, CAST(N'2025-10-28T23:18:34.443' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3866, 103, CAST(N'2025-10-28T23:18:34.497' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3867, 103, CAST(N'2025-10-28T23:18:51.947' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3868, 103, CAST(N'2025-10-28T23:18:51.950' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3869, 103, CAST(N'2025-10-28T23:18:51.953' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3870, 103, CAST(N'2025-10-28T23:18:55.347' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3871, 103, CAST(N'2025-10-28T23:18:55.350' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3872, 103, CAST(N'2025-10-28T23:18:55.350' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3873, 103, CAST(N'2025-10-28T23:18:59.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3874, 103, CAST(N'2025-10-28T23:18:59.873' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3875, 103, CAST(N'2025-10-28T23:19:06.520' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3876, 103, CAST(N'2025-10-28T23:19:06.523' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3877, 103, CAST(N'2025-10-28T23:19:06.527' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3878, 1, CAST(N'2025-10-28T23:22:00.447' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3879, 1, CAST(N'2025-10-28T23:22:01.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3880, 1, CAST(N'2025-10-28T23:29:43.370' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3881, 1, CAST(N'2025-10-28T23:29:44.420' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3882, 1, CAST(N'2025-10-28T23:36:40.783' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3883, 1, CAST(N'2025-10-28T23:36:41.607' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3884, 1, CAST(N'2025-10-28T23:47:00.330' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3885, 1, CAST(N'2025-10-28T23:47:01.137' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3886, 1, CAST(N'2025-10-28T23:47:20.307' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3887, 103, CAST(N'2025-10-28T23:50:33.297' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3888, 103, CAST(N'2025-10-28T23:50:34.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3889, 103, CAST(N'2025-10-28T23:51:04.667' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3890, 103, CAST(N'2025-10-28T23:51:04.677' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3891, 103, CAST(N'2025-10-28T23:51:04.703' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3892, 103, CAST(N'2025-10-28T23:51:11.310' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3893, 103, CAST(N'2025-10-28T23:51:11.313' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3894, 103, CAST(N'2025-10-28T23:51:11.317' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3895, 104, CAST(N'2025-10-28T23:51:46.133' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3896, 104, CAST(N'2025-10-28T23:51:46.980' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3897, 1, CAST(N'2025-10-28T23:52:11.340' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3898, 1, CAST(N'2025-10-28T23:52:12.080' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3899, 1, CAST(N'2025-10-28T23:52:17.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3900, 1, CAST(N'2025-10-28T23:54:47.933' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3901, 1, CAST(N'2025-10-28T23:55:24.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3902, 1, CAST(N'2025-10-29T00:04:35.837' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3903, 1, CAST(N'2025-10-29T00:04:36.970' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3904, 1, CAST(N'2025-10-29T00:05:09.027' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3905, 1, CAST(N'2025-10-29T00:06:17.610' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3906, 1, CAST(N'2025-10-29T00:07:10.340' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3907, 1, CAST(N'2025-10-29T00:07:10.373' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3908, 1, CAST(N'2025-10-29T00:07:10.377' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3909, 1, CAST(N'2025-10-29T00:07:15.050' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3910, 1, CAST(N'2025-10-29T00:07:15.060' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3911, 1, CAST(N'2025-10-29T00:07:15.063' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3912, NULL, CAST(N'2025-10-29T00:12:33.520' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3913, 103, CAST(N'2025-10-29T00:12:42.327' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3914, 103, CAST(N'2025-10-29T00:12:43.013' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3915, 1, CAST(N'2025-10-29T00:13:10.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3916, 1, CAST(N'2025-10-29T00:13:11.510' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3917, 103, CAST(N'2025-10-29T00:14:11.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3918, 103, CAST(N'2025-10-29T00:14:12.073' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3919, 103, CAST(N'2025-10-29T00:14:12.123' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3920, 103, CAST(N'2025-10-29T00:14:43.440' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3921, 103, CAST(N'2025-10-29T00:14:43.440' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3922, 103, CAST(N'2025-10-29T00:14:43.440' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3923, 104, CAST(N'2025-10-29T00:14:59.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3924, 104, CAST(N'2025-10-29T00:15:00.050' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3925, 104, CAST(N'2025-10-29T00:15:00.093' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3926, 1, CAST(N'2025-10-29T11:48:31.403' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3927, 1, CAST(N'2025-10-29T11:48:32.203' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3928, 1, CAST(N'2025-10-29T11:48:51.950' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3929, 1, CAST(N'2025-10-29T11:48:51.950' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3930, 1, CAST(N'2025-10-29T11:48:51.950' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3931, 1, CAST(N'2025-10-29T11:48:57.393' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3932, 1, CAST(N'2025-10-29T11:48:57.393' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3933, 1, CAST(N'2025-10-29T11:48:57.397' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3934, 1, CAST(N'2025-10-29T11:49:00.790' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3935, 1, CAST(N'2025-10-29T11:49:00.790' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3936, 1, CAST(N'2025-10-29T11:49:00.790' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3937, 1, CAST(N'2025-10-29T11:49:16.153' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3938, 1, CAST(N'2025-10-29T11:49:16.153' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3939, 1, CAST(N'2025-10-29T11:49:16.153' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3940, 1, CAST(N'2025-10-29T11:50:23.390' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3941, 1, CAST(N'2025-10-29T11:50:59.933' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3942, 1, CAST(N'2025-10-29T11:51:03.123' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3943, 1, CAST(N'2025-10-29T11:51:03.123' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3944, 1, CAST(N'2025-10-29T11:51:03.123' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3945, 1, CAST(N'2025-10-29T11:51:20.370' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3946, 1, CAST(N'2025-10-29T11:51:21.967' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3947, 1, CAST(N'2025-10-29T11:51:21.967' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3948, 1, CAST(N'2025-10-29T11:51:21.967' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3949, 1, CAST(N'2025-10-29T11:51:45.240' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3950, 1, CAST(N'2025-10-29T11:52:10.033' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3951, 1, CAST(N'2025-10-29T11:52:10.033' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3952, 1, CAST(N'2025-10-29T11:52:32.140' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3953, 1, CAST(N'2025-10-29T11:52:33.507' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3954, 1, CAST(N'2025-10-29T11:52:33.507' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3955, 1, CAST(N'2025-10-29T11:52:33.507' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3956, 1, CAST(N'2025-10-29T11:52:42.203' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3957, 1, CAST(N'2025-10-29T11:52:42.203' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3958, 1, CAST(N'2025-10-29T11:52:42.203' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3959, 1, CAST(N'2025-10-29T11:52:46.147' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3960, 1, CAST(N'2025-10-29T11:52:46.147' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3961, 1, CAST(N'2025-10-29T11:52:55.263' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3962, 1, CAST(N'2025-10-29T11:53:19.727' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3963, 1, CAST(N'2025-10-29T11:53:24.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3964, 1, CAST(N'2025-10-29T11:53:24.213' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3965, 1, CAST(N'2025-10-29T11:53:24.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3966, 1, CAST(N'2025-10-29T11:53:33.497' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3967, 1, CAST(N'2025-10-29T11:53:33.497' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3968, NULL, CAST(N'2025-10-29T11:53:37.900' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3969, 1, CAST(N'2025-10-29T11:53:46.673' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3970, 1, CAST(N'2025-10-29T11:53:46.677' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3971, 1, CAST(N'2025-10-29T11:53:46.677' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3972, 1, CAST(N'2025-10-29T11:54:04.107' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3973, 1, CAST(N'2025-10-29T11:54:04.107' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3974, 1, CAST(N'2025-10-29T11:54:12.620' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3975, 1, CAST(N'2025-10-29T11:54:12.620' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3976, 1, CAST(N'2025-10-29T11:54:24.673' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3977, 1, CAST(N'2025-10-29T11:54:54.767' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3978, 1, CAST(N'2025-10-29T11:54:56.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3979, 1, CAST(N'2025-10-29T11:54:56.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3980, 1, CAST(N'2025-10-29T11:54:56.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3981, 1, CAST(N'2025-10-29T11:55:11.757' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3982, 1, CAST(N'2025-10-29T12:07:52.880' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3983, 1, CAST(N'2025-10-29T12:07:54.000' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3984, 1, CAST(N'2025-10-29T12:08:21.097' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3985, 1, CAST(N'2025-10-29T12:08:21.137' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3986, 1, CAST(N'2025-10-29T12:08:21.147' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3987, 1, CAST(N'2025-10-29T12:08:26.410' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3988, 1, CAST(N'2025-10-29T12:08:26.413' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3989, 1, CAST(N'2025-10-29T12:08:26.433' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3990, 1, CAST(N'2025-10-29T12:08:29.767' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3991, 1, CAST(N'2025-10-29T12:08:36.397' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3992, 1, CAST(N'2025-10-29T12:08:36.397' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3993, 1, CAST(N'2025-10-29T12:08:36.400' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3994, 1, CAST(N'2025-10-29T12:08:40.240' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3995, 1, CAST(N'2025-10-29T12:08:41.343' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3996, 1, CAST(N'2025-10-29T12:08:41.347' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3997, 1, CAST(N'2025-10-29T12:08:41.350' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3998, 1, CAST(N'2025-10-29T12:08:43.973' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (3999, 1, CAST(N'2025-10-29T12:08:48.060' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4000, 1, CAST(N'2025-10-29T12:08:48.067' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4001, 1, CAST(N'2025-10-29T12:08:48.070' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4002, 1, CAST(N'2025-10-29T12:08:49.503' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4003, 1, CAST(N'2025-10-29T12:08:49.510' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4004, 1, CAST(N'2025-10-29T12:08:51.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4005, 1, CAST(N'2025-10-29T12:08:56.167' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4006, 1, CAST(N'2025-10-29T12:08:56.170' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4007, 1, CAST(N'2025-10-29T12:09:10.027' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4008, 1, CAST(N'2025-10-29T12:09:25.043' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4009, 1, CAST(N'2025-10-29T12:09:26.130' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4010, 1, CAST(N'2025-10-29T12:09:26.137' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4011, 1, CAST(N'2025-10-29T12:09:26.140' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4012, 1, CAST(N'2025-10-29T12:09:34.260' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4013, 1, CAST(N'2025-10-29T12:10:12.347' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4014, 1, CAST(N'2025-10-29T12:10:13.163' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4015, 1, CAST(N'2025-10-29T12:10:25.760' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4016, 1, CAST(N'2025-10-29T12:10:46.010' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4017, 1, CAST(N'2025-10-29T12:10:47.107' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4018, 1, CAST(N'2025-10-29T12:10:47.133' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4019, 1, CAST(N'2025-10-29T12:10:47.143' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4020, 1, CAST(N'2025-10-29T12:11:00.187' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4021, 1, CAST(N'2025-10-29T12:11:00.187' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4022, 1, CAST(N'2025-10-29T12:11:00.187' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4023, 1, CAST(N'2025-10-29T12:48:16.040' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4024, 1, CAST(N'2025-10-29T12:48:16.543' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4025, 1, CAST(N'2025-10-29T12:48:35.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4026, 1, CAST(N'2025-10-29T12:49:30.800' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4027, 1, CAST(N'2025-10-29T12:49:32.007' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4028, 1, CAST(N'2025-10-29T12:49:32.010' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4029, 1, CAST(N'2025-10-29T12:49:32.010' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4030, 1, CAST(N'2025-10-31T17:17:05.617' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4031, 1, CAST(N'2025-10-31T17:17:06.020' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4032, 1, CAST(N'2025-10-31T17:28:59.240' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4033, 1, CAST(N'2025-10-31T17:28:59.540' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4034, 1, CAST(N'2025-10-31T17:55:44.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4035, 1, CAST(N'2025-10-31T17:55:44.797' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4036, 1, CAST(N'2025-10-31T18:03:26.080' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4037, 1, CAST(N'2025-10-31T18:03:27.000' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4038, 1, CAST(N'2025-10-31T18:50:39.380' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4039, 1, CAST(N'2025-10-31T18:50:40.050' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4040, 1, CAST(N'2025-11-03T22:02:25.253' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4041, 1, CAST(N'2025-11-03T22:02:26.037' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4042, 1, CAST(N'2025-11-03T22:03:38.277' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4043, 1, CAST(N'2025-11-03T22:03:38.280' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4044, 1, CAST(N'2025-11-03T22:03:38.283' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4045, 1, CAST(N'2025-11-03T22:04:02.907' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4046, 1, CAST(N'2025-11-03T22:04:02.907' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4047, 1, CAST(N'2025-11-03T22:04:16.743' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4048, 1, CAST(N'2025-11-03T22:04:16.750' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4049, 1, CAST(N'2025-11-03T22:04:16.750' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4050, 1, CAST(N'2025-11-03T22:04:34.583' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4051, 1, CAST(N'2025-11-03T22:04:34.583' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4052, 1, CAST(N'2025-11-03T22:04:39.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4053, 1, CAST(N'2025-11-03T22:04:39.210' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4054, 1, CAST(N'2025-11-03T22:04:39.213' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4055, 1, CAST(N'2025-11-03T22:08:52.837' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4056, 1, CAST(N'2025-11-03T22:08:52.837' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4057, 1, CAST(N'2025-11-03T22:08:52.837' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4058, 1, CAST(N'2025-11-03T22:09:43.570' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4059, 1, CAST(N'2025-11-03T22:09:43.570' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4060, 1, CAST(N'2025-11-03T22:09:43.570' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4061, 1, CAST(N'2025-11-03T22:09:48.667' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4062, 1, CAST(N'2025-11-03T22:09:48.670' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4063, 1, CAST(N'2025-11-03T22:09:48.673' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4064, 1, CAST(N'2025-11-03T22:09:57.233' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4065, 1, CAST(N'2025-11-03T22:09:57.240' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4066, 1, CAST(N'2025-11-03T22:19:01.243' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4067, 1, CAST(N'2025-11-03T22:19:01.917' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4068, 1, CAST(N'2025-11-03T22:19:32.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4069, 1, CAST(N'2025-11-03T22:19:32.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4070, 1, CAST(N'2025-11-03T22:19:35.857' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4071, 1, CAST(N'2025-11-03T22:19:44.170' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4072, 1, CAST(N'2025-11-03T22:19:44.170' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4073, 1, CAST(N'2025-11-03T22:29:11.580' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4074, 1, CAST(N'2025-11-03T22:29:13.110' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4075, 1, CAST(N'2025-11-03T22:29:54.270' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4076, 1, CAST(N'2025-11-03T22:29:54.270' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4077, 1, CAST(N'2025-11-03T22:29:54.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4078, 1, CAST(N'2025-11-03T22:30:01.103' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4079, 1, CAST(N'2025-11-03T22:30:01.103' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4080, 1, CAST(N'2025-11-03T22:30:23.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4081, 1, CAST(N'2025-11-03T22:30:23.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4082, 1, CAST(N'2025-11-03T22:30:23.160' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4083, 1, CAST(N'2025-11-03T22:30:35.277' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4084, 1, CAST(N'2025-11-03T22:30:35.277' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4085, 1, CAST(N'2025-11-03T22:30:36.857' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4086, 1, CAST(N'2025-11-03T22:30:39.027' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4087, 1, CAST(N'2025-11-03T22:30:39.043' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4088, 1, CAST(N'2025-11-03T22:30:39.043' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4089, 1, CAST(N'2025-11-03T22:30:40.813' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4090, 1, CAST(N'2025-11-03T22:30:41.747' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4091, 1, CAST(N'2025-11-03T22:32:54.063' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4092, 1, CAST(N'2025-11-03T22:32:54.063' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4093, 1, CAST(N'2025-11-03T22:34:06.687' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4094, 1, CAST(N'2025-11-03T22:34:06.687' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4095, 1, CAST(N'2025-11-03T22:34:06.690' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4096, 1, CAST(N'2025-11-03T22:34:09.543' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4097, 1, CAST(N'2025-11-03T22:34:09.550' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4098, 1, CAST(N'2025-11-03T22:34:56.430' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4099, 1, CAST(N'2025-11-03T22:35:02.307' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4100, 1, CAST(N'2025-11-03T22:35:02.307' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4101, 1, CAST(N'2025-11-03T22:35:59.647' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4102, 1, CAST(N'2025-11-03T22:35:59.647' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4103, 1, CAST(N'2025-11-03T22:35:59.647' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4104, 1, CAST(N'2025-11-03T22:36:06.573' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4105, 1, CAST(N'2025-11-03T22:36:25.197' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4106, 1, CAST(N'2025-11-03T22:36:30.037' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4107, 1, CAST(N'2025-11-03T22:36:30.040' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4108, 1, CAST(N'2025-11-03T22:37:06.213' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4109, 1, CAST(N'2025-11-03T22:37:06.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4110, 1, CAST(N'2025-11-03T22:37:06.220' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4111, 1, CAST(N'2025-11-03T22:37:09.600' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4112, 1, CAST(N'2025-11-03T22:37:09.607' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4113, 1, CAST(N'2025-11-03T22:37:11.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4114, 1, CAST(N'2025-11-03T22:37:13.523' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4115, 1, CAST(N'2025-11-03T22:37:13.523' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4116, 1, CAST(N'2025-11-03T22:37:26.373' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4117, 1, CAST(N'2025-11-03T22:38:08.547' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4118, 1, CAST(N'2025-11-03T22:38:08.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4119, 1, CAST(N'2025-11-03T22:38:08.557' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4120, 103, CAST(N'2025-11-03T22:39:22.203' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4121, 103, CAST(N'2025-11-03T22:39:23.690' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4122, 103, CAST(N'2025-11-03T22:44:43.883' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4123, 103, CAST(N'2025-11-03T22:44:45.793' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4124, 103, CAST(N'2025-11-03T22:44:45.873' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4125, 104, CAST(N'2025-11-03T22:45:48.423' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4126, 104, CAST(N'2025-11-03T22:45:50.300' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4127, 104, CAST(N'2025-11-03T22:45:50.657' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4128, 104, CAST(N'2025-11-03T22:45:59.523' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4129, 104, CAST(N'2025-11-03T22:45:59.547' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4130, 104, CAST(N'2025-11-03T22:45:59.550' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4131, 104, CAST(N'2025-11-03T22:46:08.627' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4132, 104, CAST(N'2025-11-03T22:46:08.627' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4133, 104, CAST(N'2025-11-03T22:46:08.627' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4134, 1, CAST(N'2025-11-04T11:10:10.317' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4135, 1, CAST(N'2025-11-04T11:10:11.200' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4136, 1, CAST(N'2025-11-04T11:11:44.267' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4137, 1, CAST(N'2025-11-04T11:11:48.817' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4138, 1, CAST(N'2025-11-04T11:11:53.320' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4139, 1, CAST(N'2025-11-04T11:11:53.370' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4140, 1, CAST(N'2025-11-04T11:11:53.377' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4141, 1, CAST(N'2025-11-04T12:09:03.820' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4142, 1, CAST(N'2025-11-04T12:09:04.337' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4143, 1, CAST(N'2025-11-04T16:29:46.623' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4144, 1, CAST(N'2025-11-04T16:29:47.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4145, 1, CAST(N'2025-11-04T16:50:35.730' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4146, 1, CAST(N'2025-11-04T16:50:36.337' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4147, 1, CAST(N'2025-11-04T16:50:41.560' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4148, 1, CAST(N'2025-11-04T16:50:41.560' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4149, 1, CAST(N'2025-11-04T16:50:41.563' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4150, 1, CAST(N'2025-11-04T16:50:44.467' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4151, 1, CAST(N'2025-11-04T16:50:44.470' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4152, 1, CAST(N'2025-11-04T16:50:57.797' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4153, 1, CAST(N'2025-11-04T16:51:01.090' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4154, 1, CAST(N'2025-11-04T16:51:01.090' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4155, 1, CAST(N'2025-11-04T17:00:41.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4156, 1, CAST(N'2025-11-04T17:00:42.433' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4157, 1, CAST(N'2025-11-04T17:01:23.377' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4158, 1, CAST(N'2025-11-04T17:01:39.140' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4159, 1, CAST(N'2025-11-04T17:01:39.140' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4160, 1, CAST(N'2025-11-04T17:01:46.437' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4161, 1, CAST(N'2025-11-04T17:01:50.053' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4162, 1, CAST(N'2025-11-04T17:01:50.053' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4163, 1, CAST(N'2025-11-04T17:01:56.243' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4164, 1, CAST(N'2025-11-04T17:02:02.870' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4165, 1, CAST(N'2025-11-04T17:02:02.873' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4166, 1, CAST(N'2025-11-04T17:02:07.900' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4167, 1, CAST(N'2025-11-04T17:02:10.810' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4168, 1, CAST(N'2025-11-04T17:02:10.813' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4169, 1, CAST(N'2025-11-04T17:02:18.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4170, 1, CAST(N'2025-11-04T17:03:40.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4171, 1, CAST(N'2025-11-04T17:04:01.933' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4172, 1, CAST(N'2025-11-04T17:04:22.177' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4173, 1, CAST(N'2025-11-04T17:04:22.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4174, 1, CAST(N'2025-11-04T17:04:22.243' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4175, 1, CAST(N'2025-11-04T17:04:46.453' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4176, 1, CAST(N'2025-11-04T17:10:40.040' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4177, 1, CAST(N'2025-11-04T17:10:41.330' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4178, 1, CAST(N'2025-11-04T17:10:47.057' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4179, 1, CAST(N'2025-11-04T17:12:08.767' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4180, 1, CAST(N'2025-11-04T17:13:46.963' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4181, 1, CAST(N'2025-11-04T17:13:48.370' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4182, 1, CAST(N'2025-11-04T17:13:54.220' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4183, 1, CAST(N'2025-11-04T17:19:26.973' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4184, 1, CAST(N'2025-11-04T17:19:28.237' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4185, 1, CAST(N'2025-11-04T17:19:38.510' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4186, 1, CAST(N'2025-11-04T17:21:59.720' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4187, 1, CAST(N'2025-11-04T17:22:01.250' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4188, 1, CAST(N'2025-11-04T17:22:35.167' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4189, 1, CAST(N'2025-11-06T10:49:53.950' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4190, 1, CAST(N'2025-11-06T12:19:09.977' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4191, 1, CAST(N'2025-11-06T12:19:10.613' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4192, 1, CAST(N'2025-11-06T12:19:41.153' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4193, 1, CAST(N'2025-11-06T12:20:29.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4194, 1, CAST(N'2025-11-06T12:26:56.080' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4195, 1, CAST(N'2025-11-06T12:26:57.297' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4196, 1, CAST(N'2025-11-06T12:27:16.550' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4197, 1, CAST(N'2025-11-06T12:27:48.487' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4198, 1, CAST(N'2025-11-06T12:28:18.850' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4199, 1, CAST(N'2025-11-06T12:28:18.860' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4200, 1, CAST(N'2025-11-06T12:28:18.900' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4201, 1, CAST(N'2025-11-06T12:28:46.833' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4202, 1, CAST(N'2025-11-06T12:31:16.453' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4203, 1, CAST(N'2025-11-06T12:31:17.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4204, 1, CAST(N'2025-11-06T12:34:51.373' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4205, 1, CAST(N'2025-11-06T12:34:52.567' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4206, 1, CAST(N'2025-11-06T12:35:17.627' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4207, 1, CAST(N'2025-11-06T12:35:17.653' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4208, 1, CAST(N'2025-11-06T12:35:31.147' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4209, 103, CAST(N'2025-11-06T12:51:30.097' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4210, 103, CAST(N'2025-11-06T12:51:31.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4211, 103, CAST(N'2025-11-06T12:51:41.040' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4212, 103, CAST(N'2025-11-06T12:51:41.060' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4213, 103, CAST(N'2025-11-06T12:51:41.063' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4214, 103, CAST(N'2025-11-06T12:51:56.503' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4215, 103, CAST(N'2025-11-06T12:51:59.340' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4216, 103, CAST(N'2025-11-06T12:51:59.343' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4217, 103, CAST(N'2025-11-06T12:51:59.347' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4218, 103, CAST(N'2025-11-06T12:52:27.330' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4219, 103, CAST(N'2025-11-06T12:52:27.337' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4220, 103, CAST(N'2025-11-06T12:52:27.353' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4221, 103, CAST(N'2025-11-06T12:52:38.130' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4222, 103, CAST(N'2025-11-06T12:52:38.140' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4223, 103, CAST(N'2025-11-06T12:52:41.673' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4224, 103, CAST(N'2025-11-06T12:52:41.680' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4225, 103, CAST(N'2025-11-06T12:52:41.687' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4226, 103, CAST(N'2025-11-06T12:58:45.780' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4227, 103, CAST(N'2025-11-06T12:58:47.123' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4228, 103, CAST(N'2025-11-06T12:58:53.333' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4229, 103, CAST(N'2025-11-06T12:58:53.367' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4230, 103, CAST(N'2025-11-06T12:58:53.380' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4231, 103, CAST(N'2025-11-06T12:59:02.340' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4232, 103, CAST(N'2025-11-06T12:59:04.557' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4233, 103, CAST(N'2025-11-06T12:59:04.560' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4234, 103, CAST(N'2025-11-06T12:59:04.563' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4235, 103, CAST(N'2025-11-06T12:59:14.327' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4236, 103, CAST(N'2025-11-06T12:59:20.067' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4237, 103, CAST(N'2025-11-06T12:59:20.100' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4238, 103, CAST(N'2025-11-06T12:59:20.103' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4239, 103, CAST(N'2025-11-06T12:59:24.210' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4240, 103, CAST(N'2025-11-06T12:59:26.213' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4241, 103, CAST(N'2025-11-06T12:59:26.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4242, 103, CAST(N'2025-11-06T12:59:26.220' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4243, 103, CAST(N'2025-11-06T13:00:04.383' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4244, 103, CAST(N'2025-11-06T13:00:08.350' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4245, 103, CAST(N'2025-11-06T13:00:11.870' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4246, 103, CAST(N'2025-11-06T13:00:11.873' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4247, 103, CAST(N'2025-11-06T13:00:11.877' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4248, 103, CAST(N'2025-11-06T13:00:15.363' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4249, 103, CAST(N'2025-11-06T13:00:17.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4250, 103, CAST(N'2025-11-06T13:00:17.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4251, 103, CAST(N'2025-11-06T13:00:17.293' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4252, 103, CAST(N'2025-11-06T13:00:38.430' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4253, 103, CAST(N'2025-11-06T13:00:42.397' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4254, 103, CAST(N'2025-11-06T13:00:42.397' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4255, 103, CAST(N'2025-11-06T13:00:42.407' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4256, 103, CAST(N'2025-11-06T13:00:43.767' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4257, 103, CAST(N'2025-11-06T13:00:45.253' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4258, 103, CAST(N'2025-11-06T13:00:46.300' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4259, 103, CAST(N'2025-11-06T13:00:55.240' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4260, 103, CAST(N'2025-11-06T13:00:56.830' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4261, 103, CAST(N'2025-11-06T13:00:57.997' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4262, 103, CAST(N'2025-11-06T13:00:59.663' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4263, 103, CAST(N'2025-11-06T13:01:00.500' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4264, 103, CAST(N'2025-11-06T13:01:00.500' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4265, 103, CAST(N'2025-11-06T13:01:02.640' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4266, 103, CAST(N'2025-11-06T13:01:04.413' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4267, 103, CAST(N'2025-11-06T13:01:09.230' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4268, 1, CAST(N'2025-11-06T13:01:37.623' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4269, 1, CAST(N'2025-11-06T13:01:38.730' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4270, 1, CAST(N'2025-11-06T13:01:43.180' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4271, 1, CAST(N'2025-11-06T13:01:43.180' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4272, 1, CAST(N'2025-11-06T13:01:43.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4273, 1, CAST(N'2025-11-06T13:02:26.930' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4274, 104, CAST(N'2025-11-06T13:07:18.340' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4275, 104, CAST(N'2025-11-06T13:07:19.230' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4276, 103, CAST(N'2025-11-06T13:09:20.723' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4277, 103, CAST(N'2025-11-06T13:09:21.597' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4278, 103, CAST(N'2025-11-06T13:09:26.837' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4279, 103, CAST(N'2025-11-06T13:09:26.853' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4280, 103, CAST(N'2025-11-06T13:09:26.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4281, 103, CAST(N'2025-11-06T13:09:28.353' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4282, 103, CAST(N'2025-11-06T13:09:29.657' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4283, NULL, CAST(N'2025-11-06T13:09:30.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4284, 103, CAST(N'2025-11-06T13:09:30.870' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4285, 103, CAST(N'2025-11-06T13:09:32.497' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4286, 103, CAST(N'2025-11-06T13:09:38.977' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4287, 103, CAST(N'2025-11-06T13:09:39.977' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4288, 103, CAST(N'2025-11-06T13:09:39.980' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4289, 103, CAST(N'2025-11-06T13:09:42.370' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4290, 103, CAST(N'2025-11-06T13:09:59.083' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4291, 103, CAST(N'2025-11-06T13:10:04.507' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4292, 103, CAST(N'2025-11-06T13:10:06.203' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4293, 103, CAST(N'2025-11-06T13:10:08.170' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4294, 103, CAST(N'2025-11-06T13:10:09.167' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4295, 103, CAST(N'2025-11-06T13:10:09.170' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4296, 103, CAST(N'2025-11-06T13:10:09.177' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4297, 103, CAST(N'2025-11-06T13:10:11.073' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4298, 103, CAST(N'2025-11-06T13:10:25.350' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4299, 103, CAST(N'2025-11-06T13:10:27.563' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4300, 103, CAST(N'2025-11-06T13:10:28.787' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4301, 103, CAST(N'2025-11-06T13:10:35.007' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4302, 103, CAST(N'2025-11-06T13:10:35.010' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4303, 103, CAST(N'2025-11-06T13:10:35.010' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4304, 103, CAST(N'2025-11-06T13:10:39.043' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4305, 103, CAST(N'2025-11-06T13:10:41.180' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4306, 103, CAST(N'2025-11-06T13:10:41.180' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4307, 103, CAST(N'2025-11-06T13:10:41.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4308, 103, CAST(N'2025-11-06T13:11:18.237' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4309, 103, CAST(N'2025-11-06T13:11:20.733' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4310, 103, CAST(N'2025-11-06T13:11:20.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4311, 103, CAST(N'2025-11-06T13:11:20.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4312, 103, CAST(N'2025-11-06T13:11:59.027' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4313, 103, CAST(N'2025-11-06T13:12:04.243' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4314, 103, CAST(N'2025-11-06T13:12:07.940' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4315, 103, CAST(N'2025-11-06T13:12:07.943' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4316, 103, CAST(N'2025-11-06T13:12:07.947' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4317, 103, CAST(N'2025-11-06T13:12:15.950' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4318, NULL, CAST(N'2025-11-06T13:12:17.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4319, 103, CAST(N'2025-11-06T13:12:17.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4320, 103, CAST(N'2025-11-06T13:12:51.177' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4321, 103, CAST(N'2025-11-06T13:12:58.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4322, 103, CAST(N'2025-11-06T13:12:58.210' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4323, 103, CAST(N'2025-11-06T13:12:58.210' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4324, 103, CAST(N'2025-11-06T13:13:00.053' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4325, 103, CAST(N'2025-11-06T13:13:02.000' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4326, 103, CAST(N'2025-11-06T13:13:17.827' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4327, 103, CAST(N'2025-11-06T13:13:17.827' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4328, 103, CAST(N'2025-11-06T13:13:17.830' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4329, 103, CAST(N'2025-11-06T13:13:21.623' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4330, 103, CAST(N'2025-11-06T13:13:25.463' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4331, 1, CAST(N'2025-11-06T13:13:35.943' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4332, 1, CAST(N'2025-11-06T13:13:36.727' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4333, 1, CAST(N'2025-11-06T13:13:40.300' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4334, 1, CAST(N'2025-11-06T13:13:40.300' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4335, 1, CAST(N'2025-11-06T13:13:40.303' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4336, 1, CAST(N'2025-11-06T13:15:26.327' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4337, 1, CAST(N'2025-11-06T13:15:27.587' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4338, 1, CAST(N'2025-11-06T13:15:37.997' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4339, 1, CAST(N'2025-11-06T13:15:38.017' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4340, 1, CAST(N'2025-11-06T13:15:38.050' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4341, 1, CAST(N'2025-11-06T13:16:06.053' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4342, 1, CAST(N'2025-11-06T13:16:10.100' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4343, 1, CAST(N'2025-11-06T13:16:10.100' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4344, 1, CAST(N'2025-11-06T13:16:10.103' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4345, 1, CAST(N'2025-11-06T13:17:21.740' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4346, 103, CAST(N'2025-11-06T13:18:58.983' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4347, 103, CAST(N'2025-11-06T13:19:00.210' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4348, 103, CAST(N'2025-11-06T13:19:05.697' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4349, 103, CAST(N'2025-11-06T13:19:05.730' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4350, 103, CAST(N'2025-11-06T13:19:05.757' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4351, 103, CAST(N'2025-11-06T13:19:11.427' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4352, 103, CAST(N'2025-11-06T13:19:13.690' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4353, 103, CAST(N'2025-11-06T13:19:13.693' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4354, 103, CAST(N'2025-11-06T13:19:13.697' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4355, 103, CAST(N'2025-11-06T13:19:23.793' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4356, 1, CAST(N'2025-11-06T13:19:41.433' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4357, 1, CAST(N'2025-11-06T13:19:42.590' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4358, 1, CAST(N'2025-11-06T13:19:48.100' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4359, 1, CAST(N'2025-11-06T13:19:48.107' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4360, 1, CAST(N'2025-11-06T13:19:59.583' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4361, 1, CAST(N'2025-11-06T13:19:59.583' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4362, 1, CAST(N'2025-11-06T13:19:59.583' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4363, 1, CAST(N'2025-11-06T13:20:08.813' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4364, 1, CAST(N'2025-11-06T13:20:22.543' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4365, 1, CAST(N'2025-11-06T13:20:32.723' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4366, 1, CAST(N'2025-11-06T13:20:39.420' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4367, 1, CAST(N'2025-11-06T13:20:45.663' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4368, 1, CAST(N'2025-11-06T13:26:00.487' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4369, 1, CAST(N'2025-11-06T13:26:01.670' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4370, 1, CAST(N'2025-11-06T13:26:08.987' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4371, 1, CAST(N'2025-11-06T13:26:09.013' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4372, 1, CAST(N'2025-11-06T13:26:09.027' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4373, 1, CAST(N'2025-11-06T13:26:16.020' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4374, 1, CAST(N'2025-11-06T13:30:28.697' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4375, 1, CAST(N'2025-11-06T13:30:29.963' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4376, 1, CAST(N'2025-11-06T13:30:36.233' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4377, 1, CAST(N'2025-11-06T13:30:36.257' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4378, 1, CAST(N'2025-11-06T13:30:36.263' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4379, 1, CAST(N'2025-11-06T13:30:41.380' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4380, 1, CAST(N'2025-11-06T13:31:28.963' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4381, 1, CAST(N'2025-11-06T13:31:31.130' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4382, 1, CAST(N'2025-11-06T13:31:31.137' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4383, 1, CAST(N'2025-11-06T13:31:31.137' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4384, 1, CAST(N'2025-11-06T13:31:41.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4385, 1, CAST(N'2025-11-06T13:42:48.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4386, 1, CAST(N'2025-11-06T13:42:49.327' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4387, 1, CAST(N'2025-11-06T13:42:54.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4388, 1, CAST(N'2025-11-06T13:42:54.390' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4389, 1, CAST(N'2025-11-06T13:42:54.417' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4390, 1, CAST(N'2025-11-06T13:43:01.770' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4391, 1, CAST(N'2025-11-06T13:43:40.690' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4392, 1, CAST(N'2025-11-06T13:43:45.490' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4393, 1, CAST(N'2025-11-06T13:43:45.490' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4394, 1, CAST(N'2025-11-06T13:43:45.500' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4395, 1, CAST(N'2025-11-06T13:43:54.850' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4396, 1, CAST(N'2025-11-06T13:44:11.540' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4397, 1, CAST(N'2025-11-06T13:44:30.630' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4398, 1, CAST(N'2025-11-06T13:44:30.630' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4399, 1, CAST(N'2025-11-06T13:46:13.653' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4400, 1, CAST(N'2025-11-06T13:46:14.850' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4401, 1, CAST(N'2025-11-06T13:46:25.200' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4402, 1, CAST(N'2025-11-06T13:46:25.220' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4403, 1, CAST(N'2025-11-06T13:46:37.003' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4404, 1, CAST(N'2025-11-06T13:46:37.027' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4405, 1, CAST(N'2025-11-06T13:46:37.030' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4406, 1, CAST(N'2025-11-06T13:46:41.140' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4407, 1, CAST(N'2025-11-06T13:46:44.747' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4408, 1, CAST(N'2025-11-06T13:46:44.750' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4409, 1, CAST(N'2025-11-06T13:46:44.753' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4410, 1, CAST(N'2025-11-06T13:46:46.263' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4411, 1, CAST(N'2025-11-06T13:46:46.263' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4412, 1, CAST(N'2025-11-06T13:46:50.627' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4413, 1, CAST(N'2025-11-06T13:47:12.840' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4414, 1, CAST(N'2025-11-06T13:47:12.840' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4415, 1, CAST(N'2025-11-06T13:47:12.840' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4416, 1, CAST(N'2025-11-06T13:47:17.337' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4417, 1, CAST(N'2025-11-06T13:47:56.417' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4418, 1, CAST(N'2025-11-06T13:48:23.280' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4419, 1, CAST(N'2025-11-06T13:48:29.533' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4420, 1, CAST(N'2025-11-06T13:48:29.540' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4421, 1, CAST(N'2025-11-06T13:48:29.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4422, 1, CAST(N'2025-11-06T13:48:57.683' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4423, 1, CAST(N'2025-11-06T13:49:13.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4424, 1, CAST(N'2025-11-06T13:49:15.100' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4425, 1, CAST(N'2025-11-06T13:49:15.117' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4426, 1, CAST(N'2025-11-06T13:49:29.710' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4427, 1, CAST(N'2025-11-06T13:50:55.510' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4428, 1, CAST(N'2025-11-06T13:54:55.760' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4429, 1, CAST(N'2025-11-06T13:55:04.463' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4430, 1, CAST(N'2025-11-06T13:55:06.683' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4431, 1, CAST(N'2025-11-06T13:55:06.690' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4432, 1, CAST(N'2025-11-06T13:55:06.697' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4433, 1, CAST(N'2025-11-06T13:55:24.410' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4434, 1, CAST(N'2025-11-06T13:55:31.957' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4435, 1, CAST(N'2025-11-06T13:55:34.303' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4436, NULL, CAST(N'2025-11-06T13:55:34.307' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4437, 1, CAST(N'2025-11-06T13:55:40.530' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4438, 1, CAST(N'2025-11-06T14:11:02.570' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4439, 1, CAST(N'2025-11-06T14:11:04.857' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4440, 1, CAST(N'2025-11-11T14:50:55.007' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4441, 1, CAST(N'2025-11-11T14:50:55.983' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4442, 1, CAST(N'2025-11-11T14:51:03.470' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4443, 1, CAST(N'2025-11-11T14:51:03.473' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4444, 1, CAST(N'2025-11-11T14:51:22.793' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4445, 1, CAST(N'2025-11-11T14:51:24.570' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4446, 1, CAST(N'2025-11-11T14:51:24.570' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4447, 1, CAST(N'2025-11-11T14:51:24.573' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4448, 1, CAST(N'2025-11-11T14:51:27.450' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4449, 1, CAST(N'2025-11-11T14:51:37.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4450, 1, CAST(N'2025-11-11T14:51:37.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4451, 1, CAST(N'2025-11-11T14:51:38.767' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4452, 1, CAST(N'2025-11-11T14:51:38.770' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4453, 1, CAST(N'2025-11-11T14:51:40.107' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4454, 1, CAST(N'2025-11-11T14:51:41.320' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4455, 1, CAST(N'2025-11-11T14:51:41.323' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4456, 1, CAST(N'2025-11-11T14:51:41.323' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4457, 1, CAST(N'2025-11-11T14:51:43.000' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4458, 1, CAST(N'2025-11-11T14:51:43.763' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4459, 1, CAST(N'2025-11-11T14:51:56.177' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4460, 1, CAST(N'2025-11-11T14:51:56.177' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4461, 1, CAST(N'2025-11-11T14:52:09.020' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4462, 1, CAST(N'2025-11-11T14:52:10.067' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4463, 1, CAST(N'2025-11-11T14:52:10.070' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4464, 1, CAST(N'2025-11-11T14:52:10.073' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4465, 1, CAST(N'2025-11-11T14:52:13.230' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4466, 1, CAST(N'2025-11-11T16:09:45.270' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4467, 1, CAST(N'2025-11-11T16:09:46.013' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4468, 1, CAST(N'2025-11-11T16:12:33.903' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4469, 1, CAST(N'2025-11-11T16:13:07.950' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4470, 1, CAST(N'2025-11-11T16:13:11.133' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4471, 1, CAST(N'2025-11-11T16:13:11.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4472, 1, CAST(N'2025-11-11T16:13:11.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4473, 1, CAST(N'2025-11-11T16:14:40.417' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4474, 1, CAST(N'2025-11-11T16:15:11.310' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4475, 1, CAST(N'2025-11-11T16:15:30.513' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4476, 1, CAST(N'2025-11-11T16:15:30.523' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4477, 1, CAST(N'2025-11-11T16:15:43.910' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4478, 1, CAST(N'2025-11-11T16:15:45.130' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4479, 1, CAST(N'2025-11-11T16:15:45.133' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4480, 1, CAST(N'2025-11-11T16:15:45.277' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4481, 1, CAST(N'2025-11-11T16:15:54.840' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4482, 1, CAST(N'2025-11-11T16:16:08.513' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4483, 1, CAST(N'2025-11-11T16:16:08.520' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4484, 1, CAST(N'2025-11-11T16:16:08.520' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4485, 1, CAST(N'2025-11-11T16:16:10.167' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4486, 1, CAST(N'2025-11-11T16:16:10.167' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4487, 1, CAST(N'2025-11-11T16:16:24.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4488, 1, CAST(N'2025-11-11T16:16:25.130' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4489, 1, CAST(N'2025-11-11T16:16:25.133' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4490, 1, CAST(N'2025-11-11T16:16:25.143' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4491, 1, CAST(N'2025-11-11T16:16:33.490' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4492, 1, CAST(N'2025-11-11T16:16:34.313' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4493, 1, CAST(N'2025-11-11T16:16:41.477' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4494, 1, CAST(N'2025-11-11T16:16:41.480' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4495, 1, CAST(N'2025-11-11T16:16:51.037' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4496, 1, CAST(N'2025-11-11T16:17:15.053' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4497, 1, CAST(N'2025-11-11T16:17:17.877' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4498, 1, CAST(N'2025-11-11T16:17:18.033' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4499, 1, CAST(N'2025-11-11T16:17:18.037' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4500, 1, CAST(N'2025-11-11T16:17:58.770' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4501, 1, CAST(N'2025-11-11T16:17:58.770' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4502, 1, CAST(N'2025-11-11T16:19:13.500' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4503, 1, CAST(N'2025-11-11T16:19:14.657' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4504, 1, CAST(N'2025-11-11T16:19:14.657' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4505, 1, CAST(N'2025-11-11T16:19:14.660' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4506, 1, CAST(N'2025-11-11T16:19:26.777' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4507, 1, CAST(N'2025-11-11T16:19:28.600' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4508, 1, CAST(N'2025-11-11T16:19:30.003' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4509, 1, CAST(N'2025-11-11T16:21:45.307' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4510, 1, CAST(N'2025-11-11T16:21:45.307' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4511, 1, CAST(N'2025-11-11T16:21:52.927' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4512, 1, CAST(N'2025-11-11T16:22:52.900' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4513, 1, CAST(N'2025-11-11T16:22:54.643' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4514, 1, CAST(N'2025-11-11T16:22:54.653' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4515, 1, CAST(N'2025-11-11T16:22:54.660' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4516, 1, CAST(N'2025-11-11T16:23:31.247' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4517, 1, CAST(N'2025-11-11T16:23:31.247' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4518, 1, CAST(N'2025-11-11T16:23:33.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4519, 1, CAST(N'2025-11-11T16:23:34.343' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4520, 1, CAST(N'2025-11-11T16:23:34.350' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4521, 1, CAST(N'2025-11-11T16:23:34.357' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4522, 1, CAST(N'2025-11-11T16:23:42.780' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4523, 1, CAST(N'2025-11-11T16:23:43.460' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4524, 1, CAST(N'2025-11-11T16:23:44.090' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4525, 1, CAST(N'2025-11-11T16:23:47.923' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4526, 1, CAST(N'2025-11-11T16:23:47.930' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4527, 1, CAST(N'2025-11-11T16:23:56.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4528, 1, CAST(N'2025-11-11T16:24:14.503' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4529, 1, CAST(N'2025-11-11T16:24:15.853' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4530, 1, CAST(N'2025-11-11T16:24:15.860' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4531, 1, CAST(N'2025-11-11T16:24:15.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4532, 1, CAST(N'2025-11-11T16:24:33.670' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4533, 1, CAST(N'2025-11-11T16:24:33.673' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4534, 1, CAST(N'2025-11-11T16:24:41.250' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4535, 1, CAST(N'2025-11-11T16:24:42.607' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4536, 1, CAST(N'2025-11-11T16:24:42.610' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4537, 1, CAST(N'2025-11-11T16:24:55.163' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4538, 1, CAST(N'2025-11-11T16:24:55.167' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4539, 1, CAST(N'2025-11-21T17:28:45.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4540, 1, CAST(N'2025-11-21T17:28:46.287' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4541, 1, CAST(N'2025-11-21T17:32:41.803' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4542, 1, CAST(N'2025-11-21T17:32:42.917' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4543, 1, CAST(N'2025-11-21T17:32:55.987' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4544, 1, CAST(N'2025-11-21T17:32:56.017' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4545, 1, CAST(N'2025-11-21T17:32:56.030' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4546, 1, CAST(N'2025-11-21T17:32:59.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4547, 1, CAST(N'2025-11-21T17:32:59.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4548, 1, CAST(N'2025-11-21T17:33:05.980' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4549, 1, CAST(N'2025-11-21T17:33:07.437' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4550, 1, CAST(N'2025-11-21T17:33:07.447' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4551, 1, CAST(N'2025-11-21T17:33:55.563' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4552, 1, CAST(N'2025-11-21T17:33:57.010' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4553, 1, CAST(N'2025-11-21T17:34:09.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4554, 1, CAST(N'2025-11-21T17:34:38.490' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4555, 1, CAST(N'2025-11-21T17:35:09.700' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4556, 1, CAST(N'2025-11-21T17:35:12.070' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4557, 1, CAST(N'2025-11-21T17:35:12.080' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4558, 1, CAST(N'2025-11-21T17:35:12.083' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4559, 1, CAST(N'2025-11-21T17:35:33.303' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4560, 1, CAST(N'2025-11-21T17:35:36.423' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4561, 1, CAST(N'2025-11-21T17:44:08.267' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4562, 1, CAST(N'2025-11-21T17:44:08.887' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4563, 1, CAST(N'2025-11-21T17:44:32.657' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4564, 1, CAST(N'2025-11-21T17:44:32.660' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4565, 1, CAST(N'2025-11-21T17:44:32.660' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4566, 1, CAST(N'2025-11-21T17:44:39.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4567, 1, CAST(N'2025-11-21T17:48:44.080' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4568, 1, CAST(N'2025-11-21T17:48:45.267' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4569, 1, CAST(N'2025-11-21T17:48:53.680' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4570, 1, CAST(N'2025-11-21T17:48:53.710' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4571, 1, CAST(N'2025-11-21T17:48:53.727' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4572, 1, CAST(N'2025-11-21T17:48:59.037' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4573, 1, CAST(N'2025-11-21T17:51:57.163' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4574, 1, CAST(N'2025-11-21T17:51:58.313' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4575, 1, CAST(N'2025-11-21T17:52:03.397' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4576, 1, CAST(N'2025-11-21T17:52:03.480' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4577, 1, CAST(N'2025-11-21T17:52:13.877' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4578, 1, CAST(N'2025-11-21T17:52:13.877' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4579, 1, CAST(N'2025-11-21T17:52:13.890' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4580, 1, CAST(N'2025-11-21T17:52:20.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4581, 1, CAST(N'2025-11-21T17:52:43.450' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4582, 1, CAST(N'2025-11-21T17:53:14.013' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4583, 1, CAST(N'2025-11-21T17:53:18.317' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4584, 1, CAST(N'2025-11-21T17:53:45.807' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4585, 1, CAST(N'2025-11-21T17:53:45.807' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4586, 1, CAST(N'2025-11-21T17:53:45.807' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (4587, 1, CAST(N'2025-11-21T17:53:58.263' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14573, 1, CAST(N'2025-11-22T17:34:59.470' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14574, 1, CAST(N'2025-11-22T17:35:00.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14575, 1, CAST(N'2025-11-22T17:35:07.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14576, 1, CAST(N'2025-11-22T17:35:07.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14577, 1, CAST(N'2025-11-22T17:35:07.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14578, 1, CAST(N'2025-11-22T17:35:15.580' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14579, 1, CAST(N'2025-11-22T17:35:32.033' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14580, 1, CAST(N'2025-11-22T17:36:16.497' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14581, 1, CAST(N'2025-11-22T17:36:44.063' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14582, 1, CAST(N'2025-11-22T17:36:49.413' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14583, 1, CAST(N'2025-11-22T17:37:03.883' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14584, 1, CAST(N'2025-11-22T17:37:06.147' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14585, 1, CAST(N'2025-11-22T17:37:06.147' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14586, 1, CAST(N'2025-11-22T17:37:06.147' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14587, 1, CAST(N'2025-11-22T17:37:13.760' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14588, 1, CAST(N'2025-11-22T17:37:38.893' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14589, 1, CAST(N'2025-11-22T17:38:00.367' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14590, 1, CAST(N'2025-11-22T17:38:44.323' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14591, 1, CAST(N'2025-11-22T17:38:45.310' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14592, 1, CAST(N'2025-11-22T17:38:50.377' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14593, 1, CAST(N'2025-11-22T17:38:50.377' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14594, 1, CAST(N'2025-11-22T17:38:50.377' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14595, 1, CAST(N'2025-11-22T17:38:55.187' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14596, 1, CAST(N'2025-11-22T17:39:12.550' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14597, 1, CAST(N'2025-11-22T17:39:16.953' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14598, 1, CAST(N'2025-11-22T17:39:31.680' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14599, 1, CAST(N'2025-11-22T17:39:33.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14600, 1, CAST(N'2025-11-22T17:39:33.740' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14601, 1, CAST(N'2025-11-22T17:39:46.127' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14602, 1, CAST(N'2025-11-22T17:40:01.380' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14603, 1, CAST(N'2025-11-22T17:40:05.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14604, 1, CAST(N'2025-11-22T17:40:08.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14605, 1, CAST(N'2025-11-23T12:08:27.110' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14606, 1, CAST(N'2025-11-23T12:08:27.877' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14607, 1, CAST(N'2025-11-23T12:08:36.637' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14608, 1, CAST(N'2025-11-23T12:08:36.663' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14609, 1, CAST(N'2025-11-23T12:08:36.670' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14610, 1, CAST(N'2025-11-23T12:08:41.640' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14611, 1, CAST(N'2025-11-23T12:08:45.033' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14612, 1, CAST(N'2025-11-23T12:08:56.227' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14613, 1, CAST(N'2025-11-23T12:15:53.500' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14614, 1, CAST(N'2025-11-23T12:15:54.600' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14615, 1, CAST(N'2025-11-23T12:17:20.117' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14616, 1, CAST(N'2025-11-23T12:17:20.143' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14617, 1, CAST(N'2025-11-23T12:17:20.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14618, 1, CAST(N'2025-11-23T12:17:25.160' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14619, 1, CAST(N'2025-11-23T12:17:25.160' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14620, 1, CAST(N'2025-11-23T12:17:25.160' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14621, 1, CAST(N'2025-11-23T12:17:32.223' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14622, 1, CAST(N'2025-11-23T12:17:32.240' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14623, 1, CAST(N'2025-11-23T12:17:43.080' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14624, 1, CAST(N'2025-11-23T12:18:15.727' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14625, 1, CAST(N'2025-11-23T12:18:15.740' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14626, 1, CAST(N'2025-11-23T12:18:18.710' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14627, 1, CAST(N'2025-11-23T12:18:24.013' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14628, 1, CAST(N'2025-11-23T12:18:52.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14629, 1, CAST(N'2025-11-23T12:19:14.643' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14630, 1, CAST(N'2025-11-23T12:19:14.650' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14631, 1, CAST(N'2025-11-23T12:19:14.653' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14632, 1, CAST(N'2025-11-23T12:19:44.040' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14633, 1, CAST(N'2025-11-23T12:19:44.040' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14634, 1, CAST(N'2025-11-23T12:19:44.040' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14635, 1, CAST(N'2025-11-23T12:19:45.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14636, 1, CAST(N'2025-11-23T12:19:45.153' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14637, 1, CAST(N'2025-11-23T12:19:47.060' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14638, 1, CAST(N'2025-11-23T12:19:48.623' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14639, 1, CAST(N'2025-11-23T12:19:48.627' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14640, 1, CAST(N'2025-11-23T12:19:48.630' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14641, 1, CAST(N'2025-11-23T12:19:50.470' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14642, 1, CAST(N'2025-11-23T12:19:51.393' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14643, 1, CAST(N'2025-11-23T12:19:55.550' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14644, 1, CAST(N'2025-11-23T12:25:18.750' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14645, 1, CAST(N'2025-11-23T12:25:24.180' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14646, 1, CAST(N'2025-11-23T12:31:02.840' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14647, 1, CAST(N'2025-11-23T12:31:03.790' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14648, 1, CAST(N'2025-11-23T12:36:37.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14649, 1, CAST(N'2025-11-23T12:36:37.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14650, 1, CAST(N'2025-11-23T12:36:37.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14651, 1, CAST(N'2025-11-23T12:36:49.270' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14652, 1, CAST(N'2025-11-23T12:36:49.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14653, 1, CAST(N'2025-11-23T12:36:49.290' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14654, 1, CAST(N'2025-11-23T12:36:49.297' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14655, 1, CAST(N'2025-11-23T12:36:49.297' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14656, 1, CAST(N'2025-11-23T12:36:49.300' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14657, 1, CAST(N'2025-11-23T12:36:58.960' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14658, 1, CAST(N'2025-11-23T12:36:58.960' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14659, 1, CAST(N'2025-11-23T12:37:10.810' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14660, 1, CAST(N'2025-11-23T12:37:37.343' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14661, 1, CAST(N'2025-11-23T12:37:39.603' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14662, 1, CAST(N'2025-11-23T12:37:39.603' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14663, 1, CAST(N'2025-11-23T12:37:39.603' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14664, 1, CAST(N'2025-11-23T12:37:55.060' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14665, 1, CAST(N'2025-11-23T12:37:55.063' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14666, 1, CAST(N'2025-11-23T12:37:56.143' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14667, 1, CAST(N'2025-11-23T12:37:57.563' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14668, 1, CAST(N'2025-11-23T12:38:00.783' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14669, 1, CAST(N'2025-11-23T12:38:04.043' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14670, 1, CAST(N'2025-11-23T12:38:06.780' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14671, 1, CAST(N'2025-11-23T12:39:54.927' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14672, 1, CAST(N'2025-11-23T12:39:56.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14673, 1, CAST(N'2025-11-23T12:40:11.813' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14674, 1, CAST(N'2025-11-23T12:40:11.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14675, 1, CAST(N'2025-11-23T12:40:19.127' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14676, 1, CAST(N'2025-11-23T12:40:19.127' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14677, 1, CAST(N'2025-11-23T12:40:32.870' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14678, 1, CAST(N'2025-11-23T12:40:32.870' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14679, 1, CAST(N'2025-11-23T12:40:32.870' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14680, 1, CAST(N'2025-11-23T12:40:49.480' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14681, 1, CAST(N'2025-11-23T12:40:49.503' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14682, 1, CAST(N'2025-11-23T12:41:00.310' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14683, 1, CAST(N'2025-11-23T12:41:54.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14684, 1, CAST(N'2025-11-23T12:41:54.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14685, 1, CAST(N'2025-11-23T12:41:59.793' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14686, 1, CAST(N'2025-11-23T12:42:01.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14687, 1, CAST(N'2025-11-23T12:42:01.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14688, 1, CAST(N'2025-11-23T12:42:12.337' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14689, 1, CAST(N'2025-11-23T13:13:09.297' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14690, 1, CAST(N'2025-11-23T13:13:09.797' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14691, 1, CAST(N'2025-11-23T13:13:20.077' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14692, 1, CAST(N'2025-11-23T13:13:20.080' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14693, 1, CAST(N'2025-11-23T13:13:20.097' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14694, 1, CAST(N'2025-11-23T13:13:30.093' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14695, 1, CAST(N'2025-11-23T13:13:30.093' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14696, 1, CAST(N'2025-11-23T13:13:30.093' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14697, 1, CAST(N'2025-11-23T13:13:35.153' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14698, 1, CAST(N'2025-11-23T13:13:35.180' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14699, 1, CAST(N'2025-11-23T13:13:35.203' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14700, 1, CAST(N'2025-11-23T13:14:11.627' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14701, 1, CAST(N'2025-11-23T13:14:12.487' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14702, 1, CAST(N'2025-11-23T13:14:16.913' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14703, 1, CAST(N'2025-11-23T13:14:16.940' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14704, 1, CAST(N'2025-11-23T13:14:16.950' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14705, 1, CAST(N'2025-11-23T13:14:22.630' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14706, 1, CAST(N'2025-11-23T13:14:22.633' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14707, 1, CAST(N'2025-11-23T13:14:22.643' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14708, 1, CAST(N'2025-11-23T13:14:26.323' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14709, 1, CAST(N'2025-11-23T13:14:26.330' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14710, 1, CAST(N'2025-11-23T13:14:26.333' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14711, 1, CAST(N'2025-11-23T13:14:31.453' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14712, 1, CAST(N'2025-11-23T13:14:31.460' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14713, 1, CAST(N'2025-11-23T13:14:31.460' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14714, 1, CAST(N'2025-11-23T13:40:53.167' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14715, 1, CAST(N'2025-11-23T13:40:53.610' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14716, 1, CAST(N'2025-11-23T13:41:13.233' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14717, 1, CAST(N'2025-11-23T13:41:13.233' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14718, 1, CAST(N'2025-11-23T13:41:13.237' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14719, 1, CAST(N'2025-11-27T13:30:58.207' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14720, 1, CAST(N'2025-11-27T13:30:58.700' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14721, 1, CAST(N'2025-11-27T13:31:07.643' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14722, 1, CAST(N'2025-11-27T13:31:07.647' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14723, 1, CAST(N'2025-11-27T13:31:07.650' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14724, 1, CAST(N'2025-11-27T13:31:12.200' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14725, 1, CAST(N'2025-11-27T13:31:26.300' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14726, 1, CAST(N'2025-11-27T13:31:29.680' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14727, 1, CAST(N'2025-11-27T13:31:34.540' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14728, 1, CAST(N'2025-11-27T13:31:34.583' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14729, 1, CAST(N'2025-11-27T13:31:34.617' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14730, 1, CAST(N'2025-11-27T13:31:36.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14731, 1, CAST(N'2025-11-27T13:31:36.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14732, 1, CAST(N'2025-11-27T13:31:38.050' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14733, 1, CAST(N'2025-11-27T13:31:38.850' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14734, 1, CAST(N'2025-11-27T13:31:38.850' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14735, 1, CAST(N'2025-11-27T13:31:40.320' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14736, 1, CAST(N'2025-11-27T13:31:55.310' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14737, 1, CAST(N'2025-11-27T13:31:55.310' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14738, 1, CAST(N'2025-11-27T13:31:55.310' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14739, 1, CAST(N'2025-11-27T13:32:09.903' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14740, 1, CAST(N'2025-11-27T13:32:14.127' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14741, 1, CAST(N'2025-11-27T13:32:31.183' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14742, 1, CAST(N'2025-11-27T13:32:33.383' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14743, 1, CAST(N'2025-11-27T13:32:33.383' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14744, 1, CAST(N'2025-11-27T13:32:33.383' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14745, 1, CAST(N'2025-11-27T13:37:46.933' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14746, 1, CAST(N'2025-11-27T13:37:48.070' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14747, 1, CAST(N'2025-11-27T13:38:13.480' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14748, 1, CAST(N'2025-11-27T13:38:49.523' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14749, 1, CAST(N'2025-11-27T13:38:51.973' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14750, 1, CAST(N'2025-11-27T13:38:52.000' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14751, 1, CAST(N'2025-11-27T13:38:52.003' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14752, 1, CAST(N'2025-11-27T13:39:03.743' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14753, 1, CAST(N'2025-11-27T13:50:43.543' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14754, 1, CAST(N'2025-11-27T13:50:44.607' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14755, 1, CAST(N'2025-11-27T13:51:21.450' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14756, 1, CAST(N'2025-11-27T13:51:56.680' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14757, 1, CAST(N'2025-11-27T13:51:59.137' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14758, 1, CAST(N'2025-11-27T13:51:59.217' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14759, 1, CAST(N'2025-11-27T13:51:59.223' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14760, 1, CAST(N'2025-11-27T13:52:15.633' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14761, 1, CAST(N'2025-11-27T13:52:34.223' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14762, 1, CAST(N'2025-11-27T13:52:34.223' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14763, 1, CAST(N'2025-11-27T13:52:34.223' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14764, 1, CAST(N'2025-11-27T13:52:38.887' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14765, 1, CAST(N'2025-11-27T13:52:57.863' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14766, 1, CAST(N'2025-11-27T13:52:57.863' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14767, 1, CAST(N'2025-11-27T13:52:57.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14768, 117, CAST(N'2025-11-27T13:53:19.227' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14769, 117, CAST(N'2025-11-27T13:53:20.283' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14770, 117, CAST(N'2025-11-27T13:53:20.337' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14771, 117, CAST(N'2025-11-27T13:53:25.993' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14772, NULL, CAST(N'2025-11-27T13:53:26.017' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14773, 117, CAST(N'2025-11-27T13:53:30.580' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14774, 117, CAST(N'2025-11-27T13:53:30.580' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14775, 117, CAST(N'2025-11-27T13:53:30.583' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14776, 117, CAST(N'2025-11-27T13:53:35.023' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14777, 117, CAST(N'2025-11-27T13:53:36.143' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14778, 117, CAST(N'2025-11-27T13:53:36.143' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14779, 117, CAST(N'2025-11-27T13:53:36.143' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14780, 1, CAST(N'2025-11-29T20:34:46.283' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14781, 1, CAST(N'2025-11-29T20:34:47.107' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14782, 1, CAST(N'2025-11-29T20:35:48.700' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14783, 1, CAST(N'2025-11-29T20:35:48.700' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14784, 1, CAST(N'2025-11-29T20:35:48.703' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14785, 1, CAST(N'2025-11-29T20:35:54.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14786, 1, CAST(N'2025-11-29T20:35:54.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14787, 1, CAST(N'2025-11-29T20:35:54.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14788, 1, CAST(N'2025-11-29T20:35:55.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14789, 1, CAST(N'2025-11-29T20:35:55.867' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14790, 1, CAST(N'2025-11-29T20:36:09.990' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14791, 1, CAST(N'2025-11-29T20:36:12.353' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14792, 1, CAST(N'2025-11-29T20:36:12.353' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14793, 1, CAST(N'2025-11-29T20:36:12.353' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14794, 1, CAST(N'2025-11-29T20:37:22.743' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14795, 1, CAST(N'2025-11-29T20:37:31.397' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14796, 1, CAST(N'2025-11-29T20:37:52.020' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14797, 1, CAST(N'2025-11-29T20:37:52.020' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14798, 1, CAST(N'2025-11-29T20:37:52.020' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14799, 1, CAST(N'2025-11-29T20:37:59.893' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14800, 1, CAST(N'2025-12-01T16:40:29.677' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14801, 1, CAST(N'2025-12-03T13:28:26.193' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14802, 1, CAST(N'2025-12-03T13:56:25.987' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14803, 1, CAST(N'2025-12-03T13:56:26.450' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14804, 1, CAST(N'2025-12-03T13:56:32.573' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14805, 1, CAST(N'2025-12-03T13:56:32.577' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14806, 1, CAST(N'2025-12-03T13:56:32.580' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14807, 1, CAST(N'2025-12-03T13:56:39.193' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14808, 1, CAST(N'2025-12-03T13:57:29.383' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14809, 1, CAST(N'2025-12-03T13:57:29.383' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14810, 1, CAST(N'2025-12-03T13:57:34.147' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14811, 1, CAST(N'2025-12-03T13:57:34.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14812, 1, CAST(N'2025-12-03T13:57:34.157' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14813, 1, CAST(N'2025-12-03T13:57:36.303' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14814, 1, CAST(N'2025-12-03T13:57:36.310' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14815, 1, CAST(N'2025-12-03T13:57:38.280' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14816, 1, CAST(N'2025-12-03T13:57:39.440' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14817, 1, CAST(N'2025-12-03T13:57:39.440' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14818, 1, CAST(N'2025-12-03T13:57:52.920' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14819, 1, CAST(N'2025-12-03T13:57:52.920' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14820, 1, CAST(N'2025-12-03T13:57:52.920' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14821, 1, CAST(N'2025-12-03T13:57:55.410' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14822, 1, CAST(N'2025-12-03T13:57:55.410' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14823, 1, CAST(N'2025-12-03T13:58:01.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14824, 1, CAST(N'2025-12-03T13:58:01.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14825, 1, CAST(N'2025-12-03T13:58:01.553' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14826, 1, CAST(N'2025-12-28T14:56:58.263' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14827, 1, CAST(N'2025-12-28T15:11:46.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14828, 1, CAST(N'2025-12-28T15:12:25.997' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14829, 1, CAST(N'2025-12-28T20:51:28.400' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14830, 1, CAST(N'2025-12-28T20:51:28.900' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14831, 1, CAST(N'2025-12-28T21:02:35.557' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14832, 1, CAST(N'2025-12-28T21:02:36.070' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14833, 1, CAST(N'2025-12-28T21:03:07.010' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14834, 1, CAST(N'2025-12-28T21:03:07.013' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14835, 1, CAST(N'2025-12-28T21:03:15.180' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14836, 1, CAST(N'2025-12-28T21:03:24.907' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14837, 1, CAST(N'2025-12-28T21:03:28.593' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14838, 1, CAST(N'2025-12-28T21:04:36.003' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14839, NULL, CAST(N'2025-12-28T21:04:36.003' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14840, 1, CAST(N'2025-12-28T21:04:42.853' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14841, 1, CAST(N'2025-12-28T21:05:05.053' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14842, 1, CAST(N'2025-12-28T21:06:48.010' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14843, 1, CAST(N'2025-12-28T21:06:48.017' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14844, 1, CAST(N'2025-12-28T21:06:48.020' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14845, 1, CAST(N'2025-12-28T21:06:52.220' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14846, 1, CAST(N'2025-12-28T21:06:54.033' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14847, 1, CAST(N'2025-12-28T21:06:54.033' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14848, 1, CAST(N'2025-12-28T21:06:54.033' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14849, 1, CAST(N'2025-12-28T21:07:08.003' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14850, 1, CAST(N'2025-12-28T21:23:39.750' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14851, 1, CAST(N'2025-12-28T21:23:40.363' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14852, 1, CAST(N'2025-12-28T21:23:45.683' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14853, 1, CAST(N'2025-12-28T21:23:45.700' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14854, 1, CAST(N'2025-12-28T21:23:45.737' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14855, 1, CAST(N'2025-12-28T21:23:50.930' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14856, 1, CAST(N'2025-12-28T21:26:52.660' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14857, 1, CAST(N'2025-12-28T21:26:53.460' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14858, 1, CAST(N'2025-12-28T21:26:59.283' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14859, 1, CAST(N'2025-12-28T21:26:59.343' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14860, 1, CAST(N'2025-12-28T21:26:59.350' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14861, 1, CAST(N'2025-12-28T21:27:04.667' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14862, 1, CAST(N'2025-12-28T21:28:53.670' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14863, 1, CAST(N'2025-12-28T21:29:00.513' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14864, 1, CAST(N'2025-12-28T21:29:00.523' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14865, 1, CAST(N'2025-12-28T21:29:00.527' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14866, 1, CAST(N'2025-12-28T21:29:06.543' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14867, 1, CAST(N'2025-12-28T21:29:06.543' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14868, 1, CAST(N'2025-12-28T21:29:06.547' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14869, 1, CAST(N'2025-12-28T21:29:07.977' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14870, 1, CAST(N'2025-12-28T21:29:07.977' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14871, 1, CAST(N'2025-12-28T21:29:17.890' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14872, 115, CAST(N'2025-12-28T21:29:51.597' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14873, 115, CAST(N'2025-12-28T21:29:52.270' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14874, 115, CAST(N'2025-12-28T21:29:52.330' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14875, 115, CAST(N'2025-12-28T21:30:00.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14876, 115, CAST(N'2025-12-28T21:30:00.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14877, 115, CAST(N'2025-12-28T21:30:01.370' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14878, 115, CAST(N'2025-12-28T21:30:11.740' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14879, 115, CAST(N'2025-12-28T21:34:16.920' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14880, 115, CAST(N'2025-12-28T21:34:16.920' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14881, 115, CAST(N'2025-12-28T21:34:17.940' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14882, 115, CAST(N'2025-12-28T21:34:26.730' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14883, 115, CAST(N'2025-12-28T21:34:27.850' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14884, 115, CAST(N'2025-12-28T21:34:27.857' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14885, 1, CAST(N'2025-12-28T21:42:57.273' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14886, 1, CAST(N'2025-12-28T21:42:57.640' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14887, 1, CAST(N'2025-12-28T21:43:07.130' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14888, 1, CAST(N'2025-12-28T21:43:07.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14889, 1, CAST(N'2025-12-28T21:43:07.150' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14890, 1, CAST(N'2025-12-28T21:43:10.807' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14891, 1, CAST(N'2025-12-28T21:43:10.807' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14892, 1, CAST(N'2025-12-28T21:43:25.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14893, 1, CAST(N'2025-12-28T21:43:25.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14894, 1, CAST(N'2025-12-28T21:43:26.040' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14895, 1, CAST(N'2025-12-28T21:43:27.990' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14896, 1, CAST(N'2025-12-28T21:43:27.990' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14897, 1, CAST(N'2025-12-28T21:43:31.560' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14898, 1, CAST(N'2025-12-28T21:43:35.280' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14899, 1, CAST(N'2025-12-28T21:43:35.280' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14900, 1, CAST(N'2025-12-28T21:43:44.120' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14901, 1, CAST(N'2025-12-28T21:43:44.120' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14902, 1, CAST(N'2025-12-28T21:43:44.633' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14903, 1, CAST(N'2025-12-30T20:27:52.067' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14904, 1, CAST(N'2025-12-30T20:33:32.263' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14905, 1, CAST(N'2025-12-30T20:36:42.447' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14906, 1, CAST(N'2025-12-30T20:53:28.367' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14907, 1, CAST(N'2025-12-30T20:59:14.360' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14908, 1, CAST(N'2025-12-30T21:17:34.440' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14909, 1, CAST(N'2025-12-30T21:20:00.253' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14910, 1, CAST(N'2025-12-30T21:22:46.190' AS DateTime))
GO
INSERT [dbo].[Tbl_LoginHistory] ([LID], [UID], [LastLoginDateTime]) VALUES (14911, 1, CAST(N'2025-12-30T21:22:52.947' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_LoginHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Parking] ON 
GO
INSERT [dbo].[Tbl_Parking] ([ParkingId], [FID], [VehicleNumber], [VehicleType], [SlotNumber], [IsOccupied], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [VImagePath]) VALUES (4, 39, N'MH14AB3336', N'Car', N'307', 1, N'1', CAST(N'2025-11-11T16:22:53.080' AS DateTime), N'1', CAST(N'2025-11-11T16:23:33.263' AS DateTime), N'/images/ParkImg/20251111_162146.jpg')
GO
INSERT [dbo].[Tbl_Parking] ([ParkingId], [FID], [VehicleNumber], [VehicleType], [SlotNumber], [IsOccupied], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [VImagePath]) VALUES (5, 39, N'305', N'Car', N'302', 1, N'1', CAST(N'2025-11-23T12:37:37.850' AS DateTime), NULL, CAST(N'2025-11-23T12:37:37.850' AS DateTime), N'/images/ParkImg/20251123_123653.jpg')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Parking] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_User] ON 
GO
INSERT [dbo].[Tbl_User] ([UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ImagePath], [UserType]) VALUES (1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-12-03T13:56:39.273' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'/images/UserImg/20251122_173854.jpg', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User] ([UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ImagePath], [UserType]) VALUES (115, N'Suryaji Babar', N'suryajibabar@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4147845632', 0, N'1', CAST(N'2025-11-11T16:13:08.063' AS DateTime), N'1', CAST(N'2025-12-28T21:29:52.397' AS DateTime), N'cf736175c35cad58', N'User', N'/images/UserImg/20251111_161223.jpg', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User] ([UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ImagePath], [UserType]) VALUES (116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-27T13:32:14.170' AS DateTime), N'', N'User', N'/images/UserImg/20251127_133156.jpg', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User] ([UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ImagePath], [UserType]) VALUES (117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-12-28T21:27:04.780' AS DateTime), N'', N'User', N'/images/UserImg/20251127_133759.jpg', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User] ([UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ImagePath], [UserType]) VALUES (118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), N'1', CAST(N'2025-12-28T21:06:52.243' AS DateTime), N'', N'User', N'/images/UserImg/20251127_135104.jpg', N'Flat Owner/Tenent')
GO
SET IDENTITY_INSERT [dbo].[Tbl_User] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_User_Audit] ON 
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (253, 102, N'Pravin Pathrikar', N'pra@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8525846352', 0, N'0', CAST(N'2025-10-28T18:09:27.043' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (259, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'1', CAST(N'2025-10-28T18:27:26.890' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (260, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'1', CAST(N'2025-10-28T18:08:32.837' AS DateTime), N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (294, 107, N'me ani tu', N'metu@gm.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'6589636363', 0, N'1', CAST(N'2025-10-29T12:49:30.890' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (295, 107, N'me ani tu', N'metu@gm.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'6589636363', 0, N'1', CAST(N'2025-10-29T12:49:30.890' AS DateTime), NULL, NULL, NULL, N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (296, 106, N'ganesh ghongade', N'g@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'6856356896', 0, N'1', CAST(N'2025-10-29T12:10:46.077' AS DateTime), NULL, NULL, NULL, N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (297, 105, N'Swaraj Pathrikar', N'swaraj7@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'1474147845', 0, N'1', CAST(N'2025-10-29T11:51:00.087' AS DateTime), N'1', CAST(N'2025-10-29T12:08:40.277' AS DateTime), NULL, N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (298, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-10-29T00:15:00.127' AS DateTime), NULL, N'Security', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (299, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-29T00:14:12.157' AS DateTime), NULL, N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (300, 102, N'Pravin Pathrikar', N'pra@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8525846352', 0, N'0', CAST(N'2025-10-28T18:09:27.043' AS DateTime), N'1', CAST(N'2025-10-28T18:09:44.203' AS DateTime), NULL, N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (301, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'101', CAST(N'2025-10-28T21:07:45.837' AS DateTime), NULL, N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (302, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-10-14T13:26:37.127' AS DateTime), NULL, N'User|Security|Admin|SuperAdmin|Developer', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (303, 107, N'me ani tu', N'metu@gm.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'6589636363', 0, N'1', CAST(N'2025-10-29T12:49:30.890' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (304, 106, N'ganesh ghongade', N'g@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'6856356896', 0, N'1', CAST(N'2025-10-29T12:10:46.077' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (305, 105, N'Swaraj Pathrikar', N'swaraj7@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'1474147845', 0, N'1', CAST(N'2025-10-29T11:51:00.087' AS DateTime), N'1', CAST(N'2025-10-29T12:08:40.277' AS DateTime), N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (306, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-10-29T00:15:00.127' AS DateTime), N'32139c146ca54bdd', N'Security', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (307, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-29T00:14:12.157' AS DateTime), N'32139c146ca54bdd', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (308, 102, N'Pravin Pathrikar', N'pra@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8525846352', 0, N'0', CAST(N'2025-10-28T18:09:27.043' AS DateTime), N'1', CAST(N'2025-10-28T18:09:44.203' AS DateTime), NULL, N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (309, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'101', CAST(N'2025-10-28T21:07:45.837' AS DateTime), NULL, N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (310, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-10-14T13:26:37.127' AS DateTime), NULL, N'User|Security|Admin|SuperAdmin|Developer', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (384, 115, N'Suryaji Babar', N'suryajibabar@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4147845632', 0, N'1', CAST(N'2025-11-11T16:13:08.063' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (385, 115, N'Suryaji Babar', N'suryajibabar@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4147845632', 0, N'1', CAST(N'2025-11-11T16:13:08.063' AS DateTime), N'1', CAST(N'2025-11-11T16:14:40.477' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (386, 115, N'Suryaji Babar', N'suryajibabar@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4147845632', 0, N'1', CAST(N'2025-11-11T16:13:08.063' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (387, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (388, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-21T17:35:36.447' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (389, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (390, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-21T17:44:39.920' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (394, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-21T17:52:20.220' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (395, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-21T17:48:59.070' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (396, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-21T17:53:18.337' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'UPDATED', N'Security Guard')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (397, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-10-14T13:26:37.127' AS DateTime), NULL, N'User|Security|Admin|SuperAdmin|Developer', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (288, 105, N'Swaraj Pathrika', N'swaraj7@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'1474147845', 0, N'1', CAST(N'2025-10-29T11:51:00.087' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (391, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-21T17:35:36.447' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (392, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-21T17:48:59.070' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (398, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-21T17:53:58.290' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'UPDATED', N'Security Guard')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (399, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-21T17:53:18.337' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'DELETED', N'Security Guard')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10394, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-22T17:35:15.637' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10395, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-21T17:52:20.220' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10396, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-22T17:36:49.517' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10397, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-21T17:53:58.290' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'DELETED', N'Security Guard')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10400, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-22T17:39:16.987' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10401, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-22T17:37:13.790' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10402, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-22T17:39:46.147' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10403, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-22T17:39:16.987' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10404, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-27T13:32:14.170' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10406, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10407, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-11-27T13:39:03.790' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10408, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10412, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-11-27T13:52:38.907' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10413, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-11-27T13:39:03.790' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10418, 118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), N'1', CAST(N'2025-11-29T20:37:59.983' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10419, 118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), N'1', CAST(N'2025-11-27T13:52:15.683' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10420, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-12-03T13:56:39.273' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10421, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-22T17:39:46.147' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10422, 118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), N'1', CAST(N'2025-12-28T21:04:43.083' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10423, 118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), N'1', CAST(N'2025-11-29T20:37:59.983' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10426, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-12-28T21:07:08.043' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10427, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'117', CAST(N'2025-11-27T13:53:35.047' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (274, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-10-28T23:16:54.660' AS DateTime), NULL, N'Security', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (275, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T23:18:34.520' AS DateTime), NULL, N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (276, 102, N'Pravin Pathrikar', N'pra@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8525846352', 0, N'0', CAST(N'2025-10-28T18:09:27.043' AS DateTime), N'1', CAST(N'2025-10-28T18:09:44.203' AS DateTime), NULL, N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (277, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'101', CAST(N'2025-10-28T21:07:45.837' AS DateTime), NULL, N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (278, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-10-14T13:26:37.127' AS DateTime), NULL, N'User|Security|Admin|SuperAdmin|Developer', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (279, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-10-28T23:16:54.660' AS DateTime), N'cf736175c35cad58', N'Security', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (280, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T23:18:34.520' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (281, 102, N'Pravin Pathrikar', N'pra@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8525846352', 0, N'0', CAST(N'2025-10-28T18:09:27.043' AS DateTime), N'1', CAST(N'2025-10-28T18:09:44.203' AS DateTime), N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (282, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'101', CAST(N'2025-10-28T21:07:45.837' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (283, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-10-14T13:26:37.127' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (311, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-11-03T22:44:45.997' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (312, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-29T00:14:12.157' AS DateTime), NULL, N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (313, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-11-03T22:45:50.810' AS DateTime), N'cf736175c35cad58', N'Security', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (314, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-10-29T00:15:00.127' AS DateTime), NULL, N'Security', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (319, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (320, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (321, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), N'1', CAST(N'2025-11-06T12:28:50.680' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (322, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (348, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:30:41.420' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (349, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:26:16.083' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (350, 113, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:31:29.043' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (351, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:31:41.233' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (352, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:30:41.420' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (353, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:43:01.810' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (354, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:31:41.233' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (357, 113, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:31:29.043' AS DateTime), N'1', CAST(N'2025-11-06T13:47:17.370' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (358, 113, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:31:29.043' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (359, 113, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:31:29.043' AS DateTime), N'1', CAST(N'2025-11-06T13:48:23.310' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (360, 113, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:31:29.043' AS DateTime), N'1', CAST(N'2025-11-06T13:47:17.370' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (361, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:48:57.710' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (362, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:43:01.810' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (250, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (267, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T23:09:30.100' AS DateTime), N'', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (268, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T23:09:11.610' AS DateTime), N'', N'Security', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (270, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-10-28T23:16:54.660' AS DateTime), N'cf736175c35cad58', N'Security', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (271, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, NULL, N'', N'Security', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (272, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T23:18:34.520' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (273, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T23:09:30.100' AS DateTime), N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (284, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-29T00:14:12.157' AS DateTime), N'32139c146ca54bdd', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (285, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T23:18:34.520' AS DateTime), NULL, N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (286, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-10-29T00:15:00.127' AS DateTime), N'32139c146ca54bdd', N'Security', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (287, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-10-28T23:16:54.660' AS DateTime), NULL, N'Security', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (293, 106, N'ganesh ghongade', N'g@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'6856356896', 0, N'1', CAST(N'2025-10-29T12:10:46.077' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (323, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), N'1', CAST(N'2025-11-06T12:35:31.187' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (324, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), N'1', CAST(N'2025-11-06T12:28:50.680' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (325, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T12:51:56.560' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (326, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-11-03T22:44:45.997' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (335, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T13:10:39.067' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (336, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T13:00:15.390' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (363, 114, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:49:13.223' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (368, 113, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:31:29.043' AS DateTime), N'1', CAST(N'2025-11-06T13:55:24.433' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (369, 113, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:31:29.043' AS DateTime), N'1', CAST(N'2025-11-06T13:48:23.310' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (370, 112, N'eeeeee', N'eeee@e.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8585858586', 0, N'103', CAST(N'2025-11-06T13:11:18.267' AS DateTime), NULL, NULL, N'cf736175c35cad58', N'', N'DELETED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10409, 118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10410, 118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), N'1', CAST(N'2025-11-27T13:52:15.683' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10411, 118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10416, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'117', CAST(N'2025-11-27T13:53:35.047' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10417, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-11-27T13:53:20.380' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10424, 118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), N'1', CAST(N'2025-12-28T21:06:52.243' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10425, 118, N'my wallpaper', N'wall@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9028578777', 0, N'1', CAST(N'2025-11-27T13:51:56.770' AS DateTime), N'1', CAST(N'2025-12-28T21:04:43.083' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10430, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-12-28T21:27:04.780' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (393, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-21T17:44:39.920' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10398, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-22T17:37:13.790' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10399, 1, N'Atul P', N'Pathrikaratul7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9673178777', 0, N'Atul P', CAST(N'2025-09-29T23:30:35.030' AS DateTime), N'1', CAST(N'2025-11-22T17:36:49.517' AS DateTime), N'', N'User|Security|Admin|SuperAdmin|Developer', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10405, 116, N'free wire', N'feewire@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4141414141', 0, N'1', CAST(N'2025-11-21T17:35:09.797' AS DateTime), N'1', CAST(N'2025-11-22T17:35:15.637' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10428, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-12-28T21:23:51.037' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10429, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-12-28T21:07:08.043' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10431, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-12-28T21:23:51.037' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10432, 115, N'Suryaji Babar', N'suryajibabar@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4147845632', 0, N'1', CAST(N'2025-11-11T16:13:08.063' AS DateTime), N'1', CAST(N'2025-12-28T21:29:52.397' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10433, 115, N'Suryaji Babar', N'suryajibabar@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'4147845632', 0, N'1', CAST(N'2025-11-11T16:13:08.063' AS DateTime), N'1', CAST(N'2025-11-11T16:14:40.477' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10414, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-11-27T13:53:20.380' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (10415, 117, N'shivam rajesh awchar', N'Shivam7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8308329688', 0, N'1', CAST(N'2025-11-27T13:38:49.590' AS DateTime), N'1', CAST(N'2025-11-27T13:52:38.907' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (251, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'1', CAST(N'2025-10-28T18:08:32.837' AS DateTime), N'', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (252, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (254, 102, N'Pravin Pathrikar', N'pra@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8525846352', 0, N'0', CAST(N'2025-10-28T18:09:27.043' AS DateTime), N'1', CAST(N'2025-10-28T18:09:44.203' AS DateTime), N'', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (255, 102, N'Pravin Pathrikar', N'pra@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8525846352', 0, N'0', CAST(N'2025-10-28T18:09:27.043' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (256, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (257, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T18:10:31.070' AS DateTime), N'', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (258, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (327, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T12:59:02.397' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (328, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T12:51:56.560' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (331, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T13:00:15.390' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (332, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T12:59:24.233' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (333, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), N'1', CAST(N'2025-11-06T13:02:26.960' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (334, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), N'1', CAST(N'2025-11-06T12:35:31.187' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (337, 112, N'eeeeee', N'eeee@e.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8585858586', 0, N'103', CAST(N'2025-11-06T13:11:18.267' AS DateTime), NULL, NULL, N'cf736175c35cad58', N'', N'INSERT', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (338, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T13:12:15.983' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (339, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T13:10:39.067' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (342, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-11-06T13:20:08.833' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (343, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T13:19:11.457' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (344, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:20:45.683' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (345, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (366, 114, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:49:13.223' AS DateTime), N'1', CAST(N'2025-11-06T13:54:55.797' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (367, 114, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:49:13.223' AS DateTime), N'1', CAST(N'2025-11-06T13:49:29.737' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (263, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'101', CAST(N'2025-10-28T21:07:45.837' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (264, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'1', CAST(N'2025-10-28T18:27:26.890' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (269, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, NULL, N'', N'Security', N'INSERT', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (316, 109, N'Atulya Pathrikar', N'Pathrikaratulya7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'2345678765', 0, N'0', CAST(N'2025-11-06T10:52:37.140' AS DateTime), NULL, NULL, N'string', N'User', N'INSERT', N'Cleaning staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (317, 109, N'Atulya Pathrikar', N'Pathrikaratulya7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'2345678765', 0, N'0', CAST(N'2025-11-06T10:52:37.140' AS DateTime), NULL, CAST(N'2025-11-06T10:55:46.650' AS DateTime), N'string', N'User', N'UPDATED', N'Cleaning staff_7')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (318, 109, N'Atulya Pathrikar', N'Pathrikaratulya7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'2345678765', 0, N'0', CAST(N'2025-11-06T10:52:37.140' AS DateTime), NULL, NULL, N'string', N'User', N'DELETED', N'Cleaning staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (261, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T21:06:58.533' AS DateTime), N'', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (262, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T18:10:31.070' AS DateTime), N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (371, 114, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:49:13.223' AS DateTime), N'1', CAST(N'2025-11-06T13:54:55.797' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (372, 113, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:31:29.043' AS DateTime), N'1', CAST(N'2025-11-06T13:55:24.433' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (373, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), N'1', CAST(N'2025-11-06T13:43:54.880' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (374, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:48:57.710' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (375, 109, N'Atulya Pathrikar', N'Pathrikaratulya7@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'2345678765', 0, N'0', CAST(N'2025-11-06T10:52:37.140' AS DateTime), NULL, CAST(N'2025-11-06T10:55:46.650' AS DateTime), N'string', N'User', N'DELETED', N'Cleaning staff_7')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (376, 108, N'we are family', N'family@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8588888888', 0, N'1', CAST(N'2025-11-04T11:11:48.990' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (377, 107, N'me ani tu', N'metu@gm.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'6589636363', 0, N'1', CAST(N'2025-10-29T12:49:30.890' AS DateTime), NULL, NULL, NULL, N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (378, 106, N'ganesh ghongade', N'g@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'6856356896', 0, N'1', CAST(N'2025-10-29T12:10:46.077' AS DateTime), NULL, NULL, NULL, N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (379, 105, N'Swaraj Pathrikar', N'swaraj7@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'1474147845', 0, N'1', CAST(N'2025-10-29T11:51:00.087' AS DateTime), N'1', CAST(N'2025-10-29T12:08:40.277' AS DateTime), NULL, N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (380, 104, N'Thapa s', N'thapa@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'5463521423', 0, N'1', CAST(N'2025-10-28T23:10:12.957' AS DateTime), NULL, CAST(N'2025-11-03T22:45:50.810' AS DateTime), N'cf736175c35cad58', N'Security', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (381, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-11-06T13:20:08.833' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (382, 102, N'Pravin Pathrikar', N'pra@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8525846352', 0, N'0', CAST(N'2025-10-28T18:09:27.043' AS DateTime), N'1', CAST(N'2025-10-28T18:09:44.203' AS DateTime), NULL, N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (383, 101, N'sharayu Atul Pathrikar', N'pathrikarsharayu77@gmail.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9658695877', 0, N'0', CAST(N'2025-10-28T18:05:26.163' AS DateTime), N'101', CAST(N'2025-10-28T21:07:45.837' AS DateTime), NULL, N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (265, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T23:09:11.610' AS DateTime), N'', N'Security', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (266, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352134', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'1', CAST(N'2025-10-28T21:06:58.533' AS DateTime), N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (315, 108, N'we are family', N'family@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'8588888888', 0, N'1', CAST(N'2025-11-04T11:11:48.990' AS DateTime), NULL, NULL, N'', N'User', N'INSERT', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (340, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T13:19:11.457' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (341, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T13:12:15.983' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (355, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), N'1', CAST(N'2025-11-06T13:43:54.880' AS DateTime), N'', N'User', N'UPDATED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (356, 111, N'abcd', N'abcd@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'9632586965', 0, N'1', CAST(N'2025-11-06T12:27:53.953' AS DateTime), N'1', CAST(N'2025-11-06T13:02:26.960' AS DateTime), N'', N'User', N'DELETED', N'Flat Owner/Tenent')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (364, 114, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:49:13.223' AS DateTime), N'1', CAST(N'2025-11-06T13:49:29.737' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (365, 114, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T13:49:13.223' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (289, 105, N'Swaraj Pathrikar', N'swaraj7@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'1474147845', 0, N'1', CAST(N'2025-10-29T11:51:00.087' AS DateTime), N'1', CAST(N'2025-10-29T11:51:20.417' AS DateTime), N'', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (290, 105, N'Swaraj Pathrika', N'swaraj7@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'1474147845', 0, N'1', CAST(N'2025-10-29T11:51:00.087' AS DateTime), NULL, NULL, N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (291, 105, N'Swaraj Pathrikar', N'swaraj7@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'1474147845', 0, N'1', CAST(N'2025-10-29T11:51:00.087' AS DateTime), N'1', CAST(N'2025-10-29T12:08:40.277' AS DateTime), N'', N'User', N'UPDATED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (292, 105, N'Swaraj Pathrikar', N'swaraj7@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'1474147845', 0, N'1', CAST(N'2025-10-29T11:51:00.087' AS DateTime), N'1', CAST(N'2025-10-29T11:51:20.417' AS DateTime), N'', N'User', N'DELETED', NULL)
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (329, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T12:59:24.233' AS DateTime), N'cf736175c35cad58', N'User', N'UPDATED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (330, 103, N'Suryaji Babar', N'suryajibabar@gmail.com', N'ECryxt1izEihxYucQukL8g==', N'8569352137', 0, N'0', CAST(N'2025-10-28T18:10:22.423' AS DateTime), N'103', CAST(N'2025-11-06T12:59:02.397' AS DateTime), N'cf736175c35cad58', N'User', N'DELETED', N'NA')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (346, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:26:16.083' AS DateTime), N'', N'User', N'UPDATED', N'Cleaning Staff')
GO
INSERT [dbo].[Tbl_User_Audit] ([UHID], [UID], [UName], [UEmail], [UPass], [UMobile], [IsDeleted], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime], [DeviceID], [PrivList], [ChangeType], [UserType]) VALUES (347, 110, N'person 1 staff new', N'stf@g.com', N'gEx3C4NrN80uVDP8+XmYDA==', N'3525363625', 0, N'1', CAST(N'2025-11-06T12:20:51.167' AS DateTime), N'1', CAST(N'2025-11-06T13:20:45.683' AS DateTime), N'', N'User', N'DELETED', N'Cleaning Staff')
GO
SET IDENTITY_INSERT [dbo].[Tbl_User_Audit] OFF
GO
ALTER TABLE [dbo].[Tbl_Amenities] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Amenities] ADD  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Amenities] ADD  DEFAULT (getdate()) FOR [UpdatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Config] ADD  DEFAULT ((0)) FOR [ConfigIsActive]
GO
ALTER TABLE [dbo].[Tbl_Config] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Config] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Tbl_ErrorLogs] ADD  DEFAULT (getdate()) FOR [ErrorCreatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_ErrorLogs] ADD  DEFAULT ((0)) FOR [IsResolve]
GO
ALTER TABLE [dbo].[Tbl_FCMToken] ADD  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Tbl_Flat] ADD  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Flat] ADD  DEFAULT (getdate()) FOR [UpdatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Guest] ADD  CONSTRAINT [DF__Tbl_Guest__InDat__440B1D61]  DEFAULT (getdate()) FOR [InDateTime]
GO
ALTER TABLE [dbo].[Tbl_Guest] ADD  CONSTRAINT [DF__Tbl_Guest__Creat__44FF419A]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Guest] ADD  CONSTRAINT [DF__Tbl_Guest__Updat__45F365D3]  DEFAULT (getdate()) FOR [UpdatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Incident] ADD  DEFAULT (getdate()) FOR [INCReportedDateTime]
GO
ALTER TABLE [dbo].[Tbl_LoginHistory] ADD  DEFAULT (getdate()) FOR [LastLoginDateTime]
GO
ALTER TABLE [dbo].[Tbl_Parking] ADD  DEFAULT ((0)) FOR [IsOccupied]
GO
ALTER TABLE [dbo].[Tbl_Parking] ADD  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Parking] ADD  DEFAULT (getdate()) FOR [UpdatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Society] ADD  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Society] ADD  DEFAULT (getdate()) FOR [UpdatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_User] ADD  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_User] ADD  DEFAULT (getdate()) FOR [UpdatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Flat]  WITH CHECK ADD FOREIGN KEY([LoginID])
REFERENCES [dbo].[Tbl_User] ([UID])
GO
ALTER TABLE [dbo].[Tbl_Parking]  WITH CHECK ADD FOREIGN KEY([FID])
REFERENCES [dbo].[Tbl_Flat] ([FID])
GO
/****** Object:  StoredProcedure [dbo].[Usp_DataCleanup]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DataCleanup]
AS
BEGIN

DELETE FROM Tbl_User WHERE ISNULL(PrivList,'')='' 

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_ErrorLogs]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_Tbl_ErrorLogs]
(
@ERRID bigint=null,
@ErrorPage nvarchar(max)=null,
@ErrorStack nvarchar(max)=null,
@ErrorMessage nvarchar(max)=null,
@ErrorLoggedByID Varchar(max)=null,
@ErrorLoggedByName varchar(max)=null,
@Flag Varchar(100)=null
)
AS
BEGIN
IF(@Flag='IN')
BEGIN
INSERT INTO Tbl_ErrorLogs(
[ErrorPage], [ErrorStack], [ErrorMessage], [ErrorLoggedByID], [ErrorLoggedByName]
)
OUTPUT INSERTED.*
VALUES
(@ErrorPage, @ErrorStack, @ErrorMessage, @ErrorLoggedByID, @ErrorLoggedByName)
END
ELSE IF(@Flag='Report')
BEGIN


Select * from [dbo].[Tbl_ErrorLogs] where [IsResolve]=0 Order by 1 desc

END

END

GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_FCMToken]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Tbl_FCMToken]
(
@FCID bigint=null,
@FlatID Int=null,
@FcmToken varchar(max)=null,
@UpdatedOn datetime=null
)
AS
BEGIN

INSERT INTO Tbl_FCMToken (FlatID,FcmToken,UpdatedOn)
VALUES (@FlatID,@FcmToken,GETDATE())

SET @FCID=  IDENT_CURRENT('Tbl_FCMToken');

SELECT * FROM Tbl_FCMToken where FCID=@FCID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Flat]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Tbl_Flat]
(
@FID BIGINT =NULL,
@Ownername NVARCHAR(MAX) =NULL,
@FloorNumber NVARCHAR(MAX) =NULL,
@FlatNumber VARCHAR(MAX)=NULL,
@FlatType VARCHAR(MAX)=NULL,
@IsDeleted bit=NULL,
@CreatedBy NVARCHAR(MAX)=NULL,
@CreatedDateTime datetime=NULL,
@UpdatedBy NVARCHAR(MAX)=NULL,
@UpdatedDateTime DATETIME=NULL,
@LoginID bigint=NULL,
@UID bigint=null,
@Flag VARCHAR(MAX)=NULL
)
AS
BEGIN
--BEGIN TRY
Declare @PrivList_find nvarchar(max)
IF(@Flag='IN')
BEGIN

INSERT INTO [dbo].[Tbl_Flat]
([Ownername], [FloorNumber], [FlatNumber], [FlatType], [IsDeleted], [CreatedBy],
[CreatedDateTime],[LoginID]) OUTPUT INSERTED.* , CAST(0 as bigint) UID VALUES
(
@Ownername,@FloorNumber,@FlatNumber,@FlatType,0, @CreatedBy,
GETDATE(),@LoginID
)
END
ELSE IF(@Flag='UP')
BEGIN

UPDATE [dbo].[Tbl_Flat] SET Ownername=@Ownername,FloorNumber=@FloorNumber,FlatNumber=@FlatNumber,
FlatType=@FlatType,IsDeleted=@IsDeleted,
UpdatedBy=@UpdatedBy,UpdatedDateTime=GETDATE(),
LoginID=@LoginID OUTPUT INSERTED.*,CAST(0 as bigint) UID WHERE FID=@FID

END
ELSE IF(@Flag='DE')
BEGIN

UPDATE [dbo].[Tbl_Flat] SET IsDeleted=@IsDeleted,
UpdatedBy=@UpdatedBy,UpdatedDateTime=GETDATE()
OUTPUT INSERTED.*, CAST(0 as bigint) UID WHERE FID=@FID

END
ELSE IF(@Flag='AUTO')
BEGIN
select Concat(Ownername,'-',FID,'-',U.UMobile) OwnerName,FID,FlatNumber,FlatType,FloorNumber,
F.isDeleted,F.createdBy,F.createdDateTime,F.updatedBy,F.updatedDateTime,loginID,
 CAST(0 as bigint) uid
 from Tbl_Flat F LEFT JOIN Tbl_User U ON F.LoginID = U.UID
END
ELSE IF(@Flag='Report')
BEGIN

SET @PrivList_find = (Select PrivList from Tbl_User where UID=@UID)

IF(CHARINDEX('Admin|SuperAdmin|Developer',@PrivList_find)>0)
BEGIN

SELECT F.[FID],
Ownername, FloorNumber, FlatNumber, FlatType,
ISNULL(F.[IsDeleted],0) IsDeleted, F.[CreatedBy], F.[CreatedDateTime], F.[UpdatedBy],
F.UpdatedDateTime,F.LoginID,U.UID
FROM Tbl_Flat F LEFT JOIN Tbl_User U ON U.UID=F.LoginID--WHERE IsDeleted=@IsDeleted
ORDER by UID DESC
END
Else
BEGIN
SELECT F.[FID],
Ownername, FloorNumber, FlatNumber, FlatType,
ISNULL(F.[IsDeleted],0) IsDeleted, F.[CreatedBy], F.[CreatedDateTime], F.[UpdatedBy],
F.UpdatedDateTime,F.LoginID,U.UID
FROM Tbl_Flat F LEFT JOIN Tbl_User U ON U.UID=F.LoginID--WHERE IsDeleted=@IsDeleted
 WHERE UID=@UID
ORDER by UID DESC
END

END 
ELSE IF(@Flag='VehicleNumber')
BEGIN
select Concat(Ownername,'-',F.FID,'-',ISNULL(P.VehicleNumber,'NA'),'-',ISNULL(P.SlotNumber,'NA')) 
OwnerName,f.FID,FlatNumber,FlatType,FloorNumber,
F.isDeleted,F.createdBy,F.createdDateTime,F.updatedBy,F.updatedDateTime,loginID,
 CAST(0 as bigint) uid
 from Tbl_Flat F LEFT JOIN Tbl_User U ON F.LoginID = U.UID
 LEFT JOIN Tbl_Parking P ON F.FID=P.FID
END
--END TRY
--BEGIN CATCH

--SELECT 0

--END CATCH





END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Guest]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_Tbl_Guest] 
(
@GID bigint = null,
@GName nvarchar(max)=null,
@GMobile nvarchar(max)=null,
@GEmail nvarchar(max)=null,
@InDateTime datetime=null,
@OutDateTime datetime=null,
@FID BIGINT=null,
@Status varchar(max)= null,
@IsDeleted bit=null,
@CreatedBy nvarchar(max)=null,
@CreatedDateTime datetime=null,
@UpdatedBy nvarchar(max)=null,
@UpdatedDateTime datetime=null,
@GImagePath nvarchar(max)=null,
@LoginID bigint=null,
@CreatorMobile nvarchar(max)=null,
@Flag varchar(100)=null
)
AS
BEGIN
Declare @PrivList_find nvarchar(max)
Declare @ImageUrl nvarchar(max)= (SELECT ConfigName FROM Tbl_Config WHERE CID=1) -- 'http://10.198.80.209:8000'
--BEGIN TRY
--DECLARE @SecurityMobile nvarchar(max)
--if(CHARINDEX('Security',@PrivList_find)>0)
--BEGIN
   
--   SET @SecurityMobile = (Select Umobile from Tbl_User Where UID=@CreatedBy)

--END
IF(@Flag='Report')
BEGIN

SET @PrivList_find = (Select PrivList from Tbl_User where UID=@LoginID)

IF(CHARINDEX('Admin|SuperAdmin|Developer',@PrivList_find)>0)
BEGIN
-- this need to be correct , because it's sholud consider based on latest record
SELECT [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime],
F.FlatNumber, [Status], G.[IsDeleted], G.[CreatedBy],G.[CreatedDateTime],
G.[UpdatedBy], G.[UpdatedDateTime], CONCAT(@ImageUrl,G.[GImagePath]) GImagePath,G.FID,F.LoginID,
F.FlatType,F.FloorNumber,CreatorMobile--@SecurityMobile SecurityMobile
,U.UMobile FlatOwnerMobile FROM [dbo].[Tbl_Guest] G JOIN [dbo].[Tbl_Flat] F ON G.FID=F.FID
LEFT JOIN Tbl_User U ON F.LoginID=U.UID
ORDER BY GID DESC
--WHERE F.LoginID=@LoginID
END
ELSE
BEGIN
SELECT [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime],
F.FlatNumber, [Status], G.[IsDeleted], G.[CreatedBy],G.[CreatedDateTime],
G.[UpdatedBy], G.[UpdatedDateTime], CONCAT(@ImageUrl,G.[GImagePath]) GImagePath,G.FID,F.LoginID,
F.FlatType,F.FloorNumber,CreatorMobile,U.UMobile FlatOwnerMobile--@SecurityMobile SecurityMobile
FROM [dbo].[Tbl_Guest] G JOIN [dbo].[Tbl_Flat] F ON G.FID=F.FID
LEFT JOIN Tbl_User U ON F.LoginID=U.UID
WHERE F.LoginID=@LoginID
ORDER BY GID DESC
END
END
ELSE IF(@Flag='IN')
BEGIN

INSERT INTO [dbo].[Tbl_Guest](
[GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], 
[CreatedBy], [CreatedDateTime], [GImagePath],CreatorMobile)
--OUTPUT INSERTED.* ,CAST(0 as bigint) LoginID,'' FlatType, '' FloorNumber, '' FlatNumber,
--'' as SecurityMobile , '' FlatOwnerMobile
VALUES
(
@GName, @GMobile, @GEmail,@InDateTime,@OutDateTime,@FID,@Status,0, 
@CreatedBy,GETDATE(),@GImagePath,@CreatorMobile
)

SELECT *
 ,CAST(0 as bigint) LoginID,'' FlatType, '' FloorNumber, '' FlatNumber,
'' as SecurityMobile , '' FlatOwnerMobile
FROM Tbl_Guest WHERE GID=SCOPE_IDENTITY()
--DECLARE @InsertedGuests TABLE (
--    GuestID INT,        -- Assuming this is your PK
--    GName NVARCHAR(100),
--    GMobile NVARCHAR(20),
--    GEmail NVARCHAR(100),
--    InDateTime DATETIME,
--    OutDateTime DATETIME,
--    FID INT,
--    Status INT,
--    IsDeleted BIT,
--    CreatedBy NVARCHAR(50),
--    CreatedDateTime DATETIME,
--    GImagePath NVARCHAR(MAX)
--);

---- Step 2: Insert and capture inserted row(s)
--INSERT INTO [dbo].[Tbl_Guest] (
--    GName, GMobile, GEmail, InDateTime, OutDateTime, FID, Status, IsDeleted, 
--    CreatedBy, CreatedDateTime, GImagePath
--)
--OUTPUT 
--    INSERTED.GID,
--    INSERTED.GName,
--    INSERTED.GMobile,
--    INSERTED.GEmail,
--    INSERTED.InDateTime,
--    INSERTED.OutDateTime,
--    INSERTED.FID,
--    INSERTED.Status,
--    INSERTED.IsDeleted,
--    INSERTED.CreatedBy,
--    INSERTED.CreatedDateTime,
--    INSERTED.GImagePath
--INTO @InsertedGuests
--VALUES (
--    @GName, @GMobile, @GEmail, @InDateTime, @OutDateTime, @FID, @Status, 0, 
--    @CreatedBy, GETDATE(), @GImagePath
--);

---- Step 3: Join with Tbl_Flat and return results
--SELECT 
--    ig.*, 
--    f.FID,    -- Assuming Tbl_Flat has FlatName
--    f.FlatNumber,   -- Other flat info you may want
--	f.Ownername,
--	f.FlatType
--FROM @InsertedGuests ig
--JOIN Tbl_Flat f ON ig.FID = f.FID;

END
ELSE IF(@Flag='UP')
BEGIN

UPDATE [dbo].[Tbl_Guest] SET  [GName]=@GName, [GMobile]=@GMobile,
[GEmail]=@GEmail, [OutDateTime]=CASE WHEN @Status='OUT' THEN  @OutDateTime ELSE NULL END,
[FID]=@FID, [Status]=@Status, [IsDeleted]=@IsDeleted,[UpdatedBy]=@UpdatedBy,
[UpdatedDateTime]=GETDATE(), [GImagePath]=REPLACE(@GImagePath,@ImageUrl,'')
--OUTPUT INSERTED.*,CAST(0 as bigint) LoginID,'' FlatType, '' FloorNumber, '' FlatNumber,
--'' as SecurityMobile, '' FlatOwnerMobile
WHERE [GID]=@GID

SELECT *
,CAST(0 as bigint) LoginID,'' FlatType, '' FloorNumber, '' FlatNumber,
'' as SecurityMobile, '' FlatOwnerMobile
FROM Tbl_Guest WHERE GID=@GID


END
ELSE IF(@Flag='DE')
BEGIN

UPDATE [dbo].[Tbl_Guest] SET[IsDeleted]=@IsDeleted,[UpdatedBy]=@UpdatedBy,
[UpdatedDateTime]=GETDATE()
--OUTPUT INSERTED.*,CAST(0 as bigint) LoginID,'' FlatType, '' FloorNumber, '' FlatNumber,
--'' as SecurityMobile, '' FlatOwnerMobile
WHERE [GID]=@GID

SELECT *
,CAST(0 as bigint) LoginID,'' FlatType, '' FloorNumber, '' FlatNumber,
'' as SecurityMobile, '' FlatOwnerMobile
FROM Tbl_Guest WHERE GID=@GID



END
ELSE IF(@Flag='ADMIN')
BEGIN
SELECT [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [Status], G.[IsDeleted], G.[CreatedBy],G.[CreatedDateTime],
G.[UpdatedBy], G.[UpdatedDateTime],  G.[GImagePath],F.FlatNumber,F.FID,F.FloorNumber,
F.FlatType,CreatorMobile , '' FlatOwnerMobile
FROM [dbo].[Tbl_Guest] G JOIN [dbo].[Tbl_Flat] F ON G.FID=F.FID

END
--END TRY
--BEGIN CATCH

SELECT 0

--END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Guest_Backup_17_10_2025]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_Tbl_Guest_Backup_17_10_2025] 
(
@GID bigint = null,
@GName nvarchar(max)=null,
@GMobile nvarchar(max)=null,
@GEmail nvarchar(max)=null,
@InDateTime datetime=null,
@OutDateTime datetime=null,
@FID BIGINT=null,
@Status varchar(max)= null,
@IsDeleted bit=null,
@CreatedBy nvarchar(max)=null,
@CreatedDateTime datetime=null,
@UpdatedBy nvarchar(max)=null,
@UpdatedDateTime datetime=null,
@GImagePath nvarchar(max)=null,
@LoginID bigint=null,
@CreatorMobile nvarchar(max)=null,
@Flag varchar(100)=null
)
AS
BEGIN
Declare @PrivList_find nvarchar(max)
Declare @ImageUrl nvarchar(max)= 'http://192.168.12.209:8000'
--BEGIN TRY
--DECLARE @SecurityMobile nvarchar(max)
--if(CHARINDEX('Security',@PrivList_find)>0)
--BEGIN
   
--   SET @SecurityMobile = (Select Umobile from Tbl_User Where UID=@CreatedBy)

--END
IF(@Flag='Report')
BEGIN

SET @PrivList_find = (Select PrivList from Tbl_User where UID=@LoginID)

IF(CHARINDEX('Admin|SuperAdmin|Developer',@PrivList_find)>0)
BEGIN
-- this need to be correct , because it's sholud consider based on latest record
SELECT [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime],
F.FlatNumber, [Status], G.[IsDeleted], G.[CreatedBy],G.[CreatedDateTime],
G.[UpdatedBy], G.[UpdatedDateTime], CONCAT(@ImageUrl,G.[GImagePath]) GImagePath,G.FID,F.LoginID,
F.FlatType,F.FloorNumber,CreatorMobile--@SecurityMobile SecurityMobile
,U.UMobile FlatOwnerMobile FROM [dbo].[Tbl_Guest] G JOIN [dbo].[Tbl_Flat] F ON G.FID=F.FID
LEFT JOIN Tbl_User U ON F.LoginID=U.UID
ORDER BY GID DESC
--WHERE F.LoginID=@LoginID
END
ELSE
BEGIN
SELECT [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime],
F.FlatNumber, [Status], G.[IsDeleted], G.[CreatedBy],G.[CreatedDateTime],
G.[UpdatedBy], G.[UpdatedDateTime], CONCAT(@ImageUrl,G.[GImagePath]) GImagePath,G.FID,F.LoginID,
F.FlatType,F.FloorNumber,CreatorMobile,U.UMobile FlatOwnerMobile--@SecurityMobile SecurityMobile
FROM [dbo].[Tbl_Guest] G JOIN [dbo].[Tbl_Flat] F ON G.FID=F.FID
LEFT JOIN Tbl_User U ON F.LoginID=U.UID
WHERE F.LoginID=@LoginID
ORDER BY GID DESC
END
END
ELSE IF(@Flag='IN')
BEGIN

INSERT INTO [dbo].[Tbl_Guest](
[GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [FID], [Status], [IsDeleted], 
[CreatedBy], [CreatedDateTime], [GImagePath],CreatorMobile
) OUTPUT INSERTED.* ,CAST(0 as bigint) LoginID,'' FlatType, '' FloorNumber, '' FlatNumber,
'' as SecurityMobile , '' FlatOwnerMobile
VALUES
(
@GName, @GMobile, @GEmail,@InDateTime,@OutDateTime,@FID,@Status,0, 
@CreatedBy,GETDATE(),@GImagePath,@CreatorMobile
)
--DECLARE @InsertedGuests TABLE (
--    GuestID INT,        -- Assuming this is your PK
--    GName NVARCHAR(100),
--    GMobile NVARCHAR(20),
--    GEmail NVARCHAR(100),
--    InDateTime DATETIME,
--    OutDateTime DATETIME,
--    FID INT,
--    Status INT,
--    IsDeleted BIT,
--    CreatedBy NVARCHAR(50),
--    CreatedDateTime DATETIME,
--    GImagePath NVARCHAR(MAX)
--);

---- Step 2: Insert and capture inserted row(s)
--INSERT INTO [dbo].[Tbl_Guest] (
--    GName, GMobile, GEmail, InDateTime, OutDateTime, FID, Status, IsDeleted, 
--    CreatedBy, CreatedDateTime, GImagePath
--)
--OUTPUT 
--    INSERTED.GID,
--    INSERTED.GName,
--    INSERTED.GMobile,
--    INSERTED.GEmail,
--    INSERTED.InDateTime,
--    INSERTED.OutDateTime,
--    INSERTED.FID,
--    INSERTED.Status,
--    INSERTED.IsDeleted,
--    INSERTED.CreatedBy,
--    INSERTED.CreatedDateTime,
--    INSERTED.GImagePath
--INTO @InsertedGuests
--VALUES (
--    @GName, @GMobile, @GEmail, @InDateTime, @OutDateTime, @FID, @Status, 0, 
--    @CreatedBy, GETDATE(), @GImagePath
--);

---- Step 3: Join with Tbl_Flat and return results
--SELECT 
--    ig.*, 
--    f.FID,    -- Assuming Tbl_Flat has FlatName
--    f.FlatNumber,   -- Other flat info you may want
--	f.Ownername,
--	f.FlatType
--FROM @InsertedGuests ig
--JOIN Tbl_Flat f ON ig.FID = f.FID;

END
ELSE IF(@Flag='UP')
BEGIN

UPDATE [dbo].[Tbl_Guest] SET  [GName]=@GName, [GMobile]=@GMobile,
[GEmail]=@GEmail, [OutDateTime]=CASE WHEN @Status='OUT' THEN  @OutDateTime ELSE NULL END,
[FID]=@FID, [Status]=@Status, [IsDeleted]=@IsDeleted,[UpdatedBy]=@UpdatedBy,
[UpdatedDateTime]=GETDATE(), [GImagePath]=REPLACE(@GImagePath,@ImageUrl,'')
OUTPUT INSERTED.*,CAST(0 as bigint) LoginID,'' FlatType, '' FloorNumber, '' FlatNumber,
'' as SecurityMobile, '' FlatOwnerMobile

WHERE [GID]=@GID
END
ELSE IF(@Flag='DE')
BEGIN

UPDATE [dbo].[Tbl_Guest] SET[IsDeleted]=@IsDeleted,[UpdatedBy]=@UpdatedBy,
[UpdatedDateTime]=GETDATE()
OUTPUT INSERTED.*,CAST(0 as bigint) LoginID,'' FlatType, '' FloorNumber, '' FlatNumber,
'' as SecurityMobile, '' FlatOwnerMobile
WHERE [GID]=@GID
END
ELSE IF(@Flag='ADMIN')
BEGIN
SELECT [GID], [GName], [GMobile], [GEmail], [InDateTime], [OutDateTime], [Status], G.[IsDeleted], G.[CreatedBy],G.[CreatedDateTime],
G.[UpdatedBy], G.[UpdatedDateTime],  G.[GImagePath],F.FlatNumber,F.FID,F.FloorNumber,
F.FlatType,CreatorMobile , '' FlatOwnerMobile
FROM [dbo].[Tbl_Guest] G JOIN [dbo].[Tbl_Flat] F ON G.FID=F.FID

END
--END TRY
--BEGIN CATCH

SELECT 0

--END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Incident]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_Tbl_Incident]-- @UID=1, @Flag='Report'
(
@INCID BIGINT =NULL,
@INCType NVARCHAR(MAX) =NULL,
@INCImagePath NVARCHAR(MAX)=NULL,
@INCReportedBy NVARCHAR(MAX)=NULL,
@IsDeleted bit=NULL,
@INCStatus NVARCHAR(MAX)=NULL,
@INCReportedDateTime datetime=NULL,
@INCAssignTo NVARCHAR(MAX)=NULL,
@UID bigint=null,
@Flag VARCHAR(MAX)=NULL
)
AS
BEGIN
--BEGIN TRY
Declare @PrivList_find nvarchar(max)
Declare @ImageUrl nvarchar(max)= (SELECT ConfigName FROM Tbl_Config WHERE CID=1)
IF(@Flag='IN')
BEGIN

INSERT INTO [dbo].[Tbl_Incident]
(
[INCType], [INCImagePath], [INCReportedBy], [Isdeleted], [INCStatus],
[INCReportedDateTime], [INCAssignTo]
)
OUTPUT INSERTED.*,'' AssigneeToName, '' ReportedByName , '' AssignToMobileNumber, ''  ReportedBYMobileNumber
VALUES
(
@INCType, @INCImagePath, @INCReportedBy, 0, @INCStatus,
GETDATE(), @INCAssignTo
)
END
ELSE IF(@Flag='UP')
BEGIN

UPDATE [dbo].[Tbl_Incident] SET
INCType=@INCType,INCImagePath=REPLACE(@INCImagePath,@ImageUrl,''), INCReportedBy=@INCReportedBy,
Isdeleted=@IsDeleted, INCStatus=@INCStatus,
INCReportedDateTime=GETDATE(), INCAssignTo=@INCAssignTo
OUTPUT INSERTED.*,'' AssigneeToName, '' ReportedByName,'' AssignToMobileNumber,
'' ReportedBYMobileNumber
WHERE INCID=@INCID

END
ELSE IF(@Flag='DE')
BEGIN

UPDATE [dbo].[Tbl_Incident] SET IsDeleted=@IsDeleted
OUTPUT INSERTED.* , '' AssigneeToName, '' ReportedByName , '' AssignToMobileNumber,
'' ReportedBYMobileNumber
WHERE INCID=@INCID

END
ELSE IF(@Flag='DROP')
BEGIN

SELECT * FROM [dbo].[Tbl_Incident]

END
ELSE IF(@Flag='Report')
BEGIN
SET @PrivList_find = (Select PrivList from Tbl_User where UID=@UID)

IF(CHARINDEX('Admin|SuperAdmin|Developer',@PrivList_find)>0)
BEGIN
SELECT I.INCID,I.INCType,I.INCStatus,CAST(U.UID AS VARCHAR(max)) as INCReportedBy,
U.UName as ReportedByName ,CAST(A.UID AS VARCHAR(max)) INCAssignTo, A.UName As AssigneeToName,
I.IsDeleted,CONCAT(@ImageUrl,INCImagePath) INCImagePath,INCReportedDateTime,
A.UMobile AssignToMobileNumber , U.UMobile ReportedBYMobileNumber
FROM [dbo].[Tbl_Incident] I LEFT JOIN Tbl_user U 
ON I.INCReportedBy = U.UID
LEFT JOIN Tbl_user A   ON A.UID= I.INCAssignTo
ORDER BY 1 DESC
END
ELSE
BEGIN
SELECT I.INCID,I.INCType,I.INCStatus,CAST(U.UID AS VARCHAR(max)) as INCReportedBy,
U.UName as ReportedByName ,CAST(A.UID AS VARCHAR(max)) INCAssignTo, A.UName As AssigneeToName,
I.IsDeleted,CONCAT(@ImageUrl,INCImagePath) INCImagePath,INCReportedDateTime,
A.UMobile AssignToMobileNumber,U.UMobile ReportedBYMobileNumber
FROM [dbo].[Tbl_Incident] I LEFT JOIN Tbl_user U 
ON I.INCReportedBy = U.UID
LEFT JOIN Tbl_user A   ON A.UID= I.INCAssignTo
WHERE I.INCReportedBy=@UID

UNION

SELECT I.INCID,I.INCType,I.INCStatus,CAST(U.UID AS VARCHAR(max)) as INCReportedBy,
U.UName as ReportedByName ,CAST(A.UID AS VARCHAR(max)) INCAssignTo, A.UName As AssigneeToName,
I.IsDeleted,CONCAT(@ImageUrl,INCImagePath) INCImagePath,INCReportedDateTime,
A.UMobile AssignToMobileNumber,U.UMobile ReportedBYMobileNumber
FROM [dbo].[Tbl_Incident] I LEFT JOIN Tbl_user U 
ON I.INCReportedBy = U.UID
LEFT JOIN Tbl_user A   ON A.UID= I.INCAssignTo
WHERE I.INCAssignTo=@UID


ORDER BY 1 DESC
END
END
--END TRY
--BEGIN CATCH

SELECT 0

--END CATCH



END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Parking]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Tbl_Parking]
(
@ParkingId bigint=null,
@FID bigint=null,
@VehicleNumber nvarchar(20)=null,
@VehicleType nvarchar(max)=null,
@SlotNumber nvarchar(10)=null,
@IsOccupied bit=null,
@CreatedBy nvarchar(max)=null,
@CreatedDateTime datetime=null,
@UpdatedBy nvarchar(max)=null,
@UpdatedDateTime datetime=null,
@LoginID bigint=null,
@VImagePath Nvarchar(max)=null,
@UID bigint=null,
@Flag varchar(100)=null
)
AS
BEGIN
--BEGIN TRY
Declare @PrivList_find nvarchar(max)
Declare @ImageUrl nvarchar(max)= (SELECT ConfigName FROM Tbl_Config WHERE CID=1)


IF(@Flag='SE')
BEGIN


SELECT [ParkingId], F.FlatNumber, [VehicleNumber], [VehicleType], [SlotNumber], [IsOccupied],
P.[CreatedBy], P.[CreatedDateTime], P.[UpdatedBy], P.[UpdatedDateTime],F.FID,
CONCAT(@ImageUrl,P.VImagePath)

FROM [dbo].[Tbl_Parking] P JOIN [dbo].[Tbl_Flat] F ON P.FID=F.FID
WHERE F.FID=@FID
END
ELSE IF(@Flag='IN')
BEGIN
INSERT INTO [dbo].[Tbl_Parking] (
[FID], [VehicleNumber], [VehicleType], [SlotNumber], [IsOccupied],
[CreatedBy], [CreatedDateTime],VImagePath
) OUTPUT INSERTED.*, '' FlatNumber, '' Ownername
VALUES
(
@FID, @VehicleNumber,@VehicleType,@SlotNumber,@IsOccupied,@CreatedBy,
GETDATE(),@VImagePath
)
END
ELSE IF(@Flag='UP')
BEGIN
UPDATE [dbo].[Tbl_Parking] SET
[FID]=@FID, [VehicleNumber]=@VehicleNumber,[VehicleType]=@VehicleType,
[SlotNumber]=@SlotNumber, [IsOccupied]=@IsOccupied,
 [UpdatedBy]=@UpdatedBy, [UpdatedDateTime]=GETDATE(),VImagePath=REPLACE(@VImagePath,@ImageUrl,'')
 OUTPUT inserted.*,'' FlatNumber, '' Ownername
WHERE [ParkingId]=@ParkingId
END
ELSE IF(@Flag='DE')
BEGIN
UPDATE [dbo].[Tbl_Parking] SET
[UpdatedBy]=@UpdatedBy, [UpdatedDateTime]=GETDATE()
 OUTPUT inserted.*
WHERE [ParkingId]=@ParkingId
END
ELSE IF(@Flag='Report')
BEGIN
SET @PrivList_find = (Select PrivList from Tbl_User where UID=@UID)

IF(CHARINDEX('Admin|SuperAdmin|Developer',@PrivList_find)>0)
BEGIN
SELECT [ParkingId], F.FlatNumber, [VehicleNumber], [VehicleType], [SlotNumber], [IsOccupied],
 P.[CreatedBy], P.[CreatedDateTime], P.[UpdatedBy], P.[UpdatedDateTime],F.FID,
 CONCAT(@ImageUrl,P.VImagePath) VImagePath,F.Ownername
FROM [dbo].[Tbl_Parking] P LEFT JOIN [dbo].[Tbl_Flat] F ON P.FID=F.FID
ORDER BY 1 DESC
END
ELSE 
BEGIN

SELECT [ParkingId], F.FlatNumber, [VehicleNumber], [VehicleType], [SlotNumber], [IsOccupied],
 P.[CreatedBy], P.[CreatedDateTime], P.[UpdatedBy], P.[UpdatedDateTime],F.FID,
 CONCAT(@ImageUrl,P.VImagePath) VImagePath,F.Ownername
FROM [dbo].[Tbl_Parking] P LEFT JOIN [dbo].[Tbl_Flat] F ON P.FID=F.FID
WHERE F.LoginID=@UID
ORDER BY 1 DESC
END

END
--END TRY
--BEGIN CATCH
SELECT 0
--END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Society]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Tbl_Society]
(
@SID BIGINT=null,
@SName NVARCHAR(MAX)=null,
@SAddress NVARCHAR(MAX)=null,
@SPOC NVARCHAR(MAX)=null,
@IsDeleted bit=null,
@CreatedBy NVARCHAR(MAX)=null,
@CreatedDateTime Datetime=null,
@UpdatedBy NVARCHAR(MAX)=null,
@UpdatedDateTime datetime=null,
@Flag varchar(max)=null
)
AS
BEGIN
BEGIN TRY

IF(@Flag='SE')
BEGIN
Select * from [dbo].[Tbl_Society] WHERE IsDeleted=@IsDeleted
END
ELSE IF(@Flag='IN')
BEGIN

INSERT INTO [dbo].[Tbl_Society]([SName], [SAddress], [SPOC],
[IsDeleted], [CreatedBy], [CreatedDateTime])
VALUES 
(
@SName, @SAddress, @SPOC,
0, @CreatedBy,GETDATE()
)
END
ELSE IF(@Flag='UP')
BEGIN

UPDATE [dbo].[Tbl_Society] SET  [SName]=@SName, [SAddress]=@SAddress, [SPOC]=@SPOC,
[IsDeleted]=@IsDeleted,[UpdatedBy]=@UpdatedBy,[UpdatedDateTime]=GETDATE()
WHERE [SID]=@SID
END

END TRY
BEGIN CATCH

Select 0

END CATCH


END


GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_User]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC  [dbo].[USP_Tbl_User]
(
	@UID bigint = 0,
	@UName nvarchar(max)= NULL,
	@UEmail nvarchar(max)= NULL,
	@UPass nvarchar(max)= NULL,
	@UMobile nvarchar(MAX)= NULL,
	@IsDeleted bit= NULL,
	@CreatedBy nvarchar(max)= NULL,
	@CreatedDateTime datetime= NULL,
	@UpdatedBy nvarchar(max)= NULL,
	@UpdatedDateTime datetime= NULL,
	@DeviceID NVarchar(MAX)=NULL,
	@PrivList Nvarchar(max)=NULL,
	@ImagePath nvarchar(max) =NULL,
	@UserType nvarchar(max)=NULL,
	@Flag VARCHAR(MAX)= NULL
)
AS

BEGIN 
DECLARE @PrivList_find Nvarchar(max)

Declare @ImageUrl nvarchar(max)= (SELECT ConfigName FROM Tbl_Config WHERE CID=1)

--BEGIN TRY
IF(@Flag='LOG')
BEGIN

if(@UID=0)
BEGIN

SET @UID = (Select UID from tbl_user  WHERE UEmail=@UEmail AND UPass=@UPass)

INSERT  INTO Tbl_LoginHistory
(UID ,LastLoginDateTime)
VALUES ((@UID),GETDATE())


END



SELECT [UID],
[UName], [UEmail], [UMobile], U.[IsDeleted],
U.[CreatedBy], U.[CreatedDateTime], U.[UpdatedBy], U.[UpdatedDateTime], ISNULL(F.FID,0) FID ,
UPass, ISNULL(F.FlatNumber,'(New)') FlatNumber,ISNULL(F.FlatType,'(New)') FlatType,
@Flag Flag,DeviceID,PrivList,
CASE WHEN CHARINDEX('Admin|SuperAdmin|Developer',PrivList)> 0 THEN 
(SELECT COUNT(*) FROM Tbl_Guest) else 
(SELECT COUNT(*) FROM Tbl_Guest WHERE  FID=F.FID)
END

as GuestVisitor , 
CASE WHEN CHARINDEX('Admin|SuperAdmin|Developer',PrivList)> 0 THEN 
(SELECT COUNT(*) FROM Tbl_Incident) else 
(SELECT COUNT(*) FROM Tbl_Incident WHERE INCAssignTo=U.UID)
END as IncidentCount,
CONCAT(@ImageUrl,ImagePath) ImagePath, '' SecurityMobile,ISNULL(UserType,'NA') UserType
FROM Tbl_User U LEFT JOIN Tbl_Flat F ON U.UID=F.LoginID
WHERE UEmail=@UEmail AND UPass=@UPass AND U.IsDeleted=0





END
ELSE IF(@Flag='IN')
BEGIN

IF EXISTS(SELECT 1 FROM Tbl_User WHERE UEmail=@UEmail AND IsDeleted=0)
BEGIN
SELECT *,
 CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
0 GuestVisitor, 0 IncidentCount, '' SecurityMobile
FROM Tbl_User WHERE UID=SCOPE_IDENTITY()
END

ELSE
BEGIN

INSERT INTO [dbo].[Tbl_User] ([UName], [UEmail], [UPass], [UMobile], [IsDeleted],
[CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime],DeviceID,PrivList,ImagePath,UserType)
--OUTPUT  inserted.*, CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
--0 GuestVisitor, 0 IncidentCount, '' SecurityMobile
VALUES
(@UName,@UEmail,CASE WHEN ISNULL(@Upass,'0')='0' Then 'gEx3C4NrN80uVDP8+XmYDA==' else @UPass end,
@UMobile,0,@UID,GETDATE(),NULL,NULL,@DeviceID,@PrivList,@ImagePath,@UserType
)
-- CONCAT(REVERSE(@UMobile),REVERSE(@UName))

SELECT *,
 CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
0 GuestVisitor, 0 IncidentCount, '' SecurityMobile
FROM Tbl_User WHERE UID=SCOPE_IDENTITY()
END
END
ELSE IF(@Flag='UP')
BEGIN
UPDATE [dbo].[Tbl_User] SET [UName]=@UName, [UEmail]=@UEmail, [UPass]=@UPass,
[UMobile]=@UMobile,
[IsDeleted]=@IsDeleted,[UpdatedBy]=@UpdatedBy, [UpdatedDateTime]=GETDATE(),
DeviceID=@DeviceID,PrivList=@PrivList,ImagePath=REPLACE(@ImagePath,@ImageUrl,''),
UserType=@UserType


--OUTPUT INSERTED.*, CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
--0 GuestVisitor, 0 IncidentCount,'' SecurityMobile
WHERE UID=@UID

SELECT *
, CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
0 GuestVisitor, 0 IncidentCount,'' SecurityMobile
FROM Tbl_User where UID=@UID

END
ELSE IF(@Flag='DE')
BEGIN
UPDATE [dbo].[Tbl_User] SET 
[IsDeleted]=1,[UpdatedBy]=@UID, [UpdatedDateTime]=GETDATE()
--OUTPUT INSERTED.* 

WHERE UID=@UID

SELECT * FROM Tbl_User Where UID=@UID
END
ELSE IF(@Flag='Report')
BEGIN

SET @PrivList_find = (Select PrivList from Tbl_User where UID=@UID)

IF(CHARINDEX('Admin|SuperAdmin|Developer',@PrivList_find)>0)
BEGIN

SELECT [UID],
[UName], [UEmail], [UMobile], U.[IsDeleted],
U.[CreatedBy], U.[CreatedDateTime], U.[UpdatedBy], U.[UpdatedDateTime],
ISNULL(F.FID,CAST(0 as bigint)) FID ,
UPass, ISNULL(F.FlatNumber,'(New)') FlatNumber,ISNULL(F.FlatType,'(New)') FlatType,
'NA' Flag,DeviceID,PrivList,0 GuestVisitor, 0 IncidentCount,CONCAT(@ImageUrl,ImagePath) ImagePath,
'' SecurityMobile,ISNULL(UserType,'NA') UserType
FROM Tbl_User U LEFT JOIN Tbl_Flat F ON U.UID=F.LoginID--WHERE IsDeleted=@IsDeleted
ORDER by UID DESC
END
Else
BEGIN
SELECT [UID],
[UName], [UEmail], [UMobile], U.[IsDeleted],
U.[CreatedBy], U.[CreatedDateTime], U.[UpdatedBy], U.[UpdatedDateTime],
ISNULL(F.FID,CAST(0 as bigint)) FID ,
 UPass, ISNULL(F.FlatNumber,'(New)') FlatNumber,ISNULL(F.FlatType,'(New)') FlatType,
'NA' Flag,DeviceID,PrivList,0 GuestVisitor, 0 IncidentCount,CONCAT(@ImageUrl,ImagePath) ImagePath,
'' SecurityMobile,ISNULL(UserType,'NA') UserType
FROM Tbl_User U LEFT JOIN Tbl_Flat F ON U.UID=F.LoginID WHERE UID=@UID
ORDER by UID DESC
END

END 
ELSE IF(@Flag='User')
BEGIN
SET @PrivList_find = (Select PrivList from Tbl_User where UID=@UID)

IF(CHARINDEX('Admin|SuperAdmin|Developer',@PrivList_find)>0)
BEGIN
 select 0 -- do nothing
END
ELSE
BEGIN
UPDATE [dbo].[Tbl_User] SET [UpdatedDateTime]=GETDATE(),
DeviceID=@DeviceID

--OUTPUT INSERTED.*, CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
--0 GuestVisitor, 0 IncidentCount,''SecurityMobile
WHERE UID=@UID

SELECT *
, CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
0 GuestVisitor, 0 IncidentCount,''SecurityMobile
FROM Tbl_User WHERE UID=@UID

END
END
ELSE IF(@Flag='AUTO')
BEGIN
select Concat(U.Uname,'-',UID) Uname,UID,U.CreatedBy,U.CreatedDateTime,
U.DeviceID,F.FID,F.FlatNumber,F.FlatType,F.FloorNumber,
U.IsDeleted,U.PrivList,U.UEmail,U.UMobile, '******' UPass,
U.UpdatedBy,U.UpdatedDateTime,0 GuestVisitor, 0 IncidentCount,CONCAT(@ImageUrl,ImagePath) 
ImagePath , '' SecurityMobile,ISNULL(UserType,'NA') UserType
from Tbl_User U left join Tbl_Flat f 
on u.UID = f.LoginID
where F.LoginID is null
END
ELSE IF(@Flag='INC')
BEGIN
select Concat(U.Uname,'-',UID,'-',U.UMobile) Uname,UID,U.CreatedBy,U.CreatedDateTime,
U.DeviceID,F.FID,F.FlatNumber,F.FlatType,F.FloorNumber,
U.IsDeleted,U.PrivList,U.UEmail,U.UMobile, '******' UPass,
U.UpdatedBy,U.UpdatedDateTime,0 GuestVisitor, 0 IncidentCount,
CONCAT(@ImageUrl,ImagePath) ImagePath,'' SecurityMobile,ISNULL(UserType,'NA') UserType from Tbl_User U left join Tbl_Flat f 
on u.UID = f.LoginID
--where F.LoginID is null
END
--END TRY
--BEGIN CATCH

--Select 0

--END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_User_Backup_17_10_2025]    Script Date: 27-01-2026 16:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC  [dbo].[USP_Tbl_User_Backup_17_10_2025]
(
	@UID bigint = 0,
	@UName nvarchar(max)= NULL,
	@UEmail nvarchar(max)= NULL,
	@UPass nvarchar(max)= NULL,
	@UMobile nvarchar(MAX)= NULL,
	@IsDeleted bit= NULL,
	@CreatedBy nvarchar(max)= NULL,
	@CreatedDateTime datetime= NULL,
	@UpdatedBy nvarchar(max)= NULL,
	@UpdatedDateTime datetime= NULL,
	@DeviceID NVarchar(MAX)=NULL,
	@PrivList Nvarchar(max)=NULL,
	@ImagePath nvarchar(max) =NULL,
	@Flag VARCHAR(MAX)= NULL
)
AS

BEGIN 
DECLARE @PrivList_find Nvarchar(max)

Declare @ImageUrl nvarchar(max)= 'http://192.168.12.209:8000'

--BEGIN TRY
IF(@Flag='LOG')
BEGIN

if(@UID=0)
BEGIN

SET @UID = (Select UID from tbl_user  WHERE UEmail=@UEmail AND UPass=@UPass)

INSERT  INTO Tbl_LoginHistory
(UID ,LastLoginDateTime)
VALUES ((@UID),GETDATE())


END



SELECT [UID],
[UName], [UEmail], [UMobile], U.[IsDeleted],
U.[CreatedBy], U.[CreatedDateTime], U.[UpdatedBy], U.[UpdatedDateTime], ISNULL(F.FID,0) FID ,
UPass, ISNULL(F.FlatNumber,'(New)') FlatNumber,ISNULL(F.FlatType,'(New)') FlatType,
@Flag Flag,DeviceID,PrivList,
CASE WHEN CHARINDEX('Admin|SuperAdmin|Developer',PrivList)> 0 THEN 
(SELECT COUNT(*) FROM Tbl_Guest) else 
(SELECT COUNT(*) FROM Tbl_Guest WHERE  FID=F.FID)
END

as GuestVisitor , 
CASE WHEN CHARINDEX('Admin|SuperAdmin|Developer',PrivList)> 0 THEN 
(SELECT COUNT(*) FROM Tbl_Incident) else 
(SELECT COUNT(*) FROM Tbl_Incident WHERE INCAssignTo=U.UID)
END as IncidentCount,
CONCAT(@ImageUrl,ImagePath) ImagePath, '' SecurityMobile
FROM Tbl_User U LEFT JOIN Tbl_Flat F ON U.UID=F.LoginID
WHERE UEmail=@UEmail AND UPass=@UPass AND U.IsDeleted=0





END
ELSE IF(@Flag='IN')
BEGIN


INSERT INTO [dbo].[Tbl_User] ([UName], [UEmail], [UPass], [UMobile], [IsDeleted],
[CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime],DeviceID,PrivList,ImagePath)
OUTPUT  inserted.*, CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
0 GuestVisitor, 0 IncidentCount, '' SecurityMobile
VALUES
(@UName,@UEmail,CASE WHEN ISNULL(@Upass,0)=0 Then '8777' else @UPass end,
@UMobile,0,@UID,GETDATE(),NULL,NULL,@DeviceID,@PrivList,@ImagePath
)
-- CONCAT(REVERSE(@UMobile),REVERSE(@UName))

END
ELSE IF(@Flag='UP')
BEGIN
UPDATE [dbo].[Tbl_User] SET [UName]=@UName, [UEmail]=@UEmail, [UPass]=@UPass,
[UMobile]=@UMobile,
[IsDeleted]=@IsDeleted,[UpdatedBy]=@UpdatedBy, [UpdatedDateTime]=GETDATE(),
DeviceID=@DeviceID,PrivList=@PrivList,ImagePath=REPLACE(@ImagePath,@ImageUrl,'')


OUTPUT INSERTED.*, CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
0 GuestVisitor, 0 IncidentCount,'' SecurityMobile
WHERE UID=@UID
END
ELSE IF(@Flag='DE')
BEGIN
UPDATE [dbo].[Tbl_User] SET 
[IsDeleted]=1,[UpdatedBy]=@UID, [UpdatedDateTime]=GETDATE()
OUTPUT INSERTED.* WHERE UID=@UID
END
ELSE IF(@Flag='Report')
BEGIN

SET @PrivList_find = (Select PrivList from Tbl_User where UID=@UID)

IF(CHARINDEX('Admin|SuperAdmin|Developer',@PrivList_find)>0)
BEGIN

SELECT [UID],
[UName], [UEmail], [UMobile], U.[IsDeleted],
U.[CreatedBy], U.[CreatedDateTime], U.[UpdatedBy], U.[UpdatedDateTime],
ISNULL(F.FID,CAST(0 as bigint)) FID ,
UPass, ISNULL(F.FlatNumber,'(New)') FlatNumber,ISNULL(F.FlatType,'(New)') FlatType,
'NA' Flag,DeviceID,PrivList,0 GuestVisitor, 0 IncidentCount,CONCAT(@ImageUrl,ImagePath) ImagePath,
'' SecurityMobile
FROM Tbl_User U LEFT JOIN Tbl_Flat F ON U.UID=F.LoginID--WHERE IsDeleted=@IsDeleted
ORDER by UID DESC
END
Else
BEGIN
SELECT [UID],
[UName], [UEmail], [UMobile], U.[IsDeleted],
U.[CreatedBy], U.[CreatedDateTime], U.[UpdatedBy], U.[UpdatedDateTime],
ISNULL(F.FID,CAST(0 as bigint)) FID ,
 UPass, ISNULL(F.FlatNumber,'(New)') FlatNumber,ISNULL(F.FlatType,'(New)') FlatType,
'NA' Flag,DeviceID,PrivList,0 GuestVisitor, 0 IncidentCount,CONCAT(@ImageUrl,ImagePath) ImagePath,
'' SecurityMobile
FROM Tbl_User U LEFT JOIN Tbl_Flat F ON U.UID=F.LoginID WHERE UID=@UID
ORDER by UID DESC
END

END 
ELSE IF(@Flag='User')
BEGIN
SET @PrivList_find = (Select PrivList from Tbl_User where UID=@UID)

IF(CHARINDEX('Admin|SuperAdmin|Developer',@PrivList_find)>0)
BEGIN
 select 0 -- do nothing
END
ELSE
BEGIN
UPDATE [dbo].[Tbl_User] SET [UpdatedDateTime]=GETDATE(),
DeviceID=@DeviceID

OUTPUT INSERTED.*, CAST(0 as bigint) FID  , '' FlatNumber,'' FlatType,
0 GuestVisitor, 0 IncidentCount,''SecurityMobile
WHERE UID=@UID
END
END
ELSE IF(@Flag='AUTO')
BEGIN
select Concat(U.Uname,'-',UID) Uname,UID,U.CreatedBy,U.CreatedDateTime,
U.DeviceID,F.FID,F.FlatNumber,F.FlatType,F.FloorNumber,
U.IsDeleted,U.PrivList,U.UEmail,U.UMobile, '******' UPass,
U.UpdatedBy,U.UpdatedDateTime,0 GuestVisitor, 0 IncidentCount,CONCAT(@ImageUrl,ImagePath) 
ImagePath , '' SecurityMobile
from Tbl_User U left join Tbl_Flat f 
on u.UID = f.LoginID
where F.LoginID is null
END
ELSE IF(@Flag='INC')
BEGIN
select Concat(U.Uname,'-',UID,'-',U.UMobile) Uname,UID,U.CreatedBy,U.CreatedDateTime,
U.DeviceID,F.FID,F.FlatNumber,F.FlatType,F.FloorNumber,
U.IsDeleted,U.PrivList,U.UEmail,U.UMobile, '******' UPass,
U.UpdatedBy,U.UpdatedDateTime,0 GuestVisitor, 0 IncidentCount,
CONCAT(@ImageUrl,ImagePath) ImagePath,'' SecurityMobile from Tbl_User U left join Tbl_Flat f 
on u.UID = f.LoginID
--where F.LoginID is null
END
--END TRY
--BEGIN CATCH

--Select 0

--END CATCH

END
GO
USE [master]
GO
ALTER DATABASE [Society_8777] SET  READ_WRITE 
GO
