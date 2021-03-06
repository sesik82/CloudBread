USE [master]
GO
/****** Object:  Database [CloudBreadDB]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE DATABASE [CloudBreadDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CloudBreadDB1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CloudBreadDB' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CloudBreadDB1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CloudBreadDBlog' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CloudBreadDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CloudBreadDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CloudBreadDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CloudBreadDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CloudBreadDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CloudBreadDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CloudBreadDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CloudBreadDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CloudBreadDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CloudBreadDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CloudBreadDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CloudBreadDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CloudBreadDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CloudBreadDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CloudBreadDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CloudBreadDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CloudBreadDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CloudBreadDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CloudBreadDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CloudBreadDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CloudBreadDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CloudBreadDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CloudBreadDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CloudBreadDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CloudBreadDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CloudBreadDB] SET  MULTI_USER 
GO
ALTER DATABASE [CloudBreadDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CloudBreadDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CloudBreadDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CloudBreadDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CloudBreadDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CloudBreadDB', N'ON'
GO
USE [CloudBreadDB]
GO
/****** Object:  Schema [CloudBread]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE SCHEMA [CloudBread]
GO
/****** Object:  Table [CloudBread].[AdminMembers]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[AdminMembers](
	[AdminMemberID] [nvarchar](128) NOT NULL,
	[AdminMemberPWD] [nvarchar](128) NOT NULL DEFAULT (''),
	[AdminMemberEmail] [nvarchar](256) NOT NULL DEFAULT (''),
	[IDCreateAdminMember] [nvarchar](128) NOT NULL DEFAULT (''),
	[AdminGroup] [nvarchar](40) NOT NULL DEFAULT (''),
	[TimeZoneID] [nvarchar](40) NOT NULL DEFAULT ('Korea Standard Time'),
	[PINumber] [nvarchar](50) NOT NULL DEFAULT (''),
	[Name1] [nvarchar](50) NOT NULL DEFAULT (''),
	[Name2] [nvarchar](50) NOT NULL DEFAULT (''),
	[Name3] [nvarchar](50) NOT NULL DEFAULT (''),
	[DOB] [nvarchar](16) NOT NULL DEFAULT (''),
	[LastIPaddress] [nvarchar](32) NOT NULL DEFAULT (''),
	[LastLoginDT] [nvarchar](32) NOT NULL DEFAULT (''),
	[LastLogoutDT] [nvarchar](32) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.AdminMembers] PRIMARY KEY NONCLUSTERED 
(
	[AdminMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_AdminMembers_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_AdminMembers_CreatedAt] ON [CloudBread].[AdminMembers]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[Coupon]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[Coupon](
	[CouponID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[CouponCategory1] [nvarchar](50) NOT NULL DEFAULT (''),
	[CouponCategory2] [nvarchar](50) NOT NULL DEFAULT (''),
	[CouponCategory3] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[ItemCount] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemStatus] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetGroup] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetOS] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetDevice] [nvarchar](80) NOT NULL DEFAULT (''),
	[Title] [nvarchar](100) NOT NULL DEFAULT (''),
	[Content] [nvarchar](4000) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[DupeYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[OrderNumber] [int] NOT NULL DEFAULT ((0)),
	[CouponDurationFrom] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[CouponDurationTo] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[CreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL,
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[Coupon] PRIMARY KEY NONCLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Coupon]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_Coupon] ON [CloudBread].[Coupon]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[CouponMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[CouponMember](
	[CouponMemberID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[CouponID] [nvarchar](128) NOT NULL DEFAULT (''),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[CouponMember] PRIMARY KEY NONCLUSTERED 
(
	[CouponMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_CouponMember_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_CouponMember_CreatedAt] ON [CloudBread].[CouponMember]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[GameEventMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[GameEventMember](
	[GameEventMemberID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[eventID] [nvarchar](128) NOT NULL DEFAULT (''),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.GameEventMember] PRIMARY KEY NONCLUSTERED 
(
	[GameEventMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_GameEventMember_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_GameEventMember_CreatedAt] ON [CloudBread].[GameEventMember]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[GameEvents]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[GameEvents](
	[GameEventID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[EventCategory1] [nvarchar](50) NOT NULL DEFAULT (''),
	[EventCategory2] [nvarchar](50) NOT NULL DEFAULT (''),
	[EventCategory3] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[ItemCount] [nvarchar](50) NOT NULL DEFAULT (''),
	[Itemstatus] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetGroup] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetOS] [nvarchar](40) NOT NULL DEFAULT (''),
	[TargetDevice] [nvarchar](80) NOT NULL DEFAULT (''),
	[EventImageLink] [nvarchar](512) NOT NULL DEFAULT (''),
	[Title] [nvarchar](100) NOT NULL DEFAULT (''),
	[Content] [nvarchar](4000) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[EventDurationFrom] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[EventDurationTo] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[OrderNumber] [int] NOT NULL DEFAULT ((0)),
	[CreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_GameEvents] PRIMARY KEY NONCLUSTERED 
(
	[GameEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_GameEvents_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_GameEvents_CreatedAt] ON [CloudBread].[GameEvents]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[GiftDepositories]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[GiftDepositories](
	[GiftDepositoryID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[ItemCount] [nvarchar](40) NOT NULL DEFAULT (''),
	[FromMemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[ToMemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[SentMemberYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.GiftDepositories] PRIMARY KEY NONCLUSTERED 
(
	[GiftDepositoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_GiftDepositories_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_GiftDepositories_CreatedAt] ON [CloudBread].[GiftDepositories]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[ItemLists]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[ItemLists](
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[ItemName] [nvarchar](120) NOT NULL DEFAULT (''),
	[ItemDescription] [nvarchar](4000) NOT NULL DEFAULT (''),
	[ItemPrice] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemSellPrice] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemCategory1] [nvarchar](100) NOT NULL DEFAULT (''),
	[ItemCategory2] [nvarchar](100) NOT NULL DEFAULT (''),
	[ItemCategory3] [nvarchar](100) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[IteamCreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[IteamUpdateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.ItemLists] PRIMARY KEY NONCLUSTERED 
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_ItemLists_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_ItemLists_CreatedAt] ON [CloudBread].[ItemLists]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[MemberAccountBlockLog]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[MemberAccountBlockLog](
	[MemberAccountBlockID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[MemberAccountBlockReasonCategory1] [nvarchar](50) NOT NULL DEFAULT (''),
	[MemberAccountBlockReasonCategory2] [nvarchar](50) NOT NULL DEFAULT (''),
	[MemberAccountBlockReasonCategory3] [nvarchar](50) NOT NULL DEFAULT (''),
	[MemberAccountBlockReason] [nvarchar](1000) NOT NULL DEFAULT (''),
	[MemberAccountBlockProcess] [nvarchar](50) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[CreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[MemberAccountBlockLog] PRIMARY KEY NONCLUSTERED 
(
	[MemberAccountBlockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberAccountBlockLog_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_MemberAccountBlockLog_CreatedAt] ON [CloudBread].[MemberAccountBlockLog]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[MemberGameInfoes]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[MemberGameInfoes](
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[Level] [nvarchar](40) NOT NULL DEFAULT (''),
	[Exps] [nvarchar](50) NOT NULL DEFAULT (''),
	[Points] [nvarchar](50) NOT NULL DEFAULT (''),
	[UserSTAT1] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT2] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT3] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT4] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT5] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT6] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT7] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT8] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT9] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT10] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.MemberGameInfoes] PRIMARY KEY NONCLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberGameInfoes_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_MemberGameInfoes_CreatedAt] ON [CloudBread].[MemberGameInfoes]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[MemberGameInfoStages]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[MemberGameInfoStages](
	[MemberGameInfoStageID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[StageName] [nvarchar](100) NOT NULL DEFAULT (''),
	[StageStatus] [nvarchar](40) NOT NULL DEFAULT (''),
	[Category1] [nvarchar](80) NOT NULL DEFAULT (''),
	[Category2] [nvarchar](80) NOT NULL DEFAULT (''),
	[Category3] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission1] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission2] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission3] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission4] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission5] [nvarchar](80) NOT NULL DEFAULT (''),
	[Points] [nvarchar](50) NOT NULL DEFAULT (''),
	[StageStat1] [nvarchar](max) NOT NULL DEFAULT (''),
	[StageStat2] [nvarchar](max) NOT NULL DEFAULT (''),
	[StageStat3] [nvarchar](max) NOT NULL DEFAULT (''),
	[StageStat4] [nvarchar](max) NOT NULL DEFAULT (''),
	[StageStat5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](max) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](max) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[MemberGameInfoStages] PRIMARY KEY NONCLUSTERED 
(
	[MemberGameInfoStageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberGameInfoStages]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_MemberGameInfoStages] ON [CloudBread].[MemberGameInfoStages]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[MemberItemPurchases]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[MemberItemPurchases](
	[MemberItemPurchaseID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchaseQuantity] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchasePrice] [nvarchar](50) NOT NULL DEFAULT (''),
	[PGinfo1] [nvarchar](512) NOT NULL DEFAULT (''),
	[PGinfo2] [nvarchar](512) NOT NULL DEFAULT (''),
	[PGinfo3] [nvarchar](512) NOT NULL DEFAULT (''),
	[PGinfo4] [nvarchar](512) NOT NULL DEFAULT (''),
	[PGinfo5] [nvarchar](512) NOT NULL DEFAULT (''),
	[PurchaseDeviceID] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchaseDeviceIPAddress] [nvarchar](64) NOT NULL DEFAULT (''),
	[PurchaseDeviceMACAddress] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchaseDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[PurchaseCancelYN] [nvarchar](40) NOT NULL DEFAULT (''),
	[PurchaseCancelDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[PurchaseCancelingStatus] [nvarchar](40) NOT NULL DEFAULT (''),
	[PurchaseCancelReturnedAmount] [nvarchar](50) NOT NULL DEFAULT (''),
	[PurchaseCancelDeviceID] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchaseCancelDeviceIPAddress] [nvarchar](64) NOT NULL DEFAULT (''),
	[PurchaseCancelDeviceMACAddress] [nvarchar](128) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[PurchaseCancelConfirmAdminMemberID] [nvarchar](128) NOT NULL DEFAULT (''),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.MemberItemPurchases] PRIMARY KEY NONCLUSTERED 
(
	[MemberItemPurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberItemPurchases_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_MemberItemPurchases_CreatedAt] ON [CloudBread].[MemberItemPurchases]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[MemberItems]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[MemberItems](
	[MemberItemID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[ItemCount] [nvarchar](40) NOT NULL DEFAULT (''),
	[ItemStatus] [nvarchar](50) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL CONSTRAINT [DF__MemberIte__HideY__7BE56230]  DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL CONSTRAINT [DF__MemberIte__Delet__7CD98669]  DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.MemberItems] PRIMARY KEY NONCLUSTERED 
(
	[MemberItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberItems_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_MemberItems_CreatedAt] ON [CloudBread].[MemberItems]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[Members]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[Members](
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (newid()),
	[MemberPWD] [nvarchar](256) NOT NULL DEFAULT (''),
	[EmailAddress] [nvarchar](450) NOT NULL DEFAULT (''),
	[EmailConfirmedYN] [nvarchar](40) NOT NULL DEFAULT (''),
	[PhoneNumber1] [nvarchar](50) NOT NULL DEFAULT (''),
	[PhoneNumber2] [nvarchar](50) NOT NULL DEFAULT (''),
	[PINumber] [nvarchar](100) NOT NULL DEFAULT (''),
	[Name1] [nvarchar](100) NOT NULL DEFAULT (''),
	[Name2] [nvarchar](100) NOT NULL DEFAULT (''),
	[Name3] [nvarchar](100) NOT NULL DEFAULT (''),
	[DOB] [nvarchar](50) NOT NULL DEFAULT (''),
	[RecommenderID] [nvarchar](256) NOT NULL DEFAULT (''),
	[MemberGroup] [nvarchar](50) NOT NULL DEFAULT (''),
	[LastDeviceID] [nvarchar](128) NOT NULL DEFAULT (''),
	[LastIPaddress] [nvarchar](128) NOT NULL DEFAULT (''),
	[LastLoginDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[LastLogoutDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[LastMACAddress] [nvarchar](128) NOT NULL DEFAULT (''),
	[AccountBlockYN] [nvarchar](40) NOT NULL DEFAULT (''),
	[AccountBlockEndDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[AnonymousYN] [nvarchar](40) NOT NULL DEFAULT (''),
	[3rdAuthProvider] [nvarchar](128) NOT NULL DEFAULT (''),
	[3rdAuthID] [nvarchar](256) NOT NULL DEFAULT (''),
	[3rdAuthParam] [nvarchar](256) NOT NULL DEFAULT (''),
	[PushNotificationID] [nvarchar](450) NOT NULL DEFAULT (''),
	[PushNotificationProvider] [nvarchar](256) NOT NULL DEFAULT (''),
	[PushNotificationGroup] [nvarchar](256) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[TimeZoneID] [nvarchar](30) NOT NULL DEFAULT ('Korea Standard Time'),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.Members] PRIMARY KEY NONCLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Members_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_Members_CreatedAt] ON [CloudBread].[Members]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[Notices]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[Notices](
	[NoticeID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[NoticeCategory1] [nvarchar](50) NOT NULL DEFAULT (''),
	[NoticeCategory2] [nvarchar](50) NOT NULL DEFAULT (''),
	[NoticeCategory3] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetGroup] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetOS] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetDevice] [nvarchar](80) NOT NULL DEFAULT (''),
	[NoticeImageLink] [nvarchar](512) NOT NULL DEFAULT (''),
	[title] [nvarchar](100) NOT NULL DEFAULT (''),
	[content] [nvarchar](4000) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[NoticeDurationFrom] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[NoticeDurationTo] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[OrderNumber] [int] NOT NULL DEFAULT ((0)),
	[CreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[Notices] PRIMARY KEY NONCLUSTERED 
(
	[NoticeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Notices]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_Notices] ON [CloudBread].[Notices]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CloudBread].[ServerInfo]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[ServerInfo](
	[InfoID] [nvarchar](128) NOT NULL,
	[FEServerLists] [nvarchar](4000) NOT NULL,
	[SocketServerLists] [nvarchar](4000) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[ResourceLink] [nvarchar](4000) NOT NULL,
	[EULAText] [nvarchar](4000) NOT NULL,
	[sCol1] [nvarchar](max) NOT NULL,
	[sCol2] [nvarchar](max) NOT NULL,
	[sCol3] [nvarchar](max) NOT NULL,
	[sCol4] [nvarchar](max) NOT NULL,
	[sCol5] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[UpdatedAt] [datetimeoffset](7) NOT NULL,
	[DataFromRegion] [nvarchar](64) NOT NULL,
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_ServerInfo] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [CloudBread].[StatsData]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CloudBread].[StatsData](
	[StatID] [nvarchar](50) NOT NULL CONSTRAINT [DF_StatsData_StatID]  DEFAULT (newid()),
	[CategoryName] [nvarchar](256) NOT NULL CONSTRAINT [DF_Table_1_Group]  DEFAULT (''),
	[CountNum] [bigint] NOT NULL CONSTRAINT [DF_Table_1_Count]  DEFAULT ((0)),
	[Fields] [nvarchar](100) NOT NULL CONSTRAINT [DF_StatsData_Fileds]  DEFAULT (''),
	[CreatedAt] [datetimeoffset](7) NOT NULL CONSTRAINT [DF_StatsData_CreatedAt]  DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL CONSTRAINT [DF_StatsData_UpdatedAt]  DEFAULT (sysutcdatetime()),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
PRIMARY KEY NONCLUSTERED 
(
	[StatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_StatsData_CategoryName]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE CLUSTERED INDEX [IX_StatsData_CategoryName] ON [CloudBread].[StatsData]
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CloudBreadAdminLog]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CloudBreadAdminLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [varchar](256) NOT NULL,
	[JobID] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](2000) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CloudBreadErrorLog]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CloudBreadErrorLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [varchar](256) NOT NULL,
	[JobID] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL DEFAULT (sysutcdatetime()),
	[Thread] [varchar](2000) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CloudBreadLog]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CloudBreadLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [varchar](256) NOT NULL,
	[JobID] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](2000) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionId] [nvarchar](88) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Expires] [datetime] NOT NULL,
	[LockDate] [datetime] NOT NULL,
	[LockCookie] [int] NOT NULL,
	[Locked] [bit] NOT NULL,
	[SessionItem] [image] NULL,
	[Flags] [int] NOT NULL,
	[Timeout] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AdminMembers_AdminMemberEmail]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AdminMembers_AdminMemberEmail] ON [CloudBread].[AdminMembers]
(
	[AdminMemberEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AdminMembers_Name1]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_AdminMembers_Name1] ON [CloudBread].[AdminMembers]
(
	[Name1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Coupon_CouponDurationFrom]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_Coupon_CouponDurationFrom] ON [CloudBread].[Coupon]
(
	[CouponDurationFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Coupon_CouponDurationTo]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_Coupon_CouponDurationTo] ON [CloudBread].[Coupon]
(
	[CouponDurationTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Coupon_ItemListID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_Coupon_ItemListID] ON [CloudBread].[Coupon]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CouponMember_CouponID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_CouponMember_CouponID] ON [CloudBread].[CouponMember]
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CouponMember_MemberID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_CouponMember_MemberID] ON [CloudBread].[CouponMember]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GameEventMember_eventID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_GameEventMember_eventID] ON [CloudBread].[GameEventMember]
(
	[eventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GameEventMember_MemberID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_GameEventMember_MemberID] ON [CloudBread].[GameEventMember]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GameEvents_EventDurationFrom]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_GameEvents_EventDurationFrom] ON [CloudBread].[GameEvents]
(
	[EventDurationFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GameEvents_EventDurationTo]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_GameEvents_EventDurationTo] ON [CloudBread].[GameEvents]
(
	[EventDurationTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GameEvents_ItemListID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_GameEvents_ItemListID] ON [CloudBread].[GameEvents]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GiftDepositories_FromMemberID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_GiftDepositories_FromMemberID] ON [CloudBread].[GiftDepositories]
(
	[FromMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GiftDepositories_ItemListID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_GiftDepositories_ItemListID] ON [CloudBread].[GiftDepositories]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GiftDepositories_ToMemberID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_GiftDepositories_ToMemberID] ON [CloudBread].[GiftDepositories]
(
	[ToMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemLists_ItemCategory1]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_ItemLists_ItemCategory1] ON [CloudBread].[ItemLists]
(
	[ItemCategory1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemLists_ItemCategory2]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_ItemLists_ItemCategory2] ON [CloudBread].[ItemLists]
(
	[ItemCategory2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemLists_ItemCategory3]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_ItemLists_ItemCategory3] ON [CloudBread].[ItemLists]
(
	[ItemCategory3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemLists_ItemName]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_ItemLists_ItemName] ON [CloudBread].[ItemLists]
(
	[ItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberAccountBlockLog_CreateAdminID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_MemberAccountBlockLog_CreateAdminID] ON [CloudBread].[MemberAccountBlockLog]
(
	[CreateAdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberAccountBlockLog_MemberID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_MemberAccountBlockLog_MemberID] ON [CloudBread].[MemberAccountBlockLog]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberGameInfoStages_MemberID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_MemberGameInfoStages_MemberID] ON [CloudBread].[MemberGameInfoStages]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItemPurchases_ItemListID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItemPurchases_ItemListID] ON [CloudBread].[MemberItemPurchases]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItemPurchases_MemberID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItemPurchases_MemberID] ON [CloudBread].[MemberItemPurchases]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItemPurchases_PurchaseCancelDeviceID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItemPurchases_PurchaseCancelDeviceID] ON [CloudBread].[MemberItemPurchases]
(
	[PurchaseCancelDeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItemPurchases_PurchaseDeviceID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItemPurchases_PurchaseDeviceID] ON [CloudBread].[MemberItemPurchases]
(
	[PurchaseDeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItems_ItemListID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItems_ItemListID] ON [CloudBread].[MemberItems]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItems_MemberID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItems_MemberID] ON [CloudBread].[MemberItems]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_3rdAuthID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_Members_3rdAuthID] ON [CloudBread].[Members]
(
	[3rdAuthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_EmailAddress]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Members_EmailAddress] ON [CloudBread].[Members]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_LastDeviceID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_Members_LastDeviceID] ON [CloudBread].[Members]
(
	[LastDeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_Name1]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_Members_Name1] ON [CloudBread].[Members]
(
	[Name1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_PushNotificationID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_Members_PushNotificationID] ON [CloudBread].[Members]
(
	[PushNotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Notices_CreateAdminID]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_Notices_CreateAdminID] ON [CloudBread].[Notices]
(
	[CreateAdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StatsData_CreatedAt]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_StatsData_CreatedAt] ON [CloudBread].[StatsData]
(
	[CreatedAt] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sessions_Expires]    Script Date: 2015-03-15 오후 11:20:15 ******/
CREATE NONCLUSTERED INDEX [IX_Sessions_Expires] ON [dbo].[Sessions]
(
	[Expires] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_InfoID]  DEFAULT (newid()) FOR [InfoID]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_FEServerLists]  DEFAULT ('') FOR [FEServerLists]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_SocketServerLists]  DEFAULT ('') FOR [SocketServerLists]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_Version]  DEFAULT ('') FOR [Version]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_ResourceLink]  DEFAULT ('') FOR [ResourceLink]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_EULAText]  DEFAULT ('') FOR [EULAText]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_sCol1]  DEFAULT ('') FOR [sCol1]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_sCol2]  DEFAULT ('') FOR [sCol2]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_sCol3]  DEFAULT ('') FOR [sCol3]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_sCol4]  DEFAULT ('') FOR [sCol4]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_sCol5]  DEFAULT ('') FOR [sCol5]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_UpdatedAt]  DEFAULT (sysutcdatetime()) FOR [UpdatedAt]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_DataFromRegion]  DEFAULT ('') FOR [DataFromRegion]
GO
ALTER TABLE [CloudBread].[ServerInfo] ADD  CONSTRAINT [DF_ServerInfo_DataFromRegionDT]  DEFAULT ('') FOR [DataFromRegionDT]
GO
ALTER TABLE [dbo].[CloudBreadAdminLog] ADD  DEFAULT (sysutcdatetime()) FOR [Date]
GO
ALTER TABLE [dbo].[CloudBreadLog] ADD  DEFAULT (sysutcdatetime()) FOR [Date]
GO
/****** Object:  StoredProcedure [CloudBread].[uspAddMemberItemPurchase]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspAddMemberItemPurchase]
 @InsertORUpdate nvarchar(MAX) = NULL	-- 문자열은 INSERT  또는 UPDATE
--MemberItems 테이블
 , @MemberItemID_MemberItems nvarchar(MAX) 	= NULL
, @MemberID_MemberItems nvarchar(MAX)	 = NULL	--MemberID  편의상 중복
, @ItemListID_MemberItems nvarchar(MAX) = NULL
, @ItemCount_MemberItems nvarchar(MAX) = NULL
, @ItemStatus_MemberItems nvarchar(MAX) = NULL
--, @HideYN_MemberItems nvarchar(MAX) = NULL
--, @DeleteYN_MemberItems nvarchar(MAX) = NULL
, @sCol1_MemberItems nvarchar(MAX) = NULL
, @sCol2_MemberItems nvarchar(MAX) = NULL
, @sCol3_MemberItems nvarchar(MAX) = NULL
, @sCol4_MemberItems nvarchar(MAX) = NULL
, @sCol5_MemberItems nvarchar(MAX) = NULL
, @sCol6_MemberItems nvarchar(MAX) = NULL
, @sCol7_MemberItems nvarchar(MAX) = NULL
, @sCol8_MemberItems nvarchar(MAX) = NULL
, @sCol9_MemberItems nvarchar(MAX) = NULL
, @sCol10_MemberItems nvarchar(MAX) = NULL
--MemberItemPurchases 테이블 /
, @MemberID_MemberItemPurchases nvarchar(MAX) = NULL	--MemberID  편의상 중복
, @ItemListID_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseQuantity_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchasePrice_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo1_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo2_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo3_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo4_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo5_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseDeviceID_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseDeviceIPAddress_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseDeviceMACAddress_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseDT_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelYN_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelDT_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelingStatus_MemberItemPurchases nvarchar(MAX) = NULL
--, @PurchaseCancelConfirmAdminMemberID_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelReturnedAmount_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelDeviceID_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelDeviceIPAddress_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelDeviceMACAddress_MemberItemPurchases nvarchar(MAX) = NULL
--, @HideYN_MemberItemPurchases nvarchar(MAX) = NULL
--, @DeleteYN_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol1_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol2_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol3_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol4_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol5_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol6_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol7_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol8_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol9_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol10_MemberItemPurchases nvarchar(MAX) = NULL
--MemberGameInfoes 테이블 파라미터
, @MemberID_MemberGameInfoes nvarchar(MAX) = NULL		--편의상 중복
, @Level_MemberGameInfoes nvarchar(MAX) = NULL
, @Exps_MemberGameInfoes nvarchar(MAX) = NULL
, @Points_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT1_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT2_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT3_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT4_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT5_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT6_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT7_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT8_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT9_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT10_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol1_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol2_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol3_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol4_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol5_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol6_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol7_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol8_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol9_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol10_MemberGameInfoes nvarchar(MAX) = NULL
AS 
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
if upper(@InsertORUpdate) = 'INSERT' 
	begin
		begin tran
			--MemberItems에 삽입하고,  MemberItemPurchases에 삽입하고 MemberGameInfoes 를 업데이트
			--MemberItems에 삽입
			insert into CloudBread.MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10) 
			values(newid(), @MemberID_MemberItems, @ItemListID_MemberItems, @ItemCount_MemberItems, @ItemStatus_MemberItems
			, @sCol1_MemberItems, @sCol2_MemberItems, @sCol3_MemberItems, @sCol4_MemberItems, @sCol5_MemberItems, @sCol6_MemberItems, @sCol7_MemberItems, @sCol8_MemberItems, @sCol9_MemberItems, @sCol10_MemberItems)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			--MemberItemPurchases에 삽입
			insert into CloudBread.MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus,  PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
			values(newid(), @MemberID_MemberItemPurchases ,  @ItemListID_MemberItemPurchases ,  @PurchaseQuantity_MemberItemPurchases ,  @PurchasePrice_MemberItemPurchases ,  @PGinfo1_MemberItemPurchases ,  @PGinfo2_MemberItemPurchases ,  @PGinfo3_MemberItemPurchases ,  @PGinfo4_MemberItemPurchases ,  @PGinfo5_MemberItemPurchases ,  @PurchaseDeviceID_MemberItemPurchases ,  @PurchaseDeviceIPAddress_MemberItemPurchases ,  @PurchaseDeviceMACAddress_MemberItemPurchases ,  @PurchaseDT_MemberItemPurchases ,  @PurchaseCancelYN_MemberItemPurchases ,  @PurchaseCancelDT_MemberItemPurchases ,  @PurchaseCancelingStatus_MemberItemPurchases
			,  @PurchaseCancelReturnedAmount_MemberItemPurchases ,  @PurchaseCancelDeviceID_MemberItemPurchases ,  @PurchaseCancelDeviceIPAddress_MemberItemPurchases ,  @PurchaseCancelDeviceMACAddress_MemberItemPurchases ,  @sCol1_MemberItemPurchases ,  @sCol2_MemberItemPurchases ,  @sCol3_MemberItemPurchases ,  @sCol4_MemberItemPurchases ,  @sCol5_MemberItemPurchases ,  @sCol6_MemberItemPurchases ,  @sCol7_MemberItemPurchases ,  @sCol8_MemberItemPurchases ,  @sCol9_MemberItemPurchases ,  @sCol10_MemberItemPurchases)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			-- MemberGameInfoes 수정
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6   END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7   END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8   END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					, UpdatedAt = sysutcdatetime()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@InsertORUpdate) = 'UPDATE'
	begin
		begin tran
			--MemberItems에 수정하고,  MemberItemPurchases에 삽입하고 MemberGameInfoes 를 업데이트
			--MemberItems에 수정
			update MemberItems set
				MemberID = CASE WHEN @MemberID_MemberItems is not null THEN @MemberID_MemberItems  ELSE MemberID   END
				, ItemListID = CASE WHEN @ItemListID_MemberItems is not null THEN @ItemListID_MemberItems  ELSE  ItemListID  END
				, ItemCount = CASE WHEN @ItemCount_MemberItems is not null THEN @ItemCount_MemberItems  ELSE   ItemCount END
				, ItemStatus = CASE WHEN @ItemStatus_MemberItems is not null THEN @ItemStatus_MemberItems  ELSE  ItemStatus  END
				, sCol1 = CASE WHEN @sCol1_MemberItems is not null THEN @sCol1_MemberItems  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItems is not null THEN @sCol2_MemberItems  ELSE  sCol2 END
				, sCol3 = CASE WHEN @sCol3_MemberItems is not null THEN @sCol3_MemberItems  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItems is not null THEN @sCol4_MemberItems  ELSE  sCol4  END
				, sCol5 = CASE WHEN @sCol5_MemberItems is not null THEN @sCol5_MemberItems  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItems is not null THEN @sCol6_MemberItems  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItems is not null THEN @sCol7_MemberItems  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItems is not null THEN @sCol8_MemberItems  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItems is not null THEN @sCol9_MemberItems  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItems is not null THEN @sCol10_MemberItems  ELSE  sCol10  END
				, UpdatedAt = sysutcdatetime()
			where MemberItemID like @MemberItemID_MemberItems
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			--MemberItemPurchases에 삽입
			insert into CloudBread.MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
			values(newid(), @MemberID_MemberItemPurchases ,  @ItemListID_MemberItemPurchases ,  @PurchaseQuantity_MemberItemPurchases ,  @PurchasePrice_MemberItemPurchases ,  @PGinfo1_MemberItemPurchases ,  @PGinfo2_MemberItemPurchases ,  @PGinfo3_MemberItemPurchases ,  @PGinfo4_MemberItemPurchases ,  @PGinfo5_MemberItemPurchases ,  @PurchaseDeviceID_MemberItemPurchases ,  @PurchaseDeviceIPAddress_MemberItemPurchases ,  @PurchaseDeviceMACAddress_MemberItemPurchases ,  @PurchaseDT_MemberItemPurchases ,  @PurchaseCancelYN_MemberItemPurchases ,  @PurchaseCancelDT_MemberItemPurchases ,  @PurchaseCancelingStatus_MemberItemPurchases ,   @PurchaseCancelReturnedAmount_MemberItemPurchases ,  @PurchaseCancelDeviceID_MemberItemPurchases ,  @PurchaseCancelDeviceIPAddress_MemberItemPurchases ,  @PurchaseCancelDeviceMACAddress_MemberItemPurchases ,@sCol1_MemberItemPurchases ,  @sCol2_MemberItemPurchases ,  @sCol3_MemberItemPurchases ,  @sCol4_MemberItemPurchases ,  @sCol5_MemberItemPurchases ,  @sCol6_MemberItemPurchases ,  @sCol7_MemberItemPurchases ,  @sCol8_MemberItemPurchases ,  @sCol9_MemberItemPurchases ,  @sCol10_MemberItemPurchases)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			-- MemberGameInfoes 수정
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE Points   END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6  END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7  END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8  END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					, UpdatedAt = sysutcdatetime()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end

select @rowcount as Result


GO
/****** Object:  StoredProcedure [CloudBread].[uspAddUseMemberItem]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspAddUseMemberItem]
@InsertORUpdateORDelete nvarchar(MAX) = NULL
		--  MemberItems 테이블 처리
		-- 수집일 경우 인벤에 없으면 insert, 있으면 update  - 클라이언트에서 분기 
		-- 사용일 경우 인벤에 있고,  수량-사용하려는 수량 > 0 이면 update.  수량-사용하려는 수량 = 0 이면 삭제
,@MemberItemID_MemberItem nvarchar(MAX) = NULL
,@MemberID_MemberItem nvarchar(MAX) = NULL
,@ItemListID_MemberItem nvarchar(MAX) = NULL
,@ItemCount_MemberItem nvarchar(MAX) = NULL
,@ItemStatus_MemberItem nvarchar(MAX) = NULL
--,@HideYN_MemberItem nvarchar(MAX) = NULL
--,@DeleteYN_MemberItem nvarchar(MAX) = NULL
,@sCol1_MemberItem nvarchar(MAX) = NULL
,@sCol2_MemberItem nvarchar(MAX) = NULL
,@sCol3_MemberItem nvarchar(MAX) = NULL
,@sCol4_MemberItem nvarchar(MAX) = NULL
,@sCol5_MemberItem nvarchar(MAX) = NULL
,@sCol6_MemberItem nvarchar(MAX) = NULL
,@sCol7_MemberItem nvarchar(MAX) = NULL
,@sCol8_MemberItem nvarchar(MAX) = NULL
,@sCol9_MemberItem nvarchar(MAX) = NULL
,@sCol10_MemberItem nvarchar(MAX) = NULL
,@MemberID_MemberGameInfoes nvarchar(MAX) = NULL
,@Level_MemberGameInfoes nvarchar(MAX) = NULL
,@Exps_MemberGameInfoes nvarchar(MAX) = NULL
,@Points_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT1_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT2_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT3_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT4_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT5_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT6_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT7_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT8_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT9_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT10_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol1_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol2_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol3_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol4_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol5_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol6_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol7_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol8_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol9_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol10_MemberGameInfoes nvarchar(MAX) = NULL

AS 
--set, lock 옵션 등 체크
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
if upper(@InsertORUpdateORDelete) = 'INSERT' 
	begin
		begin tran
			--MemberItems에 추가하고,  MemberGamesInfoes에 수정
			--MemberItems에 추가
			insert into CloudBread.MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
			values(
				NEWID() 
				,@MemberID_MemberItem 
				,@ItemListID_MemberItem 
				,@ItemCount_MemberItem 
				,@ItemStatus_MemberItem 
				--,@HideYN_MemberItem 
				--,@DeleteYN_MemberItem 
				,@sCol1_MemberItem 
				,@sCol2_MemberItem 
				,@sCol3_MemberItem 
				,@sCol4_MemberItem 
				,@sCol5_MemberItem 
				,@sCol6_MemberItem 
				,@sCol7_MemberItem 
				,@sCol8_MemberItem 
				,@sCol9_MemberItem 
				,@sCol10_MemberItem 
				)
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- MemberGamesInfoes update 수행
			update CloudBread.MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6   END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7   END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8   END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					, UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@InsertORUpdateORDelete) = 'UPDATE'
	begin
		begin tran
			--MemberItems에 수정하고,  MemberGameInfoes에 update 
			--MemberItems에 수정
			update CloudBread.MemberItems set
				MemberID = CASE WHEN @MemberID_MemberItem is not null THEN @MemberID_MemberItem  ELSE MemberID   END
				, ItemListID = CASE WHEN @ItemListID_MemberItem is not null THEN @ItemListID_MemberItem  ELSE  ItemListID  END
				, ItemCount = CASE WHEN @ItemCount_MemberItem is not null THEN @ItemCount_MemberItem  ELSE   ItemCount END
				, ItemStatus = CASE WHEN @ItemStatus_MemberItem is not null THEN @ItemStatus_MemberItem  ELSE  ItemStatus  END
				--, HideYN = CASE WHEN @HideYN_MemberItem is not null THEN @HideYN_MemberItem  ELSE  HideYN  END
				--, DeleteYN = CASE WHEN @DeleteYN_MemberItem is not null THEN @DeleteYN_MemberItem  ELSE  DeleteYN  END
				, sCol1 = CASE WHEN @sCol1_MemberItem is not null THEN @sCol1_MemberItem  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItem is not null THEN @sCol2_MemberItem  ELSE  sCol2 END
				, sCol3 = CASE WHEN @sCol3_MemberItem is not null THEN @sCol3_MemberItem  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItem is not null THEN @sCol4_MemberItem  ELSE  sCol4  END
				, sCol5 = CASE WHEN @sCol5_MemberItem is not null THEN @sCol5_MemberItem  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItem is not null THEN @sCol6_MemberItem  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItem is not null THEN @sCol7_MemberItem  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItem is not null THEN @sCol8_MemberItem  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItem is not null THEN @sCol9_MemberItem  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItem is not null THEN @sCol10_MemberItem  ELSE  sCol10  END
				,UpdatedAt = SYSUTCDATETIME()
			where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- MemberGameInfoes 를 update 수행
			update CloudBread.MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6   END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7   END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8   END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					,UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes

			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end

if upper(@InsertORUpdateORDelete) = 'DELETE'
	begin
		begin tran
			--MemberItems에 삭제하고,  MemberGameInfoes에 update 
			--MemberItems에 삭제
			--delete from CloudBread.MemberItems where MemberItemID like @MemberItemID_MemberItem
			update CloudBread.MemberItems set DeleteYN = 'Y', UpdatedAt = SYSUTCDATETIME() where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- MemberGameInfoes 를 update 수행
			update CloudBread.MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6   END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7   END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8   END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
				where MemberID like @MemberID_MemberGameInfoes

			set @rowcount = @rowcount + (select @@ROWCOUNT)

		commit tran
	end


select @rowcount as Result

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelCoupon]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelCoupon]
@CouponID NVARCHAR(MAX)
AS 
select CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.Coupon with(nolock)
where CouponID like @CouponID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelCouponMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelCouponMember]
@CouponMemberID NVARCHAR(MAX)
AS 
select CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.CouponMember with(nolock)
where CouponMemberID like @CouponMemberID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelGameEventMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelGameEventMember]
@GameEventMemberID NVARCHAR(MAX)
AS 
select GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 from CloudBread.GameEventMember with(nolock)
where GameEventMemberID like @GameEventMemberID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelGameEvents]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelGameEvents]
@GameEventID NVARCHAR(MAX)
AS 
select GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.GameEvents with(nolock)
where GameEventID like @GameEventID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelGiftDepository]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelGiftDepository]
@GiftDepositoryID NVARCHAR(MAX)
AS 
select 
GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.GiftDepositories with(nolock)
where GiftDepositoryID like @GiftDepositoryID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelItemList1]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelItemList1]
 @ItemListID nvarchar(max)
AS 
	SELECT 
	ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
	FROM CloudBread.ItemLists
	WHERE ItemListID like @ItemListID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelMember]
@MemberID NVARCHAR(MAX)
AS 
select MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.Members with(nolock)
where MemberID like @MemberID
and HideYN like 'N'
and DeleteYN like 'N'


GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelMemberGameInfoes]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelMemberGameInfoes]
@MemberID NVARCHAR(MAX)
AS 
select MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.MemberGameInfoes with(nolock)
where MemberID like @MemberID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelMemberGameInfoStages]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelMemberGameInfoStages]
@MemberGameInfoStageID NVARCHAR(MAX)
AS 
select MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.MemberGameInfoStages with(nolock)
where MemberGameInfoStageID like @MemberGameInfoStageID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelMemberItem]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelMemberItem]
 @MemberItemID varchar(max)
AS 
	SELECT 
	MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
	FROM CloudBread.MemberItems with(nolock)
	WHERE MemberItemID like @MemberItemID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelMemberItemPurchase]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelMemberItemPurchase]
@MemberItemPurchaseID NVARCHAR(MAX)
AS 
select MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.MemberItemPurchases with(nolock)
where MemberItemPurchaseID like @MemberItemPurchaseID  and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComSelNotices]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComSelNotices]
@NoticeID NVARCHAR(MAX)
AS 
select NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.Notices with(nolock)
where NoticeID like @NoticeID and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspComUdtGiftDepository]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComUdtGiftDepository]
@GiftDepositoryID nvarchar(MAX) = NULL
,@ItemListID nvarchar(MAX) = NULL
,@ItemCount nvarchar(MAX) = NULL
,@FromMemberID nvarchar(MAX) = NULL
,@ToMemberID nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL
AS 
--set, lock 옵션 등 체크
set nocount on
update CloudBread.GiftDepositories
set  
ItemListID = CASE WHEN @ItemListID is not null THEN @ItemListID ELSE  ItemListID END
, ItemCount = CASE WHEN @ItemCount is not null THEN @ItemCount ELSE  ItemCount END
, FromMemberID = CASE WHEN @FromMemberID is not null THEN @FromMemberID ELSE  FromMemberID END
, ToMemberID = CASE WHEN @ToMemberID is not null THEN @ToMemberID ELSE  ToMemberID END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
,UpdatedAt = sysutcdatetime()
where GiftDepositoryID like @GiftDepositoryID
select @@ROWCOUNT as Reslut

GO
/****** Object:  StoredProcedure [CloudBread].[uspComUdtItemList1]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [CloudBread].[uspComUdtItemList1]
@ItemListID nvarchar(MAX) = NULL
,@ItemName nvarchar(MAX) = NULL
,@ItemDescription nvarchar(MAX) = NULL
,@ItemPrice nvarchar(MAX) = NULL
,@ItemSellPrice nvarchar(MAX) = NULL
,@ItemCategory1 nvarchar(MAX) = NULL
,@ItemCategory2 nvarchar(MAX) = NULL
,@ItemCategory3 nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL
as
set nocount on
update CloudBread.ItemLists set
 ItemName = CASE WHEN @ItemName is not null THEN @ItemName ELSE  ItemName END
, ItemDescription = CASE WHEN @ItemDescription is not null THEN @ItemDescription ELSE  ItemDescription END
, ItemPrice = CASE WHEN @ItemPrice is not null THEN @ItemPrice ELSE  ItemPrice END
, ItemSellPrice = CASE WHEN @ItemSellPrice is not null THEN @ItemSellPrice ELSE  ItemSellPrice END
, ItemCategory1 = CASE WHEN @ItemCategory1 is not null THEN @ItemCategory1 ELSE  ItemCategory1 END
, ItemCategory2 = CASE WHEN @ItemCategory2 is not null THEN @ItemCategory2 ELSE  ItemCategory2 END
, ItemCategory3 = CASE WHEN @ItemCategory3 is not null THEN @ItemCategory3 ELSE  ItemCategory3 END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
,UpdatedAt = sysutcdatetime()
where ItemListID like @ItemListID
select @@rowcount as Reslut

GO
/****** Object:  StoredProcedure [CloudBread].[uspComUdtMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComUdtMember]
 @MemberID nvarchar(MAX) = NULL
,@MemberPWD nvarchar(MAX) = NULL
,@EmailAddress nvarchar(MAX) = NULL
,@EmailConfirmedYN nvarchar(MAX) = NULL
,@PhoneNumber1 nvarchar(MAX) = NULL
,@PhoneNumber2 nvarchar(MAX) = NULL
,@PINumber nvarchar(MAX) = NULL
,@Name1 nvarchar(MAX) = NULL
,@Name2 nvarchar(MAX) = NULL
,@Name3 nvarchar(MAX) = NULL
,@DOB nvarchar(MAX) = NULL
,@RecommenderID nvarchar(MAX) = NULL
,@MemberGroup nvarchar(MAX) = NULL
,@LastDeviceID nvarchar(MAX) = NULL
,@LastIPaddress nvarchar(MAX) = NULL
,@LastLoginDT nvarchar(MAX) = NULL
,@LastLogoutDT nvarchar(MAX) = NULL
,@LastMACAddress nvarchar(MAX) = NULL
,@AccountBlockYN nvarchar(MAX) = NULL
,@AccountBlockEndDT nvarchar(MAX) = NULL
,@AnonymousYN nvarchar(MAX) = NULL
,@3rdAuthProvider nvarchar(MAX) = NULL
,@3rdAuthID nvarchar(MAX) = NULL
,@3rdAuthParam nvarchar(MAX) = NULL
,@PushNotificationID nvarchar(MAX) = NULL
,@PushNotificationProvider nvarchar(MAX) = NULL
,@PushNotificationGroup nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL
,@TimeZoneID nvarchar(MAX) = NULL		-- 암호화 안함
AS 
--set, lock 옵션 등 체크
set nocount on
update CloudBread.Members
set  
 MemberPWD = CASE WHEN @MemberPWD is not null THEN @MemberPWD ELSE  MemberPWD END
, EmailAddress = CASE WHEN @EmailAddress is not null THEN @EmailAddress ELSE  EmailAddress END
, EmailConfirmedYN = CASE WHEN @EmailConfirmedYN is not null THEN @EmailConfirmedYN ELSE  EmailConfirmedYN END
, PhoneNumber1 = CASE WHEN @PhoneNumber1 is not null THEN @PhoneNumber1 ELSE  PhoneNumber1 END
, PhoneNumber2 = CASE WHEN @PhoneNumber2 is not null THEN @PhoneNumber2 ELSE  PhoneNumber2 END
, PINumber = CASE WHEN @PINumber is not null THEN @PINumber ELSE  PINumber END
, Name1 = CASE WHEN @Name1 is not null THEN @Name1 ELSE  Name1 END
, Name2 = CASE WHEN @Name2 is not null THEN @Name2 ELSE  Name2 END
, Name3 = CASE WHEN @Name3 is not null THEN @Name3 ELSE  Name3 END
, DOB = CASE WHEN @DOB is not null THEN @DOB ELSE  DOB END
, RecommenderID = CASE WHEN @RecommenderID is not null THEN @RecommenderID ELSE  RecommenderID END
, MemberGroup = CASE WHEN @MemberGroup is not null THEN @MemberGroup ELSE  MemberGroup END
, LastDeviceID = CASE WHEN @LastDeviceID is not null THEN @LastDeviceID ELSE  LastDeviceID END
, LastIPaddress = CASE WHEN @LastIPaddress is not null THEN @LastIPaddress ELSE  LastIPaddress END
, LastLoginDT = CASE WHEN @LastLoginDT is not null THEN @LastLoginDT ELSE  LastLoginDT END
, LastLogoutDT = CASE WHEN @LastLogoutDT is not null THEN @LastLogoutDT ELSE  LastLogoutDT END
, LastMACAddress = CASE WHEN @LastMACAddress is not null THEN @LastMACAddress ELSE  LastMACAddress END
, AccountBlockYN = CASE WHEN @AccountBlockYN is not null THEN @AccountBlockYN ELSE  AccountBlockYN END
, AccountBlockEndDT = CASE WHEN @AccountBlockEndDT is not null THEN @AccountBlockEndDT ELSE  AccountBlockEndDT END
, AnonymousYN = CASE WHEN @AnonymousYN is not null THEN @AnonymousYN ELSE  AnonymousYN END
, [3rdAuthProvider] = CASE WHEN @3rdAuthProvider is not null THEN @3rdAuthProvider ELSE  [3rdAuthProvider] END
, [3rdAuthID] = CASE WHEN @3rdAuthID is not null THEN @3rdAuthID ELSE  [3rdAuthID] END
, [3rdAuthParam] = CASE WHEN @3rdAuthParam is not null THEN @3rdAuthParam ELSE  [3rdAuthParam] END
, PushNotificationID = CASE WHEN @PushNotificationID is not null THEN @PushNotificationID ELSE  PushNotificationID END
, PushNotificationProvider = CASE WHEN @PushNotificationProvider is not null THEN @PushNotificationProvider ELSE  PushNotificationProvider END
, PushNotificationGroup = CASE WHEN @PushNotificationGroup is not null THEN @PushNotificationGroup ELSE  PushNotificationGroup END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
, TimeZoneID = CASE WHEN @TimeZoneID is not null THEN @TimeZoneID ELSE  TimeZoneID END
, UpdatedAt = sysutcdatetime()
where MemberID like @MemberID and MemberPWD like @MemberPWD and HideYN like 'N' and DeleteYN like 'N'
select @@ROWCOUNT as Reslut


GO
/****** Object:  StoredProcedure [CloudBread].[uspComUdtMemberGameInfoes]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComUdtMemberGameInfoes]
@MemberID nvarchar(MAX) = NULL
,@Level nvarchar(MAX) = NULL
,@Exps nvarchar(MAX) = NULL
,@Points nvarchar(MAX) = NULL
,@UserSTAT1 nvarchar(MAX) = NULL
,@UserSTAT2 nvarchar(MAX) = NULL
,@UserSTAT3 nvarchar(MAX) = NULL
,@UserSTAT4 nvarchar(MAX) = NULL
,@UserSTAT5 nvarchar(MAX) = NULL
,@UserSTAT6 nvarchar(MAX) = NULL
,@UserSTAT7 nvarchar(MAX) = NULL
,@UserSTAT8 nvarchar(MAX) = NULL
,@UserSTAT9 nvarchar(MAX) = NULL
,@UserSTAT10 nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL

AS 
--set, lock 옵션 등 체크
set nocount on
update CloudBread.MemberGameInfoes
set  
Level = CASE WHEN @Level is not null THEN @Level ELSE  Level END
, Exps = CASE WHEN @Exps is not null THEN @Exps ELSE  Exps END
, Points = CASE WHEN @Points is not null THEN @Points ELSE  Points END
, UserSTAT1 = CASE WHEN @UserSTAT1 is not null THEN @UserSTAT1 ELSE  UserSTAT1 END
, UserSTAT2 = CASE WHEN @UserSTAT2 is not null THEN @UserSTAT2 ELSE  UserSTAT2 END
, UserSTAT3 = CASE WHEN @UserSTAT3 is not null THEN @UserSTAT3 ELSE  UserSTAT3 END
, UserSTAT4 = CASE WHEN @UserSTAT4 is not null THEN @UserSTAT4 ELSE  UserSTAT4 END
, UserSTAT5 = CASE WHEN @UserSTAT5 is not null THEN @UserSTAT5 ELSE  UserSTAT5 END
, UserSTAT6 = CASE WHEN @UserSTAT6 is not null THEN @UserSTAT6 ELSE  UserSTAT6 END
, UserSTAT7 = CASE WHEN @UserSTAT7 is not null THEN @UserSTAT7 ELSE  UserSTAT7 END
, UserSTAT8 = CASE WHEN @UserSTAT8 is not null THEN @UserSTAT8 ELSE  UserSTAT8 END
, UserSTAT9 = CASE WHEN @UserSTAT9 is not null THEN @UserSTAT9 ELSE  UserSTAT9 END
, UserSTAT10 = CASE WHEN @UserSTAT10 is not null THEN @UserSTAT10 ELSE  UserSTAT10 END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
,UpdatedAt = sysutcdatetime()
where MemberID like @MemberID
select @@ROWCOUNT as Reslut


GO
/****** Object:  StoredProcedure [CloudBread].[uspComUdtMemberGameInfoStages]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [CloudBread].[uspComUdtMemberGameInfoStages]
@MemberGameInfoStageID nvarchar(MAX) = NULL
,@MemberID nvarchar(MAX) = NULL
,@StageName nvarchar(MAX) = NULL
,@StageStatus nvarchar(MAX) = NULL
,@Category1 nvarchar(MAX) = NULL
,@Category2 nvarchar(MAX) = NULL
,@Category3 nvarchar(MAX) = NULL
,@Mission1 nvarchar(MAX) = NULL
,@Mission2 nvarchar(MAX) = NULL
,@Mission3 nvarchar(MAX) = NULL
,@Mission4 nvarchar(MAX) = NULL
,@Mission5 nvarchar(MAX) = NULL
,@Points nvarchar(MAX) = NULL
,@StageStat1 nvarchar(MAX) = NULL
,@StageStat2 nvarchar(MAX) = NULL
,@StageStat3 nvarchar(MAX) = NULL
,@StageStat4 nvarchar(MAX) = NULL
,@StageStat5 nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL
as
set nocount on
update CloudBread.MemberGameInfoStages
set
MemberID = CASE WHEN @MemberID is not null THEN @MemberID ELSE  MemberID END
, StageName = CASE WHEN @StageName is not null THEN @StageName ELSE  StageName END
, StageStatus = CASE WHEN @StageStatus is not null THEN @StageStatus ELSE  StageStatus END
, Category1 = CASE WHEN @Category1 is not null THEN @Category1 ELSE  Category1 END
, Category2 = CASE WHEN @Category2 is not null THEN @Category2 ELSE  Category2 END
, Category3 = CASE WHEN @Category3 is not null THEN @Category3 ELSE  Category3 END
, Mission1 = CASE WHEN @Mission1 is not null THEN @Mission1 ELSE  Mission1 END
, Mission2 = CASE WHEN @Mission2 is not null THEN @Mission2 ELSE  Mission2 END
, Mission3 = CASE WHEN @Mission3 is not null THEN @Mission3 ELSE  Mission3 END
, Mission4 = CASE WHEN @Mission4 is not null THEN @Mission4 ELSE  Mission4 END
, Mission5 = CASE WHEN @Mission5 is not null THEN @Mission5 ELSE  Mission5 END
, Points = CASE WHEN @Points is not null THEN @Points ELSE  Points END
, StageStat1 = CASE WHEN @StageStat1 is not null THEN @StageStat1 ELSE  StageStat1 END
, StageStat2 = CASE WHEN @StageStat2 is not null THEN @StageStat2 ELSE  StageStat2 END
, StageStat3 = CASE WHEN @StageStat3 is not null THEN @StageStat3 ELSE  StageStat3 END
, StageStat4 = CASE WHEN @StageStat4 is not null THEN @StageStat4 ELSE  StageStat4 END
, StageStat5 = CASE WHEN @StageStat5 is not null THEN @StageStat5 ELSE  StageStat5 END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
,UpdatedAt = sysutcdatetime()
where MemberGameInfoStageID like @MemberGameInfoStageID
select @@rowcount as Result

GO
/****** Object:  StoredProcedure [CloudBread].[uspComUdtMemberItem]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComUdtMemberItem]
@MemberItemID nvarchar(MAX) = NULL
,@MemberID nvarchar(MAX) = NULL
,@ItemListID nvarchar(MAX) = NULL
,@ItemCount nvarchar(MAX) = NULL
,@ItemStatus nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL
AS 
--set, lock 옵션 등 체크
set nocount on
update CloudBread.MemberItems
set  
 MemberID = CASE WHEN @MemberID is not null THEN @MemberID ELSE  MemberID END
, ItemListID = CASE WHEN @ItemListID is not null THEN @ItemListID ELSE  ItemListID END
, ItemCount = CASE WHEN @ItemCount is not null THEN @ItemCount ELSE  ItemCount END
, ItemStatus = CASE WHEN @ItemStatus is not null THEN @ItemStatus ELSE  ItemStatus END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
,UpdatedAt = sysutcdatetime()
where MemberItemID like @MemberItemID
select @@ROWCOUNT as Reslut

GO
/****** Object:  StoredProcedure [CloudBread].[uspComUdtMemberItemPurchase]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspComUdtMemberItemPurchase]
@MemberItemPurchaseID nvarchar(MAX) = NULL
,@MemberID nvarchar(MAX) = NULL
,@ItemListID nvarchar(MAX) = NULL
,@PurchaseQuantity nvarchar(MAX) = NULL
,@PurchasePrice nvarchar(MAX) = NULL
,@PGinfo1 nvarchar(MAX) = NULL
,@PGinfo2 nvarchar(MAX) = NULL
,@PGinfo3 nvarchar(MAX) = NULL
,@PGinfo4 nvarchar(MAX) = NULL
,@PGinfo5 nvarchar(MAX) = NULL
,@PurchaseDeviceID nvarchar(MAX) = NULL
,@PurchaseDeviceIPAddress nvarchar(MAX) = NULL
,@PurchaseDeviceMACAddress nvarchar(MAX) = NULL
,@PurchaseDT nvarchar(MAX) = NULL
,@PurchaseCancelYN nvarchar(MAX) = NULL
,@PurchaseCancelDT nvarchar(MAX) = NULL
,@PurchaseCancelingStatus nvarchar(MAX) = NULL
,@PurchaseCancelReturnedAmount nvarchar(MAX) = NULL
,@PurchaseCancelDeviceID nvarchar(MAX) = NULL
,@PurchaseCancelDeviceIPAddress nvarchar(MAX) = NULL
,@PurchaseCancelDeviceMACAddress nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL


AS 
set nocount on
update MemberItemPurchases
set
MemberID = CASE WHEN @MemberID is not null THEN @MemberID ELSE  MemberID END
, ItemListID = CASE WHEN @ItemListID is not null THEN @ItemListID ELSE  ItemListID END
, PurchaseQuantity = CASE WHEN @PurchaseQuantity is not null THEN @PurchaseQuantity ELSE  PurchaseQuantity END
, PurchasePrice = CASE WHEN @PurchasePrice is not null THEN @PurchasePrice ELSE  PurchasePrice END
, PGinfo1 = CASE WHEN @PGinfo1 is not null THEN @PGinfo1 ELSE  PGinfo1 END
, PGinfo2 = CASE WHEN @PGinfo2 is not null THEN @PGinfo2 ELSE  PGinfo2 END
, PGinfo3 = CASE WHEN @PGinfo3 is not null THEN @PGinfo3 ELSE  PGinfo3 END
, PGinfo4 = CASE WHEN @PGinfo4 is not null THEN @PGinfo4 ELSE  PGinfo4 END
, PGinfo5 = CASE WHEN @PGinfo5 is not null THEN @PGinfo5 ELSE  PGinfo5 END
, PurchaseDeviceID = CASE WHEN @PurchaseDeviceID is not null THEN @PurchaseDeviceID ELSE  PurchaseDeviceID END
, PurchaseDeviceIPAddress = CASE WHEN @PurchaseDeviceIPAddress is not null THEN @PurchaseDeviceIPAddress ELSE  PurchaseDeviceIPAddress END
, PurchaseDeviceMACAddress = CASE WHEN @PurchaseDeviceMACAddress is not null THEN @PurchaseDeviceMACAddress ELSE  PurchaseDeviceMACAddress END
, PurchaseDT = CASE WHEN @PurchaseDT is not null THEN @PurchaseDT ELSE  PurchaseDT END
, PurchaseCancelYN = CASE WHEN @PurchaseCancelYN is not null THEN @PurchaseCancelYN ELSE  PurchaseCancelYN END
, PurchaseCancelDT = CASE WHEN @PurchaseCancelDT is not null THEN @PurchaseCancelDT ELSE  PurchaseCancelDT END
, PurchaseCancelingStatus = CASE WHEN @PurchaseCancelingStatus is not null THEN @PurchaseCancelingStatus ELSE  PurchaseCancelingStatus END
, PurchaseCancelReturnedAmount = CASE WHEN @PurchaseCancelReturnedAmount is not null THEN @PurchaseCancelReturnedAmount ELSE  PurchaseCancelReturnedAmount END
, PurchaseCancelDeviceID = CASE WHEN @PurchaseCancelDeviceID is not null THEN @PurchaseCancelDeviceID ELSE  PurchaseCancelDeviceID END
, PurchaseCancelDeviceIPAddress = CASE WHEN @PurchaseCancelDeviceIPAddress is not null THEN @PurchaseCancelDeviceIPAddress ELSE  PurchaseCancelDeviceIPAddress END
, PurchaseCancelDeviceMACAddress = CASE WHEN @PurchaseCancelDeviceMACAddress is not null THEN @PurchaseCancelDeviceMACAddress ELSE  PurchaseCancelDeviceMACAddress END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
,UpdatedAt = sysutcdatetime()
where MemberItemPurchaseID like @MemberItemPurchaseID
select @@rowcount as Reslut


GO
/****** Object:  StoredProcedure [CloudBread].[uspInsAnonymousRegMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspInsAnonymousRegMember]
 @MembersMemberID nvarchar(MAX) = NULL
,@MembersMemberPWD nvarchar(MAX) = NULL
,@MembersEmailAddress nvarchar(MAX) = NULL
,@MembersEmailConfirmedYN nvarchar(MAX) = NULL
,@MembersPhoneNumber1 nvarchar(MAX) = NULL
,@MembersPhoneNumber2 nvarchar(MAX) = NULL
,@MembersPINumber nvarchar(MAX) = NULL
,@MembersName1 nvarchar(MAX) = NULL
,@MembersName2 nvarchar(MAX) = NULL
,@MembersName3 nvarchar(MAX) = NULL
,@MembersDOB nvarchar(MAX) = NULL
,@MembersRecommenderID nvarchar(MAX) = NULL
,@MembersMemberGroup nvarchar(MAX) = NULL
,@MembersLastDeviceID nvarchar(MAX) = NULL
,@MembersLastIPaddress nvarchar(MAX) = NULL
,@MembersLastLoginDT nvarchar(MAX) = NULL
,@MembersLastLogoutDT nvarchar(MAX) = NULL
,@MembersLastMACAddress nvarchar(MAX) = NULL
,@MembersAccountBlockYN nvarchar(MAX) = NULL
,@MembersAccountBlockEndDT nvarchar(MAX) = NULL
,@MembersAnonymousYN nvarchar(MAX) = NULL		--익명 처리 암호화 한다
,@Members3rdAuthProvider nvarchar(MAX) = NULL
,@Members3rdAuthID nvarchar(MAX) = NULL
,@Members3rdAuthParam nvarchar(MAX) = NULL
,@MembersPushNotificationID nvarchar(MAX) = NULL
,@MembersPushNotificationProvider nvarchar(MAX) = NULL
,@MembersPushNotificationGroup nvarchar(MAX) = NULL
,@MemberssCol1 nvarchar(MAX) = NULL
,@MemberssCol2 nvarchar(MAX) = NULL
,@MemberssCol3 nvarchar(MAX) = NULL
,@MemberssCol4 nvarchar(MAX) = NULL
,@MemberssCol5 nvarchar(MAX) = NULL
,@MemberssCol6 nvarchar(MAX) = NULL
,@MemberssCol7 nvarchar(MAX) = NULL
,@MemberssCol8 nvarchar(MAX) = NULL
,@MemberssCol9 nvarchar(MAX) = NULL
,@MemberssCol10 nvarchar(MAX) = NULL
,@MembersTimeZoneID nvarchar(MAX) = NULL		--암호화 안함

,@MemberGameInfoesLevel nvarchar(MAX) = NULL
,@MemberGameInfoesExps nvarchar(MAX) = NULL
,@MemberGameInfoesPoints nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT1 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT2 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT3 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT4 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT5 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT6 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT7 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT8 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT9 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT10 nvarchar(MAX) = NULL
,@MemberGameInfoessCol1 nvarchar(MAX) = NULL
,@MemberGameInfoessCol2 nvarchar(MAX) = NULL
,@MemberGameInfoessCol3 nvarchar(MAX) = NULL
,@MemberGameInfoessCol4 nvarchar(MAX) = NULL
,@MemberGameInfoessCol5 nvarchar(MAX) = NULL
,@MemberGameInfoessCol6 nvarchar(MAX) = NULL
,@MemberGameInfoessCol7 nvarchar(MAX) = NULL
,@MemberGameInfoessCol8 nvarchar(MAX) = NULL
,@MemberGameInfoessCol9 nvarchar(MAX) = NULL
,@MemberGameInfoessCol10 nvarchar(MAX) = NULL
AS 
--set, lock 옵션 등 체크
SET NOCOUNT ON
SET XACT_ABORT ON
DECLARE @rowcount as int
SET @rowcount = 0
begin tran
insert into CloudBread.Members(MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID) 
values(@MembersMemberID, @MembersMemberPWD, @MembersEmailAddress, @MembersEmailConfirmedYN, @MembersPhoneNumber1, @MembersPhoneNumber2, @MembersPINumber, @MembersName1, @MembersName2, @MembersName3, @MembersDOB, @MembersRecommenderID, @MembersMemberGroup, @MembersLastDeviceID, @MembersLastIPaddress, @MembersLastLoginDT, @MembersLastLogoutDT, @MembersLastMACAddress, @MembersAccountBlockYN, @MembersAccountBlockEndDT, @MembersAnonymousYN, @Members3rdAuthProvider, @Members3rdAuthID, @Members3rdAuthParam, @MembersPushNotificationID, @MembersPushNotificationProvider, @MembersPushNotificationGroup, @MemberssCol1, @MemberssCol2, @MemberssCol3, @MemberssCol4, @MemberssCol5, @MemberssCol6, @MemberssCol7, @MemberssCol8, @MemberssCol9, @MemberssCol10, @MembersTimeZoneID)
SET @rowcount = @rowcount + @@ROWCOUNT
insert into CloudBread.MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10) 
values(@MembersMemberID, @MemberGameInfoesLevel, @MemberGameInfoesExps, @MemberGameInfoesPoints, @MemberGameInfoesUserSTAT1, @MemberGameInfoesUserSTAT2, @MemberGameInfoesUserSTAT3, @MemberGameInfoesUserSTAT4, @MemberGameInfoesUserSTAT5, @MemberGameInfoesUserSTAT6, @MemberGameInfoesUserSTAT7, @MemberGameInfoesUserSTAT8, @MemberGameInfoesUserSTAT9, @MemberGameInfoesUserSTAT10, @MemberGameInfoessCol1, @MemberGameInfoessCol2, @MemberGameInfoessCol3, @MemberGameInfoessCol4, @MemberGameInfoessCol5, @MemberGameInfoessCol6, @MemberGameInfoessCol7, @MemberGameInfoessCol8, @MemberGameInfoessCol9, @MemberGameInfoessCol10)
SET @rowcount = @rowcount + @@ROWCOUNT
commit tran
SELECT @rowcount as Result

GO
/****** Object:  StoredProcedure [CloudBread].[uspInsRegMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspInsRegMember]
	@MemberID_Members nvarchar(MAX)
,	@MemberPWD_Members nvarchar(MAX)
,	@EmailAddress_Members nvarchar(MAX)
,	@EmailConfirmedYN_Members nvarchar(MAX)
,	@PhoneNumber1_Members nvarchar(MAX)
,	@PhoneNumber2_Members nvarchar(MAX)
,	@PINumber_Members nvarchar(MAX)
,	@Name1_Members nvarchar(MAX)
,	@Name2_Members nvarchar(MAX)
,	@Name3_Members nvarchar(MAX)
,	@DOB_Members nvarchar(MAX)
,	@RecommenderID_Members nvarchar(MAX)
,	@MemberGroup_Members nvarchar(MAX)
,	@LastDeviceID_Members nvarchar(MAX)
,	@LastIPaddress_Members nvarchar(MAX)
,	@LastLoginDT_Members nvarchar(MAX)
,	@LastLogoutDT_Members nvarchar(MAX)
,	@LastMACAddress_Members nvarchar(MAX)
,	@AccountBlockYN_Members nvarchar(MAX)
,	@AccountBlockEndDT_Members nvarchar(MAX)
,	@AnonymousYN_Members nvarchar(MAX)
,	@3rdAuthProvider_Members nvarchar(MAX)
,	@3rdAuthID_Members nvarchar(MAX)
,	@3rdAuthParam_Members nvarchar(MAX)
,	@PushNotificationID_Members nvarchar(MAX)
,	@PushNotificationProvider_Members nvarchar(MAX)
,	@PushNotificationGroup_Members nvarchar(MAX)
,	@sCol1_Members nvarchar(MAX)
,	@sCol2_Members nvarchar(MAX)
,	@sCol3_Members nvarchar(MAX)
,	@sCol4_Members nvarchar(MAX)
,	@sCol5_Members nvarchar(MAX)
,	@sCol6_Members nvarchar(MAX)
,	@sCol7_Members nvarchar(MAX)
,	@sCol8_Members nvarchar(MAX)
,	@sCol9_Members nvarchar(MAX)
,	@sCol10_Members nvarchar(MAX)
,	@TimeZoneID_Members nvarchar(MAX)		-- 암호화 안함

,	@Level_MemberGameInfoes nvarchar(MAX)
,	@Exps_MemberGameInfoes nvarchar(MAX)
,	@Points_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT1_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT2_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT3_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT4_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT5_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT6_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT7_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT8_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT9_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT10_MemberGameInfoes nvarchar(MAX)
,	@sCol1_MemberGameInfoes nvarchar(MAX)
,	@sCol2_MemberGameInfoes nvarchar(MAX)
,	@sCol3_MemberGameInfoes nvarchar(MAX)
,	@sCol4_MemberGameInfoes nvarchar(MAX)
,	@sCol5_MemberGameInfoes nvarchar(MAX)
,	@sCol6_MemberGameInfoes nvarchar(MAX)
,	@sCol7_MemberGameInfoes nvarchar(MAX)
,	@sCol8_MemberGameInfoes nvarchar(MAX)
,	@sCol9_MemberGameInfoes nvarchar(MAX)
,	@sCol10_MemberGameInfoes nvarchar(MAX)
AS 
--set, lock 옵션 등 체크
SET NOCOUNT ON
SET XACT_ABORT ON
DECLARE @rowcount as int
SET @rowcount = 0
begin tran
insert into CloudBread.Members(MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID) 
values(@MemberID_Members,@MemberPWD_Members,@EmailAddress_Members,@EmailConfirmedYN_Members,@PhoneNumber1_Members,@PhoneNumber2_Members,@PINumber_Members,@Name1_Members,@Name2_Members,@Name3_Members,@DOB_Members,@RecommenderID_Members,@MemberGroup_Members,@LastDeviceID_Members,@LastIPaddress_Members,@LastLoginDT_Members,@LastLogoutDT_Members,@LastMACAddress_Members,@AccountBlockYN_Members,@AccountBlockEndDT_Members,@AnonymousYN_Members,@3rdAuthProvider_Members,@3rdAuthID_Members,@3rdAuthParam_Members,@PushNotificationID_Members,@PushNotificationProvider_Members,@PushNotificationGroup_Members,@sCol1_Members,@sCol2_Members,@sCol3_Members,@sCol4_Members,@sCol5_Members,@sCol6_Members,@sCol7_Members,@sCol8_Members,@sCol9_Members,@sCol10_Members,@TimeZoneID_Members)
SET @rowcount = @rowcount + @@ROWCOUNT
insert into CloudBread.MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10) 
values(@MemberID_Members, @Level_MemberGameInfoes,@Exps_MemberGameInfoes,@Points_MemberGameInfoes,@UserSTAT1_MemberGameInfoes,@UserSTAT2_MemberGameInfoes,@UserSTAT3_MemberGameInfoes,@UserSTAT4_MemberGameInfoes,@UserSTAT5_MemberGameInfoes,@UserSTAT6_MemberGameInfoes,@UserSTAT7_MemberGameInfoes,@UserSTAT8_MemberGameInfoes,@UserSTAT9_MemberGameInfoes,@UserSTAT10_MemberGameInfoes,@sCol1_MemberGameInfoes,@sCol2_MemberGameInfoes,@sCol3_MemberGameInfoes,@sCol4_MemberGameInfoes,@sCol5_MemberGameInfoes,@sCol6_MemberGameInfoes,@sCol7_MemberGameInfoes,@sCol8_MemberGameInfoes,@sCol9_MemberGameInfoes,@sCol10_MemberGameInfoes)
SET @rowcount = @rowcount + @@ROWCOUNT
commit tran
SELECT @rowcount as Result

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelAdminLogin]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelAdminLogin]
@AdminMemberID NVARCHAR(MAX)
, @AdminMemberPWD NVARCHAR(MAX)
, @LastIPaddress NVARCHAR(MAX) = ''
AS 
set nocount on
update CloudBread.AdminMembers set LastIPaddress = @LastIPaddress, LastLoginDT = SYSUTCDATETIME(), UpdatedAt = SYSUTCDATETIME()
where AdminMemberID like @AdminMemberID and AdminMemberPWD like @AdminMemberPWD
select AdminMemberID, AdminGroup, TimeZoneID
from CloudBread.AdminMembers with(nolock)
where AdminMemberID like @AdminMemberID and AdminMemberPWD like @AdminMemberPWD
and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelAdminLogout]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelAdminLogout]
@AdminMemberID NVARCHAR(MAX)
AS 
set nocount on
update CloudBread.AdminMembers set LastLoginDT = SYSUTCDATETIME(), UpdatedAt = SYSUTCDATETIME()
where AdminMemberID like @AdminMemberID
select @@ROWCOUNT as result

--select * from cloudbread.adminmembers
GO
/****** Object:  StoredProcedure [CloudBread].[uspSelCoupons]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelCoupons]
@MemberID varchar(MAX)
--CouponDurationFrom를 비교 하려면 날자 부분은 암호화 되지 않은 평문이어야 함.
--CouponDurationFrom 컬럼은 datetime 형태로 저장 되어야 함.
AS 
select CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
FROM CloudBread.Coupon with(nolock)
WHERE NOT EXISTS 
(
  SELECT 1 
    FROM CloudBread.CouponMember  with(nolock)
    WHERE CouponMember.CouponID = Coupon.CouponID
	and CouponMember.MemberID like @MemberID
		--현재 날자 조건에 맞는 것 and HideYN, DeleteYN이 N 인것
)
and sysutcdatetime() between CouponDurationFrom and CouponDurationTo
and Coupon.HideYN like 'N'
and Coupon.DeleteYN like 'N'
order by OrderNumber asc, CreatedAt desc		-- 정렬은 정렬 컬럼 숫자 asc, 이후 생성일 최신 순

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelGameEvents]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelGameEvents]
@MemberID VARCHAR(MAX)
AS 
--set, lock 옵션 등 체크
SELECT GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10  
FROM CloudBread.GameEvents
WHERE NOT EXISTS 
(
  SELECT 1 
    FROM CloudBread.GameEventMember
    WHERE GameEventMember.eventID = GameEvents.GameEventID
	and MemberID like @MemberID
)
and sysutcdatetime() between GameEvents.EventDurationFrom and GameEvents.EventDurationTo
and GameEvents.HideYN like 'N'
and GameEvents.DeleteYN like 'N'
order by OrderNumber asc, CreatedAt desc		-- 정렬은 정렬 컬럼 숫자 asc, 이후 생성일 최신 순

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelGiftItemToMe]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelGiftItemToMe]
@MemberID VARCHAR(MAX)
AS 
select top 1 GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.GiftDepositories
where ToMemberID like @MemberID and HideYN like 'N' and DeleteYN like 'N'
order by CreatedAt DESC  --최근에 받은 선물부터 조회

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelItem1]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [CloudBread].[uspSelItem1]
@ItemListID varchar(MAX)
as
select ItemListID,ItemName,ItemDescription,ItemPrice,ItemSellPrice,ItemCategory1,ItemCategory2,ItemCategory3,sCol1,sCol2,sCol3,sCol4,sCol5,sCol6,sCol7,sCol8,sCol9,sCol10 
from CloudBread.ItemLists with(nolock) where ItemListID like @ItemListID and DeleteYN like 'N' and HideYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelItemListAll]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelItemListAll]
( 
  @Page             bigint 
, @PageSize  bigint 
) AS 
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
WITH TBL_PAGELIST AS 
( 
       SELECT ROW_NUMBER() OVER (ORDER BY CreatedAt) AS ROWNUM, 
       ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
       FROM CloudBread.ItemLists
	   where DeleteYN like 'N' and HideYN like 'N'
) 
SELECT ROWNUM, ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from TBL_PAGELIST
WHERE ROWNUM BETWEEN ((@PAGE - 1) * @PAGESIZE) + 1 AND @PAGE * @PAGESIZE; 

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelLoginIDDupeCheck]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelLoginIDDupeCheck]
@MemberID NVARCHAR(MAX)
AS 
set nocount on
IF EXISTS (
	SELECT MemberID FROM CloudBread.Members WITH(NOLOCK) 
	WHERE MemberID like @MemberID
	)
BEGIN
	--MemberID가 존재
	SELECT 1 AS Result
END
ELSE
BEGIN
	----MemberID 없음. 생성 가능
	SELECT 0 AS Result
END

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelLoginInfo]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelLoginInfo]
	@MemberID NVARCHAR(MAX)
,	@MemberPWD NVARCHAR(MAX)
,	@LastDeviceID  NVARCHAR(MAX)	=	''
,	@LastIPaddress  NVARCHAR(MAX)	=	''
,	@LastMACAddress  NVARCHAR(MAX)		=	''
AS
set nocount on
update CloudBread.Members set
LastDeviceID =  @LastDeviceID
, LastIPaddress = @LastIPaddress
, LastLoginDT = sysutcdatetime()
, LastMACAddress = @LastMACAddress
, UpdatedAt = sysutcdatetime()
where MemberID like @MemberID and MemberPWD like @MemberPWD and HideYN like 'N' and DeleteYN like 'N'

select MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.Members with(nolock)
where MemberID like @MemberID and MemberPWD like @MemberPWD and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelMemberGameInfoStages]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelMemberGameInfoStages]
@MemberID NVARCHAR(MAX)
AS 
--set, lock 옵션 등 체크
select MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.MemberGameInfoStages with(nolock)
where MemberID like @MemberID and HideYN like 'N' and DeleteYN like 'N'
order by CreatedAt asc


GO
/****** Object:  StoredProcedure [CloudBread].[uspSelMemberItems]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelMemberItems]
( 
  @Page             bigint 
, @PageSize  bigint 
, @MemberID varchar(max)
) AS 
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
WITH TBL_PAGELIST AS 
( 
	SELECT ROW_NUMBER() OVER (ORDER BY MemberItems.CreatedAt) AS ROWNUM, 
	ItemLists.ItemListID as	ItemListsItemListID
	, ItemLists.ItemName as ItemListsItemName 
	, ItemLists.ItemDescription as ItemListsItemDescription 
	, ItemLists.ItemPrice as ItemListsItemPrice 
	, ItemLists.ItemSellPrice as ItemListsItemSellPrice 
	, ItemLists.ItemCategory1 as ItemListsItemCategory1 
	, ItemLists.ItemCategory2 as ItemListsItemCategory2 
	, ItemLists.ItemCategory3 as ItemListsItemCategory3 
	, ItemLists.sCol1 as ItemListssCol1 
	, ItemLists.sCol2 as ItemListssCol2 
	, ItemLists.sCol3 as ItemListssCol3 
	, ItemLists.sCol4 as ItemListssCol4 
	, ItemLists.sCol5 as ItemListssCol5 
	, ItemLists.sCol6 as ItemListssCol6 
	, ItemLists.sCol7 as ItemListssCol7 
	, ItemLists.sCol8 as ItemListssCol8 
	, ItemLists.sCol9 as ItemListssCol9 
	, ItemLists.sCol10 as ItemListssCol10 
	, MemberItems.MemberItemID as MemberItemsMemberItemID 
	, MemberItems.MemberID as MemberItemsMemberID 
	, MemberItems.ItemListID as MemberItemsItemListID 
	, MemberItems.ItemCount as MemberItemsItemCount 
	, MemberItems.ItemStatus as MemberItemsItemStatus 
	, MemberItems.sCol1 as MemberItemssCol1 
	, MemberItems.sCol2 as MemberItemssCol2 
	, MemberItems.sCol3 as MemberItemssCol3 
	, MemberItems.sCol4 as MemberItemssCol4 
	, MemberItems.sCol5 as MemberItemssCol5 
	, MemberItems.sCol6 as MemberItemssCol6 
	, MemberItems.sCol7 as MemberItemssCol7 
	, MemberItems.sCol8 as MemberItemssCol8 
	, MemberItems.sCol9 as MemberItemssCol9 
	, MemberItems.sCol10 as MemberItemssCol10
	FROM CloudBread.MemberItems
	inner join CloudBread.ItemLists	on MemberItems.ItemListID = ItemLists.ItemListID
	-- item 테이블과 join해 item의 정보도 가져온다.
	WHERE MemberItems.MemberID like @MemberID and MemberItems.HideYN like 'N' and MemberItems.DeleteYN like 'N' and ItemLists.HideYN like 'N' and ItemLists.DeleteYN like 'N'
) 
SELECT ROWNUM
		,ItemListsItemName 
		,ItemListsItemDescription 
		,ItemListsItemPrice 
		,ItemListsItemSellPrice 
		,ItemListsItemCategory1 
		,ItemListsItemCategory2 
		,ItemListsItemCategory3 
		,ItemListssCol1 
		,ItemListssCol2 
		,ItemListssCol3 
		,ItemListssCol4 
		,ItemListssCol5 
		,ItemListssCol6 
		,ItemListssCol7 
		,ItemListssCol8 
		,ItemListssCol9 
		,ItemListssCol10 
		,MemberItemsMemberItemID 
		,MemberItemsMemberID 
		,MemberItemsItemListID 
		,MemberItemsItemCount 
		,MemberItemsItemStatus 
		,MemberItemssCol1 
		,MemberItemssCol2 
		,MemberItemssCol3 
		,MemberItemssCol4 
		,MemberItemssCol5 
		,MemberItemssCol6 
		,MemberItemssCol7 
		,MemberItemssCol8 
		,MemberItemssCol9 
		,MemberItemssCol10		
from TBL_PAGELIST
WHERE ROWNUM BETWEEN ((@PAGE - 1) * @PAGESIZE) + 1 AND @PAGE * @PAGESIZE; 

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelNotices]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelNotices]
--NoticeDurationFrom를 비교 하려면 날자 부분은 암호화 되지 않은 평문이어야 함.
--NoticeDurationFrom / To 컬럼은 datetimeoffset 형태로 비교를 위해 저장 되어야 함.
AS 
select NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CloudBread.Notices with(nolock)
where
	--현재 날자 조건에 맞는 것 and HideYN, DeleteYN이 N 인것
	sysutcdatetime() between NoticeDurationFrom and NoticeDurationTo
and HideYN like 'N'
and DeleteYN like 'N'
order by OrderNumber asc, CreatedAt desc		-- 정렬은 정렬 컬럼 숫자 asc, 이후 생성일 최신 순

GO
/****** Object:  StoredProcedure [CloudBread].[uspSelSendEmailToMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspSelSendEmailToMember]
@MemberID NVARCHAR(MAX)
AS 
--set, lock 옵션 등 체크
select EmailAddress from CloudBread.Members with(nolock) where MemberID like @MemberID
and HideYN like 'N' and DeleteYN like 'N'

GO
/****** Object:  StoredProcedure [CloudBread].[uspUdtConfirmedEmailAddress]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspUdtConfirmedEmailAddress]
@MemberID NVARCHAR(MAX)
,@MemberPWD NVARCHAR(MAX)
AS 
--set, lock 옵션 등 체크
set nocount on
update CloudBread.Members Set EmailConfirmedYN = 'Y', UpdatedAt = sysutcdatetime()
where MemberID like @MemberID and MemberPWD like @MemberPWD and HideYN like 'N' and DeleteYN like 'N'
select @@rowcount as Result

GO
/****** Object:  StoredProcedure [CloudBread].[uspUdtCouponMember]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspUdtCouponMember]
@InsertORUpdate nvarchar(MAX) = NULL
--, @DupeYN_Coupon nvarchar(MAX) = NULL		--쿠폰의 DupeYN 값으로 Coupon을 없앨지 말지를 결정한다. - 업데이트 : 값 여부를 프로시저 내부에서 알아온다.
, @CouponID_Coupon nvarchar(MAX) = NULL		--쿠폰 ID -DupeYN 값에 의해 DeleteYN flag가 결정된다.
,	@MemberItemID_MemberItems nvarchar(MAX) = NULL	--update에서만 사용
,	@MemberID_MemberItems nvarchar(MAX) = NULL
,	@ItemListID_MemberItems nvarchar(MAX) = NULL
,	@ItemCount_MemberItems nvarchar(MAX) = NULL
,	@ItemStatus_MemberItems nvarchar(MAX) = NULL
,	@sCol1_MemberItems nvarchar(MAX) = NULL
,	@sCol2_MemberItems nvarchar(MAX) = NULL
,	@sCol3_MemberItems nvarchar(MAX) = NULL
,	@sCol4_MemberItems nvarchar(MAX) = NULL
,	@sCol5_MemberItems nvarchar(MAX) = NULL
,	@sCol6_MemberItems nvarchar(MAX) = NULL
,	@sCol7_MemberItems nvarchar(MAX) = NULL
,	@sCol8_MemberItems nvarchar(MAX) = NULL
,	@sCol9_MemberItems nvarchar(MAX) = NULL
,	@sCol10_MemberItems nvarchar(MAX) = NULL

--@CouponMemberID_CouponMember nvarchar(MAX)-- 항상 insert 과정이라 없음
,	@CouponID_CouponMember nvarchar(MAX) = NULL
,	@MemberID_CouponMember nvarchar(MAX) = NULL
,	@sCol1_CouponMember nvarchar(MAX) = NULL
,	@sCol2_CouponMember nvarchar(MAX) = NULL
,	@sCol3_CouponMember nvarchar(MAX) = NULL
,	@sCol4_CouponMember nvarchar(MAX) = NULL
,	@sCol5_CouponMember nvarchar(MAX) = NULL
,	@sCol6_CouponMember nvarchar(MAX) = NULL
,	@sCol7_CouponMember nvarchar(MAX) = NULL
,	@sCol8_CouponMember nvarchar(MAX) = NULL
,	@sCol9_CouponMember nvarchar(MAX) = NULL
,	@sCol10_CouponMember nvarchar(MAX) = NULL
AS 
--조회된 Coupon의 itemid와 수량을 이용해 MemberItem에 insert or update 하고 이어서 CouponMember에 insert해서 이벤트 선물 받음을 확인	
--이어서 Coupon의 DupeYN이 N이면 쿠폰의 DeleteYN 을 Y로 업데이트 해서 쿠폰이 사용 불가하도록 한다.

--itemID가 인벤에 있을 경우 MemberItem에 update
--itemID가 인벤에 없을 경우 MemberItem에 insert
--set, lock 옵션 등 체크
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
declare @DupeYN_Coupon nvarchar(1)
set @DupeYN_Coupon = (select DupeYN from CloudBread.Coupon where CouponID like @CouponID_Coupon)	--쿠폰의 DupeYN 값을 알아온다.

--쿠폰id로 조회해 해당 쿠폰이 사용 조건과 맞지 않으면 종료
if exists(select CouponID from CloudBread.Coupon where CouponID like @CouponID_Coupon and sysutcdatetime() between CouponDurationFrom and CouponDurationTo and Coupon.HideYN like 'N' and Coupon.DeleteYN like 'N')
begin
	if upper(@InsertORUpdate) = 'INSERT' 
		begin
			begin tran
				--INSERT 일 경우 MemberItems에 추가하고,  EventMember에 삽입
				--MemberItems에 추가
				--MemberItemID는 기본값으로 GUID 처리
				insert into CloudBread.MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(
					newid()
					,	@MemberID_MemberItems
					,	@ItemListID_MemberItems
					,	@ItemCount_MemberItems
					,	@ItemStatus_MemberItems
					,	@sCol1_MemberItems
					,	@sCol2_MemberItems
					,	@sCol3_MemberItems
					,	@sCol4_MemberItems
					,	@sCol5_MemberItems
					,	@sCol6_MemberItems
					,	@sCol7_MemberItems
					,	@sCol8_MemberItems
					,	@sCol9_MemberItems
					,	@sCol10_MemberItems
					)
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				-- CouponMember에 추가 수행해 이벤트 CouponMemberID는 GUID로 자동 삽입됨
				insert into CloudBread.CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(
					newid(), 
					@CouponID_CouponMember
				,	@MemberID_CouponMember
				,	@sCol1_CouponMember
				,	@sCol2_CouponMember
				,	@sCol3_CouponMember
				,	@sCol4_CouponMember
				,	@sCol5_CouponMember
				,	@sCol6_CouponMember
				,	@sCol7_CouponMember
				,	@sCol8_CouponMember
				,	@sCol9_CouponMember
				,	@sCol10_CouponMember
				)
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				if upper(@DupeYN_Coupon) = 'N'		-- 중복 사용 가능 쿠폰이면 아무것도 안함. N 일 경우에는 쿠폰 테이블 업데이트
					begin
						update CloudBread.Coupon set DeleteYN = 'Y' WHERE CouponID like @CouponID_Coupon
					end
				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end
	if upper(@InsertORUpdate) = 'UPDATE'
		begin
			begin tran
				--MemberItems에 수정하고,  EventMember에 추가
				--MemberItems에 수정
				update CloudBread.MemberItems set
					MemberID = CASE WHEN @MemberID_MemberItems is not null THEN @MemberID_MemberItems ELSE  MemberID END
					, ItemListID = CASE WHEN @ItemListID_MemberItems is not null THEN @ItemListID_MemberItems ELSE  ItemListID END
					, ItemCount = CASE WHEN @ItemCount_MemberItems is not null THEN @ItemCount_MemberItems ELSE  ItemCount END
					, ItemStatus = CASE WHEN @ItemStatus_MemberItems is not null THEN @ItemStatus_MemberItems ELSE  ItemStatus END
					, sCol1 = CASE WHEN @sCol1_MemberItems is not null THEN @sCol1_MemberItems ELSE  sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberItems is not null THEN @sCol2_MemberItems ELSE  sCol2 END
					, sCol3 = CASE WHEN @sCol3_MemberItems is not null THEN @sCol3_MemberItems ELSE  sCol3 END
					, sCol4 = CASE WHEN @sCol4_MemberItems is not null THEN @sCol4_MemberItems ELSE  sCol4 END
					, sCol5 = CASE WHEN @sCol5_MemberItems is not null THEN @sCol5_MemberItems ELSE  sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberItems is not null THEN @sCol6_MemberItems ELSE  sCol6 END
					, sCol7 = CASE WHEN @sCol7_MemberItems is not null THEN @sCol7_MemberItems ELSE  sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberItems is not null THEN @sCol8_MemberItems ELSE  sCol8 END
					, sCol9 = CASE WHEN @sCol9_MemberItems is not null THEN @sCol9_MemberItems ELSE  sCol9 END
					, sCol10 = CASE WHEN @sCol10_MemberItems is not null THEN @sCol10_MemberItems ELSE  sCol10 END
					,UpdatedAt = sysutcdatetime()
				where MemberItemID like @MemberItemID_MemberItems
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				--  CouponMember에 추가	CouponMemberID는 insert라 생성해 넣음
				insert into CloudBread.CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(
					newid(), 
					@CouponID_CouponMember
				,	@MemberID_CouponMember
				,	@sCol1_CouponMember
				,	@sCol2_CouponMember
				,	@sCol3_CouponMember
				,	@sCol4_CouponMember
				,	@sCol5_CouponMember
				,	@sCol6_CouponMember
				,	@sCol7_CouponMember
				,	@sCol8_CouponMember
				,	@sCol9_CouponMember
				,	@sCol10_CouponMember
				)
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				if upper(@DupeYN_Coupon) = 'N'		-- 중복 사용 가능 쿠폰(Y)이면 아무것도 안함. N 일 경우에는 쿠폰 테이블 업데이트해서 쿠폰 삭제
					begin
						update CloudBread.Coupon set DeleteYN = 'Y', UpdatedAt=SYSUTCDATETIME() WHERE CouponID like @CouponID_Coupon
					end
				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end
	select @rowcount as Result
end
else
	select 0 as Result

GO
/****** Object:  StoredProcedure [CloudBread].[uspUdtGameEventMemberToItem]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspUdtGameEventMemberToItem]
@InsertORUpdate nvarchar(MAX) = NULL
,	@MemberItemID_MemberItems nvarchar(MAX) = NULL  --update일 경우에만 사용
,	@MemberID_MemberItems nvarchar(MAX) = NULL
,	@ItemListID_MemberItems nvarchar(MAX) = NULL
,	@ItemCount_MemberItems nvarchar(MAX) = NULL
,	@ItemStatus_MemberItems nvarchar(MAX) = NULL
,	@sCol1_MemberItems nvarchar(MAX) = NULL
,	@sCol2_MemberItems nvarchar(MAX) = NULL
,	@sCol3_MemberItems nvarchar(MAX) = NULL
,	@sCol4_MemberItems nvarchar(MAX) = NULL
,	@sCol5_MemberItems nvarchar(MAX) = NULL
,	@sCol6_MemberItems nvarchar(MAX) = NULL
,	@sCol7_MemberItems nvarchar(MAX) = NULL
,	@sCol8_MemberItems nvarchar(MAX) = NULL
,	@sCol9_MemberItems nvarchar(MAX) = NULL
,	@sCol10_MemberItems nvarchar(MAX) = NULL

--,	@GameEventMemberID_GameEventMember nvarchar(MAX) = NULL  --insert 과정이라 없음
,	@eventID_GameEventMember nvarchar(MAX) = NULL
,	@MemberID_GameEventMember nvarchar(MAX) = NULL
,	@sCol1_GameEventMember nvarchar(MAX) = NULL
,	@sCol2_GameEventMember nvarchar(MAX) = NULL
,	@sCol3_GameEventMember nvarchar(MAX) = NULL
,	@sCol4_GameEventMember nvarchar(MAX) = NULL
,	@sCol5_GameEventMember nvarchar(MAX) = NULL
,	@sCol6_GameEventMember nvarchar(MAX) = NULL
,	@sCol7_GameEventMember nvarchar(MAX) = NULL
,	@sCol8_GameEventMember nvarchar(MAX) = NULL
,	@sCol9_GameEventMember nvarchar(MAX) = NULL
,	@sCol10_GameEventMember nvarchar(MAX) = NULL
AS 
--조회된 event의 itemid와 수량을 이용해 MemberItem에 insert or update 하고 이어서 GameEventMember에 insert해서 이벤트 선물 받음을 확인	
--itemID가 인벤에 있을 경우 MemberItem에 update
--itemID가 인벤에 없을 경우 MemberItem에 insert
--set, lock 옵션 등 체크
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
if exists(select GameEventID from CloudBread.GameEvents where GameEventID like @eventID_GameEventMember and sysutcdatetime() between EventDurationFrom and EventDurationTo and HideYN like 'N' and DeleteYN like 'N' )
begin
	if upper(@InsertORUpdate) = 'INSERT' 
		begin
			begin tran
				--INSERT 일 경우 MemberItems에 추가하고,  EventMember에 삽입
				--MemberItems에 추가
				--MemberItemID는 기본값으로 GUID 처리
				insert into CloudBread.MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(newid(), @MemberID_MemberItems,@ItemListID_MemberItems,@ItemCount_MemberItems,@ItemStatus_MemberItems,@sCol1_MemberItems,@sCol2_MemberItems,@sCol3_MemberItems,@sCol4_MemberItems,@sCol5_MemberItems,@sCol6_MemberItems,@sCol7_MemberItems,@sCol8_MemberItems,@sCol9_MemberItems,@sCol10_MemberItems)
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				-- EventMember에 추가 수행해 이벤트 GameEventMemberID는 GUID로 자동 삽입됨
				insert into CloudBread.GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(newid(), @eventID_GameEventMember,@MemberID_GameEventMember,@sCol1_GameEventMember,@sCol2_GameEventMember,@sCol3_GameEventMember,@sCol4_GameEventMember,@sCol5_GameEventMember,@sCol6_GameEventMember,@sCol7_GameEventMember,@sCol8_GameEventMember,@sCol9_GameEventMember,@sCol10_GameEventMember)
				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end
	if upper(@InsertORUpdate) = 'UPDATE'
		begin
			begin tran
				--MemberItems에 수정하고,  EventMember에 추가
				--MemberItems에 수정
				update CloudBread.MemberItems set
					--, MemberItemID = CASE WHEN @MemberItemID_MemberItems is not null THEN @MemberItemID_MemberItems ELSE  MemberItemID END
					MemberID = CASE WHEN @MemberID_MemberItems is not null THEN @MemberID_MemberItems ELSE  MemberID END
					, ItemListID = CASE WHEN @ItemListID_MemberItems is not null THEN @ItemListID_MemberItems ELSE  ItemListID END
					, ItemCount = CASE WHEN @ItemCount_MemberItems is not null THEN @ItemCount_MemberItems ELSE  ItemCount END
					, ItemStatus = CASE WHEN @ItemStatus_MemberItems is not null THEN @ItemStatus_MemberItems ELSE  ItemStatus END
					, sCol1 = CASE WHEN @sCol1_MemberItems is not null THEN @sCol1_MemberItems ELSE  sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberItems is not null THEN @sCol2_MemberItems ELSE  sCol2 END
					, sCol3 = CASE WHEN @sCol3_MemberItems is not null THEN @sCol3_MemberItems ELSE  sCol3 END
					, sCol4 = CASE WHEN @sCol4_MemberItems is not null THEN @sCol4_MemberItems ELSE  sCol4 END
					, sCol5 = CASE WHEN @sCol5_MemberItems is not null THEN @sCol5_MemberItems ELSE  sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberItems is not null THEN @sCol6_MemberItems ELSE  sCol6 END
					, sCol7 = CASE WHEN @sCol7_MemberItems is not null THEN @sCol7_MemberItems ELSE  sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberItems is not null THEN @sCol8_MemberItems ELSE  sCol8 END
					, sCol9 = CASE WHEN @sCol9_MemberItems is not null THEN @sCol9_MemberItems ELSE  sCol9 END
					, sCol10 = CASE WHEN @sCol10_MemberItems is not null THEN @sCol10_MemberItems ELSE  sCol10 END
					,UpdatedAt = sysutcdatetime()
				where MemberItemID like @MemberItemID_MemberItems
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				--  GameEventMember에 추가	GameEventMemberID는 insert라 생성해 넣음
				insert into CloudBread.GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(newid(), @eventID_GameEventMember,@MemberID_GameEventMember,@sCol1_GameEventMember,@sCol2_GameEventMember,@sCol3_GameEventMember,@sCol4_GameEventMember,@sCol5_GameEventMember,@sCol6_GameEventMember,@sCol7_GameEventMember,@sCol8_GameEventMember,@sCol9_GameEventMember,@sCol10_GameEventMember)

				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end

	select @rowcount as Result
end
else
	select 0 as Result	--이벤트가 존재하지 않거나 만료

GO
/****** Object:  StoredProcedure [CloudBread].[uspUdtLoginInfo]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspUdtLoginInfo]
@MemberID nvarchar(MAX) = NULL
,@MemberPWD nvarchar(MAX) = NULL
,@EmailAddress nvarchar(MAX) = NULL
,@EmailConfirmedYN nvarchar(MAX) = NULL
,@PhoneNumber1 nvarchar(MAX) = NULL
,@PhoneNumber2 nvarchar(MAX) = NULL
,@PINumber nvarchar(MAX) = NULL
,@Name1 nvarchar(MAX) = NULL
,@Name2 nvarchar(MAX) = NULL
,@Name3 nvarchar(MAX) = NULL
,@DOB nvarchar(MAX) = NULL
,@RecommenderID nvarchar(MAX) = NULL
,@MemberGroup nvarchar(MAX) = NULL
,@LastDeviceID nvarchar(MAX) = NULL
,@LastIPaddress nvarchar(MAX) = NULL
,@LastLoginDT nvarchar(MAX) = NULL
,@LastLogoutDT nvarchar(MAX) = NULL
,@LastMACAddress nvarchar(MAX) = NULL
,@AccountBlockYN nvarchar(MAX) = NULL
,@AccountBlockEndDT nvarchar(MAX) = NULL
,@AnonymousYN nvarchar(MAX) = NULL
,@3rdAuthProvider nvarchar(MAX) = NULL
,@3rdAuthID nvarchar(MAX) = NULL
,@3rdAuthParam nvarchar(MAX) = NULL
,@PushNotificationID nvarchar(MAX) = NULL
,@PushNotificationProvider nvarchar(MAX) = NULL
,@PushNotificationGroup nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL
,@TimeZoneID nvarchar(MAX) = NULL		-- 암호화 안함
AS 
--set, lock 옵션 등 체크
set nocount on
update CloudBread.Members
set  
MemberID = CASE WHEN @MemberID is not null THEN @MemberID ELSE  MemberID END
, MemberPWD = CASE WHEN @MemberPWD is not null THEN @MemberPWD ELSE  MemberPWD END
, EmailAddress = CASE WHEN @EmailAddress is not null THEN @EmailAddress ELSE  EmailAddress END
, EmailConfirmedYN = CASE WHEN @EmailConfirmedYN is not null THEN @EmailConfirmedYN ELSE  EmailConfirmedYN END
, PhoneNumber1 = CASE WHEN @PhoneNumber1 is not null THEN @PhoneNumber1 ELSE  PhoneNumber1 END
, PhoneNumber2 = CASE WHEN @PhoneNumber2 is not null THEN @PhoneNumber2 ELSE  PhoneNumber2 END
, PINumber = CASE WHEN @PINumber is not null THEN @PINumber ELSE  PINumber END
, Name1 = CASE WHEN @Name1 is not null THEN @Name1 ELSE  Name1 END
, Name2 = CASE WHEN @Name2 is not null THEN @Name2 ELSE  Name2 END
, Name3 = CASE WHEN @Name3 is not null THEN @Name3 ELSE  Name3 END
, DOB = CASE WHEN @DOB is not null THEN @DOB ELSE  DOB END
, RecommenderID = CASE WHEN @RecommenderID is not null THEN @RecommenderID ELSE  RecommenderID END
, MemberGroup = CASE WHEN @MemberGroup is not null THEN @MemberGroup ELSE  MemberGroup END
, LastDeviceID = CASE WHEN @LastDeviceID is not null THEN @LastDeviceID ELSE  LastDeviceID END
, LastIPaddress = CASE WHEN @LastIPaddress is not null THEN @LastIPaddress ELSE  LastIPaddress END
, LastLoginDT = CASE WHEN @LastLoginDT is not null THEN @LastLoginDT ELSE  LastLoginDT END
, LastLogoutDT = CASE WHEN @LastLogoutDT is not null THEN @LastLogoutDT ELSE  LastLogoutDT END
, LastMACAddress = CASE WHEN @LastMACAddress is not null THEN @LastMACAddress ELSE  LastMACAddress END
, AccountBlockYN = CASE WHEN @AccountBlockYN is not null THEN @AccountBlockYN ELSE  AccountBlockYN END
, AccountBlockEndDT = CASE WHEN @AccountBlockEndDT is not null THEN @AccountBlockEndDT ELSE  AccountBlockEndDT END
, AnonymousYN = CASE WHEN @AnonymousYN is not null THEN @AnonymousYN ELSE  AnonymousYN END
, [3rdAuthProvider] = CASE WHEN @3rdAuthProvider is not null THEN @3rdAuthProvider ELSE  [3rdAuthProvider] END
, [3rdAuthID] = CASE WHEN @3rdAuthID is not null THEN @3rdAuthID ELSE  [3rdAuthID] END
, [3rdAuthParam] = CASE WHEN @3rdAuthParam is not null THEN @3rdAuthParam ELSE  [3rdAuthParam] END
, PushNotificationID = CASE WHEN @PushNotificationID is not null THEN @PushNotificationID ELSE  PushNotificationID END
, PushNotificationProvider = CASE WHEN @PushNotificationProvider is not null THEN @PushNotificationProvider ELSE  PushNotificationProvider END
, PushNotificationGroup = CASE WHEN @PushNotificationGroup is not null THEN @PushNotificationGroup ELSE  PushNotificationGroup END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
, TimeZoneID = CASE WHEN @TimeZoneID is not null THEN @TimeZoneID ELSE  TimeZoneID END
, UpdatedAt = sysutcdatetime()
where MemberID like @MemberID and MemberPWD like @MemberPWD and HideYN like 'N' and DeleteYN like 'N'
select @@ROWCOUNT as Result


GO
/****** Object:  StoredProcedure [CloudBread].[uspUdtMemberGameInfoStage]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspUdtMemberGameInfoStage]
@InsertORUpdate nvarchar(MAX) = NULL
, @MemberID_MemberGameInfoes nvarchar(MAX) = NULL
, @Level_MemberGameInfoes nvarchar(MAX) = NULL
, @Exps_MemberGameInfoes nvarchar(MAX) = NULL
, @Points_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT1_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT2_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT3_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT4_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT5_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT6_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT7_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT8_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT9_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT10_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol1_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol2_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol3_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol4_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol5_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol6_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol7_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol8_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol9_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol10_MemberGameInfoes nvarchar(MAX) = NULL
, @MemberGameInfoStageID_MemberGameInfoStages nvarchar(MAX) = NULL
, @MemberID_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageName_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStatus_MemberGameInfoStages nvarchar(MAX) = NULL
, @Category1_MemberGameInfoStages nvarchar(MAX) = NULL
, @Category2_MemberGameInfoStages nvarchar(MAX) = NULL
, @Category3_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission1_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission2_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission3_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission4_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission5_MemberGameInfoStages nvarchar(MAX) = NULL
, @Points_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat1_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat2_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat3_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat4_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat5_MemberGameInfoStages nvarchar(MAX) = NULL
--, @HideYN_MemberGameInfoStages nvarchar(MAX) = NULL
--, @DeleteYN_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol1_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol2_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol3_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol4_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol5_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol6_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol7_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol8_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol9_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol10_MemberGameInfoStages nvarchar(MAX) = NULL
AS 
--stage가 있을 경우 update 하고 없을 경우 insret 한다.
--set, lock 옵션 등 체크
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
	if upper(@InsertORUpdate) = 'INSERT' 
		begin
			begin tran
				--INSERT 일 경우 MemberGameInfoStages에 추가하고,  MemberGameInfo에 update
				insert into CloudBread.MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5,  sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(newid(), @MemberID_MemberGameInfoStages, @StageName_MemberGameInfoStages, @StageStatus_MemberGameInfoStages, @Category1_MemberGameInfoStages, @Category2_MemberGameInfoStages, @Category3_MemberGameInfoStages, @Mission1_MemberGameInfoStages, @Mission2_MemberGameInfoStages, @Mission3_MemberGameInfoStages, @Mission4_MemberGameInfoStages, @Mission5_MemberGameInfoStages, @Points_MemberGameInfoStages, @StageStat1_MemberGameInfoStages, @StageStat2_MemberGameInfoStages, @StageStat3_MemberGameInfoStages, @StageStat4_MemberGameInfoStages, @StageStat5_MemberGameInfoStages,@sCol1_MemberGameInfoStages, @sCol2_MemberGameInfoStages, @sCol3_MemberGameInfoStages, @sCol4_MemberGameInfoStages, @sCol5_MemberGameInfoStages, @sCol6_MemberGameInfoStages, @sCol7_MemberGameInfoStages, @sCol8_MemberGameInfoStages, @sCol9_MemberGameInfoStages, @sCol10_MemberGameInfoStages)
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				-- MemberGameInfo에 update 수행
				update CloudBread.MemberGameInfoes set
					MemberID = CASE WHEN @MemberID_MemberGameInfoes is not null THEN @MemberID_MemberGameInfoes ELSE MemberID END
					, Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes ELSE Level END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes ELSE Exps END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes ELSE Points END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes ELSE UserSTAT1 END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes ELSE UserSTAT2 END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes ELSE UserSTAT3 END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes ELSE UserSTAT4 END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes ELSE UserSTAT5 END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes ELSE UserSTAT6 END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes ELSE UserSTAT7 END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes ELSE UserSTAT8 END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes ELSE UserSTAT9 END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes ELSE UserSTAT10 END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes ELSE sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes ELSE sCol2 END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes ELSE sCol3 END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes ELSE sCol4 END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes ELSE sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes ELSE sCol6 END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes ELSE sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes ELSE sCol8 END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes ELSE sCol9 END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes ELSE sCol10 END
					,UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes

				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end
	if upper(@InsertORUpdate) = 'UPDATE'
		begin
			begin tran
				----UPDATE 일 경우 MemberGameInfoStages에 update 하고,  MemberGameInfo에 update
				-- MemberGameInfoStages에 update 수행
				update CloudBread.MemberGameInfoStages set
					 MemberGameInfoStageID = CASE WHEN @MemberGameInfoStageID_MemberGameInfoStages is not null THEN @MemberGameInfoStageID_MemberGameInfoStages ELSE  MemberGameInfoStageID END
						, MemberID = CASE WHEN @MemberID_MemberGameInfoStages is not null THEN @MemberID_MemberGameInfoStages ELSE  MemberID END
						, StageName = CASE WHEN @StageName_MemberGameInfoStages is not null THEN @StageName_MemberGameInfoStages ELSE  StageName END
						, StageStatus = CASE WHEN @StageStatus_MemberGameInfoStages is not null THEN @StageStatus_MemberGameInfoStages ELSE  StageStatus END
						, Category1 = CASE WHEN @Category1_MemberGameInfoStages is not null THEN @Category1_MemberGameInfoStages ELSE  Category1 END
						, Category2 = CASE WHEN @Category2_MemberGameInfoStages is not null THEN @Category2_MemberGameInfoStages ELSE  Category2 END
						, Category3 = CASE WHEN @Category3_MemberGameInfoStages is not null THEN @Category3_MemberGameInfoStages ELSE  Category3 END
						, Mission1 = CASE WHEN @Mission1_MemberGameInfoStages is not null THEN @Mission1_MemberGameInfoStages ELSE  Mission1 END
						, Mission2 = CASE WHEN @Mission2_MemberGameInfoStages is not null THEN @Mission2_MemberGameInfoStages ELSE  Mission2 END
						, Mission3 = CASE WHEN @Mission3_MemberGameInfoStages is not null THEN @Mission3_MemberGameInfoStages ELSE  Mission3 END
						, Mission4 = CASE WHEN @Mission4_MemberGameInfoStages is not null THEN @Mission4_MemberGameInfoStages ELSE  Mission4 END
						, Mission5 = CASE WHEN @Mission5_MemberGameInfoStages is not null THEN @Mission5_MemberGameInfoStages ELSE  Mission5 END
						, Points = CASE WHEN @Points_MemberGameInfoStages is not null THEN @Points_MemberGameInfoStages ELSE  Points END
						, StageStat1 = CASE WHEN @StageStat1_MemberGameInfoStages is not null THEN @StageStat1_MemberGameInfoStages ELSE  StageStat1 END
						, StageStat2 = CASE WHEN @StageStat2_MemberGameInfoStages is not null THEN @StageStat2_MemberGameInfoStages ELSE  StageStat2 END
						, StageStat3 = CASE WHEN @StageStat3_MemberGameInfoStages is not null THEN @StageStat3_MemberGameInfoStages ELSE  StageStat3 END
						, StageStat4 = CASE WHEN @StageStat4_MemberGameInfoStages is not null THEN @StageStat4_MemberGameInfoStages ELSE  StageStat4 END
						, StageStat5 = CASE WHEN @StageStat5_MemberGameInfoStages is not null THEN @StageStat5_MemberGameInfoStages ELSE  StageStat5 END
						--, HideYN = CASE WHEN @HideYN_MemberGameInfoStages is not null THEN @HideYN_MemberGameInfoStages ELSE  HideYN END
						--, DeleteYN = CASE WHEN @DeleteYN_MemberGameInfoStages is not null THEN @DeleteYN_MemberGameInfoStages ELSE  DeleteYN END
						, sCol1 = CASE WHEN @sCol1_MemberGameInfoStages is not null THEN @sCol1_MemberGameInfoStages ELSE  sCol1 END
						, sCol2 = CASE WHEN @sCol2_MemberGameInfoStages is not null THEN @sCol2_MemberGameInfoStages ELSE  sCol2 END
						, sCol3 = CASE WHEN @sCol3_MemberGameInfoStages is not null THEN @sCol3_MemberGameInfoStages ELSE  sCol3 END
						, sCol4 = CASE WHEN @sCol4_MemberGameInfoStages is not null THEN @sCol4_MemberGameInfoStages ELSE  sCol4 END
						, sCol5 = CASE WHEN @sCol5_MemberGameInfoStages is not null THEN @sCol5_MemberGameInfoStages ELSE  sCol5 END
						, sCol6 = CASE WHEN @sCol6_MemberGameInfoStages is not null THEN @sCol6_MemberGameInfoStages ELSE  sCol6 END
						, sCol7 = CASE WHEN @sCol7_MemberGameInfoStages is not null THEN @sCol7_MemberGameInfoStages ELSE  sCol7 END
						, sCol8 = CASE WHEN @sCol8_MemberGameInfoStages is not null THEN @sCol8_MemberGameInfoStages ELSE  sCol8 END
						, sCol9 = CASE WHEN @sCol9_MemberGameInfoStages is not null THEN @sCol9_MemberGameInfoStages ELSE  sCol9 END
						, sCol10 = CASE WHEN @sCol10_MemberGameInfoStages is not null THEN @sCol10_MemberGameInfoStages ELSE  sCol10 END
						, UpdatedAt = SYSUTCDATETIME()
					where MemberGameInfoStageID like @MemberGameInfoStageID_MemberGameInfoStages

				-- MemberGameInfo에 update 수행
				update CloudBread.MemberGameInfoes set
					MemberID = CASE WHEN @MemberID_MemberGameInfoes is not null THEN @MemberID_MemberGameInfoes ELSE MemberID END
					, Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes ELSE Level END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes ELSE Exps END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes ELSE Points END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes ELSE UserSTAT1 END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes ELSE UserSTAT2 END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes ELSE UserSTAT3 END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes ELSE UserSTAT4 END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes ELSE UserSTAT5 END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes ELSE UserSTAT6 END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes ELSE UserSTAT7 END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes ELSE UserSTAT8 END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes ELSE UserSTAT9 END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes ELSE UserSTAT10 END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes ELSE sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes ELSE sCol2 END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes ELSE sCol3 END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes ELSE sCol4 END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes ELSE sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes ELSE sCol6 END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes ELSE sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes ELSE sCol8 END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes ELSE sCol9 END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes ELSE sCol10 END
					,UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes
				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end

	select @rowcount as Result


GO
/****** Object:  StoredProcedure [CloudBread].[uspUdtMoveGift]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspUdtMoveGift]
 @InsertORUpdate nvarchar(MAX) 		-- 문자열은 INSERT  또는 UPDATE
, @GiftDepositoryID nvarchar(MAX)	 	--gift 테이블 삭제 플래그 처리를 위해
,	@MemberItemID nvarchar(MAX) = NULL
,	@MemberID nvarchar(MAX) = NULL
,	@ItemListID nvarchar(MAX) = NULL
,	@ItemCount nvarchar(MAX) = NULL
,	@ItemStatus nvarchar(MAX) = NULL
,	@sCol1 nvarchar(MAX) = NULL
,	@sCol2 nvarchar(MAX) = NULL
,	@sCol3 nvarchar(MAX) = NULL
,	@sCol4 nvarchar(MAX) = NULL
,	@sCol5 nvarchar(MAX) = NULL
,	@sCol6 nvarchar(MAX) = NULL
,	@sCol7 nvarchar(MAX) = NULL
,	@sCol8 nvarchar(MAX) = NULL
,	@sCol9 nvarchar(MAX) = NULL
,	@sCol10 nvarchar(MAX) = NULL
AS 
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0

if upper(@InsertORUpdate) = 'INSERT' 
	begin
		begin tran
			--MemberItems에 삽입하고 gift에서 gift deleteYN flag 바꾸기
			insert into CloudBread.MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10) 
			values(newid(), @MemberID,@ItemListID,@ItemCount,@ItemStatus,@sCol1,@sCol2,@sCol3,@sCol4,@sCol5,@sCol6,@sCol7,@sCol8,@sCol9,@sCol10)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			--삭제 플래그 루틴
			--delete from CloudBread.GiftDepositories where GiftDepositoryID like @GiftDepositoryID
			update CloudBread.GiftDepositories set SentMemberYN = 'Y', DeleteYN = 'Y', UpdatedAt = sysutcdatetime() where GiftDepositoryID like @GiftDepositoryID
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@InsertORUpdate) = 'UPDATE'
	begin
		begin tran
		--MemberItems에 update하고 gift에서 gift 실제 삭제
		update CloudBread.MemberItems set 
			MemberID = CASE WHEN @MemberID is not null THEN @MemberID ELSE  MemberID END
			, ItemListID = CASE WHEN @ItemListID is not null THEN @ItemListID ELSE  ItemListID END
			, ItemCount = CASE WHEN @ItemCount is not null THEN @ItemCount ELSE  ItemCount END
			, ItemStatus = CASE WHEN @ItemStatus is not null THEN @ItemStatus ELSE  ItemStatus END
			, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
			, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
			, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
			, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
			, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
			, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
			, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
			, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
			, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
			, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
			, UpdatedAt = sysutcdatetime()
			where MemberItemID like @MemberItemID
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		--삭제 플래그 루틴
		--delete from CloudBread.GiftDepositories where GiftDepositoryID like @GiftDepositoryID
		update CloudBread.GiftDepositories set SentMemberYN = 'Y', DeleteYN = 'Y', UpdatedAt = sysutcdatetime() where GiftDepositoryID like @GiftDepositoryID
		set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end

select @rowcount as Result

GO
/****** Object:  StoredProcedure [CloudBread].[uspUdtReturnItem]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspUdtReturnItem]
 @InsertORUpdate nvarchar(MAX)	= NULL		-- 문자열은 DELETE(보유아이템의 한 항목)  또는 UPDATE
--MemberItems 테이블
 , @MemberItemID_MemberItems nvarchar(MAX)	= NULL
, @MemberID_MemberItems nvarchar(MAX)		= NULL	--MemberID  편의상 중복
, @ItemListID_MemberItems nvarchar(MAX)	= NULL
, @ItemCount_MemberItems nvarchar(MAX)	= NULL
, @ItemStatus_MemberItems nvarchar(MAX)	= NULL
--, @HideYN_MemberItems nvarchar(MAX)	= NULL
--, @DeleteYN_MemberItems nvarchar(MAX)	= NULL
, @sCol1_MemberItems nvarchar(MAX)	= NULL
, @sCol2_MemberItems nvarchar(MAX)	= NULL
, @sCol3_MemberItems nvarchar(MAX)	= NULL
, @sCol4_MemberItems nvarchar(MAX)	= NULL
, @sCol5_MemberItems nvarchar(MAX)	= NULL
, @sCol6_MemberItems nvarchar(MAX)	= NULL
, @sCol7_MemberItems nvarchar(MAX)	= NULL
, @sCol8_MemberItems nvarchar(MAX)	= NULL
, @sCol9_MemberItems nvarchar(MAX)	= NULL
, @sCol10_MemberItems nvarchar(MAX)	= NULL
--MemberItemPurchases 테이블 /
, @MemberItemPurchaseID_MemberItemPurchases nvarchar(MAX)		= NULL		--변경된 부분
, @MemberID_MemberItemPurchases nvarchar(MAX)	= NULL	--MemberID  편의상 중복
, @ItemListID_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseQuantity_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchasePrice_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo1_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo2_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo3_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo4_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo5_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseDeviceID_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseDeviceIPAddress_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseDeviceMACAddress_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseDT_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelYN_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelDT_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelingStatus_MemberItemPurchases nvarchar(MAX)	= NULL
--, @PurchaseCancelConfirmAdminMemberID_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelReturnedAmount_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelDeviceID_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelDeviceIPAddress_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelDeviceMACAddress_MemberItemPurchases nvarchar(MAX)	= NULL
--, @HideYN_MemberItemPurchases nvarchar(MAX)	= NULL
--, @DeleteYN_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol1_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol2_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol3_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol4_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol5_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol6_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol7_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol8_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol9_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol10_MemberItemPurchases nvarchar(MAX)	= NULL
--MemberGameInfoes 테이블 파라미터
, @MemberID_MemberGameInfoes nvarchar(MAX)	= NULL		--편의상 중복
, @Level_MemberGameInfoes nvarchar(MAX)	= NULL
, @Exps_MemberGameInfoes nvarchar(MAX)	= NULL
, @Points_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT1_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT2_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT3_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT4_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT5_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT6_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT7_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT8_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT9_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT10_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol1_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol2_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol3_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol4_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol5_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol6_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol7_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol8_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol9_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol10_MemberGameInfoes nvarchar(MAX)	= NULL
AS 
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0

if upper(@InsertORUpdate) = 'DELETE' 
	begin
		begin tran
			--MemberItems에서 삭제하고,  MemberItemPurchases에 수정하고 MemberGameInfoes 를 수정
			--MemberItems에 삭제
			--delete from MemberItems where MemberItemID like @MemberItemID_MemberItems
			update MemberItems set DeleteYN = 'Y', UpdatedAt = sysutcdatetime() where MemberItemID like @MemberItemID_MemberItems
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			--MemberItemPurchases에 수정
			update MemberItemPurchases set
				MemberID = CASE WHEN @MemberID_MemberItemPurchases is not null THEN @MemberID_MemberItemPurchases  ELSE  MemberID  END
				, ItemListID = CASE WHEN @ItemListID_MemberItemPurchases is not null THEN @ItemListID_MemberItemPurchases  ELSE  ItemListID  END
				, PurchaseQuantity = CASE WHEN @PurchaseQuantity_MemberItemPurchases is not null THEN @PurchaseQuantity_MemberItemPurchases  ELSE PurchaseQuantity   END
				, PurchasePrice = CASE WHEN @PurchasePrice_MemberItemPurchases is not null THEN @PurchasePrice_MemberItemPurchases  ELSE  PurchasePrice  END
				, PGinfo1 = CASE WHEN @PGinfo1_MemberItemPurchases is not null THEN @PGinfo1_MemberItemPurchases  ELSE  PGinfo1  END
				, PGinfo2 = CASE WHEN @PGinfo2_MemberItemPurchases is not null THEN @PGinfo2_MemberItemPurchases  ELSE  PGinfo2  END
				, PGinfo3 = CASE WHEN @PGinfo3_MemberItemPurchases is not null THEN @PGinfo3_MemberItemPurchases  ELSE  PGinfo3  END
				, PGinfo4 = CASE WHEN @PGinfo4_MemberItemPurchases is not null THEN @PGinfo4_MemberItemPurchases  ELSE PGinfo4   END
				, PGinfo5 = CASE WHEN @PGinfo5_MemberItemPurchases is not null THEN @PGinfo5_MemberItemPurchases  ELSE  PGinfo5  END
				, PurchaseDeviceID = CASE WHEN @PurchaseDeviceID_MemberItemPurchases is not null THEN @PurchaseDeviceID_MemberItemPurchases  ELSE  PurchaseDeviceID  END
				, PurchaseDeviceIPAddress = CASE WHEN @PurchaseDeviceIPAddress_MemberItemPurchases is not null THEN @PurchaseDeviceIPAddress_MemberItemPurchases  ELSE  PurchaseDeviceIPAddress  END
				, PurchaseDeviceMACAddress = CASE WHEN @PurchaseDeviceMACAddress_MemberItemPurchases is not null THEN @PurchaseDeviceMACAddress_MemberItemPurchases  ELSE  PurchaseDeviceMACAddress  END
				, PurchaseDT = CASE WHEN @PurchaseDT_MemberItemPurchases is not null THEN @PurchaseDT_MemberItemPurchases  ELSE PurchaseDT   END
				, PurchaseCancelYN = CASE WHEN @PurchaseCancelYN_MemberItemPurchases is not null THEN @PurchaseCancelYN_MemberItemPurchases  ELSE PurchaseCancelYN   END
				, PurchaseCancelDT = CASE WHEN @PurchaseCancelDT_MemberItemPurchases is not null THEN @PurchaseCancelDT_MemberItemPurchases  ELSE  PurchaseCancelDT  END
				, PurchaseCancelingStatus = CASE WHEN @PurchaseCancelingStatus_MemberItemPurchases is not null THEN @PurchaseCancelingStatus_MemberItemPurchases  ELSE PurchaseCancelingStatus   END
				, PurchaseCancelReturnedAmount = CASE WHEN @PurchaseCancelReturnedAmount_MemberItemPurchases is not null THEN @PurchaseCancelReturnedAmount_MemberItemPurchases  ELSE PurchaseCancelReturnedAmount   END
				, PurchaseCancelDeviceID = CASE WHEN @PurchaseCancelDeviceID_MemberItemPurchases is not null THEN @PurchaseCancelDeviceID_MemberItemPurchases  ELSE PurchaseCancelDeviceID   END
				, PurchaseCancelDeviceIPAddress = CASE WHEN @PurchaseCancelDeviceIPAddress_MemberItemPurchases is not null THEN @PurchaseCancelDeviceIPAddress_MemberItemPurchases  ELSE  PurchaseCancelDeviceIPAddress  END
				, PurchaseCancelDeviceMACAddress = CASE WHEN @PurchaseCancelDeviceMACAddress_MemberItemPurchases is not null THEN @PurchaseCancelDeviceMACAddress_MemberItemPurchases  ELSE  PurchaseCancelDeviceMACAddress  END
				, sCol1 = CASE WHEN @sCol1_MemberItemPurchases is not null THEN @sCol1_MemberItemPurchases  ELSE sCol1   END
				, sCol2 = CASE WHEN @sCol2_MemberItemPurchases is not null THEN @sCol2_MemberItemPurchases  ELSE   sCol2 END
				, sCol3 = CASE WHEN @sCol3_MemberItemPurchases is not null THEN @sCol3_MemberItemPurchases  ELSE sCol3   END
				, sCol4 = CASE WHEN @sCol4_MemberItemPurchases is not null THEN @sCol4_MemberItemPurchases  ELSE sCol4   END
				, sCol5 = CASE WHEN @sCol5_MemberItemPurchases is not null THEN @sCol5_MemberItemPurchases  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItemPurchases is not null THEN @sCol6_MemberItemPurchases  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItemPurchases is not null THEN @sCol7_MemberItemPurchases  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItemPurchases is not null THEN @sCol8_MemberItemPurchases  ELSE sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItemPurchases is not null THEN @sCol9_MemberItemPurchases  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItemPurchases is not null THEN @sCol10_MemberItemPurchases  ELSE sCol10   END
				,UpdatedAt = sysutcdatetime()
			where MemberItemPurchaseID like @MemberItemPurchaseID_MemberItemPurchases
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- MemberGameInfoes 수정
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE  Level  END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE Exps   END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE   UserSTAT10 END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE   sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE sCol3   END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6  END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8  END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE sCol9   END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					,UpdatedAt = sysutcdatetime()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@InsertORUpdate) = 'UPDATE'
	begin
		begin tran
			--MemberItems에서 수정하고,  MemberItemPurchases에 수정하고 MemberGameInfoes 를 수정
			--MemberItems에 수정
			update MemberItems set
				MemberID = CASE WHEN @MemberID_MemberItems is not null THEN @MemberID_MemberItems  ELSE  MemberID  END
				, ItemListID = CASE WHEN @ItemListID_MemberItems is not null THEN @ItemListID_MemberItems  ELSE   ItemListID END
				, ItemCount = CASE WHEN @ItemCount_MemberItems is not null THEN @ItemCount_MemberItems  ELSE  ItemCount  END
				, ItemStatus = CASE WHEN @ItemStatus_MemberItems is not null THEN @ItemStatus_MemberItems  ELSE  ItemStatus  END
				, sCol1 = CASE WHEN @sCol1_MemberItems is not null THEN @sCol1_MemberItems  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItems is not null THEN @sCol2_MemberItems  ELSE sCol2   END
				, sCol3 = CASE WHEN @sCol3_MemberItems is not null THEN @sCol3_MemberItems  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItems is not null THEN @sCol4_MemberItems  ELSE sCol4   END
				, sCol5 = CASE WHEN @sCol5_MemberItems is not null THEN @sCol5_MemberItems  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItems is not null THEN @sCol6_MemberItems  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItems is not null THEN @sCol7_MemberItems  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItems is not null THEN @sCol8_MemberItems  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItems is not null THEN @sCol9_MemberItems  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItems is not null THEN @sCol10_MemberItems  ELSE  sCol10  END
				,UpdatedAt = sysutcdatetime()
			where MemberItemID like @MemberItemID_MemberItems
			set @rowcount = @rowcount + (select @@ROWCOUNT)
					
			--MemberItemPurchases에 수정
			update MemberItemPurchases set
				MemberID = CASE WHEN @MemberID_MemberItemPurchases is not null THEN @MemberID_MemberItemPurchases  ELSE  MemberID  END
				, ItemListID = CASE WHEN @ItemListID_MemberItemPurchases is not null THEN @ItemListID_MemberItemPurchases  ELSE  ItemListID  END
				, PurchaseQuantity = CASE WHEN @PurchaseQuantity_MemberItemPurchases is not null THEN @PurchaseQuantity_MemberItemPurchases  ELSE PurchaseQuantity   END
				, PurchasePrice = CASE WHEN @PurchasePrice_MemberItemPurchases is not null THEN @PurchasePrice_MemberItemPurchases  ELSE  PurchasePrice  END
				, PGinfo1 = CASE WHEN @PGinfo1_MemberItemPurchases is not null THEN @PGinfo1_MemberItemPurchases  ELSE  PGinfo1  END
				, PGinfo2 = CASE WHEN @PGinfo2_MemberItemPurchases is not null THEN @PGinfo2_MemberItemPurchases  ELSE  PGinfo2  END
				, PGinfo3 = CASE WHEN @PGinfo3_MemberItemPurchases is not null THEN @PGinfo3_MemberItemPurchases  ELSE  PGinfo3  END
				, PGinfo4 = CASE WHEN @PGinfo4_MemberItemPurchases is not null THEN @PGinfo4_MemberItemPurchases  ELSE PGinfo3   END
				, PGinfo5 = CASE WHEN @PGinfo5_MemberItemPurchases is not null THEN @PGinfo5_MemberItemPurchases  ELSE   PGinfo5 END
				, PurchaseDeviceID = CASE WHEN @PurchaseDeviceID_MemberItemPurchases is not null THEN @PurchaseDeviceID_MemberItemPurchases  ELSE  PurchaseDeviceID  END
				, PurchaseDeviceIPAddress = CASE WHEN @PurchaseDeviceIPAddress_MemberItemPurchases is not null THEN @PurchaseDeviceIPAddress_MemberItemPurchases  ELSE PurchaseDeviceIPAddress   END
				, PurchaseDeviceMACAddress = CASE WHEN @PurchaseDeviceMACAddress_MemberItemPurchases is not null THEN @PurchaseDeviceMACAddress_MemberItemPurchases  ELSE   PurchaseDeviceMACAddress END
				, PurchaseDT = CASE WHEN @PurchaseDT_MemberItemPurchases is not null THEN @PurchaseDT_MemberItemPurchases  ELSE   PurchaseDT END
				, PurchaseCancelYN = CASE WHEN @PurchaseCancelYN_MemberItemPurchases is not null THEN @PurchaseCancelYN_MemberItemPurchases  ELSE   PurchaseCancelYN END
				, PurchaseCancelDT = CASE WHEN @PurchaseCancelDT_MemberItemPurchases is not null THEN @PurchaseCancelDT_MemberItemPurchases  ELSE  PurchaseCancelDT  END
				, PurchaseCancelingStatus = CASE WHEN @PurchaseCancelingStatus_MemberItemPurchases is not null THEN @PurchaseCancelingStatus_MemberItemPurchases  ELSE  PurchaseCancelingStatus  END
				, PurchaseCancelReturnedAmount = CASE WHEN @PurchaseCancelReturnedAmount_MemberItemPurchases is not null THEN @PurchaseCancelReturnedAmount_MemberItemPurchases  ELSE PurchaseCancelReturnedAmount   END
				, PurchaseCancelDeviceID = CASE WHEN @PurchaseCancelDeviceID_MemberItemPurchases is not null THEN @PurchaseCancelDeviceID_MemberItemPurchases  ELSE  PurchaseCancelDeviceID  END
				, PurchaseCancelDeviceIPAddress = CASE WHEN @PurchaseCancelDeviceIPAddress_MemberItemPurchases is not null THEN @PurchaseCancelDeviceIPAddress_MemberItemPurchases  ELSE  PurchaseCancelDeviceIPAddress  END
				, PurchaseCancelDeviceMACAddress = CASE WHEN @PurchaseCancelDeviceMACAddress_MemberItemPurchases is not null THEN @PurchaseCancelDeviceMACAddress_MemberItemPurchases  ELSE PurchaseCancelDeviceMACAddress   END
				, sCol1 = CASE WHEN @sCol1_MemberItemPurchases is not null THEN @sCol1_MemberItemPurchases  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItemPurchases is not null THEN @sCol2_MemberItemPurchases  ELSE  sCol2  END
				, sCol3 = CASE WHEN @sCol3_MemberItemPurchases is not null THEN @sCol3_MemberItemPurchases  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItemPurchases is not null THEN @sCol4_MemberItemPurchases  ELSE  sCol4  END
				, sCol5 = CASE WHEN @sCol5_MemberItemPurchases is not null THEN @sCol5_MemberItemPurchases  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItemPurchases is not null THEN @sCol6_MemberItemPurchases  ELSE sCol6   END
				, sCol7 = CASE WHEN @sCol7_MemberItemPurchases is not null THEN @sCol7_MemberItemPurchases  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItemPurchases is not null THEN @sCol8_MemberItemPurchases  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItemPurchases is not null THEN @sCol9_MemberItemPurchases  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItemPurchases is not null THEN @sCol10_MemberItemPurchases  ELSE  sCol10  END
				, UpdatedAt = sysutcdatetime()
			where MemberItemPurchaseID like @MemberItemPurchaseID_MemberItemPurchases
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			
			-- MemberGameInfoes 수정
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE  Level  END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE Exps   END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE   UserSTAT10 END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE   sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE sCol3   END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6  END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8  END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE sCol9   END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					, UpdatedAt = sysutcdatetime()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end

select @rowcount as Result


GO
/****** Object:  StoredProcedure [CloudBread].[uspUdtSellItem]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------------------------------------------
-- uspUdtSellItem 프로시저 생성
--DROP PROC CloudBread.uspUdtSellItem
CREATE PROC [CloudBread].[uspUdtSellItem]
@DeleteORUpdate nvarchar(MAX) = NULL		-- 인벤의 카운트 - 팔려는 숫자 = 0 이면 아이템을 삭제 또는 인벤카운드 - 팔려는 숫자 > 0 이면 수정을 결정 해서 파라미터로
,@MemberItemID_MemberItem nvarchar(MAX) = NULL
,@MemberID_MemberItem nvarchar(MAX) = NULL
,@ItemListID_MemberItem nvarchar(MAX) = NULL
,@ItemCount_MemberItem nvarchar(MAX) = NULL
,@ItemStatus_MemberItem nvarchar(MAX) = NULL
--,@HideYN_MemberItem nvarchar(MAX) = NULL
--,@DeleteYN_MemberItem nvarchar(MAX) = NULL
,@sCol1_MemberItem nvarchar(MAX) = NULL
,@sCol2_MemberItem nvarchar(MAX) = NULL
,@sCol3_MemberItem nvarchar(MAX) = NULL
,@sCol4_MemberItem nvarchar(MAX) = NULL
,@sCol5_MemberItem nvarchar(MAX) = NULL
,@sCol6_MemberItem nvarchar(MAX) = NULL
,@sCol7_MemberItem nvarchar(MAX) = NULL
,@sCol8_MemberItem nvarchar(MAX) = NULL
,@sCol9_MemberItem nvarchar(MAX) = NULL
,@sCol10_MemberItem nvarchar(MAX) = NULL
,@MemberID_MemberGameInfoes nvarchar(MAX) = NULL
,@Level_MemberGameInfoes nvarchar(MAX) = NULL
,@Exps_MemberGameInfoes nvarchar(MAX) = NULL
,@Points_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT1_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT2_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT3_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT4_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT5_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT6_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT7_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT8_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT9_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT10_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol1_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol2_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol3_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol4_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol5_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol6_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol7_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol8_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol9_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol10_MemberGameInfoes nvarchar(MAX) = NULL
AS 
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
if upper(@DeleteORUpdate) = 'DELETE' 
	begin
		begin tran
			--MemberItems에 삭제하고,  MemberGameInfoes 를 업데이트
			--MemberItems에 삭제
			--delete from CloudBread.MemberItems where MemberItemID like @MemberItemID_MemberItem
			update CloudBread.MemberItems set DeleteYN = 'Y', UpdatedAt = SYSUTCDATETIME() where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- MemberGameInfoes 를 업데이트
			update CloudBread.MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6   END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7   END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8   END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					, UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@DeleteORUpdate) = 'UPDATE'
	begin
		begin tran
			--MemberItems에 수정하고,  MemberGameInfoes 를 업데이트
			--MemberItems에 수정
			update MemberItems set
				MemberID = CASE WHEN @MemberID_MemberItem is not null THEN @MemberID_MemberItem  ELSE MemberID   END
				, ItemListID = CASE WHEN @ItemListID_MemberItem is not null THEN @ItemListID_MemberItem  ELSE  ItemListID  END
				, ItemCount = CASE WHEN @ItemCount_MemberItem is not null THEN @ItemCount_MemberItem  ELSE   ItemCount END
				, ItemStatus = CASE WHEN @ItemStatus_MemberItem is not null THEN @ItemStatus_MemberItem  ELSE  ItemStatus  END
				--, HideYN = CASE WHEN @HideYN_MemberItem is not null THEN @HideYN_MemberItem  ELSE  HideYN  END
				--, DeleteYN = CASE WHEN @DeleteYN_MemberItem is not null THEN @DeleteYN_MemberItem  ELSE  DeleteYN  END
				, sCol1 = CASE WHEN @sCol1_MemberItem is not null THEN @sCol1_MemberItem  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItem is not null THEN @sCol2_MemberItem  ELSE  sCol2 END
				, sCol3 = CASE WHEN @sCol3_MemberItem is not null THEN @sCol3_MemberItem  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItem is not null THEN @sCol4_MemberItem  ELSE  sCol4  END
				, sCol5 = CASE WHEN @sCol5_MemberItem is not null THEN @sCol5_MemberItem  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItem is not null THEN @sCol6_MemberItem  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItem is not null THEN @sCol7_MemberItem  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItem is not null THEN @sCol8_MemberItem  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItem is not null THEN @sCol9_MemberItem  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItem is not null THEN @sCol10_MemberItem  ELSE  sCol10  END
				, UpdatedAt = SYSUTCDATETIME()
			where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			-- MemberGameInfoes 수정
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE Points   END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6  END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7  END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8  END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					, UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end

select @rowcount as Result


GO
/****** Object:  StoredProcedure [CloudBread].[uspUdtSendGift]    Script Date: 2015-03-15 오후 11:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CloudBread].[uspUdtSendGift]
@DeleteORUpdate nvarchar(MAX) = NULL		-- 인벤의 카운트 - 보내려는  숫자 = 0 이면 아이템을 삭제 또는 인벤카운드 - 팔려는 숫자 > 0 이면 수정을 결정 해서 파라미터로
,@MemberItemID_MemberItem nvarchar(MAX) = NULL
,@MemberID_MemberItem nvarchar(MAX) = NULL
,@ItemListID_MemberItem nvarchar(MAX) = NULL
,@ItemCount_MemberItem nvarchar(MAX) = NULL
,@ItemStatus_MemberItem nvarchar(MAX) = NULL
--,@HideYN_MemberItem nvarchar(MAX) = NULL
--,@DeleteYN_MemberItem nvarchar(MAX) = NULL
,@sCol1_MemberItem nvarchar(MAX) = NULL
,@sCol2_MemberItem nvarchar(MAX) = NULL
,@sCol3_MemberItem nvarchar(MAX) = NULL
,@sCol4_MemberItem nvarchar(MAX) = NULL
,@sCol5_MemberItem nvarchar(MAX) = NULL
,@sCol6_MemberItem nvarchar(MAX) = NULL
,@sCol7_MemberItem nvarchar(MAX) = NULL
,@sCol8_MemberItem nvarchar(MAX) = NULL
,@sCol9_MemberItem nvarchar(MAX) = NULL
,@sCol10_MemberItem nvarchar(MAX) = NULL

,@GiftDepositoryID_GiftDepository nvarchar(MAX) = NULL
--,@ItemName_GiftDepository nvarchar(MAX) = NULL
,@ItemListID_GiftDepository nvarchar(MAX) = NULL
,@ItemCount_GiftDepository nvarchar(MAX) = NULL
,@FromMemberID_GiftDepository nvarchar(MAX) = NULL
,@ToMemberID_GiftDepository nvarchar(MAX) = NULL
--,@SentMemberYN_GiftDepository nvarchar(MAX) = NULL
--,@HideYN_GiftDepository nvarchar(MAX) = NULL
--,@DeleteYN_GiftDepository nvarchar(MAX) = NULL
,@sCol1_GiftDepository nvarchar(MAX) = NULL
,@sCol2_GiftDepository nvarchar(MAX) = NULL
,@sCol3_GiftDepository nvarchar(MAX) = NULL
,@sCol4_GiftDepository nvarchar(MAX) = NULL
,@sCol5_GiftDepository nvarchar(MAX) = NULL
,@sCol6_GiftDepository nvarchar(MAX) = NULL
,@sCol7_GiftDepository nvarchar(MAX) = NULL
,@sCol8_GiftDepository nvarchar(MAX) = NULL
,@sCol9_GiftDepository nvarchar(MAX) = NULL
,@sCol10_GiftDepository nvarchar(MAX) = NULL

AS 
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
if upper(@DeleteORUpdate) = 'DELETE' 
	begin
		begin tran
			--MemberItems에 삭제하고,  GiftDepositories에 insert 
			--MemberItems에 삭제
			--delete from CloudBread.MemberItems where MemberItemID like @MemberItemID_MemberItem
			update CloudBread.MemberItems set DeleteYN = 'Y', UpdatedAt = SYSUTCDATETIME() where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- GiftDepositories 를 insert
			insert into CloudBread.GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 )
			values(
				NEWID() 
--				,@ItemName_GiftDepository 
				,@ItemListID_GiftDepository 
				,@ItemCount_GiftDepository 
				,@FromMemberID_GiftDepository 
				,@ToMemberID_GiftDepository 
				--,@SentMemberYN_GiftDepository 
				--,@HideYN_GiftDepository 
				--,@DeleteYN_GiftDepository 
				,@sCol1_GiftDepository 
				,@sCol2_GiftDepository 
				,@sCol3_GiftDepository 
				,@sCol4_GiftDepository 
				,@sCol5_GiftDepository 
				,@sCol6_GiftDepository 
				,@sCol7_GiftDepository 
				,@sCol8_GiftDepository 
				,@sCol9_GiftDepository 
				,@sCol10_GiftDepository
				)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@DeleteORUpdate) = 'UPDATE'
	begin
		begin tran
			--MemberItems에 수정하고,  GiftDepositories에 insert 
			--MemberItems에 수정
			update MemberItems set
				MemberID = CASE WHEN @MemberID_MemberItem is not null THEN @MemberID_MemberItem  ELSE MemberID   END
				, ItemListID = CASE WHEN @ItemListID_MemberItem is not null THEN @ItemListID_MemberItem  ELSE  ItemListID  END
				, ItemCount = CASE WHEN @ItemCount_MemberItem is not null THEN @ItemCount_MemberItem  ELSE   ItemCount END
				, ItemStatus = CASE WHEN @ItemStatus_MemberItem is not null THEN @ItemStatus_MemberItem  ELSE  ItemStatus  END
				--, HideYN = CASE WHEN @HideYN_MemberItem is not null THEN @HideYN_MemberItem  ELSE  HideYN  END
				--, DeleteYN = CASE WHEN @DeleteYN_MemberItem is not null THEN @DeleteYN_MemberItem  ELSE  DeleteYN  END
				, sCol1 = CASE WHEN @sCol1_MemberItem is not null THEN @sCol1_MemberItem  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItem is not null THEN @sCol2_MemberItem  ELSE  sCol2 END
				, sCol3 = CASE WHEN @sCol3_MemberItem is not null THEN @sCol3_MemberItem  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItem is not null THEN @sCol4_MemberItem  ELSE  sCol4  END
				, sCol5 = CASE WHEN @sCol5_MemberItem is not null THEN @sCol5_MemberItem  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItem is not null THEN @sCol6_MemberItem  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItem is not null THEN @sCol7_MemberItem  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItem is not null THEN @sCol8_MemberItem  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItem is not null THEN @sCol9_MemberItem  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItem is not null THEN @sCol10_MemberItem  ELSE  sCol10  END
				, UpdatedAt = SYSUTCDATETIME()
			where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- GiftDepositories 를 insert
			insert into CloudBread.GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID,sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 )
			values(
				NEWID() 
--				,@ItemName_GiftDepository 
				,@ItemListID_GiftDepository 
				,@ItemCount_GiftDepository 
				,@FromMemberID_GiftDepository 
				,@ToMemberID_GiftDepository 
				--,@SentMemberYN_GiftDepository 
				--,@HideYN_GiftDepository 
				--,@DeleteYN_GiftDepository 
				,@sCol1_GiftDepository 
				,@sCol2_GiftDepository 
				,@sCol3_GiftDepository 
				,@sCol4_GiftDepository 
				,@sCol5_GiftDepository 
				,@sCol6_GiftDepository 
				,@sCol7_GiftDepository 
				,@sCol8_GiftDepository 
				,@sCol9_GiftDepository 
				,@sCol10_GiftDepository 
				)
			set @rowcount = @rowcount + (select @@ROWCOUNT)

		commit tran
	end

select @rowcount as Result


GO
USE [master]
GO
ALTER DATABASE [CloudBreadDB] SET  READ_WRITE 
GO
