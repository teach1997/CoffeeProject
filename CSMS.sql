USE [master]
GO
/****** Object:  Database [CSMS]    Script Date: 12/17/2018 10:49:31 PM ******/
CREATE DATABASE [CSMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.DANGQUAN\MSSQL\DATA\CSMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CSMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.DANGQUAN\MSSQL\DATA\CSMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CSMS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSMS] SET RECOVERY FULL 
GO
ALTER DATABASE [CSMS] SET  MULTI_USER 
GO
ALTER DATABASE [CSMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSMS] SET QUERY_STORE = OFF
GO
USE [CSMS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CSMS]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/17/2018 10:49:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nchar](50) NOT NULL,
	[Password] [nchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/17/2018 10:49:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/17/2018 10:49:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[BirthDate] [datetime] NULL,
	[Photo] [varchar](100) NULL,
	[Phone] [nchar](12) NULL,
	[Salary] [money] NULL,
	[DateOfJoin] [datetime] NULL,
	[Gender] [nchar](10) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/17/2018 10:49:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/17/2018 10:49:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/17/2018 10:49:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[CategoryID] [int] NULL,
	[Price] [money] NULL,
	[Size] [nchar](5) NULL,
	[Description] [nvarchar](500) NULL,
	[Picture] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [Role], [EmployeeID]) VALUES (N'anhnq                                             ', N'1                                                 ', N'STAFF', 4)
INSERT [dbo].[Account] ([Username], [Password], [Role], [EmployeeID]) VALUES (N'chilp                                             ', N'1                                                 ', N'MANAGER', 5)
INSERT [dbo].[Account] ([Username], [Password], [Role], [EmployeeID]) VALUES (N'ducla                                             ', N'1                                                 ', N'STAFF', 3)
INSERT [dbo].[Account] ([Username], [Password], [Role], [EmployeeID]) VALUES (N'luatnd                                            ', N'1                                                 ', N'STAFF', 2)
INSERT [dbo].[Account] ([Username], [Password], [Role], [EmployeeID]) VALUES (N'quand                                             ', N'1                                                 ', N'STAFF', 1)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'COFFEE', N'Vietnam is the world’s second largest producer of coffee. As a Vietnamese brand, Highlands Coffee hand selects and roasts only the finest aromatic Arabica and bold Robusta beans for our signature blends.')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'FREEZE', N'Our delicious ice-blended beverages are made from premium Vietnamese ingredients and have a range of options with coffee and also without coffee.')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'TEA', N'Building on Vietnam’s rich tea heritage, we select only the finest teas grown in the highlands regions of Vietnam to create delicious, modern tea beverages that include natural fruits and toppings. Served with or without milk.')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'BANH MI', N'You’ve heard enough about the legendary Vietnamese Banh Mi. Now take a bite of the freshly made, crispy baguette at Highlands Coffee. Let that distinctive balance of flavors and textures fill your mouth with layers of tastes from salty to sweet and sour, finished with a hint of spiciness. It’s love at first bite.')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [BirthDate], [Photo], [Phone], [Salary], [DateOfJoin], [Gender]) VALUES (1, N'NGUYEN DANG QUAN', N'Bac Ninh', CAST(N'1998-07-31T00:00:00.000' AS DateTime), N'Avatar/quand.png', N'0123456789  ', 60.0000, CAST(N'2018-12-13T00:00:00.000' AS DateTime), N'Male      ')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [BirthDate], [Photo], [Phone], [Salary], [DateOfJoin], [Gender]) VALUES (2, N'NGUYEN DUC LUAT', N'Nam Dinh', CAST(N'1998-07-30T00:00:00.000' AS DateTime), N'Avatar/luatnd.png', N'0123456789  ', 60.0000, CAST(N'2018-12-13T00:00:00.000' AS DateTime), N'Male      ')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [BirthDate], [Photo], [Phone], [Salary], [DateOfJoin], [Gender]) VALUES (3, N'LE ANH DUC', N'Ha Noi', CAST(N'1998-07-29T00:00:00.000' AS DateTime), N'Avatar/default.png', N'0123456789  ', 60.0000, CAST(N'2018-12-13T00:00:00.000' AS DateTime), N'Male      ')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [BirthDate], [Photo], [Phone], [Salary], [DateOfJoin], [Gender]) VALUES (4, N'NGUYEN QUANG ANH', N'Hung Yen', CAST(N'1997-06-30T00:00:00.000' AS DateTime), N'Avatar/default.png', N'0123456789  ', 60.0000, CAST(N'2018-12-13T00:00:00.000' AS DateTime), N'Male      ')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [BirthDate], [Photo], [Phone], [Salary], [DateOfJoin], [Gender]) VALUES (5, N' LE PHUONG CHI', N'Ha Noi', CAST(N'1985-05-22T00:00:00.000' AS DateTime), N'Avatar/default.png', N'0123456789  ', 100.0000, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'Female    ')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (1, 1, CAST(N'2018-12-14T09:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (2, 2, CAST(N'2018-12-14T09:10:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (3, 3, CAST(N'2018-12-14T10:20:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (4, 1, CAST(N'2018-12-14T09:34:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (5, 4, CAST(N'2018-12-14T09:30:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (6, 4, CAST(N'2018-12-14T12:20:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (7, 3, CAST(N'2018-12-14T13:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (8, 2, CAST(N'2018-12-14T14:02:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (9, 1, CAST(N'2018-12-14T15:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (10, 4, CAST(N'2018-12-14T16:10:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (11, 2, CAST(N'2018-12-14T16:20:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (12, 3, CAST(N'2018-12-14T17:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [OrderDate]) VALUES (13, 1, CAST(N'2018-12-14T18:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (1, 1, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (1, 37, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (2, 1, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (2, 2, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (3, 3, 3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (3, 38, 2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (3, 39, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (4, 4, 4)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (5, 19, 2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (5, 20, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (6, 26, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (7, 29, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (7, 30, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (8, 35, 2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (9, 36, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (10, 1, 2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (11, 31, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (11, 32, 2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (12, 28, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (12, 40, 1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity]) VALUES (13, 33, 3)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (1, N'PHIN SUA DA', 1, 29000.0000, N'S    ', N'Vietnamese Iced Milk Coffee! The authentic taste of Vietnam! A bold blend of the finest Vietnamese Robusta and Arabica coffee beans, hand roasted and flavored to perfection, then slow drip brewed through a traditional Vietnamese ‘Phin’ filter. Sweet condensed milk and ice are added to create this deliciously indulgent pick me up!', N'Product_Picture/PHIN-SUA-DA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (2, N'PHIN SUA DA', 1, 39000.0000, N'L    ', N'Vietnamese Iced Milk Coffee! The authentic taste of Vietnam! A bold blend of the finest Vietnamese Robusta and Arabica coffee beans, hand roasted and flavored to perfection, then slow drip brewed through a traditional Vietnamese ‘Phin’ filter. Sweet condensed milk and ice are added to create this deliciously indulgent pick me up!', N'Product_Picture/PHIN-SUA-DA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (3, N'PHIN DA DEN', 1, 29000.0000, N'S    ', N'Vietnamese Iced Black Coffee! For committed caffeine lovers! Made from our signature Highlands Traditional Blend. Rich, slow brewed coffee mixed with a teaspoon of sugar and poured over ice to bring you the bold taste of Vietnam!', N'Product_Picture/PHIN-DEN-DA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (4, N'PHIN DA DEN', 1, 39000.0000, N'L    ', N'Vietnamese Iced Black Coffee! For committed caffeine lovers! Made from our signature Highlands Traditional Blend. Rich, slow brewed coffee mixed with a teaspoon of sugar and poured over ice to bring you the bold taste of Vietnam!', N'Product_Picture/PHIN-DEN-DA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (5, N'PHIN SUA NONG', 1, 29000.0000, N'S    ', N'Vietnamese Hot Milk Coffee! A bold blend of the finest Vietnamese Robusta and Arabica coffee beans, hand roasted and flavored to perfection, then slow drip brewed through a traditional Vietnamese ‘Phin’ filter. Served hot with sweet condensed milk, to create a deliciously indulgent pick me up!', N'Product_Picture/PHIN-SUA-NONG.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (6, N'PHIN DEN NONG', 1, 29000.0000, N'S    ', N'Vietnamese Hot Black Coffee! For committed caffeine lovers! Made from our signature Highlands Traditional Blend. Rich, slow brewed coffee mixed with a teaspoon of sugar to bring you the bold taste of Vietnam!', N'Product_Picture/PHIN DEN NONG.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (7, N'CAPPUCCINO', 1, 54000.0000, N'M    ', N'Bold Milk Coffee! Bolder tasting than a Latte, our Cappuccino starts with an espresso shot then we add equal amounts fresh steamed milk and hot milk foam. Also available as Iced Cappuccino.', N'Product_Picture/CAPPUCINO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (8, N'CAPPUCCINO', 1, 64000.0000, N'L    ', N'Bold Milk Coffee! Bolder tasting than a Latte, our Cappuccino starts with an espresso shot then we add equal amounts fresh steamed milk and hot milk foam. Also available as Iced Cappuccino.', N'Product_Picture/CAPPUCINO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (9, N'AMERICANO', 1, 44000.0000, N'M    ', N'A shot of espresso topped with hot water. Also available was an Iced Americano.', N'Product_Picture/AMERICANO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (10, N'AMERICANO', 1, 54000.0000, N'L    ', N'A shot of espresso topped with hot water. Also available was an Iced Americano.', N'Product_Picture/AMERICANO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (11, N'ESPRESSO', 1, 44000.0000, N'M    ', N'Intense! An expertly crafted shot of espresso made from our Highlands Coffee Full City Roast Blend – a blend of premium Vietnamese Arabica and Robusta coffee beans.', N'Product_Picture/ESPRESSO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (12, N'ESPRESSO', 1, 54000.0000, N'L    ', N'Intense! An expertly crafted shot of espresso made from our Highlands Coffee Full City Roast Blend – a blend of premium Vietnamese Arabica and Robusta coffee beans.', N'Product_Picture/ESPRESSO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (13, N'CARAMEL MACCHIATO', 1, 59000.0000, N'M    ', N'Sweet satisfaction! Our multi-layered Macchiato begins with fresh steamed milk and a layer of creamy milk foam. Then rich espresso is poured through the foam where it mixes with the milk. Finally, the barista signs their work of art with a swirl of sweet caramel sauce. Also available as Iced Mocha.', N'Product_Picture/CARAMEL-MACCHIATO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (14, N'CARAMEL MACCHIATO', 1, 69000.0000, N'L    ', N'Sweet satisfaction! Our multi-layered Macchiato begins with fresh steamed milk and a layer of creamy milk foam. Then rich espresso is poured through the foam where it mixes with the milk. Finally, the barista signs their work of art with a swirl of sweet caramel sauce. Also available as Iced Mocha.', N'Product_Picture/CARAMEL-MACCHIATO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (15, N'MOCHA', 1, 59000.0000, N'M    ', N'A flawless mixture of Espresso, chocolate syrup and steamed milk, expertly topped with hot milk foam and more chocolate syrup. Also available as Iced Mocha.', N'Product_Picture/MOCHA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (16, N'MOCHA', 1, 69000.0000, N'L    ', N'A flawless mixture of Espresso, chocolate syrup and steamed milk, expertly topped with hot milk foam and more chocolate syrup. Also available as Iced Mocha.', N'Product_Picture/MOCHA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (17, N'LATTE', 1, 54000.0000, N'M    ', N'Silky Smooth Milk Coffee! Lighter tasting than Cappuccino, our Latte starts with a shot of espresso, then we add a generous portion of fresh steamed milk and top it with a touch of hot milk foam. Also available as Iced Latte.', N'Product_Picture/LATTE.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (18, N'LATTE', 1, 64000.0000, N'L    ', N'Silky Smooth Milk Coffee! Lighter tasting than Cappuccino, our Latte starts with a shot of espresso, then we add a generous portion of fresh steamed milk and top it with a touch of hot milk foam. Also available as Iced Latte.', N'Product_Picture/LATTE.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (19, N'GREEN TEA FREEZE', 2, 49000.0000, N'S    ', N'A fan favorite! Premium Vietnamese green tea and ice are blended into fine flavor granules with added chewy green tea jelly and a topping of rich cream. Indulgently delicious and refreshing!', N'Product_Picture/GTF.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (20, N'GREEN TEA FREEZE', 2, 65000.0000, N'L    ', N'A fan favorite! Premium Vietnamese green tea and ice are blended into fine flavor granules with added chewy green tea jelly and a topping of rich cream. Indulgently delicious and refreshing!', N'Product_Picture/GTF.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (21, N'COOKIES & CREAM', 2, 49000.0000, N'S    ', N'Crunchy Cookie Delight! A perfect combination of crunchy chocolate cookies, condensed milk and fresh milk, blended with ice then topped with rich whipped cream and crushed chocolate cookies!', N'Product_Picture/COOKIES-CREAM.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (22, N'COOKIES & CREAM', 2, 65000.0000, N'L    ', N'Crunchy Cookie Delight! A perfect combination of crunchy chocolate cookies, condensed milk and fresh milk, blended with ice then topped with rich whipped cream and crushed chocolate cookies!', N'Product_Picture/COOKIES-CREAM.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (23, N'CHOCOLATE FREEZE', 2, 49000.0000, N'S    ', N'Iced Chocolate Heaven! Premium Vietnamese chocolate is ice blended into fine flavor granules then we add chewy chocolate jelly and a topping of rich whipped cream and chocolate sauce.', N'Product_Picture/CHOCOLATE-FREEZE.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (24, N'CHOCOLATE FREEZE', 2, 65000.0000, N'L    ', N'Iced Chocolate Heaven! Premium Vietnamese chocolate is ice blended into fine flavor granules then we add chewy chocolate jelly and a topping of rich whipped cream and chocolate sauce.', N'Product_Picture/CHOCOLATE-FREEZE.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (25, N'CARAMEL COFFEE FREEZE', 2, 49000.0000, N'S    ', N'Deliciously indulgent! Our unique Highlands Traditional Blend of slow-dripped Vietnamese coffee, luscious caramel, coffee jelly, blended with ice and topped with whipped cream and a rich caramel sauce. A perfect way to catch-up with friends!', N'Product_Picture/CARAMEL-MACCHIATO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (26, N'CARAMEL COFFEE FREEZE', 2, 65000.0000, N'L    ', N'Deliciously indulgent! Our unique Highlands Traditional Blend of slow-dripped Vietnamese coffee, luscious caramel, coffee jelly, blended with ice and topped with whipped cream and a rich caramel sauce. A perfect way to catch-up with friends!', N'Product_Picture/CARAMEL-MACCHIATO.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (27, N'CLASSIC PHIN FREEZE', 2, 49000.0000, N'S    ', N'Boldly indulgent! Our unique Highlands Traditional Blend of slow-dripped Vietnamese coffee, coffee jelly, blended with ice and topped with whipped cream and bold cocoa powder.', N'Product_Picture/CLASSIC-FREEZE.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (28, N'CLASSIC PHIN FREEZE', 2, 65000.0000, N'L    ', N'Boldly indulgent! Our unique Highlands Traditional Blend of slow-dripped Vietnamese coffee, coffee jelly, blended with ice and topped with whipped cream and bold cocoa powder.', N'Product_Picture/CLASSIC-FREEZE.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (29, N'LYCHEE TEA', 3, 39000.0000, N'S    ', N'A refreshing blend of black tea, whole lychee fruits and chewy golden jelly.', N'Product_Picture/LYCHEE TEA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (30, N'LYCHEE TEA', 3, 55000.0000, N'L    ', N'A refreshing blend of black tea, whole lychee fruits and chewy golden jelly.', N'Product_Picture/LYCHEE TEA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (31, N'PEACH JELLY TEA', 3, 39000.0000, N'S    ', N'A bold tea base with juicy peaches and chewy peach jelly. Top it with milk if you prefer!', N'Product_Picture/PEACH JELLY TEA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (32, N'PEACH JELLY TEA', 3, 55000.0000, N'L    ', N'A bold tea base with juicy peaches and chewy peach jelly. Top it with milk if you prefer!', N'Product_Picture/PEACH JELLY TEA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (33, N'PEACH LEMONGRASS TEA', 3, 39000.0000, N'S    ', N'Delightfully refreshing! The perfect balance of premium tea, subtle lemongrass and sweet juicy peaches.', N'Product_Picture/PEACH LEMONGRASS TEA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (34, N'PEACH LEMONGRASS TEA', 3, 55000.0000, N'L    ', N'Delightfully refreshing! The perfect balance of premium tea, subtle lemongrass and sweet juicy peaches.', N'Product_Picture/PEACH LEMONGRASS TEA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (35, N'GOLDEN LOTUS TEA', 3, 39000.0000, N'S    ', N'Another fan favorite! A refreshing blend of cooling oolong tea, luscious lotus seeds and water chestnuts. Your choice whether to add milk or not!', N'Product_Picture/GOLDEN LOTUS TEA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (36, N'GOLDEN LOTUS TEA', 3, 55000.0000, N'L    ', N'Another fan favorite! A refreshing blend of cooling oolong tea, luscious lotus seeds and water chestnuts. Your choice whether to add milk or not!', N'Product_Picture/GOLDEN LOTUS TEA.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (37, N'GRILLED PORK
', 4, 19000.0000, N'N    ', N'A Vietnamese icon! Crispy crusty baguette filled with deliciously grilled pork, vegetables and herbs and our special sauce.', N'Product_Picture/GRILLED PORK.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (38, N'PORK MEATBALL', 4, 19000.0000, N'N    ', N'Crispy Vietnamese baguette filled with juicy pork meatballs, smothered in a rich tomato sauce and balanced with fresh vegetables and herbs.', N'Product_Picture/PORK MEATBALL.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (39, N'ROAST PORK & PORK SAUSAGE', 4, 19000.0000, N'N    ', N'Crispy Vietnamese baguette filled with delicious pork sausage & char siu pork, vegetables and herbs and our special sauce.', N'Product_Picture/ROAST PORK & PORK SAUSAGE.png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Price], [Size], [Description], [Picture]) VALUES (40, N'ROAST CHICKEN', 4, 19000.0000, N'N    ', N'Crispy Vietnamese baguette stuffed with shredded roasted chicken, vegetables and herbs and our special sauce!', N'Product_Picture/ROAST CHICKEN.png')
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Staff] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Staff]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Staff] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Staff]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [CSMS] SET  READ_WRITE 
GO
