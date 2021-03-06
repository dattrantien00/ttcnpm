USE [OnlineShop1]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 7/15/2020 4:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[BankName] [nchar](10) NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cooker]    Script Date: 7/15/2020 4:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cooker](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[VendorId] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Cooker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 7/15/2020 4:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/15/2020 4:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[VendorID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Order_Quantity1]  DEFAULT ((0)),
	[Quantity] [int] NOT NULL CONSTRAINT [DF_Order_Quantity]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()),
	[PaymentMethod] [int] NOT NULL CONSTRAINT [DF_Order_PaymentStatus1]  DEFAULT ((0)),
	[PaymentStatus] [int] NOT NULL CONSTRAINT [DF_Order_PaymentStatus]  DEFAULT ((0)),
	[FoodStatus] [int] NOT NULL CONSTRAINT [DF_Order_FoodStatus]  DEFAULT ((0)),
	[Status] [bit] NOT NULL CONSTRAINT [DF_Order_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/15/2020 4:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Product_Price]  DEFAULT ((0)),
	[Quantity] [int] NOT NULL CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)),
	[VendorID] [bigint] NOT NULL,
	[DisplayOrder] [int] NOT NULL CONSTRAINT [DF_Product_DisplayOrder]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NOT NULL CONSTRAINT [DF_Product_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 7/15/2020 4:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Balance] [bigint] NOT NULL CONSTRAINT [DF_User_Balance]  DEFAULT ((0)),
	[Phone] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserBank]    Script Date: 7/15/2020 4:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBank](
	[UserID] [bigint] NOT NULL,
	[BankName] [nchar](255) NOT NULL,
	[STK] [nchar](30) NOT NULL,
	[Pass] [nchar](30) NOT NULL,
 CONSTRAINT [PK_UserBank] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[BankName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 7/15/2020 4:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
	[VendorID] [bigint] IDENTITY(1,1) NOT NULL,
	[VendorAccount] [varchar](50) NULL,
	[VendorPassword] [varchar](50) NULL,
	[VendorName] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Vendor_DisplayOrder]  DEFAULT ((0)),
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cooker] ON 

INSERT [dbo].[Cooker] ([ID], [UserName], [Password], [VendorId], [Name], [Email], [Phone], [Status]) VALUES (1, N'cooker1', N'1', 2, N'đầu bếp 1', N'a@a.a', N'01122334455', 1)
INSERT [dbo].[Cooker] ([ID], [UserName], [Password], [VendorId], [Name], [Email], [Phone], [Status]) VALUES (2, N'cooker2', N'2', 6, N'đầu bếp 1', N'a@a.a', N'01122334455', 1)
INSERT [dbo].[Cooker] ([ID], [UserName], [Password], [VendorId], [Name], [Email], [Phone], [Status]) VALUES (3, N'admin1', N'ádasdas', 2, N'ádsadasd', N'ndt19051996@gmail.com', N'0917016503', 1)
INSERT [dbo].[Cooker] ([ID], [UserName], [Password], [VendorId], [Name], [Email], [Phone], [Status]) VALUES (4, N'admin1', N'ádasdas', 18, N'ádsadasd', N'ndt19051996@gmail.com', N'0917016503', 1)
INSERT [dbo].[Cooker] ([ID], [UserName], [Password], [VendorId], [Name], [Email], [Phone], [Status]) VALUES (5, N'admin1', N'ádasdas', 9, N'ádsadasd', N'ndt19051996@gmail.com', N'0917016503', 1)
SET IDENTITY_INSERT [dbo].[Cooker] OFF
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Email], [Phone], [Status]) VALUES (3, N'admin1', N'1', N'TuanAdmin', N'tuan@tuan.tuan', N'001122334455', 1)
SET IDENTITY_INSERT [dbo].[Manager] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (29, 2, 8, 3, CAST(20000 AS Decimal(18, 0)), 3, CAST(N'2020-06-12 11:45:02.687' AS DateTime), 0, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (30, 2, 8, 3, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2020-06-12 11:53:32.987' AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (31, 2, 8, 3, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2020-06-12 11:54:34.487' AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (32, 2, 8, 3, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 11:54:48.533' AS DateTime), 0, 0, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (33, 2, 8, 4, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 11:57:06.460' AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (34, 2, 8, 5, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 11:57:06.463' AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (35, 2, 8, 3, CAST(0 AS Decimal(18, 0)), 2, CAST(N'2020-07-12 12:42:56.260' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (36, 2, 8, 4, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 12:42:56.603' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (37, 2, 8, 3, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 12:47:48.157' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (38, 2, 8, 3, CAST(0 AS Decimal(18, 0)), 2, CAST(N'2020-07-12 12:48:14.390' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (39, 2, 8, 4, CAST(0 AS Decimal(18, 0)), 2, CAST(N'2020-07-12 12:48:14.393' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (40, 2, 8, 3, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 12:53:41.557' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (41, 2, 8, 3, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 12:55:39.723' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (42, 2, 8, 3, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 12:56:39.040' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (43, 2, 8, 4, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 13:00:23.640' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (44, 2, 8, 7, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 13:00:39.287' AS DateTime), 0, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (45, 2, 8, 7, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 13:02:19.433' AS DateTime), 0, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (46, 2, 8, 3, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 13:03:01.510' AS DateTime), 0, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (47, 2, 8, 4, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 13:03:17.280' AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (48, 2, 8, 3, CAST(30000 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 13:04:20.213' AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (49, 2, 8, 4, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 13:05:21.397' AS DateTime), 0, 0, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (50, 2, 8, 4, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 13:06:37.357' AS DateTime), 0, 0, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (51, 2, 8, 3, CAST(30000 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 13:07:00.437' AS DateTime), 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (52, 9, 8, 1, CAST(10000 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 18:18:12.623' AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (53, 2, 8, 4, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2020-07-12 23:57:53.487' AS DateTime), 0, 0, 0, 0)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (54, 2, 8, 4, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2020-07-13 00:55:34.473' AS DateTime), 0, 0, 0, 0)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (55, 9, 8, 1, CAST(10000 AS Decimal(18, 0)), 2, CAST(N'2020-07-14 16:57:40.727' AS DateTime), 0, 0, 0, 0)
INSERT [dbo].[Order] ([OrderID], [VendorID], [UserID], [ProductID], [Price], [Quantity], [CreatedDate], [PaymentMethod], [PaymentStatus], [FoodStatus], [Status]) VALUES (56, 2, 8, 3, CAST(30000 AS Decimal(18, 0)), 1, CAST(N'2020-07-14 17:00:46.513' AS DateTime), 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Image], [Price], [Quantity], [VendorID], [DisplayOrder], [CreatedDate], [Status]) VALUES (1, N'Coca Cola', N'/assets/client/images/cocacola.jpg', CAST(10000 AS Decimal(18, 0)), 10, 9, 0, CAST(N'2015-08-26 19:24:20.953' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Price], [Quantity], [VendorID], [DisplayOrder], [CreatedDate], [Status]) VALUES (2, N'Cà phê', N'/assets/client/images/coffe.jpg', CAST(20000 AS Decimal(18, 0)), 12, 1, 0, CAST(N'2015-08-26 19:30:57.870' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Price], [Quantity], [VendorID], [DisplayOrder], [CreatedDate], [Status]) VALUES (3, N'Chese Burger', N'/assets/client/images/cheseburger.jpg', CAST(30000 AS Decimal(18, 0)), 13, 2, 0, CAST(N'2015-08-26 19:32:06.437' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Price], [Quantity], [VendorID], [DisplayOrder], [CreatedDate], [Status]) VALUES (4, N'Khoai tây chiên', N'/assets/client/images/fries.jpg', CAST(20000 AS Decimal(18, 0)), 12, 2, 0, CAST(N'2015-08-26 19:33:18.800' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Price], [Quantity], [VendorID], [DisplayOrder], [CreatedDate], [Status]) VALUES (5, N'Hamburger', N'/assets/client/images/hamburger.jpg', CAST(30000 AS Decimal(18, 0)), 1, 2, 0, CAST(N'2015-08-26 19:33:18.800' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Price], [Quantity], [VendorID], [DisplayOrder], [CreatedDate], [Status]) VALUES (7, N'Pizza', N'/assets/client/images/pizza.jpg', CAST(50000 AS Decimal(18, 0)), 44, 2, 0, CAST(N'2015-08-26 19:33:18.800' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Price], [Quantity], [VendorID], [DisplayOrder], [CreatedDate], [Status]) VALUES (9, N'Sữa lắc', N'/assets/client/images/milksahke.jpg', CAST(20000 AS Decimal(18, 0)), 11, 1, 0, CAST(N'2020-06-13 00:16:59.137' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Price], [Quantity], [VendorID], [DisplayOrder], [CreatedDate], [Status]) VALUES (17, N'ádsadasd', N'/assets/client/images/fries.jpg', CAST(22222 AS Decimal(18, 0)), 12, 18, 2, CAST(N'2020-06-13 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Price], [Quantity], [VendorID], [DisplayOrder], [CreatedDate], [Status]) VALUES (24, N'Nước ngọt', N'/assets/client/images/milksahke.jpg', CAST(10000 AS Decimal(18, 0)), 123, 2, 1, CAST(N'2020-07-14 22:53:48.063' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Balance], [Phone], [Status]) VALUES (2, N'tuantuan', N'1', N'tuan', N'tuan@gmail.com', 100000, N'121', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Balance], [Phone], [Status]) VALUES (8, N'admin1', N'1', N'admin 1', NULL, 2000000000, N'123456789', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Balance], [Phone], [Status]) VALUES (9, N'admin2', N'1', N'admin 2', NULL, 100000, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Balance], [Phone], [Status]) VALUES (11, N'admin3', N'1', N'admin 3', NULL, 100000, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Balance], [Phone], [Status]) VALUES (14, N'admin4', N'1', N'admin 123', NULL, 100000, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserBank] ([UserID], [BankName], [STK], [Pass]) VALUES (8, N'OCB                                                                                                                                                                                                                                                            ', N'123456789                     ', N'123456                        ')
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([VendorID], [VendorAccount], [VendorPassword], [VendorName], [Email], [Phone], [DisplayOrder], [Status]) VALUES (2, N'vendor1', N'1', N'Gian Hàng 2', N'dt@abc.vn', N'0122344556', 12, 1)
INSERT [dbo].[Vendor] ([VendorID], [VendorAccount], [VendorPassword], [VendorName], [Email], [Phone], [DisplayOrder], [Status]) VALUES (9, N'vendor2', N'2', N'Gian hàng 1', N'ndt19051996@gmail.com', N'0917016503', 6, 1)
INSERT [dbo].[Vendor] ([VendorID], [VendorAccount], [VendorPassword], [VendorName], [Email], [Phone], [DisplayOrder], [Status]) VALUES (18, N'vendor3', N'3', N'Gian Hàng 4', N'tuan@tuan.tuan', N'0917016503', 1, 1)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Vendor__7BCD8757E2C0BE55]    Script Date: 7/15/2020 4:05:36 PM ******/
ALTER TABLE [dbo].[Vendor] ADD UNIQUE NONCLUSTERED 
(
	[VendorAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
