USE [master]
GO
/****** Object:  Database [CoffeChainManagementDB]    Script Date: 11/15/2024 3:43:07 PM ******/
CREATE DATABASE [CoffeChainManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoffeChainManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\SQLServer_01M\MSSQL16.SQLSERVERM1\MSSQL\DATA\CoffeChainManagementDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoffeChainManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\SQLServer_01M\MSSQL16.SQLSERVERM1\MSSQL\DATA\CoffeChainManagementDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CoffeChainManagementDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeChainManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeChainManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeChainManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeChainManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CoffeChainManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeChainManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CoffeChainManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeChainManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeChainManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeChainManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeChainManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoffeChainManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoffeChainManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CoffeChainManagementDB', N'ON'
GO
ALTER DATABASE [CoffeChainManagementDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CoffeChainManagementDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CoffeChainManagementDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[FullName] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Address] [varchar](255) NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK__Account__3214EC27CE93E42E] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Price] [int] NULL,
	[IsRent] [bit] NOT NULL,
	[Quantity] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[DiscountCode] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK__Cart__51BCD797A1ABB908] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NULL,
	[LastName] [nvarchar](40) NULL,
	[City] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
	[Phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[ShopID] [int] NOT NULL,
	[Position] [nvarchar](50) NULL,
	[HireDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ShopID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[LastUpdated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[OrderNumber] [nvarchar](10) NULL,
	[CustomerId] [int] NULL,
	[TotalAmount] [decimal](12, 2) NULL,
	[PromotionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[UnitPrice] [decimal](12, 2) NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[Amount] [decimal](12, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[SupplierId] [int] NULL,
	[UnitPrice] [int] NULL,
	[Package] [nvarchar](30) NULL,
	[IsDiscontinued] [bit] NULL,
	[Stock] [int] NULL,
	[ShopID] [int] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK__Product__3214EC0744442B08] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PromotionName] [nvarchar](100) NOT NULL,
	[Discount] [decimal](5, 2) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Promotio__3214EC07949D7C15] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ShippingAddress] [nvarchar](255) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](20) NOT NULL,
	[ShippingDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[ShopID] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[OpeningHours] [nvarchar](50) NULL,
	[Revenue] [decimal](18, 2) NULL,
	[ImagePath] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 11/15/2024 3:43:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactTitle] [nvarchar](40) NULL,
	[City] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
	[Phone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [Username], [Password], [Email], [FullName], [PhoneNumber], [Address], [Role]) VALUES (12, N'test01', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'test01@gmail.com', N'test01', N'23123', N'test01', N'Admin')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Email], [FullName], [PhoneNumber], [Address], [Role]) VALUES (15, N'us', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'test@gmail.com', N'us', N'123', N'1wqeZ', N'User')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Email], [FullName], [PhoneNumber], [Address], [Role]) VALUES (17, N'user', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'user@gmail.com', N'user', N'123123', N'user 1231`23', N'User')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Email], [FullName], [PhoneNumber], [Address], [Role]) VALUES (18, N'Admin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Admin@gmail.com', N'Ngo Ba Tan Tai', N'0962126912', N'Au Co, Tan BInh', N'Admin')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Email], [FullName], [PhoneNumber], [Address], [Role]) VALUES (20, N'txt', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'1', N'txt', N'123', N'txt', N'User')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [UserID], [ProductID], [Price], [IsRent], [Quantity], [StartDate], [EndDate], [DiscountCode], [CreatedAt], [UpdatedAt]) VALUES (3, 1, 1, NULL, 1, 1, CAST(N'2024-10-16' AS Date), CAST(N'2024-10-16' AS Date), N'1', CAST(N'2024-10-16T09:01:34.587' AS DateTime), CAST(N'2024-10-16T09:01:34.603' AS DateTime))
INSERT [dbo].[Cart] ([CartID], [UserID], [ProductID], [Price], [IsRent], [Quantity], [StartDate], [EndDate], [DiscountCode], [CreatedAt], [UpdatedAt]) VALUES (4, 1, 3, 1200, 1, 2, CAST(N'2024-10-16' AS Date), CAST(N'2024-10-16' AS Date), N'1', CAST(N'2024-10-16T14:20:26.497' AS DateTime), CAST(N'2024-10-16T14:20:26.513' AS DateTime))
INSERT [dbo].[Cart] ([CartID], [UserID], [ProductID], [Price], [IsRent], [Quantity], [StartDate], [EndDate], [DiscountCode], [CreatedAt], [UpdatedAt]) VALUES (5, 1, 17, 400, 1, 2, CAST(N'2024-11-06' AS Date), CAST(N'2024-11-06' AS Date), N'1', CAST(N'2024-11-06T17:45:34.247' AS DateTime), CAST(N'2024-11-06T17:45:34.260' AS DateTime))
INSERT [dbo].[Cart] ([CartID], [UserID], [ProductID], [Price], [IsRent], [Quantity], [StartDate], [EndDate], [DiscountCode], [CreatedAt], [UpdatedAt]) VALUES (6, 1, 18, 300, 1, 2, CAST(N'2024-11-06' AS Date), CAST(N'2025-04-24' AS Date), N'1', CAST(N'2024-11-06T18:37:44.610' AS DateTime), CAST(N'2024-11-06T18:37:44.617' AS DateTime))
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1, N'Category 1')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (2, N'Category 2')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (3, N'Category 3')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (1, N'John', N'Doe', N'New York', N'USA', N'123-456-7890')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (2, N'Jane', N'Smith', N'Los Angeles', N'USA', N'123-456-7891')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (3, N'Michael', N'Johnson', N'Chicago', N'USA', N'123-456-7892')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (4, N'Emily', N'Davis', N'Houston', N'USA', N'123-456-7893')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (5, N'Robert', N'Miller', N'Phoenix', N'USA', N'123-456-7894')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (6, N'Sophia', N'Garcia', N'Philadelphia', N'USA', N'123-456-7895')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (7, N'Liam', N'Martinez', N'San Antonio', N'USA', N'123-456-7896')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (8, N'Olivia', N'Rodriguez', N'San Diego', N'USA', N'123-456-7897')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (9, N'Noah', N'Lee', N'Dallas', N'USA', N'123-456-7898')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [City], [Country], [Phone]) VALUES (10, N'Ava', N'Walker', N'San Jose', N'USA', N'123-456-7899')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [FullName], [Email], [Phone], [ShopID], [Position], [HireDate]) VALUES (1, N'Alice Johnson', N'alice.johnson@example.com', N'123-456-7890', 1, N'Manager', CAST(N'2022-01-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([Id], [FullName], [Email], [Phone], [ShopID], [Position], [HireDate]) VALUES (2, N'Bob Smith', N'bob.smith@example.com', N'098-765-4321', 2, N'Barista', CAST(N'2022-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([Id], [FullName], [Email], [Phone], [ShopID], [Position], [HireDate]) VALUES (3, N'Carol Davis', N'carol.davis@example.com', N'567-890-1234', 1, N'Cashier', CAST(N'2023-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([Id], [FullName], [Email], [Phone], [ShopID], [Position], [HireDate]) VALUES (4, N'David Wilson', N'david.wilson@example.com', N'234-567-8901', 2, N'Assistant Manager', CAST(N'2023-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([Id], [FullName], [Email], [Phone], [ShopID], [Position], [HireDate]) VALUES (8, N'fghjghjk', N'4/5/2023', N'4/5/2023', 2, N'4/5/2023', CAST(N'2023-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([Id], [FullName], [Email], [Phone], [ShopID], [Position], [HireDate]) VALUES (15, N'Ngô  Bá Tấn Tài', N'nbtt@gmail.com', N'0962126912', 6, N'Employee', CAST(N'2024-11-04T06:59:01.693' AS DateTime))
INSERT [dbo].[Employee] ([Id], [FullName], [Email], [Phone], [ShopID], [Position], [HireDate]) VALUES (16, N'TestAf', N'ttaf@gmail.com', N'0962126912', 1, N'Employee', CAST(N'2024-11-05T19:17:35.140' AS DateTime))
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (1, 1, 1, 442, CAST(N'2024-11-03T20:45:40.267' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (2, 2, 1, 21, CAST(N'2024-09-22T07:12:35.220' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (3, 3, 1, 150, CAST(N'2024-11-06T17:59:05.817' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (4, 4, 1, 120, CAST(N'2024-11-06T18:32:20.533' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (5, 5, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (6, 6, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (7, 7, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (8, 8, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (9, 9, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (10, 10, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (11, 11, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (12, 12, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (13, 13, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (14, 14, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (15, 15, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (16, 16, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (17, 17, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (18, 18, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (19, 19, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
INSERT [dbo].[Inventory] ([Id], [ProductId], [ShopID], [Quantity], [LastUpdated]) VALUES (20, 20, 1, 0, CAST(N'2024-09-19T16:55:05.333' AS DateTime))
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount], [PromotionId]) VALUES (1, CAST(N'2024-11-04T00:00:00.000' AS DateTime), N'ORD001', 1, CAST(2000.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount], [PromotionId]) VALUES (2, CAST(N'2024-11-04T00:00:00.000' AS DateTime), N'ORD002', 2, CAST(1500.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount], [PromotionId]) VALUES (3, CAST(N'2024-11-04T00:00:00.000' AS DateTime), N'ORD003', 3, CAST(1000.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount], [PromotionId]) VALUES (4, CAST(N'2024-11-04T00:00:00.000' AS DateTime), N'ORD004', 4, CAST(500.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [OrderNumber], [CustomerId], [TotalAmount], [PromotionId]) VALUES (5, CAST(N'2024-11-04T00:00:00.000' AS DateTime), N'ORD005', 5, CAST(300.00 AS Decimal(12, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (1, 1, 1, CAST(1200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (2, 1, 2, CAST(800.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (3, 2, 3, CAST(600.00 AS Decimal(12, 2)), 2)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (4, 3, 4, CAST(300.00 AS Decimal(12, 2)), 2)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (5, 3, 5, CAST(50.00 AS Decimal(12, 2)), 4)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (6, 4, 6, CAST(30.00 AS Decimal(12, 2)), 5)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (7, 4, 7, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (8, 5, 8, CAST(150.00 AS Decimal(12, 2)), 2)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (9, 5, 9, CAST(100.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (12, 1, 1, CAST(1200.00 AS Decimal(12, 2)), 2)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (13, 1, 2, CAST(800.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (14, 1, 3, CAST(600.00 AS Decimal(12, 2)), 3)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (15, 1, 4, CAST(500.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (16, 1, 5, CAST(300.00 AS Decimal(12, 2)), 4)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (17, 2, 1, CAST(1100.00 AS Decimal(12, 2)), 2)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (18, 2, 2, CAST(900.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (19, 2, 3, CAST(700.00 AS Decimal(12, 2)), 3)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (20, 2, 4, CAST(600.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (21, 2, 5, CAST(400.00 AS Decimal(12, 2)), 4)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (22, 3, 1, CAST(1300.00 AS Decimal(12, 2)), 2)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (23, 3, 2, CAST(950.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (24, 3, 3, CAST(750.00 AS Decimal(12, 2)), 3)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (25, 3, 4, CAST(650.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (26, 3, 5, CAST(550.00 AS Decimal(12, 2)), 4)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (27, 4, 1, CAST(1400.00 AS Decimal(12, 2)), 2)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (28, 4, 2, CAST(980.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (29, 4, 3, CAST(780.00 AS Decimal(12, 2)), 3)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (30, 4, 4, CAST(680.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (31, 4, 5, CAST(580.00 AS Decimal(12, 2)), 4)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (32, 5, 1, CAST(1500.00 AS Decimal(12, 2)), 2)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (33, 5, 2, CAST(1000.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (34, 5, 3, CAST(800.00 AS Decimal(12, 2)), 3)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (35, 5, 4, CAST(700.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity]) VALUES (36, 5, 5, CAST(600.00 AS Decimal(12, 2)), 4)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [OrderId], [PaymentDate], [PaymentMethod], [Amount]) VALUES (1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'Credit Card', CAST(2000.00 AS Decimal(12, 2)))
INSERT [dbo].[Payment] ([Id], [OrderId], [PaymentDate], [PaymentMethod], [Amount]) VALUES (2, 2, CAST(N'2024-09-02T00:00:00.000' AS DateTime), N'Cash', CAST(1500.00 AS Decimal(12, 2)))
INSERT [dbo].[Payment] ([Id], [OrderId], [PaymentDate], [PaymentMethod], [Amount]) VALUES (3, 3, CAST(N'2024-09-03T00:00:00.000' AS DateTime), N'Bank Transfer', CAST(1000.00 AS Decimal(12, 2)))
INSERT [dbo].[Payment] ([Id], [OrderId], [PaymentDate], [PaymentMethod], [Amount]) VALUES (4, 4, CAST(N'2024-09-04T00:00:00.000' AS DateTime), N'Credit Card', CAST(500.00 AS Decimal(12, 2)))
INSERT [dbo].[Payment] ([Id], [OrderId], [PaymentDate], [PaymentMethod], [Amount]) VALUES (5, 5, CAST(N'2024-09-05T00:00:00.000' AS DateTime), N'Cash', CAST(300.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (1, N'Laptop', 1, 1200, N'Box', 0, 442, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (2, N'Smartphone', 1, 800, N'Box', 0, 9, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (3, N'Tablet', 2, 600, N'Box', 0, 150, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (4, N'Monitor', 2, 300, N'Box', 0, 120, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (5, N'Keyboard', 3, 50, N'Plastic Wrap', 0, 100, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (6, N'Mouse', 3, 30, N'Plastic Wrap', 0, 2, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (7, N'Printer', 4, 200, N'Box', 0, 100, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (8, N'Scanner', 4, 150, N'Box', 0, 100, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (9, N'Desk Chair', 5, 100, N'Unboxed', 0, 5, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (10, N'Office Desk', 5, 500, N'Unboxed', 1, 100, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (11, N'Laptop', 1, 1200, N'Box', 0, 100, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (12, N'Smartphone', 1, 800, N'Box', 0, 8, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (13, N'Tablet', 2, 600, N'Box', 0, 6, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (14, N'Monitor', 2, 300, N'Box', 0, 10, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (15, N'Keyboard', 3, 50, N'Plastic Wrap', 0, 100, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (16, N'Mouse', 3, 30, N'Plastic Wrap', 0, 5, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (17, N'Printer', 4, 200, N'Box', 0, 100, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (18, N'Scanner', 4, 150, N'Box', 1, 100, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (19, N'Desk Chair', 5, 100, N'Unboxed', 0, 6, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (20, N'Office Desk', 5, 500, N'Unboxed', 1, 7, NULL, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (21, N'test01', 1, 199, N'plastic', 1, 111, 1, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (23, N'123ada', 1, 1111, N'111w3', 1, 123, 1, 1)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (25, N'TestDX', 4, 1092, N'Plastic', 1, 90, 3, 3)
INSERT [dbo].[Product] ([Id], [ProductName], [SupplierId], [UnitPrice], [Package], [IsDiscontinued], [Stock], [ShopID], [CategoryId]) VALUES (26, N'Tablet DX', 4, 9020, N'Plastic', 1, 120, 3, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotion] ON 

INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (1, N'Valentine Day Special', CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-02-14T00:00:00.000' AS DateTime), CAST(N'2024-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (2, N'Spring Sale', CAST(20.00 AS Decimal(5, 2)), CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-05-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (3, N'Easter Discount', CAST(15.00 AS Decimal(5, 2)), CAST(N'2024-04-01T00:00:00.000' AS DateTime), CAST(N'2024-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (4, N'Back to School', CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (5, N'Black Friday Sale', CAST(35.00 AS Decimal(5, 2)), CAST(N'2024-11-29T00:00:00.000' AS DateTime), CAST(N'2024-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (6, N'Cyber Monday Deal', CAST(25.00 AS Decimal(5, 2)), CAST(N'2024-12-02T00:00:00.000' AS DateTime), CAST(N'2024-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (7, N'Winter Clearance', CAST(30.00 AS Decimal(5, 2)), CAST(N'2024-12-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (8, N'Holiday Sale', CAST(20.00 AS Decimal(5, 2)), CAST(N'2024-12-15T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (9, N'Anniversary Discount', CAST(15.00 AS Decimal(5, 2)), CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-10-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (10, N'Summer Blowout', CAST(25.00 AS Decimal(5, 2)), CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (11, N'Labor Day Sale', CAST(20.00 AS Decimal(5, 2)), CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (12, N'Autumn Specials', CAST(15.00 AS Decimal(5, 2)), CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(N'2024-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (13, N'Spring Forward', CAST(18.00 AS Decimal(5, 2)), CAST(N'2024-03-15T00:00:00.000' AS DateTime), CAST(N'2024-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (14, N'Christmas in July', CAST(20.00 AS Decimal(5, 2)), CAST(N'2024-07-01T00:00:00.000' AS DateTime), CAST(N'2024-07-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotion] ([Id], [PromotionName], [Discount], [StartDate], [EndDate]) VALUES (15, N'End of Year Sale', CAST(40.00 AS Decimal(5, 2)), CAST(N'2024-12-27T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([Id], [OrderId], [ShippingAddress], [City], [Country], [PostalCode], [ShippingDate], [DeliveryDate], [Latitude], [Longitude]) VALUES (1, 1, N'123 Ðu?ng Lê L?i', N'TP. H? Chí Minh', N'Vi?t Nam', N'700000', CAST(N'2024-09-10T00:00:00.000' AS DateTime), CAST(N'2024-09-12T00:00:00.000' AS DateTime), 10.774, 106.699)
INSERT [dbo].[Shipping] ([Id], [OrderId], [ShippingAddress], [City], [Country], [PostalCode], [ShippingDate], [DeliveryDate], [Latitude], [Longitude]) VALUES (2, 2, N'456 Ðu?ng C?u Gi?y', N'Hà N?i', N'Vi?t Nam', N'100000', CAST(N'2024-09-11T00:00:00.000' AS DateTime), CAST(N'2024-09-13T00:00:00.000' AS DateTime), 21.0285, 105.8542)
INSERT [dbo].[Shipping] ([Id], [OrderId], [ShippingAddress], [City], [Country], [PostalCode], [ShippingDate], [DeliveryDate], [Latitude], [Longitude]) VALUES (3, 3, N'789 Ðu?ng Võ Van Ki?t', N'TP. H? Chí Minh', N'Vi?t Nam', N'700000', CAST(N'2024-09-12T00:00:00.000' AS DateTime), CAST(N'2024-09-14T00:00:00.000' AS DateTime), 10.7627, 106.6822)
INSERT [dbo].[Shipping] ([Id], [OrderId], [ShippingAddress], [City], [Country], [PostalCode], [ShippingDate], [DeliveryDate], [Latitude], [Longitude]) VALUES (4, 4, N'101 Ðu?ng Tr?n Phú', N'Ðà N?ng', N'Vi?t Nam', N'550000', CAST(N'2024-09-13T00:00:00.000' AS DateTime), CAST(N'2024-09-15T00:00:00.000' AS DateTime), 16.0471, 108.2068)
INSERT [dbo].[Shipping] ([Id], [OrderId], [ShippingAddress], [City], [Country], [PostalCode], [ShippingDate], [DeliveryDate], [Latitude], [Longitude]) VALUES (5, 5, N'202 Ðu?ng Nguy?n Trãi', N'Nha Trang', N'Vi?t Nam', N'650000', CAST(N'2024-09-14T00:00:00.000' AS DateTime), CAST(N'2024-09-16T00:00:00.000' AS DateTime), 12.2451, 109.1943)
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
SET IDENTITY_INSERT [dbo].[Shops] ON 

INSERT [dbo].[Shops] ([ShopID], [ShopName], [Address], [PhoneNumber], [OpeningHours], [Revenue], [ImagePath], [Description]) VALUES (1, N'Starbucks-e', N'Address Test', N'123-456-7890', N'7:00 AM - 9:00 PM', CAST(15000.50 AS Decimal(18, 2)), N'C:\Users\taing\OneDrive\Pictures\riotgame.jpg', N'A popular chain known for its coffee beverages.')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [Address], [PhoneNumber], [OpeningHours], [Revenue], [ImagePath], [Description]) VALUES (2, N'Coffee Bean-e', N'456 Elm Street', N'987-654-3210', N'6:30 AM - 8:00 PM', CAST(12000.75 AS Decimal(18, 2)), N'/images/coffeebean.jpg', N'Specializes in high-quality coffee and tea.')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [Address], [PhoneNumber], [OpeningHours], [Revenue], [ImagePath], [Description]) VALUES (3, N'Dunkin Donuts', N'789 Oak Street', N'555-123-4567', N'5:00 AM - 10:00 PM', CAST(9000.25 AS Decimal(18, 2)), N'/images/dunkindonuts.jpg', N'Famous for its donuts and coffee.')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [Address], [PhoneNumber], [OpeningHours], [Revenue], [ImagePath], [Description]) VALUES (4, N'Peets Coffee', N'321 Maple Avenue', N'222-333-4444', N'6:00 AM - 7:00 PM', CAST(8999.00 AS Decimal(18, 2)), N'/images/peetscoffee.jpg', N'Offers a variety of coffee roasts and blends.')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [Address], [PhoneNumber], [OpeningHours], [Revenue], [ImagePath], [Description]) VALUES (5, N'Tim Hortons', N'567 Pine Street', N'999-888-7777', N'24 Hours', CAST(8500.00 AS Decimal(18, 2)), N'/EditHere', N'Canadian-based chain serving coffee, donuts, and sandwiches.')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [Address], [PhoneNumber], [OpeningHours], [Revenue], [ImagePath], [Description]) VALUES (6, N'Blue Bottle Coffee-Edit', N'789 ASDASDAWDAWD', N'777-666-5555', N'8:00 AM - 5:00 PM', CAST(11000.35 AS Decimal(18, 2)), N'/images/bluebottle.jpg', N'Specialty coffee roaster and retailer known for its dedication to quality.')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [Address], [PhoneNumber], [OpeningHours], [Revenue], [ImagePath], [Description]) VALUES (16, N'fuckdiu', N'332/2/13 Âu Cơ Tạn Bình', N'0962126912', N'7h30 A.M - 22h00 P.M', CAST(19000000.00 AS Decimal(18, 2)), N'C:\Users\taing\OneDrive\Pictures\Dream\test01.jpg', N'coffe ncc')
INSERT [dbo].[Shops] ([ShopID], [ShopName], [Address], [PhoneNumber], [OpeningHours], [Revenue], [ImagePath], [Description]) VALUES (19, N'Test01', N'Test01', N'Test01', N'Test01', CAST(123.00 AS Decimal(18, 2)), N'C:\Users\taing\OneDrive\Pictures\Đèn var\z5613604255856_b797661ce331609691867782eead4e03.jpg', N'Test01')
SET IDENTITY_INSERT [dbo].[Shops] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (1, N'Global Supplies', N'Mark Brown', N'Sales Manager', N'New York', N'USA', N'555-1234', N'555-1235')
INSERT [dbo].[Supplier] ([Id], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (2, N'Pacific Products', N'Anna Wilson', N'Account Manager', N'Los Angeles', N'USA', N'555-2234', N'555-2235')
INSERT [dbo].[Supplier] ([Id], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (3, N'Eastern Enterprises', N'David Taylor', N'Procurement Manager', N'Chicago', N'USA', N'555-3234', N'555-3235')
INSERT [dbo].[Supplier] ([Id], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (4, N'Northwest Wholesalers', N'Maria Anderson', N'Operations Manager', N'Houston', N'USA', N'555-4234', N'555-4235')
INSERT [dbo].[Supplier] ([Id], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [Phone], [Fax]) VALUES (5, N'Central Distributors', N'James Thomas', N'Logistics Manager', N'Phoenix', N'USA', N'555-5234', N'555-5235')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__536C85E4970D99D5]    Script Date: 11/15/2024 3:43:08 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__536C85E4970D99D5] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A9D1053465707BF4]    Script Date: 11/15/2024 3:43:08 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__A9D1053465707BF4] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF__Cart__CreatedAt__160F4887]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF__Cart__UpdatedAt__17036CC0]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [HireDate]
GO
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Shops] ADD  DEFAULT ((0)) FOR [Revenue]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([ShopID])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK__Inventory__Produ__00200768] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK__Inventory__Produ__00200768]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([ShopID])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Product]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([ShopID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Shop]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Promotion] FOREIGN KEY([PromotionId])
REFERENCES [dbo].[Promotion] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Promotion]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK__OrderItem__Produ__6754599E] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK__OrderItem__Produ__6754599E]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Supplie__60A75C0F] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Supplie__60A75C0F]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ShopID] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([ShopID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ShopID]
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [chk_RentDates] CHECK  (([IsRent]=(0) AND [StartDate] IS NULL AND [EndDate] IS NULL OR [IsRent]=(1) AND [StartDate] IS NOT NULL AND [EndDate] IS NOT NULL))
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [chk_RentDates]
GO
/****** Object:  StoredProcedure [dbo].[GetInventoryWithDetails]    Script Date: 11/15/2024 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[GetInventoryWithDetails]
AS
BEGIN
    SELECT 
        i.Id AS InventoryId,
        p.ProductName,
        s.ShopName,
        i.Quantity,
        i.LastUpdated
    FROM 
        Inventory i
    JOIN 
        Product p ON i.ProductId = p.Id
    JOIN 
        Shops s ON i.ShopID = s.ShopID;
END
GO
USE [master]
GO
ALTER DATABASE [CoffeChainManagementDB] SET  READ_WRITE 
GO
