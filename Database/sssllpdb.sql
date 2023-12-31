USE [master]
GO
/****** Object:  Database [sssllp]    Script Date: 22-09-2023 16:51:14 ******/
CREATE DATABASE [sssllp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sssllp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\sssllp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sssllp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\sssllp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sssllp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sssllp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sssllp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sssllp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sssllp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sssllp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sssllp] SET ARITHABORT OFF 
GO
ALTER DATABASE [sssllp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sssllp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sssllp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sssllp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sssllp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sssllp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sssllp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sssllp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sssllp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sssllp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sssllp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sssllp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sssllp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sssllp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sssllp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sssllp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sssllp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sssllp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sssllp] SET  MULTI_USER 
GO
ALTER DATABASE [sssllp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sssllp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sssllp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sssllp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [sssllp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [sssllp]
GO
/****** Object:  Table [dbo].[Admin_Tbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[uName] [nvarchar](max) NULL,
	[uPassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_Admin_Tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CallEnquiry]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CallEnquiry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](max) NULL,
	[cmobile] [nvarchar](max) NULL,
	[cpattern] [nvarchar](max) NULL,
	[cspec] [nvarchar](max) NULL,
	[cqty] [nvarchar](max) NULL,
	[cventure] [nvarchar](max) NULL,
	[rts] [datetime] NULL,
 CONSTRAINT [PK_CallEnquiry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientReportingPartyAccountTbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientReportingPartyAccountTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartyName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[VerificationName] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ClientReportingPartyAccountTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientReportingTbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientReportingTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoomNo] [nvarchar](max) NULL,
	[OwnParty] [nvarchar](max) NULL,
	[QualityNo] [nvarchar](max) NULL,
	[ReedxPickxRs] [nvarchar](max) NULL,
	[BeamNo] [nvarchar](max) NULL,
	[BeamPipeNo] [nvarchar](max) NULL,
	[DateOfGaitingKnotting] [nvarchar](max) NULL,
	[BillFallDate] [nvarchar](max) NULL,
	[Nos] [nvarchar](max) NULL,
	[AvgOfRollingMtr] [nvarchar](max) NULL,
	[AvgOfPick] [nvarchar](max) NULL,
	[TotalFabricReced] [nvarchar](max) NULL,
	[BeamBalanceMtr] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientReportingTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color_Tbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color_Tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Color_Tbl_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Details_Tbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Details_Tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[cName] [nvarchar](max) NULL,
	[cLogo] [nvarchar](max) NULL,
	[cSliderImage1] [nvarchar](max) NULL,
	[cSliderImage2] [nvarchar](max) NULL,
	[cSliderImage3] [nvarchar](max) NULL,
	[cAbout] [nvarchar](max) NULL,
	[cAddress] [nvarchar](max) NULL,
	[cEmail] [nvarchar](max) NULL,
	[cMobile1] [nvarchar](max) NULL,
	[cMobile2] [nvarchar](max) NULL,
 CONSTRAINT [PK_Company_Details_Tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact_Enqtbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Enqtbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](max) NULL,
	[umob] [nvarchar](max) NULL,
	[uemail] [nvarchar](max) NULL,
	[usub] [nvarchar](max) NULL,
	[umsg] [nvarchar](max) NULL,
	[rts] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact_Enqtbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers_Tbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers_Tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](max) NOT NULL,
	[Last_Name] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[rts] [date] NULL,
 CONSTRAINT [PK_Customers_Tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gallery_Tbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery_Tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[gimage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Gallery_Tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MyCart_Tbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyCart_Tbl](
	[MyCartID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ColorId] [int] NULL,
	[ColorName] [nvarchar](max) NULL,
 CONSTRAINT [PK_MyCart_Tbl] PRIMARY KEY CLUSTERED 
(
	[MyCartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Tbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ShippingID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ColorOrder] [int] NULL,
	[OrderColorName] [nvarchar](max) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_Order_Tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageVisits]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageVisits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PageUrl] [nvarchar](max) NULL,
	[IpAddress] [nvarchar](max) NULL,
	[VisitDateTime] [datetime] NULL,
	[VisitorId] [nvarchar](max) NULL,
 CONSTRAINT [PK_PageVisits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Tbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[pname] [nvarchar](max) NOT NULL,
	[pweight] [nvarchar](max) NULL,
	[pdetails] [nvarchar](max) NULL,
	[pimg1] [nvarchar](max) NULL,
	[pimg2] [nvarchar](max) NULL,
	[pimg3] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[rts] [datetime] NULL,
 CONSTRAINT [PK_Product_Tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductColorlist]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColorlist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[colorname] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductColorlist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Review_Tbl]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review_Tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](max) NULL,
	[uimg] [nvarchar](max) NULL,
	[ureview] [nvarchar](max) NULL,
	[ureviewdate] [nvarchar](max) NULL,
 CONSTRAINT [PK_Review_Tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Mobile] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[PostCode] [nvarchar](max) NULL,
	[OrderNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Team]    Script Date: 22-09-2023 16:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[about] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin_Tbl] ON 

INSERT [dbo].[Admin_Tbl] ([Id], [uName], [uPassword]) VALUES (1, N'sssllp', N'superadmin')
SET IDENTITY_INSERT [dbo].[Admin_Tbl] OFF
SET IDENTITY_INSERT [dbo].[CallEnquiry] ON 

INSERT [dbo].[CallEnquiry] ([Id], [cname], [cmobile], [cpattern], [cspec], [cqty], [cventure], [rts]) VALUES (1, N'om', N'1234567890', N'circle', NULL, N'1234 qty neede', N'dbh', CAST(N'2023-06-19 12:21:03.427' AS DateTime))
INSERT [dbo].[CallEnquiry] ([Id], [cname], [cmobile], [cpattern], [cspec], [cqty], [cventure], [rts]) VALUES (2, N'vikas sharma', N'08999292525', N'circle', N'yellow color, 1000 m', N'1234 qty neede', N'dbh', CAST(N'2023-06-19 12:39:53.567' AS DateTime))
SET IDENTITY_INSERT [dbo].[CallEnquiry] OFF
SET IDENTITY_INSERT [dbo].[Color_Tbl] ON 

INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (1, N'Red')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (2, N'Black')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (3, N'Orange')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (4, N'Green')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (5, N'Yellow')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (6, N'Blue')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (7, N'Purple')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (8, N'Brown')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (9, N'Grey')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (10, N'White')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (11, N'Pink')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (12, N'Cyan')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (13, N'Maroon')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (14, N'Violet')
INSERT [dbo].[Color_Tbl] ([Id], [ColorName]) VALUES (15, N'Wheat')
SET IDENTITY_INSERT [dbo].[Color_Tbl] OFF
SET IDENTITY_INSERT [dbo].[Company_Details_Tbl] ON 

INSERT [dbo].[Company_Details_Tbl] ([Id], [cName], [cLogo], [cSliderImage1], [cSliderImage2], [cSliderImage3], [cAbout], [cAddress], [cEmail], [cMobile1], [cMobile2]) VALUES (1, N'Shree Shanta Synfab LLP', N'SHREE SHANTA SYNFAB.png', N'desktopbannerimg1.jpg', N'homebannerimage2.jpg', N'cs3.jpg', N'Shree Shanta Synfab LLP, a well-respected entity, has positioned itself as a distinguished producer and exporter of an exclusive collection of fabrics for tailored suits. Our range encompasses various types of suiting fabrics, including cotton, polyester, viscose, and blended textiles. The manufacturing process we employ adheres to international standards, ensuring the superior quality of our products. Renowned for their exquisite patterns and designs, our suiting fabrics have secured a prominent position in the market. Our company was founded on the 7th of October, 2014, and our headquarters are located in Bhilwara, Rajasthan, India.
With our extensive experience, we have acquired specialized knowledge in producing suiting fabrics that align with current trends. Our state-of-the-art manufacturing unit for suiting fabrics gives us a competitive advantage in the market. Additionally, our commitment to conducting business ethically has resulted in the establishment of a substantial customer base throughout the country.', N'E-189(B), 3rd phase, RIICO Industrial Area, Biliya, Bhilwara, Rajasthan 311001', N'shreeshantasynfabllp@gmail.com', N'7021520017', N'7014905197')
SET IDENTITY_INSERT [dbo].[Company_Details_Tbl] OFF
SET IDENTITY_INSERT [dbo].[Contact_Enqtbl] ON 

INSERT [dbo].[Contact_Enqtbl] ([Id], [uname], [umob], [uemail], [usub], [umsg], [rts]) VALUES (1, N'Om Sharma', N'8999292525', N'omsharma@gmail.com', N'this is a test enquiry', N'this is a test enquiry', N'24-06-2023 01:32:11')
SET IDENTITY_INSERT [dbo].[Contact_Enqtbl] OFF
SET IDENTITY_INSERT [dbo].[Customers_Tbl] ON 

INSERT [dbo].[Customers_Tbl] ([Id], [First_Name], [Last_Name], [UserName], [Password], [State], [City], [Email], [Mobile], [Address], [rts]) VALUES (3, N'om', N'sharma', N'omsharma', N'omom', N'rajasthan', N'bhilwara', N'omopyt2020@gmail.com', N'8999292525', N'Sanjay Colony', CAST(N'2023-06-20' AS Date))
SET IDENTITY_INSERT [dbo].[Customers_Tbl] OFF
SET IDENTITY_INSERT [dbo].[Gallery_Tbl] ON 

INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (2, N'infra-img1.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (3, N'infra-img2.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (4, N'infra-img3.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (5, N'infra-img4.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (6, N'infra-img5.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (8, N'infra-img6.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (9, N'infra-img7.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (10, N'infra-img8.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (11, N'infra-img9.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (12, N'infra-img10.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (13, N'infra-img11.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (14, N'infra-img12.jpg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (15, N'Drawing.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (16, N'Drawing2.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (17, N'factory1.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (18, N'factory2.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (19, N'folding.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (20, N'Grey checking1.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (21, N'rewinding.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (22, N'stock1.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (23, N'stock2.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (24, N'sulzerloom-double.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (25, N'sulzerloom-single.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (26, N'warping1.jpeg')
INSERT [dbo].[Gallery_Tbl] ([Id], [gimage]) VALUES (27, N'warping2.jpeg')
SET IDENTITY_INSERT [dbo].[Gallery_Tbl] OFF
SET IDENTITY_INSERT [dbo].[Order_Tbl] ON 

INSERT [dbo].[Order_Tbl] ([Id], [CustomerID], [ProductID], [ShippingID], [Quantity], [ColorOrder], [OrderColorName], [OrderDate]) VALUES (1, 3, 2, 1, 3, 4, N'Green', CAST(N'2023-06-24 15:45:44.367' AS DateTime))
INSERT [dbo].[Order_Tbl] ([Id], [CustomerID], [ProductID], [ShippingID], [Quantity], [ColorOrder], [OrderColorName], [OrderDate]) VALUES (2, 3, 2, 2, 1, 13, N'Maroon', CAST(N'2023-06-24 15:45:44.423' AS DateTime))
INSERT [dbo].[Order_Tbl] ([Id], [CustomerID], [ProductID], [ShippingID], [Quantity], [ColorOrder], [OrderColorName], [OrderDate]) VALUES (3, 3, 1, 3, 10, 4, N'Green', CAST(N'2023-06-30 17:39:58.483' AS DateTime))
INSERT [dbo].[Order_Tbl] ([Id], [CustomerID], [ProductID], [ShippingID], [Quantity], [ColorOrder], [OrderColorName], [OrderDate]) VALUES (4, 3, 1, 4, 5, 13, N'Maroon', CAST(N'2023-06-30 17:39:58.500' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order_Tbl] OFF
SET IDENTITY_INSERT [dbo].[PageVisits] ON 

INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (1, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 15:16:19.370' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (2, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 15:40:20.047' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (3, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 16:16:52.923' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (4, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 16:23:10.543' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (5, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 16:35:52.687' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (6, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 16:44:47.690' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (7, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 16:50:37.217' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (8, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 16:51:33.207' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (9, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 16:56:23.350' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (10, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:08:23.117' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (11, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:10:27.893' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (12, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:16:05.797' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (13, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:16:25.910' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (14, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:16:30.807' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (15, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:17:50.483' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (16, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:18:06.867' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (17, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:34:06.987' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (18, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:35:39.883' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (19, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:50:01.857' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (20, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:55:14.957' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (21, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 17:58:32.900' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (22, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 22:55:56.383' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (23, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 23:11:13.803' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (24, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 23:26:13.480' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (25, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 23:33:32.097' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (26, N'https://localhost:44322/', N'::1', CAST(N'2023-06-23 23:53:01.900' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (27, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 00:06:10.393' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (28, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 01:30:21.690' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (29, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 10:16:36.787' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (30, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 11:40:35.443' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (31, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 11:40:39.797' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (32, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 11:43:34.297' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (33, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 11:46:42.623' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (34, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 12:02:55.450' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (35, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 12:03:58.900' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (36, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 12:43:14.947' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (37, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 15:45:44.467' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (38, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 15:47:10.140' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (39, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 15:47:50.127' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (40, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 15:55:47.823' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (41, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 16:03:50.687' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (42, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 16:34:20.550' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (43, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 16:36:00.970' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (44, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 16:36:50.347' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (45, N'https://localhost:44322/', N'::1', CAST(N'2023-06-24 16:37:31.253' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (46, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-25 00:18:38.650' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (47, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-25 00:24:58.630' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (48, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-25 00:27:50.303' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (49, N'https://localhost:44322/', N'::1', CAST(N'2023-06-25 23:53:25.930' AS DateTime), N'19ec5e80-15e2-4911-a7b8-2a3300cee041')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (50, N'https://localhost:44322/', N'::1', CAST(N'2023-06-26 22:00:30.570' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (51, N'https://localhost:44322/', N'::1', CAST(N'2023-06-26 22:01:53.433' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (52, N'https://localhost:44322/', N'::1', CAST(N'2023-06-26 22:07:33.890' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (53, N'https://localhost:44322/', N'::1', CAST(N'2023-06-26 22:11:58.957' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (54, N'https://localhost:44322/', N'::1', CAST(N'2023-06-26 22:13:22.273' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (55, N'https://localhost:44322/', N'::1', CAST(N'2023-06-26 23:10:58.397' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (56, N'https://localhost:44322/', N'::1', CAST(N'2023-06-26 23:12:36.393' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (57, N'https://localhost:44322/', N'::1', CAST(N'2023-06-27 00:08:57.817' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (58, N'https://localhost:44322/', N'::1', CAST(N'2023-06-27 00:15:21.777' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (59, N'https://localhost:44322/', N'::1', CAST(N'2023-06-27 00:23:46.563' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (60, N'https://localhost:44322/', N'::1', CAST(N'2023-06-27 17:25:12.843' AS DateTime), N'f325ae8f-2dad-484c-bc7d-ab8f52fd14cc')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (61, N'https://localhost:44322/', N'::1', CAST(N'2023-06-27 17:45:40.620' AS DateTime), N'e8713922-0f1c-4f6d-8f2a-de690b31f2bd')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (62, N'https://localhost:44322/', N'::1', CAST(N'2023-06-27 23:22:33.000' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (63, N'https://localhost:44322/', N'::1', CAST(N'2023-06-27 23:55:54.073' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (64, N'https://localhost:44322/', N'::1', CAST(N'2023-06-28 00:05:39.847' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (65, N'https://localhost:44322/', N'::1', CAST(N'2023-06-29 23:28:27.247' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (66, N'https://localhost:44322/', N'::1', CAST(N'2023-06-29 23:29:04.883' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (67, N'https://localhost:44322/', N'::1', CAST(N'2023-06-29 23:41:05.370' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (68, N'https://localhost:44322/', N'::1', CAST(N'2023-06-29 23:46:36.883' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (69, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 14:09:47.997' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (70, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:04:54.873' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (71, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:06:17.847' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (72, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:06:33.823' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (73, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:06:52.440' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (74, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:08:18.517' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (75, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:08:43.627' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (76, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:09:02.693' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (77, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:10:08.490' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (78, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:13:10.153' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (79, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:19:59.920' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (80, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:20:29.640' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (81, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:23:26.190' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (82, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:25:17.030' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (83, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:26:12.907' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (84, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:26:19.177' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (85, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:26:33.713' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (86, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:27:39.613' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (87, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:29:30.237' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (88, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 16:39:21.967' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (89, N'https://localhost:44322/', N'::1', CAST(N'2023-06-30 17:08:26.850' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (90, N'https://localhost:44322/', N'::1', CAST(N'2023-06-30 17:08:58.547' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (91, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 17:09:13.637' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (92, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 17:10:08.187' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (93, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 17:11:22.750' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (94, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 17:12:29.657' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (95, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-06-30 17:12:48.777' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (96, N'https://localhost:44322/', N'::1', CAST(N'2023-06-30 17:13:02.907' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (97, N'https://localhost:44322/', N'::1', CAST(N'2023-06-30 17:29:33.287' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (98, N'https://localhost:44322/', N'::1', CAST(N'2023-06-30 17:39:58.527' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (99, N'https://localhost:44322/', N'::1', CAST(N'2023-06-30 17:41:11.790' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
GO
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (100, N'https://localhost:44322/', N'::1', CAST(N'2023-06-30 17:42:00.840' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (101, N'https://localhost:44322/', N'::1', CAST(N'2023-06-30 17:42:49.497' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (102, N'https://localhost:44322/', N'::1', CAST(N'2023-06-30 17:43:30.777' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (103, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-07-03 11:14:22.347' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (104, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 11:18:14.797' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (105, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 11:19:41.383' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (106, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 11:19:54.937' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (107, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 12:49:01.303' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (108, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 13:41:43.513' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (109, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 13:41:57.873' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (110, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 13:44:28.777' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (111, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 13:48:04.997' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (112, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 13:49:32.107' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (113, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 13:53:42.087' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (114, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 13:53:58.600' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (115, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 13:54:31.887' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (116, N'https://localhost:44322/Home/Index', N'::1', CAST(N'2023-07-03 22:19:35.357' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (117, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 22:49:46.270' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (118, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 22:49:51.330' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
INSERT [dbo].[PageVisits] ([Id], [PageUrl], [IpAddress], [VisitDateTime], [VisitorId]) VALUES (119, N'https://localhost:44322/', N'::1', CAST(N'2023-07-03 22:52:07.103' AS DateTime), N'e6152e57-abc0-4467-b3b7-0edab4817432')
SET IDENTITY_INSERT [dbo].[PageVisits] OFF
SET IDENTITY_INSERT [dbo].[Product_Tbl] ON 

INSERT [dbo].[Product_Tbl] ([Id], [pname], [pweight], [pdetails], [pimg1], [pimg2], [pimg3], [status], [rts]) VALUES (1, N'Herringbone', N'1000', N'Herringbone, also called broken twill weave, describes a distinctive V-shaped weaving pattern usually found in twill fabric. It is distinguished from a plain chevron by the break at reversal, which makes it resemble a broken zigzag. The pattern is called herringbone because it resembles the skeleton of a herring fish.', N'pro-img1.jpg', N'pro-img2.jpg', N'pro-img3.jpg', 1, CAST(N'2023-06-23 00:08:20.000' AS DateTime))
INSERT [dbo].[Product_Tbl] ([Id], [pname], [pweight], [pdetails], [pimg1], [pimg2], [pimg3], [status], [rts]) VALUES (2, N'Twill', N'1100', N'The order of interlacing which causes diagonal lines of warp and weft floats to be formed in the fabric is called twill weave. In the basic weaves of these diagonal lines are continuous but in some of their derivatives they may be broken or reversed periodically. The simplest possible repeat for a twill weave is 3 ends * 3 picks and there is no theoretical upper limit to the size of the repeat.', N'pro-img2.jpg', N'pro-img3.jpg', N'pro-img4.jpg', 1, CAST(N'2023-06-24 00:08:20.653' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product_Tbl] OFF
SET IDENTITY_INSERT [dbo].[ProductColorlist] ON 

INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (1, 1, 1, N'Red')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (2, 1, 2, N'Black')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (3, 2, 1, N'Red')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (4, 2, 4, N'Green')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (5, 2, 7, N'Purple')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (6, 2, 10, N'White')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (7, 2, 13, N'Maroon')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (8, 1, 3, N'Orange')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (9, 1, 4, N'Green')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (11, 1, 14, N'Violet')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (12, 1, 15, N'Wheat')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (13, 1, 5, N'Yellow')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (14, 1, 6, N'Blue')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (15, 1, 7, N'Purple')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (16, 1, 8, N'Brown')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (17, 1, 11, N'Pink')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (18, 1, 12, N'Cyan')
INSERT [dbo].[ProductColorlist] ([id], [pid], [cid], [colorname]) VALUES (19, 1, 13, N'Maroon')
SET IDENTITY_INSERT [dbo].[ProductColorlist] OFF
SET IDENTITY_INSERT [dbo].[Review_Tbl] ON 

INSERT [dbo].[Review_Tbl] ([Id], [uname], [uimg], [ureview], [ureviewdate]) VALUES (1, N'Vikas Sharma', N'dummy-user.jpeg', N'Impeccable craftsmanship and breathtaking designs. Their woven textiles truly elevate any space. Highly recommended!', N'25 July')
INSERT [dbo].[Review_Tbl] ([Id], [uname], [uimg], [ureview], [ureviewdate]) VALUES (2, N'Om Sharma', N'dummy-user.jpeg', N'The quality of their woven fabrics is unmatched. Exquisite detailing and luxurious feel. A go-to for premium textiles.', N'20 June')
INSERT [dbo].[Review_Tbl] ([Id], [uname], [uimg], [ureview], [ureviewdate]) VALUES (3, N'Simran Kour', N'dummy-user.jpeg', N'From traditional to contemporary, their weaving patterns are a true work of art. Impeccable quality and timeless beauty.', N'29 May')
INSERT [dbo].[Review_Tbl] ([Id], [uname], [uimg], [ureview], [ureviewdate]) VALUES (4, N'Nitu Sharma', N'dummy-user.jpeg', N'An exceptional weaving textile company. Their attention to detail and commitment to excellence is evident in every piece.', N'8 Jan')
INSERT [dbo].[Review_Tbl] ([Id], [uname], [uimg], [ureview], [ureviewdate]) VALUES (5, N'Amit Jain', N'dummy-user.jpeg', N'Incredible craftsmanship and impeccable customer service. Their woven textiles have transformed my home into a palace.', N'25 May')
SET IDENTITY_INSERT [dbo].[Review_Tbl] OFF
SET IDENTITY_INSERT [dbo].[ShippingDetails] ON 

INSERT [dbo].[ShippingDetails] ([ShippingID], [OrderID], [FirstName], [LastName], [Email], [Mobile], [Address], [State], [City], [PostCode], [OrderNote]) VALUES (1, 1, N'vikas', N'sharma', N'omopyt2020@gmail.com', N'08999292525', N'sanjay colony bhilwara', N'rajasthan', N'jojwa', N'311001', N'testing')
INSERT [dbo].[ShippingDetails] ([ShippingID], [OrderID], [FirstName], [LastName], [Email], [Mobile], [Address], [State], [City], [PostCode], [OrderNote]) VALUES (2, 2, N'vikas', N'sharma', N'omopyt2020@gmail.com', N'08999292525', N'sanjay colony bhilwara', N'rajasthan', N'jojwa', N'311001', N'testing')
INSERT [dbo].[ShippingDetails] ([ShippingID], [OrderID], [FirstName], [LastName], [Email], [Mobile], [Address], [State], [City], [PostCode], [OrderNote]) VALUES (3, 3, N'vikas', N'sharma', N'omopyt2020@gmail.com', N'08999292525', N'sanjay colony bhilwara', N'rajasthan', N'jojwa', N'311001', N'asdfgj')
INSERT [dbo].[ShippingDetails] ([ShippingID], [OrderID], [FirstName], [LastName], [Email], [Mobile], [Address], [State], [City], [PostCode], [OrderNote]) VALUES (4, 4, N'vikas', N'sharma', N'omopyt2020@gmail.com', N'08999292525', N'sanjay colony bhilwara', N'rajasthan', N'jojwa', N'311001', N'asdfgj')
SET IDENTITY_INSERT [dbo].[ShippingDetails] OFF
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([Id], [name], [about], [image]) VALUES (1, N'Mrs. Sunita Heda, CEO / Designated Partner', N'Mrs. Sunita Heda is an exceptional leader serving as the CEO and Designated Partner at Shree Shanta Synfab LLP. With her visionary guidance and extensive expertise, she drives the company''s overall success. Mrs. Heda''s strategic acumen and innovative thinking empower the team to excel in the textile industry. Her strong leadership fosters a collaborative and inclusive work environment, inspiring employees to reach their full potential. Through her unwavering dedication and commitment, Mrs. Sunita Heda sets a remarkable example, ensuring the continued growth and prosperity of Shree Shanta Synfab LLP.', N'Shree Sunita Heda, Designated Partner.jpg')
INSERT [dbo].[Team] ([Id], [name], [about], [image]) VALUES (2, N'Mr. Satyanarayan Kogta, Designated Partner', N'Mr. Satyanarayan Kogta serves as a Designated Partner in the Shree Shanta Synfab LLP, making valuable contributions to its success. With his strong expertise and strategic mindset, he effectively oversees key operations and drives the company''s growth. Mr. Kogta''s meticulous attention to detail, coupled with his ability to identify market opportunities, enables the team to make informed decisions. His dedication and collaborative approach make him an invaluable asset in achieving the Shree Shanta Synfab LLP''s goals.', N'Shree Satyanarayan Kogta, Designated Partner.jpg')
INSERT [dbo].[Team] ([Id], [name], [about], [image]) VALUES (3, N'Mr. Amit Heda, Operation Associate', N'Mr. Amit Heda is a dedicated Operations Associate at Shree Shanta Synfab LLP. With strong operational skills and meticulous attention to detail, he ensures smooth and efficient processes. Mr. Heda''s analytical abilities and effective problem-solving contribute to operational excellence. His commitment to high-quality work and collaborative nature make him a valuable asset to the team at Shree Shanta Synfab LLP.', N'Shree Amit Heda, Associates Partner.jpg')
INSERT [dbo].[Team] ([Id], [name], [about], [image]) VALUES (4, N'Mr. Manish Mundra, Sales  Associates', N'Mr. Manish Mundra is a dynamic Sales Associate at Shree Shanta Synfab LLP. With his exceptional sales skills and a customer-centric approach, he plays a crucial role in driving revenue growth and expanding the company''s customer base. Mr. Mundra''s strong interpersonal and communication skills enable him to build lasting relationships with clients. His ability to identify opportunities and provide tailored solutions makes him an invaluable asset to the sales team at Shree Shanta Synfab LLP.', N'Shree Manish Mundra, Associates Sales.jpg')
INSERT [dbo].[Team] ([Id], [name], [about], [image]) VALUES (5, N'Mr. Sanyam Maheshwari, Accounts Associates ', N'Mr. Sanyam Maheshwari is a proficient Accounts Associate at Shree Shanta Synfab LLP. With his strong understanding of financial processes and attention to detail, he effectively manages the company''s accounts and ensures accurate financial records. Mr. Maheshwari''s meticulous approach to financial analysis and reporting plays a vital role in supporting strategic decision-making. His dedication, reliability, and commitment to maintaining financial integrity make him a valuable asset to the accounting team at Shree Shanta Synfab LLP.', N'Shree Sanyam Maheshwari, Associates Accounts.jpg')
SET IDENTITY_INSERT [dbo].[Team] OFF
USE [master]
GO
ALTER DATABASE [sssllp] SET  READ_WRITE 
GO
