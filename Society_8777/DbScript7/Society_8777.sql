USE [master]
GO
/****** Object:  Database [Society_8777]    Script Date: 16-10-2025 18:27:21 ******/
CREATE DATABASE [Society_8777]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Society_8777', FILENAME = N'F:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Society_8777.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Society_8777_log', FILENAME = N'F:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Society_8777_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Society_8777] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [Society_8777] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Society_8777', N'ON'
GO
ALTER DATABASE [Society_8777] SET QUERY_STORE = ON
GO
ALTER DATABASE [Society_8777] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Society_8777]
GO
/****** Object:  Table [dbo].[Tbl_Amenities]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ErrorLogs]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Flat]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Guest]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Guest_Audit]    Script Date: 16-10-2025 18:27:21 ******/
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
/****** Object:  Table [dbo].[Tbl_Incident]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_LoginHistory]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Parking]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_RolesMapping]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Society]    Script Date: 16-10-2025 18:27:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_User]    Script Date: 16-10-2025 18:27:21 ******/
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
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_User_Audit]    Script Date: 16-10-2025 18:27:21 ******/
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
	[ChangeType] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Amenities] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Amenities] ADD  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_Amenities] ADD  DEFAULT (getdate()) FOR [UpdatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_ErrorLogs] ADD  DEFAULT (getdate()) FOR [ErrorCreatedDateTime]
GO
ALTER TABLE [dbo].[Tbl_ErrorLogs] ADD  DEFAULT ((0)) FOR [IsResolve]
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
/****** Object:  StoredProcedure [dbo].[USP_Tbl_ErrorLogs]    Script Date: 16-10-2025 18:27:21 ******/
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


Select * from [dbo].[Tbl_ErrorLogs] where [IsResolve]=0

END

END

GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Flat]    Script Date: 16-10-2025 18:27:21 ******/
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

--END TRY
--BEGIN CATCH

--SELECT 0

--END CATCH





END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Guest]    Script Date: 16-10-2025 18:27:21 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Incident]    Script Date: 16-10-2025 18:27:21 ******/
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
Declare @ImageUrl nvarchar(max)= 'http://192.168.12.209:8000'
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
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Parking]    Script Date: 16-10-2025 18:27:21 ******/
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
Declare @ImageUrl nvarchar(max)= 'http://192.168.12.209:8000'


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
/****** Object:  StoredProcedure [dbo].[USP_Tbl_Society]    Script Date: 16-10-2025 18:27:21 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_Tbl_User]    Script Date: 16-10-2025 18:27:21 ******/
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
