USE [master]
GO
/****** Object:  Database [do an]    Script Date: 20/04/2025 3:07:27 SA ******/
CREATE DATABASE [do an]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'do an', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\do an.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'do an_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\do an_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [do an] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [do an].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [do an] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [do an] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [do an] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [do an] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [do an] SET ARITHABORT OFF 
GO
ALTER DATABASE [do an] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [do an] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [do an] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [do an] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [do an] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [do an] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [do an] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [do an] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [do an] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [do an] SET  DISABLE_BROKER 
GO
ALTER DATABASE [do an] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [do an] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [do an] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [do an] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [do an] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [do an] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [do an] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [do an] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [do an] SET  MULTI_USER 
GO
ALTER DATABASE [do an] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [do an] SET DB_CHAINING OFF 
GO
ALTER DATABASE [do an] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [do an] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [do an] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [do an] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [do an] SET QUERY_STORE = ON
GO
ALTER DATABASE [do an] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [do an]
GO
/****** Object:  Table [dbo].[bao_cao]    Script Date: 20/04/2025 3:07:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bao_cao](
	[ma_bao_cao] [int] NOT NULL,
	[ma_de_tai] [int] NOT NULL,
	[duong_dan_file] [nvarchar](255) NOT NULL,
	[ngay_nop] [date] NOT NULL,
	[mo_ta] [nvarchar](50) NULL,
	[tenbaocao] [nvarchar](255) NULL,
 CONSTRAINT [PK_bao_cao] PRIMARY KEY CLUSTERED 
(
	[ma_bao_cao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[de_tai]    Script Date: 20/04/2025 3:07:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[de_tai](
	[ma_de_tai] [nvarchar](50) NOT NULL,
	[ten_de_tai] [nvarchar](50) NOT NULL,
	[mo_ta] [nvarchar](50) NULL,
	[trang_thai] [nvarchar](50) NULL,
	[ngay_tao] [date] NULL,
	[mssv] [nvarchar](13) NOT NULL,
	[ma_gv] [nvarchar](5) NULL,
 CONSTRAINT [PK_de_tai] PRIMARY KEY CLUSTERED 
(
	[ma_de_tai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diem]    Script Date: 20/04/2025 3:07:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diem](
	[cham_diem] [int] NOT NULL,
	[ma_bao_cao] [int] NOT NULL,
	[diem] [decimal](18, 0) NULL,
	[nhan_xet] [nvarchar](max) NULL,
	[ngay_cham] [date] NULL,
	[tong_diem] [float] NULL,
	[trangthaidoan] [nvarchar](13) NULL,
	[long_diem] [float] NULL,
	[diem_tb] [decimal](5, 2) NULL,
 CONSTRAINT [PK_diem] PRIMARY KEY CLUSTERED 
(
	[cham_diem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giang_vien]    Script Date: 20/04/2025 3:07:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giang_vien](
	[ma_gv] [nvarchar](5) NOT NULL,
	[mat_khau] [nvarchar](max) NOT NULL,
	[ho_ten] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[bo_mon] [nvarchar](50) NULL,
 CONSTRAINT [PK_giang_vien] PRIMARY KEY CLUSTERED 
(
	[ma_gv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phan_hoi]    Script Date: 20/04/2025 3:07:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phan_hoi](
	[ma_phan_hoi] [int] NOT NULL,
	[ma_bao_cao] [int] NOT NULL,
	[ma_gv] [nvarchar](5) NULL,
	[noi_dung] [nvarchar](max) NULL,
	[ngay_phan_hoi] [date] NOT NULL,
 CONSTRAINT [PK_phan_hoi] PRIMARY KEY CLUSTERED 
(
	[ma_phan_hoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quan_tri]    Script Date: 20/04/2025 3:07:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quan_tri](
	[ma_admin] [nvarchar](10) NOT NULL,
	[mat_khau] [nvarchar](max) NOT NULL,
	[ho_ten] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_quan_tri] PRIMARY KEY CLUSTERED 
(
	[ma_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinh_vien]    Script Date: 20/04/2025 3:07:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinh_vien](
	[mssv] [nvarchar](13) NOT NULL,
	[mat_khau] [nvarchar](10) NOT NULL,
	[ho_ten] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[lop] [nvarchar](10) NULL,
	[khoa] [nvarchar](10) NULL,
 CONSTRAINT [PK_sinh_vien] PRIMARY KEY CLUSTERED 
(
	[mssv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thoi_gian]    Script Date: 20/04/2025 3:07:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thoi_gian](
	[moc_thoi_gian] [int] NOT NULL,
	[ten_moc] [nvarchar](50) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[ngay_bat_dau] [date] NOT NULL,
	[ngay_ket_thuc] [date] NOT NULL,
 CONSTRAINT [PK_thoi_gian] PRIMARY KEY CLUSTERED 
(
	[moc_thoi_gian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thong_ke]    Script Date: 20/04/2025 3:07:28 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thong_ke](
	[ma_bao_cao] [int] NOT NULL,
	[hoc_ky] [int] NULL,
	[khoa] [nvarchar](10) NULL,
	[lop] [nvarchar](10) NULL,
	[tong_so_de_tai] [int] NULL,
	[so_de_tai_hoan_thanh] [int] NULL,
	[ngay_tao] [date] NULL,
 CONSTRAINT [PK_thong_ke] PRIMARY KEY CLUSTERED 
(
	[ma_bao_cao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[bao_cao] ([ma_bao_cao], [ma_de_tai], [duong_dan_file], [ngay_nop], [mo_ta], [tenbaocao]) VALUES (1, 1, N'https://github.com/kien2511/K58_KMT', CAST(N'2025-04-17' AS Date), N'BẢO VỆ', NULL)
INSERT [dbo].[bao_cao] ([ma_bao_cao], [ma_de_tai], [duong_dan_file], [ngay_nop], [mo_ta], [tenbaocao]) VALUES (2, 2, N'C:\du_lieu\bao_cao1.docx', CAST(N'2025-04-02' AS Date), N'Báo cáo Đồ án 1', NULL)
INSERT [dbo].[bao_cao] ([ma_bao_cao], [ma_de_tai], [duong_dan_file], [ngay_nop], [mo_ta], [tenbaocao]) VALUES (6, 4, N'C:\du_lieu\bao_cao1.docx', CAST(N'2025-04-02' AS Date), N'Báo cáo Đồ án 1', NULL)
GO
INSERT [dbo].[de_tai] ([ma_de_tai], [ten_de_tai], [mo_ta], [trang_thai], [ngay_tao], [mssv], [ma_gv]) VALUES (N'01', N'đồ án pttk ht quản lý đồ án của sinh viên ', N'đồ án môn học', N'đã nhận', CAST(N'2025-03-17' AS Date), N'K225480106032', N'GV001')
GO
INSERT [dbo].[diem] ([cham_diem], [ma_bao_cao], [diem], [nhan_xet], [ngay_cham], [tong_diem], [trangthaidoan], [long_diem], [diem_tb]) VALUES (1, 1, CAST(5 AS Decimal(18, 0)), N'Báo cáo tốt', CAST(N'2025-04-17' AS Date), 8, N'Đạt', NULL, CAST(7.50 AS Decimal(5, 2)))
GO
INSERT [dbo].[giang_vien] ([ma_gv], [mat_khau], [ho_ten], [email], [bo_mon]) VALUES (N'GV001', N'GV001', N'Đỗ Duy Cốp', N'đouycop@tnut.edu.vn', N'cntt')
GO
INSERT [dbo].[phan_hoi] ([ma_phan_hoi], [ma_bao_cao], [ma_gv], [noi_dung], [ngay_phan_hoi]) VALUES (1, 1, N'GV001', N'Cần bổ sung nội dung chương 2', CAST(N'2025-04-17' AS Date))
GO
INSERT [dbo].[quan_tri] ([ma_admin], [mat_khau], [ho_ten], [email]) VALUES (N'AD001', N'AD001', N'ADMIN', N'admin.tnut.edu.vn')
GO
INSERT [dbo].[sinh_vien] ([mssv], [mat_khau], [ho_ten], [email], [lop], [khoa]) VALUES (N'K225480106032', N'14102004', N'Nguyễn Trung Kiên', N'k225480106032@tnut.edu.vn', N'k58.ktp.01', N'điện tử')
GO
INSERT [dbo].[thoi_gian] ([moc_thoi_gian], [ten_moc], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc]) VALUES (1, N'Nộp đề cương', N'Sinh viên nộp đề cương', CAST(N'2024-04-01' AS Date), CAST(N'2024-04-05' AS Date))
INSERT [dbo].[thoi_gian] ([moc_thoi_gian], [ten_moc], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc]) VALUES (2, N'LẬP DÀN Ý', N'KHONG CÓ', CAST(N'2025-04-01' AS Date), CAST(N'2025-04-11' AS Date))
INSERT [dbo].[thoi_gian] ([moc_thoi_gian], [ten_moc], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc]) VALUES (3, N'ĐƯA RA BẢNG DỮ LIỆU', N'PK FK ', CAST(N'2025-04-12' AS Date), CAST(N'2025-04-18' AS Date))
INSERT [dbo].[thoi_gian] ([moc_thoi_gian], [ten_moc], [mo_ta], [ngay_bat_dau], [ngay_ket_thuc]) VALUES (4, N'CHỨC NĂNG CỦA HỆ THỐNG ', N'ĐƯA RA CÁC SQL PHÙ HỢP ĐỂ CÓ DỮ LIỆU ', CAST(N'2025-04-19' AS Date), CAST(N'2025-04-23' AS Date))
GO
INSERT [dbo].[thong_ke] ([ma_bao_cao], [hoc_ky], [khoa], [lop], [tong_so_de_tai], [so_de_tai_hoan_thanh], [ngay_tao]) VALUES (1, 3, N'điện tử', N'k58.ktp.01', 1, 1, CAST(N'2025-04-30' AS Date))
GO
ALTER TABLE [dbo].[de_tai]  WITH CHECK ADD  CONSTRAINT [FK_de_tai_de_tai] FOREIGN KEY([ma_de_tai])
REFERENCES [dbo].[de_tai] ([ma_de_tai])
GO
ALTER TABLE [dbo].[de_tai] CHECK CONSTRAINT [FK_de_tai_de_tai]
GO
ALTER TABLE [dbo].[diem]  WITH CHECK ADD  CONSTRAINT [FK_diem_bao_cao] FOREIGN KEY([ma_bao_cao])
REFERENCES [dbo].[bao_cao] ([ma_bao_cao])
GO
ALTER TABLE [dbo].[diem] CHECK CONSTRAINT [FK_diem_bao_cao]
GO
ALTER TABLE [dbo].[phan_hoi]  WITH CHECK ADD  CONSTRAINT [FK_phan_hoi_bao_cao1] FOREIGN KEY([ma_bao_cao])
REFERENCES [dbo].[bao_cao] ([ma_bao_cao])
GO
ALTER TABLE [dbo].[phan_hoi] CHECK CONSTRAINT [FK_phan_hoi_bao_cao1]
GO
ALTER TABLE [dbo].[diem]  WITH CHECK ADD  CONSTRAINT [CK_diem] CHECK  (([diem]>=(0) AND [diem]<=(10)))
GO
ALTER TABLE [dbo].[diem] CHECK CONSTRAINT [CK_diem]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diem', @level2type=N'CONSTRAINT',@level2name=N'CK_diem'
GO
USE [master]
GO
ALTER DATABASE [do an] SET  READ_WRITE 
GO
