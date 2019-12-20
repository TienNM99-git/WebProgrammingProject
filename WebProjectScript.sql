USE [DepartmentManagement]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/20/2019 10:00:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/20/2019 10:00:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [int] NULL,
	[Phone] [int] NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/20/2019 10:00:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/20/2019 10:00:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)),
	[Price] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/20/2019 10:00:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Pid] [int] NOT NULL,
	[ProductName] [nvarchar](250) NOT NULL,
	[Price] [float] NOT NULL,
	[ImageURL] [nvarchar](250) NOT NULL,
	[Quantitty] [int] NOT NULL,
	[SupplierID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/20/2019 10:00:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12/20/2019 10:00:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Phone')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Laptop')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Tablet')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Headphone')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (1, N'Jedi', N'minhnguyen123', N'28c8edde3d61a0411511d3b1866f0636', 0, 336022356, N'23/5')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (2, N'MinhNguyen', N'minhnguyen1231', N'c4ca4238a0b923820dcc509a6f75849b', 0, 1, N'NYC')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (4, N'Adele', N'ohhello', N'c4ca4238a0b923820dcc509a6f75849b', 0, 123123, N'NYC')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (1002, N'Hai Yen', N'haiyen123', N'c4ca4238a0b923820dcc509a6f75849b', 0, 336022356, N'Ha Noi')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (1003, N'ThanhVi', N'vinguyen123', N'c4ca4238a0b923820dcc509a6f75849b', 0, 33602356, N'HCM')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (1004, N'Goichi', N'ichigo123', N'c4ca4238a0b923820dcc509a6f75849b', 0, 12345, N'Japan')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (2002, N'123', N'minhguyen299', N'202cb962ac59075b964b07152d234b70', 0, 123, N'123')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (2004, N'admin', N'admin', N'c4ca4238a0b923820dcc509a6f75849b', 1, 113, N'23/5, KP6')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (2005, N'Vinh Dragon', N'vinhdragon999', N'202cb962ac59075b964b07152d234b70', 0, 9452135, N'Vinh Long')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (2006, N'John', N'johncena123', N'28c8edde3d61a0411511d3b1866f0636', 0, 123, N'WWE')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (3005, N'UTE', N'hcmute1234', N'81dc9bdb52d04dc20036dbd8313ed055', 0, 15389, N'Thu Ducddd')
INSERT [dbo].[Customer] ([Cid], [Name], [Username], [Password], [Role], [Phone], [Address]) VALUES (3006, N'UTE', N'hcmute33', N'9c02be868455aaac9ced2ca8bf94e91c', 0, 123444, N'Thu Duc')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (3, 1002, CAST(N'2019-12-12 00:00:00.000' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (4, 1002, CAST(N'2019-12-13 00:00:00.000' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (1002, 1, CAST(N'2019-12-13 00:00:00.000' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (2002, 2005, CAST(N'2019-12-14 00:00:00.000' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (3002, 2004, CAST(N'2019-12-14 00:00:00.000' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (3003, 2004, CAST(N'2019-12-14 00:00:00.000' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (3004, 2004, CAST(N'2019-12-14 22:13:50.513' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (4004, 2004, CAST(N'2019-12-15 20:36:25.570' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (4005, 2, CAST(N'2019-12-15 20:48:09.383' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (4006, 2, CAST(N'2019-12-15 20:50:21.037' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (4007, 2, CAST(N'2019-12-15 21:27:31.543' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (4008, 2, CAST(N'2019-12-19 11:12:02.450' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (5008, 2, CAST(N'2019-12-19 19:14:44.867' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (5009, 2, CAST(N'2019-12-19 19:38:15.803' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (6008, NULL, CAST(N'2019-12-20 21:24:19.323' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (6009, NULL, CAST(N'2019-12-20 21:26:04.363' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (6010, NULL, CAST(N'2019-12-20 21:26:07.813' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (6011, NULL, CAST(N'2019-12-20 21:26:54.707' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (6012, 3005, CAST(N'2019-12-20 21:30:25.493' AS DateTime), N'Cash', N'Processing')
INSERT [dbo].[Order] ([OrderId], [CustomerID], [OrderDate], [PaymentType], [Status]) VALUES (6013, 3006, CAST(N'2019-12-20 21:39:54.663' AS DateTime), N'Cash', N'Processing')
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 1, 1, 299)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (4, 2, 3, 15000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (1002, 1, 1, 299)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (2002, 1, 1, 299)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (3002, 1, 3, 897)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (3003, 1, 1, 299)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (3004, 2, 1, 5000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (4004, 1, 1, 299)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (4004, 2, 4, 20000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (4004, 4, 2, 1598)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (4005, 1, 1, 299)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (4006, 2, 1, 5000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (4007, 2, 2, 10000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (4008, 1, 12, 3588)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (5008, 1, 1, 299)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (5008, 4, 1, 799)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (5009, 3, 3, 177)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (6008, 8, 3, 3132)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (6011, 8, 1, 1044)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (6012, 10, 2, 2300)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (6013, 0, 4, 6080)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (0, N'iPhone 11 Pro 256GB', 1520, N'/NewsImages/637124681901799498_iphone-11-pro-256gb-black-400x460.png', 29, 1)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (1, N'Iphone 6', 299, N'/NewsImages/637124679950275049_iphone6.png', 9, 1)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (2, N'Asus ROG Mothership GZ700GX-EV002R', 5000, N'/NewsImages/637124680953078989_GZ700-10-1-568x568.png', 2, 3)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (3, N' MSI Gaming Headset DS502', 59, N'/NewsImages/637124681049908805_51l5rXLXrCL._AC_UL115_.png', 12, 4)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (4, N'IphoneXS', 799, N'/NewsImages/637124681396208777_Iphone XS.png', 17, 1)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (5, N'Samsung Galaxy S10', 699, N'/NewsImages/637124681552947393_S10.png', 10, 2)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (6, N'Iphone 1 Pro Max 256GB', 1649, N'/NewsImages/637124681834505197_iphone-11-pro-max-256gb-green-400x460.png', 25, 1)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (7, N'Iphone 11 Pro Max 512GB', 1900, N'/NewsImages/637124682021532583_iphone-11-pro-max-512gb-gold-400x460.png', 29, 1)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (8, N'iPhone 11 128GB', 1044, N'/NewsImages/637124682115524793_iphone-11-128gb-black-400x460.png', 11, 1)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (9, N'iPhone 7 32GB', 430, N'/NewsImages/637124682179175620_iphone-7-gold-400x460.png', 11, 1)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (10, N'Asus Gaming ROG Strix G531GD', 1150, N'/NewsImages/637124682295052471_asus-gaming-rog-g531gd-i7-9750h-8gb-512gb-4gb-gtx1-600x600.png', 3, 3)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (11, N'Asus Gaming TUF FX505D R7', 999, N'/NewsImages/637124682423369265_asus-gaming-tuf-fx505d-r7-3750h-8gb-512gb-4gb-gtx1-1-600x600.png', 3, 3)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (12, N'Asus VivoBook X509FJ', 809, N'/ProductImages/637124682910546358_asus-vivobook-x509f-i7-8565u-8gb-mx230-win10-ej13-5-2-1-2-1-600x600.png', 3, 3)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (13, N'iPad Pro 11 inch Wifi 64GB (2018)', 929, N'/NewsImages/637124683884994156_ipad-pro-11-inch-2018-64gb-wifi-33397-chitiet-400x460.png', 5, 1)
INSERT [dbo].[Product] ([Pid], [ProductName], [Price], [ImageURL], [Quantitty], [SupplierID]) VALUES (14, N'iPad 10.2 inch Wifi Cellular 128GB (2019)', 673, N'/ProductImages/637124684478891595_ipad-10-2-inch-wifi-cellular-128gb-2019-gray-400x460.png', 2, 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 4)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 5)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 6)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 7)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 8)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 9)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 2)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 10)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 11)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 12)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 13)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 14)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (4, 3)
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Sid], [SupplierName]) VALUES (1, N'Apple')
INSERT [dbo].[Supplier] ([Sid], [SupplierName]) VALUES (2, N'Samsung')
INSERT [dbo].[Supplier] ([Sid], [SupplierName]) VALUES (3, N'Asus')
INSERT [dbo].[Supplier] ([Sid], [SupplierName]) VALUES (4, N'MSI')
INSERT [dbo].[Supplier] ([Sid], [SupplierName]) VALUES (6, N'Acer')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([Cid])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Pid])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([Sid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Category]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Pid])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Product]
GO
