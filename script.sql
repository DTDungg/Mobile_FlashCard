IF EXISTS (SELECT * FROM sys.databases WHERE name = 'FlashCardDB')
BEGIN
    DROP DATABASE FlashCardDB
END
create database FlashCardDB
go

USE [FlashCardDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/14/2025 10:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 1/14/2025 10:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardID] [int] IDENTITY(1,1) NOT NULL,
	[Front] [nvarchar](50) NOT NULL,
	[Back] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[LastModify] [datetime2](7) NOT NULL,
	[SetID] [int] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow]    Script Date: 1/14/2025 10:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow](
	[FollowId] [int] IDENTITY(1,1) NOT NULL,
	[FollowingId] [int] NULL,
	[FollowerId] [int] NULL,
 CONSTRAINT [PK_Follow] PRIMARY KEY CLUSTERED 
(
	[FollowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Save]    Script Date: 1/14/2025 10:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Save](
	[SaveID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[SetID] [int] NULL,
 CONSTRAINT [PK_Save] PRIMARY KEY CLUSTERED 
(
	[SaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Set]    Script Date: 1/14/2025 10:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Set](
	[SetID] [int] IDENTITY(1,1) NOT NULL,
	[SetName] [nvarchar](50) NOT NULL,
	[SetDescription] [nvarchar](500) NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[Liked] [int] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Set] PRIMARY KEY CLUSTERED 
(
	[SetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 1/14/2025 10:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[TypeDescription] [nvarchar](500) NOT NULL,
	[TimeToReview] [int] NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/14/2025 10:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Follower] [int] NOT NULL,
	[Following] [int] NOT NULL,
	[Streak] [int] NOT NULL,
	[Gift] [int] NOT NULL,
	[Avatar] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250110040745_DbInit', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250114011149_initDB', N'8.0.11')
GO
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (1, N'apple', N'tao', N'trai cay dang tron, mau do, ngot', CAST(N'2025-01-14T10:01:48.1950763' AS DateTime2), 1, 3)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (2, N'banana', N'chuoi', N'trai cay dang dai, mau vang, ngot', CAST(N'2025-01-14T08:22:38.1773727' AS DateTime2), 1, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (3, N'orange', N'cam', N'trai cay hinh cau, chua, mau cam', CAST(N'2025-01-14T08:23:01.9036187' AS DateTime2), 1, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (4, N'grapes', N'nho', N'trai cay hinh cau, nho, mau tim', CAST(N'2025-01-14T08:23:54.8299909' AS DateTime2), 1, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (5, N'pineapple', N'dua', N'trai lon, hinh tru, co gai,mau xanh vang', CAST(N'2025-01-14T08:24:49.0023750' AS DateTime2), 1, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (6, N'watermelon', N'dua hau', N'qua lon hinh cau, ngot, vo xanh, ruot do', CAST(N'2025-01-14T08:25:17.6471397' AS DateTime2), 1, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (7, N'strawberry', N'dau tay', N'qua nho hinh trai tim, mau do, chua ngot', CAST(N'2025-01-14T08:25:50.5587914' AS DateTime2), 1, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (8, N'mango', N'xoai', N'qua mau vang ngot hoac xanh chua', CAST(N'2025-01-14T08:26:17.7807116' AS DateTime2), 1, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (9, N'knife', N'dao', N'dung cu sat ben den cat thuc pham', CAST(N'2025-01-14T08:29:19.5531168' AS DateTime2), 2, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (10, N'cutting board', N'thot', N'be mat phang, tu go hoac nhua, de cat thuc an', CAST(N'2025-01-14T08:29:55.9460351' AS DateTime2), 2, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (11, N'frying pan', N'chao ran', N'dung cu co day phang, dung de chien xao', CAST(N'2025-01-14T08:30:30.2058327' AS DateTime2), 2, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (12, N'pot', N'noi', N'dung cu sau long, co tay cam, dung de nau canh', CAST(N'2025-01-14T08:30:56.1116199' AS DateTime2), 2, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (13, N'spatula', N'xeng', N'dung de dao thuc pham khi chien xao', CAST(N'2025-01-14T08:31:29.9974859' AS DateTime2), 2, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (14, N'micorwave', N'lo vi song', N'dung de ham nong hoac nau thuc an bang song vi ba', CAST(N'2025-01-14T08:32:06.3943959' AS DateTime2), 2, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (15, N'Refrigerator', N'tu lanh', N'dung de luu tru thuc pham trong thoi gian dai', CAST(N'2025-01-14T08:32:33.9270273' AS DateTime2), 2, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (16, N'blender', N'may xay sinh to', N'dung de xay nhuyen thuc pham', CAST(N'2025-01-14T08:32:58.1195224' AS DateTime2), 2, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (17, N'Tây Tiến', N'Quang Dũng', N'Năm sáng tác: 1948', CAST(N'2025-01-14T08:35:18.9719926' AS DateTime2), 3, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (18, N'Đoàn thuyền đánh cá', N'Huy Cận', N'Năm sáng tác: 1958', CAST(N'2025-01-14T08:35:36.0329791' AS DateTime2), 3, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (19, N'Đồng chí', N'Chính Hữu', N'Năm sáng tác: 1948', CAST(N'2025-01-14T08:35:55.7038415' AS DateTime2), 3, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (20, N'Việt Bắc', N'Tố Hữu', N'Năm sáng tác: 1954', CAST(N'2025-01-14T08:36:13.2319092' AS DateTime2), 3, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (21, N'Sóng', N'Tác giả: Xuân Quỳnh', N'Năm sáng tác: 1967', CAST(N'2025-01-14T08:36:29.7034265' AS DateTime2), 3, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (22, N'Ánh trăng', N'Nguyễn Duy', N'Năm sáng tác: 1978', CAST(N'2025-01-14T08:36:45.6181301' AS DateTime2), 3, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (23, N'Bếp lửa', N'Bằng Việt', N'Năm sáng tác: 1963', CAST(N'2025-01-14T08:37:10.8883701' AS DateTime2), 3, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (24, N'Nhớ rừng', N'Thế Lữ', N'Năm sáng tác: 1934', CAST(N'2025-01-14T08:37:24.9131157' AS DateTime2), 3, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (25, N'Việt Nam', N'Hà Nội', N'Năm 1945 (sau Cách mạng Tháng Tám thành công)', CAST(N'2025-01-14T09:00:02.6761485' AS DateTime2), 4, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (26, N'Nhật Bản', N'Tokyo
', N'Năm 1868 (thời Minh Trị Duy Tân, chuyển từ Kyoto sang Tokyo)', CAST(N'2025-01-14T09:00:19.8536636' AS DateTime2), 4, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (27, N'Pháp', N'Paris', N'Năm 508 (khi vua Clovis I chọn Paris làm thủ đô)', CAST(N'2025-01-14T09:00:46.3802769' AS DateTime2), 4, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (28, N'Hoa Kỳ', N'Washington, D.C', N' Năm 1800 (khi chính quyền liên bang chuyển từ Philadelphia)', CAST(N'2025-01-14T09:01:02.7681435' AS DateTime2), 4, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (29, N'Úc', N'Canberra', N'Năm 1913 (sau tranh luận giữa Sydney và Melbourne).', CAST(N'2025-01-14T09:01:19.3662089' AS DateTime2), 4, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (30, N'Hàn Quốc', N'Seoul', N' Năm 1948 (khi Hàn Quốc chính thức thành lập).', CAST(N'2025-01-14T09:01:42.2722560' AS DateTime2), 4, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (31, N'Anh', N'London', N' Khoảng năm 1066 (khi vua William I chọn làm trung tâm chính trị).', CAST(N'2025-01-14T09:01:54.5470584' AS DateTime2), 4, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (32, N'Ấn Độ', N'New Delhi', N'Năm 1931 (khi chuyển thủ đô từ Kolkata).', CAST(N'2025-01-14T09:02:17.7295412' AS DateTime2), 4, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (37, N'b', N'b', N'b', CAST(N'2025-01-14T09:21:07.4625951' AS DateTime2), 6, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (38, N'b', N'b', N'b', CAST(N'2025-01-14T09:21:10.4254493' AS DateTime2), 6, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (39, N'Việt Nam', N'Hà Nội', N'Năm 1945 (sau Cách mạng Tháng Tám thành công)', CAST(N'2025-01-14T09:21:12.2343286' AS DateTime2), 7, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (40, N'Nhật Bản', N'Tokyo
', N'Năm 1868 (thời Minh Trị Duy Tân, chuyển từ Kyoto sang Tokyo)', CAST(N'2025-01-14T09:21:13.4364157' AS DateTime2), 7, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (41, N'Pháp', N'Paris', N'Năm 508 (khi vua Clovis I chọn Paris làm thủ đô)', CAST(N'2025-01-14T09:22:24.6622236' AS DateTime2), 7, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (42, N'Hoa Kỳ', N'Washington, D.C', N' Năm 1800 (khi chính quyền liên bang chuyển từ Philadelphia)', CAST(N'2025-01-14T09:22:25.5498539' AS DateTime2), 7, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (43, N'Úc', N'Canberra', N'Năm 1913 (sau tranh luận giữa Sydney và Melbourne).', CAST(N'2025-01-14T09:22:26.6306949' AS DateTime2), 7, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (44, N'Hàn Quốc', N'Seoul', N' Năm 1948 (khi Hàn Quốc chính thức thành lập).', CAST(N'2025-01-14T09:22:27.7012385' AS DateTime2), 7, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (45, N'Anh', N'London', N' Khoảng năm 1066 (khi vua William I chọn làm trung tâm chính trị).', CAST(N'2025-01-14T09:22:28.6162179' AS DateTime2), 7, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (46, N'Ấn Độ', N'New Delhi', N'Năm 1931 (khi chuyển thủ đô từ Kolkata).', CAST(N'2025-01-14T09:22:29.6782829' AS DateTime2), 7, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (47, N'knife', N'dao', N'dung cu sat ben den cat thuc pham', CAST(N'2025-01-14T09:22:30.7571192' AS DateTime2), 8, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (48, N'cutting board', N'thot', N'be mat phang, tu go hoac nhua, de cat thuc an', CAST(N'2025-01-14T09:22:31.9051592' AS DateTime2), 8, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (49, N'frying pan', N'chao ran', N'dung cu co day phang, dung de chien xao', CAST(N'2025-01-14T09:22:33.1484534' AS DateTime2), 8, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (50, N'pot', N'noi', N'dung cu sau long, co tay cam, dung de nau canh', CAST(N'2025-01-14T09:22:34.2344277' AS DateTime2), 8, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (51, N'spatula', N'xeng', N'dung de dao thuc pham khi chien xao', CAST(N'2025-01-14T09:22:36.1192816' AS DateTime2), 8, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (52, N'micorwave', N'lo vi song', N'dung de ham nong hoac nau thuc an bang song vi ba', CAST(N'2025-01-14T09:22:37.7325160' AS DateTime2), 8, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (53, N'Refrigerator', N'tu lanh', N'dung de luu tru thuc pham trong thoi gian dai', CAST(N'2025-01-14T09:22:38.9989087' AS DateTime2), 8, 1)
INSERT [dbo].[Card] ([CardID], [Front], [Back], [Description], [LastModify], [SetID], [TypeID]) VALUES (54, N'blender', N'may xay sinh to', N'dung de xay nhuyen thuc pham', CAST(N'2025-01-14T09:22:41.1681705' AS DateTime2), 8, 1)
SET IDENTITY_INSERT [dbo].[Card] OFF
GO
SET IDENTITY_INSERT [dbo].[Save] ON 

INSERT [dbo].[Save] ([SaveID], [UserID], [SetID]) VALUES (1, 3, 4)
INSERT [dbo].[Save] ([SaveID], [UserID], [SetID]) VALUES (2, 3, 2)
SET IDENTITY_INSERT [dbo].[Save] OFF
GO
SET IDENTITY_INSERT [dbo].[Set] ON 

INSERT [dbo].[Set] ([SetID], [SetName], [SetDescription], [IsPublic], [Liked], [UserID]) VALUES (1, N'fruit', N'tu vung tieng anh ve cac loai trai cay', 1, 0, 1)
INSERT [dbo].[Set] ([SetID], [SetName], [SetDescription], [IsPublic], [Liked], [UserID]) VALUES (2, N'Kitchen', N'cac tu vung ve nha bep', 1, 1, 1)
INSERT [dbo].[Set] ([SetID], [SetName], [SetDescription], [IsPublic], [Liked], [UserID]) VALUES (3, N'Tho ca', N'cac bai tho noi tieng cua tac gia Viet', 1, 0, 1)
INSERT [dbo].[Set] ([SetID], [SetName], [SetDescription], [IsPublic], [Liked], [UserID]) VALUES (4, N'Thủ đô', N'thủ đô của các quốc gia', 1, 1, 2)
INSERT [dbo].[Set] ([SetID], [SetName], [SetDescription], [IsPublic], [Liked], [UserID]) VALUES (6, N'b', N'b', 1, 0, 3)
INSERT [dbo].[Set] ([SetID], [SetName], [SetDescription], [IsPublic], [Liked], [UserID]) VALUES (7, N'Thủ đô', N'thủ đô của các quốc gia', 0, 0, 3)
INSERT [dbo].[Set] ([SetID], [SetName], [SetDescription], [IsPublic], [Liked], [UserID]) VALUES (8, N'Kitchen', N'cac tu vung ve nha bep', 0, 0, 3)
SET IDENTITY_INSERT [dbo].[Set] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([TypeID], [TypeName], [TypeDescription], [TimeToReview]) VALUES (1, N'new word', N'still have not learn', 0)
INSERT [dbo].[Type] ([TypeID], [TypeName], [TypeDescription], [TimeToReview]) VALUES (2, N'quite new', N'learn some time', 6)
INSERT [dbo].[Type] ([TypeID], [TypeName], [TypeDescription], [TimeToReview]) VALUES (3, N'old word', N'learned a lot of time', 24)
INSERT [dbo].[Type] ([TypeID], [TypeName], [TypeDescription], [TimeToReview]) VALUES (4, N'my word', N'i know it', 72)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [Follower], [Following], [Streak], [Gift], [Avatar]) VALUES (1, N'Doris', N'email@gmail.com', N'11111111', 0, 0, 0, 7, N'assets/images/fc.png')
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [Follower], [Following], [Streak], [Gift], [Avatar]) VALUES (2, N'Mathew', N'email@gmail.com', N'22222222', 0, 0, 0, 5, N'assets/images/fc.png')
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [Follower], [Following], [Streak], [Gift], [Avatar]) VALUES (3, N'Anna', N'email@gmail.com', N'33333333', 0, 0, 0, 4, N'assets/images/fc.png')
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [Follower], [Following], [Streak], [Gift], [Avatar]) VALUES (6, N'Sunny', N'email@gmail.com', N'44444444', 0, 0, 0, 1, N'assets/images/fc.png')
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [Follower], [Following], [Streak], [Gift], [Avatar]) VALUES (8, N'Hana', N'email@gmail.com', N'55555555', 0, 0, 0, 3, N'assets/images/fc.png')
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [Follower], [Following], [Streak], [Gift], [Avatar]) VALUES (9, N'John', N'email@gmail.com', N'66666666', 0, 0, 0, 10, N'assets/images/fc.png')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Card_SetID]    Script Date: 1/14/2025 10:07:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Card_SetID] ON [dbo].[Card]
(
	[SetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Card_TypeID]    Script Date: 1/14/2025 10:07:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Card_TypeID] ON [dbo].[Card]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Follow_FollowerId]    Script Date: 1/14/2025 10:07:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Follow_FollowerId] ON [dbo].[Follow]
(
	[FollowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Follow_FollowingId]    Script Date: 1/14/2025 10:07:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Follow_FollowingId] ON [dbo].[Follow]
(
	[FollowingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Save_SetID]    Script Date: 1/14/2025 10:07:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Save_SetID] ON [dbo].[Save]
(
	[SetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Save_UserID]    Script Date: 1/14/2025 10:07:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Save_UserID] ON [dbo].[Save]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Set_UserID]    Script Date: 1/14/2025 10:07:45 AM ******/
CREATE NONCLUSTERED INDEX [IX_Set_UserID] ON [dbo].[Set]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Set_SetID] FOREIGN KEY([SetID])
REFERENCES [dbo].[Set] ([SetID])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Set_SetID]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Type_TypeID] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Type_TypeID]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow_User_FollowerId] FOREIGN KEY([FollowerId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow_User_FollowerId]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow_User_FollowingId] FOREIGN KEY([FollowingId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow_User_FollowingId]
GO
ALTER TABLE [dbo].[Save]  WITH CHECK ADD  CONSTRAINT [FK_Save_Set_SetID] FOREIGN KEY([SetID])
REFERENCES [dbo].[Set] ([SetID])
GO
ALTER TABLE [dbo].[Save] CHECK CONSTRAINT [FK_Save_Set_SetID]
GO
ALTER TABLE [dbo].[Save]  WITH CHECK ADD  CONSTRAINT [FK_Save_User_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Save] CHECK CONSTRAINT [FK_Save_User_UserID]
GO
ALTER TABLE [dbo].[Set]  WITH CHECK ADD  CONSTRAINT [FK_Set_User_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Set] CHECK CONSTRAINT [FK_Set_User_UserID]
GO
USE [master]
GO
ALTER DATABASE [FlashCardDB] SET  READ_WRITE 
GO
