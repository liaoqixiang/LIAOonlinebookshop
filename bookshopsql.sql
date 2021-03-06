USE [book_shop3]
GO
/****** Object:  Table [dbo].[BookComment]    Script Date: 1/04/2017 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Msg] [nvarchar](max) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_BookComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 1/04/2017 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Author] [nvarchar](200) NOT NULL,
	[PublishDate] [datetime] NOT NULL,
	[ISBN] [nvarchar](50) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/04/2017 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/04/2017 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderBook]    Script Date: 1/04/2017 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[TotalPrice] [int] NOT NULL,
 CONSTRAINT [PK_OrderBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/04/2017 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginId] [nvarchar](50) NOT NULL,
	[LoginPwd] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](100) NULL,
	[Mail] [nvarchar](100) NOT NULL,
	[UserStateId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserStates]    Script Date: 1/04/2017 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserStates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BookComment] ON 

INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (276, N'sadfsdaf', CAST(0x0000A29400EB7FA8 AS DateTime), 4944)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (277, N'haohao[b]hao[/b]', CAST(0x0000A296010BBC9B AS DateTime), 4943)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (289, N'fdsafas', CAST(0x0000A2AF00ADEA2D AS DateTime), 4939)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (290, N'dfasdfs', CAST(0x0000A2AF00ADF34B AS DateTime), 4939)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (292, N'adsf', CAST(0x0000A2AF00ADF88B AS DateTime), 4939)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (293, N'└(^o^)┘Y(^_^)Y凸^-^凸(☆_☆)', CAST(0x0000A2AF00AE17B5 AS DateTime), 4939)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (294, N'Hello,World', CAST(0x0000A2AF00AE196B AS DateTime), 4939)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (295, N'Hello,World', CAST(0x0000A2AF00AE316D AS DateTime), 4939)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (297, N'└(^o^)┘Y(^_^)Y！凸^-^凸(☆_☆)', CAST(0x0000A2AF00AE5A5B AS DateTime), 4942)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (298, N'8-)', CAST(0x0000A2AF00AE5CA9 AS DateTime), 4939)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (299, N':(', CAST(0x0000A2AF00AE8392 AS DateTime), 4939)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (2399, N'im the first one', CAST(0x0000A73A0100FE5B AS DateTime), 4947)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (2400, N'i am the second one
', CAST(0x0000A73A0101A53C AS DateTime), 4942)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (2401, N'we are couple', CAST(0x0000A73A010D12F7 AS DateTime), 4942)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (2402, N'first', CAST(0x0000A73A010D6514 AS DateTime), 4945)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (2403, N'1', CAST(0x0000A73A010D8627 AS DateTime), 4945)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (2404, N'alert(1)', CAST(0x0000A73A010D99E1 AS DateTime), 4945)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (2405, N'im cam', CAST(0x0000A74200D7EEEB AS DateTime), 4944)
INSERT [dbo].[BookComment] ([Id], [Msg], [CreateDateTime], [BookId]) VALUES (2406, N'dada', CAST(0x0000A7440142250C AS DateTime), 4943)
SET IDENTITY_INSERT [dbo].[BookComment] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4939, N'C++ Prime', N'（美）Stanley B. Lippman Barbara E. Moo Josée LaJoie   著，李师贤  等译', CAST(0x0000977700000000 AS DateTime), N'9787115145543', 99.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4942, N'C++ Prime 2', N'蒋爱军，李师贤，梅晓勇  著', CAST(0x000098C700000000 AS DateTime), N'9787115155108', 45.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4943, N'Effective C# ', N'（中）瓦格纳  著，李建忠  译', CAST(0x00009F1000000000 AS DateTime), N'978711515888', 120.0000, 1)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4944, N'C', N'（美）克尼汉，（美）里奇 著，徐宝文，李志 译', CAST(0x0000946800000000 AS DateTime), N'9787111128069', 33.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4945, N'C++Primer Plus', N'[美]普拉塔（Prata,S.）  著，孙建春，韦强  译', CAST(0x0000964700000000 AS DateTime), N'9787115134165', 72.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4946, N'CLR Via C#', N'（美）瑞奇特（Richter,J.）  著，周靖，张杰良  译', CAST(0x0000986C00000000 AS DateTime), N'9787302140160', 68.0000, 1)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4947, N'C++ Design', N'钱能  著', CAST(0x000096C200000000 AS DateTime), N'9787302114642', 39.5000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4948, N'C++ Object Model', N'（美）Stanley B. Lippman  著，侯捷  译', CAST(0x0000909200000000 AS DateTime), N'9787560924182', 54.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4949, N'Expert C# 2005 Business Objects', N'（美）霍特卡  著，王鑫  译', CAST(0x0000994000000000 AS DateTime), N'9787121038181', 79.8000, 1)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4951, N'Beginning C# Objects', N'（美）芭可，（美）帕尔默  著，韩磊，戴飞  译', CAST(0x000097D300000000 AS DateTime), N'9787121024931', 68.0000, 1)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4954, N'C# Design Pattern', N'（美）麦斯科 著，颜炯 译', CAST(0x0000968400000000 AS DateTime), N'9787508334929', 42.0000, 1)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4955, N'Beyond C++ Standard Libary', N'（美）卡尔森（Kalsson，B.）　著，张杰良　译', CAST(0x0000992100000000 AS DateTime), N'9787302149118', 39.8000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4956, N'Data Structure and Algorithmn C++', N'（美）维斯  著，张怀勇  等译', CAST(0x000098A900000000 AS DateTime), N'9787115139238', 49.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4957, N'C++Programming 2nd', N'（美）埃克尔 著，刘宗田等 译', CAST(0x0000934E00000000 AS DateTime), N'9787111108078', 59.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4959, N'C Excersise 2nd', N'[美]汤朵，[美]吉米拜尔 著，杨涛等 译', CAST(0x0000946100000000 AS DateTime), N'9787111129431', 15.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4960, N'C++Primer 4th', N'（美）李普曼，（美）拉菇瓦，（美）穆  著', CAST(0x0000986C00000000 AS DateTime), N'9787115151698', 99.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4961, N'C++programming', N'（美）埃克尔  等著，刁成嘉  等译', CAST(0x0000973C00000000 AS DateTime), N'9787111171157', 59.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4962, N'C++Rules', N'萨特，亚历山德雷斯库  著，刘基诚  译', CAST(0x0000973C00000000 AS DateTime), N'9787115142054', 35.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4963, N'C++Design', N'美.Andrei Alexandrescu 著；候捷，於春景 译', CAST(0x0000932F00000000 AS DateTime), N'9787560929064', 59.8000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4965, N'Unit Test C++', N'（美）托马斯  等著，陈伟桩，陶文  译', CAST(0x000095CF00000000 AS DateTime), N'9787121006661', 25.0000, 1)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4967, N'Essential C++ ', N'[美]Stanley B. Lippman著侯捷译', CAST(0x000090EE00000000 AS DateTime), N'9787560925110', 39.8000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4970, N'Effective C++ Third Edition', N'（美）玛雅尔斯（Meyers,S.)  著', CAST(0x0000977700000000 AS DateTime), N'7121008270', 45.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4973, N'C++Web Programming', N'（美）施密特，（美）霍斯顿  著，於春景  译', CAST(0x0000990300000000 AS DateTime), N'9787121041518', 35.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4974, N'C++Standard Liabary', N'德.Nicolai M.Josuttis 著，侯捷，孟岩 译', CAST(0x0000927A00000000 AS DateTime), N'9787560927824', 108.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (4977, N'C Puzzle Book', N'（美）福伊尔  著，杨涛  等译', CAST(0x0000995E00000000 AS DateTime), N'9787115159731', 25.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5034, N'C# Inside Sharp', N'（德）侯姆，（德）克鲁格，（德）斯普达 著，薛兴涛，袁勤勇 译', CAST(0x000093C800000000 AS DateTime), N'9787302069126', 66.0000, 1)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5036, N'21天学通C＋＋：第五版', N'（美）利伯帝（Liberty,J.），（美）琼斯（Jones,B.）  著，李佩乾，杨小珂  译', CAST(0x000096C200000000 AS DateTime), N'9787115136923', 59.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5038, N'STL高效编程（英文版）', N'（美）迈耶斯  著', CAST(0x0000981000000000 AS DateTime), N'9787111196242', 32.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5042, N'.NET Web服务入门经典--C#编程篇', N'Joseph Bustos 等著', CAST(0x0000932F00000000 AS DateTime), N'9787302063100', 45.0000, 1)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5052, N'实用C++调试指南', N'美.Ann R.Ford and Toby J.Teorey 著；於春景 译', CAST(0x000092F400000000 AS DateTime), N'9787560928906', 15.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5053, N'C++Primer Answer Book题解', N'（美）Clovs L.Tondo & Bruce P.Leung 著，侯捷 译', CAST(0x0000927A00000000 AS DateTime), N'7560927041', 48.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5054, N'现代编译原理：C语言描述（英文版）——图灵原版计算机科学系列', N'（美）阿佩尔，（美）金斯伯格  著', CAST(0x000096C200000000 AS DateTime), N'9787115137715', 59.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5057, N'并行程序设计：C、MPI与OpenMP——大学计算机教育国外著名教材系列', N'（美）奎因 著', CAST(0x000096A300000000 AS DateTime), N'730211157X', 33.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5117, N'C++GUL QT3编程', N'（加拿大）布兰切尼，（英）桑姆梅菲尔德　著，齐亮　译', CAST(0x0000981000000000 AS DateTime), N'9787810777315', 49.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5118, N'实用C语言FPGA编程', N'（美）佩勒，（美）蒂博　著，边计年　等译', CAST(0x0000992100000000 AS DateTime), N'9787111211594', 38.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5119, N'C程序设计教程', N'（美）迪特尔著 薛万鹏等译', CAST(0x0000931300000000 AS DateTime), N'9787111079521', 33.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5122, N'Imperfect C++中文版（含CD-ROM光盘一张）', N'威尔逊（Wilson，M.） 著，荣耀，刘未鹏  译', CAST(0x0000973C00000000 AS DateTime), N'9787115136848', 75.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5123, N'Essential C++（英文版）', N'（美）利普曼　著', CAST(0x0000986C00000000 AS DateTime), N'9787115152572', 32.0000, 15)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5334, N'.NET性能优化', N'(澳)维恩霍尔特  著，田松茂，谢君英  译', CAST(0x000096A300000000 AS DateTime), N'9787302110460', 32.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5336, N'Atlas基础教程:ASP.NET Ajax快速开发', N'（美）莫罗尼  著，陈黎夫  译', CAST(0x0000986C00000000 AS DateTime), N'9787115153210', 39.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5337, N'Essential ASP.NET 2.0中文版', N'Brown.F.O.K.', CAST(0x0000995E00000000 AS DateTime), N'9787115159755', 39.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5340, N'移动设备.NET 应用程序设计', N'（英）威格里 著，（英）罗克斯巴勒 著，赵明 等译', CAST(0x0000931300000000 AS DateTime), N'9787302064220', 58.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5341, N'.NET本质论第一卷：公共语言运行库（影印版）', N'（美）伯克斯，（美）赛欧司 著', CAST(0x0000942400000000 AS DateTime), N'9787508318066', 48.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5344, N'ASP.NET 2.0 高级编程（特别版）（含盘）', N'（美）伊夫杰  等著，杨亚  译', CAST(0x0000997D00000000 AS DateTime), N'9787302157014', 138.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5345, N'.NET大局观', N'（美）David Chappell 著，侯捷，荣耀 译', CAST(0x000093A900000000 AS DateTime), N'9787560929491', 42.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5346, N'ASP.NET编程（影印版）（第三版）', N'（美）利伯蒂，（美）赫沃兹  著', CAST(0x0000979600000000 AS DateTime), N'9787564103217', 98.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5348, N'ASP.NET 2.0程序开发详解（附光盘）', N'杨云，王毅  编著', CAST(0x0000992100000000 AS DateTime), N'9787115159342', 55.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5352, N'.NET技术大系：编程的奥秘.NET软件技术学习与实践（含CD-ROM光盘一张）', N'金旭亮  著', CAST(0x0000973C00000000 AS DateTime), N'9787121018206', 65.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5353, N'ASP.NET办公自动化系统开发实例导航（1CD）——行业项目开发实例系列丛书', N'季久峰 李志　等', CAST(0x0000953600000000 AS DateTime), N'9787115124425', 49.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5355, N'企业应用集成.NET实现之道', N'（美）克拉克（Clark,B.） 著，李琪，毕敏刚  译', CAST(0x0000990300000000 AS DateTime), N'9787121038143', 59.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5369, N'ADO.NET高级编程', N'Paul Dickinson等 著；张晓明，邓少（昆+鸟） 译', CAST(0x000093C800000000 AS DateTime), N'9787508313924', 69.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5371, N'21天学通Visual Studio.NET 2003', N'[美]贝雷斯（Beres，J.） 著，袁鹏飞 译', CAST(0x000093C800000000 AS DateTime), N'9787115113191', 55.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5373, N'Delphi for.NET开发人员指南（附CD-ROM光盘一张）——Borland核心技术丛书', N'（美）帕切科 等著，马朝晖  等译', CAST(0x000095CF00000000 AS DateTime), N'9787111155126', 78.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5383, N'ASP. NET 2.0 大揭密', N'（德）洛伦茨 著，王军，郭卫泳  译', CAST(0x000094DA00000000 AS DateTime), N'9787302085010', 36.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5387, N'精通ASP.NET程序设计——微软.NET程序设计系列', N'（意）埃斯波西托（Espostits,D.）  著，罗兵  等译', CAST(0x000097F100000000 AS DateTime), N'7302131856', 85.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5389, N'ASP.NET安全性高级编程', N'（美）巴兹拉 等 著，王晓娜，黄开枝 译', CAST(0x0000934E00000000 AS DateTime), N'9787302064930', 56.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5392, N'C#.NET程序设计——国外计算机科学经典教材', N'布拉德利（Bradley,J.C.），米尔斯波（Millspaugh,A.C.）  著， 天宏工作室  译', CAST(0x000095CF00000000 AS DateTime), N'9787302099345', 64.0000, 1)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5393, N'.NET设计规范（附光盘）', N'（美）夸利纳　等著', CAST(0x000098A900000000 AS DateTime), N'9787111202031', 56.0000, 25)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5502, N'HTML和XHTML权威指南（第五版）', N'慕西亚诺（Musciano，C.），肯尼迪（Kennedy，B.） 著，技桥  译', CAST(0x000094F900000000 AS DateTime), N'9787302076063', 72.0000, 27)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5711, N'Java编程思想（英文版·第4版）', N'（美）埃克尔  著', CAST(0x0000990300000000 AS DateTime), N'9787111212508', 79.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5712, N'Effective Java中文版', N'（美）布洛克 著，潘爱民 译', CAST(0x000092F400000000 AS DateTime), N'7111113853', 39.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5713, N'JSF实战', N'（美）曼  著，铁手  等译', CAST(0x000098E400000000 AS DateTime), N'9787115155917', 69.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5715, N'JavaScript DOM编程艺术', N'（英）基思  著，杨涛，王建桥，杨晓云  译', CAST(0x000098A900000000 AS DateTime), N'9787115139214', 39.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5718, N'Enterprise JavaBeans 3.0 中文版(第5版)', N'（美）布克，（美）蒙森-哈斐尔  著，莫映  等译', CAST(0x0000992100000000 AS DateTime), N'9787121040016', 98.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5719, N'Java设计模式', N'（美）梅特斯克，（美）韦克  著，龚波，赵彩琳，陈蓓  译', CAST(0x000098E400000000 AS DateTime), N'9787115156884', 49.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5721, N'JAVA并发编程实践', N'（美）戈茨（Goetz，B.） 等著，韩锴，方妙  译', CAST(0x0000994000000000 AS DateTime), N'9787121043161', 58.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5723, N'POJOs IN ACTION中文版:用轻量级框架开发企业应用', N'（美）理查德森　著，李琳骁，王海龙　译', CAST(0x0000990300000000 AS DateTime), N'9787121039614', 68.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5726, N'Ajax与Java高级程序设计', N'（美）舒塔（Schutta，N.T.）（美）阿斯利森（Asleson，R.）　著，杨光　译', CAST(0x0000992100000000 AS DateTime), N'9787115158666', 45.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5727, N'Ajax设计模式', N'（美）麦赫马夫　著，杨仁和　译', CAST(0x0000992100000000 AS DateTime), N'9787121039959', 78.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5729, N'Java 数据结构和算法(第二版)', N'（美）拉弗 著，计晓云等 译', CAST(0x0000948000000000 AS DateTime), N'9787508319117', 55.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5730, N'JUnit in Action 中文版——Java人的工具箱系列', N'（美）马森（Massol,V.） 著，鲍志云  译', CAST(0x000095CF00000000 AS DateTime), N'9787121004834', 39.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5734, N'深入Java虚拟机（原书第2版）附光盘---SUN公司核心技术丛书', N'[美]文纳斯 著，曹晓钢，蒋靖 译', CAST(0x000093E700000000 AS DateTime), N'9787111128052', 58.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5736, N'Java解惑', N'（美）布洛赫，（美）加夫特  著，陈昊鹏  译', CAST(0x0000973C00000000 AS DateTime), N'9787115142412', 39.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5737, N'Agile Java中文版:测试驱动开发的编程技术', N'（美）兰格（Jeff,L.）  著，涂波，孙勇  译', CAST(0x0000982F00000000 AS DateTime), N'9787121027048', 69.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5738, N'Java程序设计教程(第5版)/国外经典教材', N'〔美〕迪特尔（Deitel,H.M.)，〔美〕迪特尔（Deitel,P.J.）  著，施平安，施惠琼，柳赐佳  译', CAST(0x0000949D00000000 AS DateTime), N'9787302078920', 98.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5740, N'Hibernate实战(第2版·英文版)', N'（德）鲍尔，（澳）金  著', CAST(0x0000994000000000 AS DateTime), N'9787115160614', 89.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5741, N'SCJP学习指南（附光盘）', N'（美）谢拉，（美）贝茨  著，陈宗斌，沈金河  译', CAST(0x0000984D00000000 AS DateTime), N'9787115151353', 69.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5743, N'JavaScript核心技术', N'（美）帕瓦斯　著', CAST(0x0000994000000000 AS DateTime), N'9787111212973', 45.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5744, N'Java 2入门经典：JDK5', N'（美）霍顿（Horton I.）  著，潘晓雷  等译', CAST(0x0000973C00000000 AS DateTime), N'9787111180890', 118.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5746, N'Java网络编程（第3版）——O’Reilly Java系列', N'（英）哈诺德  著，朱涛江，林剑  译', CAST(0x000096FF00000000 AS DateTime), N'9787508338408', 85.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5748, N'详解HTML&CSS&JavaScript 语法辞典（专业版）', N'（日）大藤幹，（日）半场方人  编著，陈晓鑫  译', CAST(0x0000990300000000 AS DateTime), N'9787500673637', 48.0000, 27)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5750, N'Java程序设计语言（第4版）/图灵计算机科学丛书', N'（美）阿诺德，（美）戈斯林，（美）霍姆斯  著，陈昊鹏  等译', CAST(0x0000986C00000000 AS DateTime), N'9787115152978', 69.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5752, N'Head First EJB（中文版）', N'（美）西勒（Sierra，K.），（美）贝茨（Bates，B.）著，陈学峰  等译', CAST(0x0000982F00000000 AS DateTime), N'9787508338897', 79.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5755, N'JavaScript精粹', N'（英）爱德华兹，（澳）亚当斯  著，高铁军  译', CAST(0x0000994000000000 AS DateTime), N'9787115159991', 49.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5805, N'Java设计模式（第2版）（精装英文版）', N'（美）梅茨克尔（Metsker，S.J.），（美）韦克（Wake，W.C.） 著', CAST(0x0000994000000000 AS DateTime), N'9787115155696', 75.0000, 21)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5806, N'JXTA技术手册', N'奥克斯（Oaks,s.）,切沃萨特（Traversat,B.），宫力（Gong,L.）著，技桥 译', CAST(0x000094BC00000000 AS DateTime), N'9787302074687', 49.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5807, N'JFC Swing标准教材（第二版）——SUN可核心技术丛书', N'（美）沃尔拉斯（Walrath，K.）著；邓一凡 等译', CAST(0x000095EE00000000 AS DateTime), N'9787121007460', 58.0000, 28)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId]) VALUES (5888, N'Java算法（第3版·第1卷）', N'(美)塞奇威克 著，赵文进', CAST(0x000094F900000000 AS DateTime), N'9787302086383', 59.0000, 21)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [UserId], [BookId], [Count]) VALUES (412, 228, 4943, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [BookId], [Count]) VALUES (458, 216, 4946, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [BookId], [Count]) VALUES (459, 216, 4945, 1)
INSERT [dbo].[Cart] ([Id], [UserId], [BookId], [Count]) VALUES (460, 216, 4939, 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N' C#')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (25, N'.NET')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (15, N'C++')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (27, N'Front-End')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (21, N'Java')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (28, N'Others')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[OrderBook] ON 

INSERT [dbo].[OrderBook] ([Id], [UserID], [Address], [TotalPrice]) VALUES (1, 216, N'wsdq', 918)
INSERT [dbo].[OrderBook] ([Id], [UserID], [Address], [TotalPrice]) VALUES (2, 216, N'', 45)
SET IDENTITY_INSERT [dbo].[OrderBook] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [LoginId], [LoginPwd], [Name], [Address], [Phone], [Mail], [UserStateId]) VALUES (216, N'liye', N'1', N'djalk', N'da', N'dwa', N'da@fa.com', 1)
INSERT [dbo].[Users] ([Id], [LoginId], [LoginPwd], [Name], [Address], [Phone], [Mail], [UserStateId]) VALUES (224, N'liaoqixiang', N'123', N'', N'', N'', N'', 1)
INSERT [dbo].[Users] ([Id], [LoginId], [LoginPwd], [Name], [Address], [Phone], [Mail], [UserStateId]) VALUES (228, N'fuck', N'123', N'', N'', N'', N'', 1)
INSERT [dbo].[Users] ([Id], [LoginId], [LoginPwd], [Name], [Address], [Phone], [Mail], [UserStateId]) VALUES (229, N'www', N'123123', N'', N'', N'', N'', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserStates] ON 

INSERT [dbo].[UserStates] ([Id], [Name]) VALUES (2, N'Cancel')
INSERT [dbo].[UserStates] ([Id], [Name]) VALUES (3, N'Forbidden')
INSERT [dbo].[UserStates] ([Id], [Name]) VALUES (1, N'Normal')
SET IDENTITY_INSERT [dbo].[UserStates] OFF
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Books]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserStates] FOREIGN KEY([UserStateId])
REFERENCES [dbo].[UserStates] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserStates]
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultId', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserStates'
GO
