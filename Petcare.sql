
CREATE DATABASE PetcareDB;
GO

USE [PetcareDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 1/14/2020 9:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](200) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[Fullname] [nvarchar](200) NULL,
	[Email] [varchar](200) NULL,
	[Phone] [int] NULL,
	[Address] [nvarchar](255) NULL,
	[Role] [tinyint] NOT NULL,
	[IsInactive] [bit] NOT NULL,
	[ReasonBaned] [nvarchar](1000) NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccId] ASC
)) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/14/2020 9:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CateId] ASC
)) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 1/14/2020 9:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbacktId] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](200) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Phone] [int] NULL,
	[Content] [nvarchar](2000) NOT NULL,
	[IsRead] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[AccId] [int] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OdId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[IsDelivered] [bit] NOT NULL,
	[DateCreated] [datetime] NULL,
	[OrderId] [int] NOT NULL,
	[ProdId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OdId] ASC
)) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/14/2020 9:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[AccId] [int] NOT NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetGuides]    Script Date: 1/14/2020 9:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetGuides](
	[PetGuideId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ImageName] [varchar](200) NULL,
	[IsNew] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[AccId] [int] NOT NULL,
 CONSTRAINT [PK_PetGuides] PRIMARY KEY CLUSTERED 
(
	[PetGuideId] ASC
)) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 1/14/2020 9:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](200) NOT NULL,
	[ProdId] [int] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/14/2020 9:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProdId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[ImageName] [varchar](200) NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [nvarchar](50) NOT NULL,
	[IsNew] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[AccId] [int] NOT NULL,
	[CateId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProdId] ASC
)) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccId], [Username], [Password], [Fullname], [Email], [Phone], [Address], [Role], [IsInactive], [ReasonBaned], [DateCreated]) VALUES (1, N'admin', N'admin', N'Administrator', N'admin@gmail.com', 933113114, N'590 CMT8', 2, 0, NULL, CAST(N'2020-01-12T18:02:43.797' AS DateTime))
INSERT [dbo].[Accounts] ([AccId], [Username], [Password], [Fullname], [Email], [Phone], [Address], [Role], [IsInactive], [ReasonBaned], [DateCreated]) VALUES (2, N'user', N'user', N'User', N'user@gmail.com', 902123321, N'21 Bui Thi Xuan', 0, 0, NULL, CAST(N'2020-01-12T19:05:26.450' AS DateTime))
INSERT [dbo].[Accounts] ([AccId], [Username], [Password], [Fullname], [Email], [Phone], [Address], [Role], [IsInactive], [ReasonBaned], [DateCreated]) VALUES (3, N'phuong.nd', N'123456', N'Phuong Ngo', N'phuong.ngo@gmail.com', 762327226, N'70 Nguy?n S? Sách', 1, 0, NULL, CAST(N'2020-01-12T19:07:49.313' AS DateTime))
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CateId], [Name], [Description]) VALUES (1, N'Dog Food', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbacktId], [Fullname], [Email], [Phone], [Content], [IsRead], [DateCreated], [AccId]) VALUES (1, N'asdf', N'asdf', 44654, N'sdafasfd', 0, CAST(N'2020-01-12T22:25:30.363' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [AccId], [DateCreated]) VALUES (1, 1, CAST(N'2020-01-14T09:17:20.700' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[PetGuides] ON 

INSERT [dbo].[PetGuides] ([PetGuideId], [Title], [Content], [ImageName], [IsNew], [DateCreated], [AccId]) VALUES (1, N'Test Title', N'Lorem Ipsum...tét', N'test.jpg', 0, CAST(N'2020-01-12T19:17:36.627' AS DateTime), 1)
INSERT [dbo].[PetGuides] ([PetGuideId], [Title], [Content], [ImageName], [IsNew], [DateCreated], [AccId]) VALUES (3, N'Dog', N'Lorem ipsum....', NULL, 0, CAST(N'2020-01-14T09:22:07.367' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PetGuides] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProdId], [Name], [Description], [ImageName], [Quantity], [UnitPrice], [IsNew], [DateCreated], [AccId], [CateId]) VALUES (1, N'Bean', NULL, NULL, 100, N'pcs', 1, CAST(N'2020-01-12T19:20:29.660' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [U_Name]    Script Date: 1/14/2020 9:33:36 AM ******/
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [U_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_Role]  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_IsInactive]  DEFAULT ((0)) FOR [IsInactive]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[PetGuides] ADD  CONSTRAINT [DF_PetGuides_IsNew]  DEFAULT ((0)) FOR [IsNew]
GO
ALTER TABLE [dbo].[PetGuides] ADD  CONSTRAINT [DF_Articles_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_IsNew]  DEFAULT ((1)) FOR [IsNew]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Accounts] FOREIGN KEY([AccId])
REFERENCES [dbo].[Accounts] ([AccId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Accounts]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProdId])
REFERENCES [dbo].[Products] ([ProdId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([AccId])
REFERENCES [dbo].[Accounts] ([AccId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[PetGuides]  WITH CHECK ADD  CONSTRAINT [FK_PetGuides_Accounts] FOREIGN KEY([AccId])
REFERENCES [dbo].[Accounts] ([AccId])
GO
ALTER TABLE [dbo].[PetGuides] CHECK CONSTRAINT [FK_PetGuides_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Accounts] FOREIGN KEY([AccId])
REFERENCES [dbo].[Accounts] ([AccId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CateId])
REFERENCES [dbo].[Categories] ([CateId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
