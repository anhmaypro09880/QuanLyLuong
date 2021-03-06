USE [master]
GO
/****** Object:  Database [QlyLuong]    Script Date: 12/24/2021 12:15:09 PM ******/
CREATE DATABASE [QlyLuong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QlyLuong', FILENAME = N'E:\Database\QlyLuong.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QlyLuong_log', FILENAME = N'E:\Database\QlyLuong_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QlyLuong] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QlyLuong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QlyLuong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QlyLuong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QlyLuong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QlyLuong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QlyLuong] SET ARITHABORT OFF 
GO
ALTER DATABASE [QlyLuong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QlyLuong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QlyLuong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QlyLuong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QlyLuong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QlyLuong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QlyLuong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QlyLuong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QlyLuong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QlyLuong] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QlyLuong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QlyLuong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QlyLuong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QlyLuong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QlyLuong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QlyLuong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QlyLuong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QlyLuong] SET RECOVERY FULL 
GO
ALTER DATABASE [QlyLuong] SET  MULTI_USER 
GO
ALTER DATABASE [QlyLuong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QlyLuong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QlyLuong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QlyLuong] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QlyLuong] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QlyLuong] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QlyLuong', N'ON'
GO
ALTER DATABASE [QlyLuong] SET QUERY_STORE = OFF
GO
USE [QlyLuong]
GO
/****** Object:  Table [dbo].[CongDoan]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongDoan](
	[maCongDoan] [nvarchar](50) NOT NULL,
	[tenCongDoan] [nvarchar](50) NULL,
	[maSanPham] [nvarchar](50) NOT NULL,
	[donGia] [float] NULL,
 CONSTRAINT [PK_CongDoan] PRIMARY KEY CLUSTERED 
(
	[maCongDoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNV] [nvarchar](50) NOT NULL,
	[tenNV] [nvarchar](50) NOT NULL,
	[ngaySinh] [date] NULL,
	[ngayVaolam] [date] NULL,
	[maPB] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[CMND] [nchar](9) NULL,
	[SDT] [nvarchar](10) NULL,
	[quanLy] [bit] NULL,
	[trangThai] [bit] NULL,
	[gioiTinh] [bit] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[maNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien_CongDoan]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien_CongDoan](
	[maNhanVien] [nvarchar](50) NOT NULL,
	[maCongDoan] [nvarchar](50) NOT NULL,
	[soluong] [nchar](10) NULL,
	[thang] [int] NOT NULL,
	[nam] [int] NOT NULL,
	[tinhTrang] [bit] NULL,
 CONSTRAINT [PK_NV_CD] PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC,
	[maCongDoan] ASC,
	[thang] ASC,
	[nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSP] [nvarchar](50) NOT NULL,
	[tenSP] [nvarchar](50) NULL,
	[moTa] [nvarchar](500) NULL,
	[mau] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuNhapKhac]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuNhapKhac](
	[maThuNhapKhac] [nvarchar](50) NOT NULL,
	[luongLamThem] [float] NULL,
	[phuCap] [float] NULL,
	[thuong] [float] NULL,
	[maNV] [nvarchar](50) NOT NULL,
	[thang] [int] NULL,
	[nam] [int] NULL,
 CONSTRAINT [PK_ThuNhapKhac] PRIMARY KEY CLUSTERED 
(
	[maThuNhapKhac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LuongCN]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[LuongCN] as
select NhanVien.maNV,maThuNhapKhac,tenNV,tenSP,tenCongDoan,soluong,CongDoan.donGia,ThuNhapKhac= phuCap+thuong+luongLamThem,NhanVien_CongDoan.thang,NhanVien_CongDoan.nam,Tongluong=soluong*CongDoan.donGia+luongLamThem+phuCap+thuong ,tinhTrang from [NhanVien] join NhanVien_CongDoan 
on NhanVien.maNV=NhanVien_CongDoan.maNhanVien join ThuNhapKhac 
on NhanVien.maNV=ThuNhapKhac.maNV and NhanVien_CongDoan.thang=ThuNhapKhac.thang join CongDoan on CongDoan.maCongDoan= NhanVien_CongDoan.maCongDoan join SanPham
on SanPham.maSP=CongDoan.maSanPham
GO
/****** Object:  Table [dbo].[ChamCongNVHC]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCongNVHC](
	[maChamCong] [nvarchar](50) NOT NULL,
	[maNV] [nvarchar](50) NOT NULL,
	[thang] [int] NULL,
	[nam] [int] NULL,
	[heSoluong] [money] NULL,
	[soCongngayle] [int] NULL,
	[soCongngaythuong] [int] NULL,
	[nghiKhongphep] [int] NULL,
	[tinhTrang] [bit] NULL,
 CONSTRAINT [PK_ChamCongNVHC] PRIMARY KEY CLUSTERED 
(
	[maChamCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LuongNV]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[LuongNV] as
select NhanVien.maNV,NhanVien.tenNV,ChamCongNVHC.heSoluong,ChamCongNVHC.soCongngaythuong,ChamCongNVHC.soCongngayle,ChamCongNVHC.nghiKhongphep,SoCongChuan=soCongngayle*2+soCongngaythuong-nghiKhongphep,Thunhapkhac = luongLamThem+phuCap+thuong ,ThuNhapKhac.thang,ThuNhapKhac.nam, Tongluong = heSoluong*(soCongngayle*2+soCongngaythuong-nghiKhongphep)+(luongLamThem+phuCap+thuong),tinhTrang from [dbo].[ChamCongNVHC] join [dbo].[ThuNhapKhac] 
on [dbo].[ChamCongNVHC].maNV = [dbo].[ThuNhapKhac].maNV and [dbo].[ChamCongNVHC].thang=ThuNhapKhac.thang and [dbo].[ChamCongNVHC].nam=ThuNhapKhac.nam
join [dbo].[NhanVien] on [dbo].[ChamCongNVHC].maNV=[dbo].[NhanVien].maNV
GO
/****** Object:  View [dbo].[LuongCN1]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[LuongCN1] as
select maNV,maThuNhapKhac,tenNV,tenSP,tenCongDoan,soluong,donGia,ThuNhapKhac,thang,nam,Tongluong,tinhTrang from LuongCN
group by maNV,maThuNhapKhac,tenNV,tenSP,tenCongDoan,soluong,donGia,ThuNhapKhac,thang,nam,Tongluong,tinhTrang 
GO
/****** Object:  View [dbo].[LuongNV1]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[LuongNV1] as
select maNV,tenNV,heSoluong,soCongngaythuong,soCongngayle,nghiKhongphep,SoCongChuan,Thunhapkhac,thang,nam,Tongluong,tinhTrang from LuongNV
group by maNV,tenNV,heSoluong,soCongngaythuong,soCongngayle,nghiKhongphep,SoCongChuan,Thunhapkhac,thang,nam,Tongluong,tinhTrang
GO
/****** Object:  View [dbo].[LuongNhanVien]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[LuongNhanVien] as
select NhanVien.maNV,NhanVien.tenNV,ChamCongNVHC.heSoluong,ChamCongNVHC.soCongngaythuong,ChamCongNVHC.soCongngayle,ChamCongNVHC.nghiKhongphep,SoCongChuan=soCongngayle*2+soCongngaythuong-nghiKhongphep,luongLamThem,thuong,phuCap,Thunhapkhac = luongLamThem+phuCap+thuong ,ThuNhapKhac.thang,ThuNhapKhac.nam, Tongluong = heSoluong*(soCongngayle*2+soCongngaythuong-nghiKhongphep)+(luongLamThem+phuCap+thuong),tinhTrang from [dbo].[ChamCongNVHC] join [dbo].[ThuNhapKhac] 
on [dbo].[ChamCongNVHC].maNV = [dbo].[ThuNhapKhac].maNV and [dbo].[ChamCongNVHC].thang=ThuNhapKhac.thang and [dbo].[ChamCongNVHC].nam=ThuNhapKhac.nam
join [dbo].[NhanVien] on [dbo].[ChamCongNVHC].maNV=[dbo].[NhanVien].maNV
GO
/****** Object:  View [dbo].[LuongCongNhan]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[LuongCongNhan] as
select NhanVien.maNV,maThuNhapKhac,tenNV,tenSP,tenCongDoan,soluong,CongDoan.donGia,phuCap,thuong,luongLamThem,ThuNhapKhac= phuCap+thuong+luongLamThem,NhanVien_CongDoan.thang,NhanVien_CongDoan.nam,Tongluong=soluong*CongDoan.donGia+luongLamThem+phuCap+thuong ,tinhTrang from [NhanVien] join NhanVien_CongDoan 
on NhanVien.maNV=NhanVien_CongDoan.maNhanVien join ThuNhapKhac 
on NhanVien.maNV=ThuNhapKhac.maNV and NhanVien_CongDoan.thang=ThuNhapKhac.thang join CongDoan on CongDoan.maCongDoan= NhanVien_CongDoan.maCongDoan join SanPham
on SanPham.maSP=CongDoan.maSanPham
GO
/****** Object:  Table [dbo].[BangLuong]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangLuong](
	[maBangluong] [nvarchar](50) NOT NULL,
	[maNV] [nvarchar](50) NOT NULL,
	[luong] [money] NULL,
	[thang] [int] NULL,
	[nam] [int] NULL,
 CONSTRAINT [PK_BangLuong] PRIMARY KEY CLUSTERED 
(
	[maBangluong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LuongTK]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[LuongTK]
as
select DISTINCT maBangluong, n.maNV, n.tenNV, l.thang, l.nam, luongLamThem, phuCap, thuong, l.luong 
from [dbo].[BangLuong] l join [dbo].[NhanVien] n on l.maNV = n.maNV
							join [dbo].[ThuNhapKhac] k on k.maNV = n.maNV
where l.thang = k.thang and l.nam=k.nam
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[maPhongBan] [nvarchar](50) NOT NULL,
	[tenPhongBan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[maPhongBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/24/2021 12:15:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00001', N'NV000002', 5050000.0000, 11, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00002', N'LD000001', 3700000.0000, 1, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00003', N'LD000010', 6616000.0000, 1, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00004', N'LD000011', 6260000.0000, 1, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00005', N'LD000001', 4800000.0000, 2, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00006', N'LD000001', 5700000.0000, 3, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00007', N'LD000001', 5580000.0000, 4, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00008', N'LD000002', 9000000.0000, 4, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00009', N'LD000010', 6880000.0000, 4, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00010', N'LD000001', 5400000.0000, 5, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00011', N'LD000011', 5620000.0000, 5, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00012', N'LD000001', 6600000.0000, 6, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00013', N'LD000002', 6800000.0000, 6, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00014', N'LD000003', 7100000.0000, 6, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00015', N'LD000007', 34393800.0000, 6, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00016', N'LD000008', 4624500.0000, 6, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00017', N'LD000006', 6196000.0000, 7, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00018', N'LD000005', 4856000.0000, 7, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00019', N'LD000009', 5400000.0000, 7, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00020', N'LD000010', 7890000.0000, 7, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00021', N'LD000002', 5700000.0000, 8, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00022', N'LD000004', 43270000.0000, 8, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00023', N'LD000011', 5780000.0000, 8, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00024', N'LD000003', 6858000.0000, 9, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00025', N'LD000008', 6345000.0000, 9, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00026', N'LD000009', 8000000.0000, 9, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00027', N'LD000010', 6438000.0000, 9, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00028', N'LD000003', 8560000.0000, 10, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00029', N'LD000004', 49180000.0000, 10, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00030', N'LD000006', 6680000.0000, 10, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00031', N'LD000007', 35738000.0000, 10, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00032', N'LD000008', 6345000.0000, 10, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00033', N'LD000009', 6250000.0000, 10, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00034', N'NV000008', 8620000.0000, 1, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00035', N'NV000004', 9200000.0000, 2, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00036', N'NV000007', 9200000.0000, 5, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00037', N'NV000006', 9500000.0000, 5, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00038', N'NV000005', 9200000.0000, 5, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00039', N'NV000004', 9200000.0000, 5, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00040', N'NV000003', 8330000.0000, 5, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00041', N'NV000007', 8620000.0000, 6, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00042', N'NV000008', 8620000.0000, 6, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00043', N'NV000005', 9500000.0000, 7, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00044', N'NV000006', 9500000.0000, 8, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00045', N'NV000002', 8570000.0000, 7, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00046', N'NV000001', 6700000.0000, 9, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00047', N'NV000008', 9200000.0000, 9, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00048', N'NV000001', 6950000.0000, 10, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00049', N'NV000003', 8770000.0000, 9, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00050', N'NV000006', 9500000.0000, 10, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00051', N'NV000007', 8620000.0000, 10, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00052', N'NV000008', 8620000.0000, 11, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00053', N'NV000009', 8980000.0000, 11, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00054', N'LD000004', 11200000.0000, 11, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00055', N'LD000004', 10000000.0000, 12, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00056', N'LD000001', 5000000.0000, 12, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00057', N'LD000002', 6900000.0000, 12, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00058', N'LD000003', 5000000.0000, 12, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00059', N'LD000004', 6900000.0000, 12, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00060', N'LD000005', 8700000.0000, 12, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00061', N'LD000006', 6900000.0000, 11, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00062', N'LD000007', 37571000.0000, 11, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00063', N'LD000008', 4624500.0000, 11, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00064', N'LD000009', 6930000.0000, 11, 2021)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00065', N'NV000002', 9300000.0000, 1, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00066', N'NV000002', 9300000.0000, 3, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00067', N'NV000002', 9300000.0000, 5, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00068', N'NV000002', 9300000.0000, 7, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00069', N'NV000002', 9300000.0000, 8, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00070', N'NV000002', 9300000.0000, 12, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00071', N'LD000003', 2300000.0000, 12, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00072', N'LD000003', 2300000.0000, 8, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00073', N'LD000003', 2300000.0000, 5, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00074', N'LD000003', 2300000.0000, 4, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00075', N'LD000003', 2300000.0000, 3, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00076', N'LD000002', 2300000.0000, 2, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00077', N'LD000003', 2200000.0000, 12, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00078', N'LD000001', 2200000.0000, 1, 2020)
INSERT [dbo].[BangLuong] ([maBangluong], [maNV], [luong], [thang], [nam]) VALUES (N'BL00079', N'NV000001', 7200000.0000, 11, 2021)
GO
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00001', N'NV000002', 11, 2021, 250000.0000, 2, 27, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00002', N'NV000001', 11, 2021, 250000.0000, 0, 28, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00003', N'NV000001', 9, 2021, 250000.0000, 0, 27, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00004', N'NV000001', 10, 2021, 250000.0000, 0, 28, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00005', N'NV000002', 7, 2021, 270000.0000, 1, 29, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00006', N'NV000003', 11, 2021, 270000.0000, 1, 29, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00007', N'NV000003', 9, 2021, 270000.0000, 1, 29, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00008', N'NV000003', 5, 2021, 270000.0000, 1, 29, 2, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00009', N'NV000004', 5, 2021, 300000.0000, 1, 29, 2, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00010', N'NV000004', 11, 2021, 300000.0000, 1, 29, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00011', N'NV000004', 2, 2021, 300000.0000, 1, 28, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00012', N'NV000005', 5, 2021, 300000.0000, 1, 28, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00013', N'NV000005', 11, 2021, 300000.0000, 1, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00014', N'NV000005', 10, 2021, 300000.0000, 2, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00015', N'NV000005', 7, 2021, 300000.0000, 2, 28, 2, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00016', N'NV000006', 10, 2021, 300000.0000, 2, 28, 2, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00017', N'NV000006', 11, 2021, 300000.0000, 2, 26, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00018', N'NV000006', 8, 2021, 300000.0000, 2, 26, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00019', N'NV000006', 5, 2021, 300000.0000, 2, 26, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00020', N'NV000007', 5, 2021, 290000.0000, 1, 28, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00021', N'NV000007', 10, 2021, 290000.0000, 0, 28, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00022', N'NV000007', 6, 2021, 290000.0000, 0, 28, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00023', N'NV000008', 1, 2021, 290000.0000, 0, 28, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00024', N'NV000008', 6, 2021, 290000.0000, 0, 28, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00025', N'NV000008', 11, 2021, 290000.0000, 0, 28, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00026', N'NV000008', 9, 2021, 290000.0000, 0, 30, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00027', N'NV000007', 11, 2021, 280000.0000, 0, 29, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00028', N'NV000009', 11, 2021, 280000.0000, 1, 29, 0, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00029', N'NV000010', 11, 2021, 280000.0000, 1, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00030', N'NV000002', 1, 2020, 300000.0000, 2, 27, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00031', N'NV000002', 3, 2020, 300000.0000, 2, 27, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00032', N'NV000002', 5, 2020, 300000.0000, 2, 27, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00033', N'NV000002', 7, 2020, 300000.0000, 2, 27, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00034', N'NV000002', 8, 2020, 300000.0000, 2, 27, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00035', N'NV000002', 12, 2020, 300000.0000, 2, 27, 1, 1)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00036', N'NV000001', 1, 2021, 300000.0000, 2, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00037', N'NV000002', 1, 2021, 290000.0000, 2, 26, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00038', N'NV000003', 1, 2021, 320000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00039', N'NV000004', 1, 2021, 310000.0000, 2, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00040', N'NV000005', 1, 2021, 330000.0000, 1, 29, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00041', N'NV000006', 1, 2021, 340000.0000, 1, 29, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00042', N'NV000007', 1, 2021, 320000.0000, 1, 27, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00043', N'NV000009', 1, 2021, 300000.0000, 0, 28, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00044', N'NV000010', 1, 2021, 350000.0000, 0, 29, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00045', N'NV000011', 1, 2021, 350000.0000, 3, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00046', N'NV000012', 1, 2021, 320000.0000, 1, 26, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00047', N'NV000013', 1, 2021, 350000.0000, 0, 28, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00048', N'NV000013', 2, 2021, 350000.0000, 0, 28, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00049', N'NV000001', 2, 2021, 300000.0000, 0, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00050', N'NV000003', 2, 2021, 280000.0000, 1, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00051', N'NV000002', 2, 2021, 320000.0000, 1, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00052', N'NV000005', 2, 2021, 310000.0000, 1, 27, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00053', N'NV000006', 2, 2021, 290.0000, 0, 28, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00054', N'NV000007', 2, 2021, 320000.0000, 2, 28, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00055', N'NV000008', 2, 2021, 310000.0000, 1, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00056', N'NV000009', 2, 2021, 340000.0000, 0, 26, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00057', N'NV000010', 2, 2021, 350000.0000, 0, 29, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00058', N'NV000011', 2, 2021, 300000.0000, 0, 27, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00059', N'NV000012', 2, 2021, 290000.0000, 3, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00060', N'NV000012', 3, 2021, 290000.0000, 3, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00061', N'NV000013', 3, 2021, 300000.0000, 1, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00062', N'NV000011', 3, 2021, 310000.0000, 1, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00063', N'NV000010', 3, 2021, 280000.0000, 2, 27, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00064', N'NV000009', 3, 2021, 290000.0000, 0, 26, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00065', N'NV000008', 3, 2021, 300000.0000, 0, 28, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00066', N'NV000007', 3, 2021, 320000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00067', N'NV000006', 3, 2021, 330000.0000, 2, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00068', N'NV000005', 3, 2021, 350000.0000, 0, 27, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00069', N'NV000004', 3, 2021, 300000.0000, 3, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00070', N'NV000003', 3, 2021, 320000.0000, 1, 29, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00071', N'NV000002', 3, 2021, 330000.0000, 2, 26, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00072', N'NV000001', 3, 2021, 360000.0000, 2, 29, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00073', N'NV000001', 4, 2021, 360000.0000, 2, 29, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00074', N'NV000002', 4, 2021, 280000.0000, 0, 29, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00075', N'NV000003', 4, 2021, 290000.0000, 0, 29, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00076', N'NV000004', 4, 2021, 300000.0000, 1, 27, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00077', N'NV000005', 4, 2021, 310000.0000, 2, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00078', N'NV000006', 4, 2021, 320000.0000, 1, 29, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00079', N'NV000007', 4, 2021, 330000.0000, 0, 29, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00080', N'NV000008', 4, 2021, 340000.0000, 3, 29, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00081', N'NV000009', 4, 2021, 350000.0000, 1, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00082', N'NV000010', 4, 2021, 300000.0000, 1, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00083', N'NV000011', 4, 2021, 310000.0000, 1, 27, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00084', N'NV000012', 4, 2021, 320000.0000, 2, 29, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00085', N'NV000013', 4, 2021, 340000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00086', N'NV000013', 5, 2021, 340000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00087', N'NV000012', 5, 2021, 350000.0000, 1, 30, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00088', N'NV000011', 5, 2021, 330000.0000, 0, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00089', N'NV000010', 5, 2021, 320000.0000, 0, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00090', N'NV000009', 5, 2021, 310000.0000, 2, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00091', N'NV000008', 5, 2021, 300000.0000, 2, 26, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00092', N'NV000002', 5, 2021, 300000.0000, 2, 26, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00093', N'NV000001', 5, 2021, 280000.0000, 3, 26, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00094', N'NV000001', 6, 2021, 280000.0000, 3, 26, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00095', N'NV000002', 6, 2021, 290000.0000, 1, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00096', N'NV000003', 6, 2021, 300000.0000, 0, 29, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00097', N'NV000004', 6, 2021, 310000.0000, 0, 27, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00098', N'NV000005', 6, 2021, 320000.0000, 3, 26, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00099', N'NV000006', 6, 2021, 330000.0000, 1, 28, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00100', N'NV000009', 6, 2021, 340000.0000, 3, 29, 0, 0)
GO
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00101', N'NV000010', 6, 2021, 350000.0000, 0, 28, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00102', N'NV000011', 6, 2021, 290000.0000, 1, 29, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00103', N'NV000012', 6, 2021, 280000.0000, 2, 25, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00104', N'NV000013', 6, 2021, 320000.0000, 0, 25, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00105', N'NV000013', 7, 2021, 320000.0000, 0, 25, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00106', N'NV000012', 7, 2021, 350000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00107', N'NV000011', 7, 2021, 340000.0000, 1, 27, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00108', N'NV000010', 7, 2021, 330000.0000, 1, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00109', N'NV000009', 7, 2021, 320000.0000, 0, 27, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00110', N'NV000008', 7, 2021, 310000.0000, 2, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00111', N'NV000007', 7, 2021, 300000.0000, 2, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00112', N'NV000006', 7, 2021, 280000.0000, 2, 26, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00113', N'NV000004', 7, 2021, 290000.0000, 3, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00114', N'NV000003', 7, 2021, 320000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00115', N'NV000001', 7, 2021, 340000.0000, 1, 26, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00116', N'NV000001', 8, 2021, 340000.0000, 1, 26, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00117', N'NV000002', 8, 2021, 350000.0000, 0, 26, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00118', N'NV000003', 8, 2021, 330000.0000, 2, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00119', N'NV000004', 8, 2021, 320000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00120', N'NV000005', 8, 2021, 310000.0000, 3, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00121', N'NV000007', 8, 2021, 300000.0000, 1, 29, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00122', N'NV000008', 8, 2021, 290000.0000, 0, 28, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00123', N'NV000009', 8, 2021, 280000.0000, 2, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00124', N'NV000010', 8, 2021, 280000.0000, 2, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00125', N'NV000011', 8, 2021, 300000.0000, 1, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00126', N'NV000012', 8, 2021, 320000.0000, 0, 28, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00127', N'NV000013', 8, 2021, 330000.0000, 0, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00128', N'NV000013', 9, 2021, 330000.0000, 0, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00129', N'NV000012', 9, 2021, 350000.0000, 2, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00130', N'NV000011', 9, 2021, 330000.0000, 0, 27, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00131', N'NV000010', 9, 2021, 320000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00132', N'NV000009', 9, 2021, 310000.0000, 0, 27, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00133', N'NV000007', 9, 2021, 300000.0000, 3, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00134', N'NV000006', 9, 2021, 280000.0000, 2, 29, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00135', N'NV000005', 9, 2021, 290000.0000, 1, 29, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00136', N'NV000004', 9, 2021, 350000.0000, 2, 30, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00137', N'NV000002', 9, 2021, 330000.0000, 1, 26, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00138', N'NV000002', 10, 2021, 350000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00139', N'NV000003', 10, 2021, 340000.0000, 0, 30, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00140', N'NV000004', 10, 2021, 340000.0000, 3, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00141', N'NV000008', 10, 2021, 330000.0000, 1, 26, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00142', N'NV000009', 10, 2021, 320000.0000, 2, 29, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00143', N'NV000010', 10, 2021, 310000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00144', N'NV000011', 10, 2021, 300000.0000, 3, 26, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00145', N'NV000012', 10, 2021, 280000.0000, 1, 29, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00146', N'NV000013', 10, 2021, 290000.0000, 2, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00147', N'NV000011', 11, 2021, 350000.0000, 0, 27, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00148', N'NV000012', 11, 2021, 320000.0000, 3, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00149', N'NV000013', 11, 2021, 300000.0000, 2, 30, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00150', N'NV000013', 12, 2021, 300000.0000, 2, 30, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00151', N'NV000012', 12, 2021, 280000.0000, 0, 30, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00152', N'NV000011', 12, 2021, 290000.0000, 3, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00153', N'NV000010', 12, 2021, 300000.0000, 0, 27, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00154', N'NV000009', 12, 2021, 310000.0000, 2, 26, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00155', N'NV000008', 12, 2021, 310000.0000, 1, 29, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00156', N'NV000007', 12, 2021, 300000.0000, 2, 27, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00157', N'NV000006', 12, 2021, 320000.0000, 0, 27, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00158', N'NV000005', 12, 2021, 330000.0000, 1, 27, 3, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00159', N'NV000004', 12, 2021, 340000.0000, 3, 30, 1, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00160', N'NV000003', 12, 2021, 300000.0000, 3, 26, 2, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00161', N'NV000002', 12, 2021, 320000.0000, 1, 28, 0, 0)
INSERT [dbo].[ChamCongNVHC] ([maChamCong], [maNV], [thang], [nam], [heSoluong], [soCongngayle], [soCongngaythuong], [nghiKhongphep], [tinhTrang]) VALUES (N'CC00162', N'NV000001', 12, 2021, 340000.0000, 0, 29, 1, 0)
GO
INSERT [dbo].[CongDoan] ([maCongDoan], [tenCongDoan], [maSanPham], [donGia]) VALUES (N'CD001', N'Thiết kế', N'SP001', 16000)
INSERT [dbo].[CongDoan] ([maCongDoan], [tenCongDoan], [maSanPham], [donGia]) VALUES (N'CD002', N'Cắt vải', N'SP001', 15500)
INSERT [dbo].[CongDoan] ([maCongDoan], [tenCongDoan], [maSanPham], [donGia]) VALUES (N'CD003', N'May', N'SP001', 17000)
INSERT [dbo].[CongDoan] ([maCongDoan], [tenCongDoan], [maSanPham], [donGia]) VALUES (N'CD004', N'Nhuộm và dệt', N'SP006', 20000)
INSERT [dbo].[CongDoan] ([maCongDoan], [tenCongDoan], [maSanPham], [donGia]) VALUES (N'CD005', N'Thiết kế', N'SP006', 18000)
INSERT [dbo].[CongDoan] ([maCongDoan], [tenCongDoan], [maSanPham], [donGia]) VALUES (N'CD006', N'May', N'SP006', 22000)
INSERT [dbo].[CongDoan] ([maCongDoan], [tenCongDoan], [maSanPham], [donGia]) VALUES (N'CD007', N'Giặt tẩy', N'SP006', 22000)
INSERT [dbo].[CongDoan] ([maCongDoan], [tenCongDoan], [maSanPham], [donGia]) VALUES (N'CD008', N'Nhuộm', N'SP001', 122200)
GO
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000001', N'Trương Thành Đạt', CAST(N'2001-01-01' AS Date), CAST(N'2019-12-12' AS Date), N'LD', N'LD000001', N'212421131', N'092563215 ', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000002', N'Lê Hồng Phong', CAST(N'1999-12-01' AS Date), CAST(N'2021-11-18' AS Date), N'LD', N'LD000002', N'243268866', N'098738225 ', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000003', N'Nguyễn Thị Cẩm Tú', CAST(N'1998-11-01' AS Date), CAST(N'2021-11-17' AS Date), N'LD', N'LD000003', N'243268233', N'098574255 ', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000004', N'Đinh Đức Thọ', CAST(N'1990-09-12' AS Date), CAST(N'2021-11-19' AS Date), N'LD', N'LD000004', N'234674488', N'023352355', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000005', N'Đinh Văn An', CAST(N'1970-08-07' AS Date), CAST(N'2021-11-19' AS Date), N'LD', N'LD000005', N'234764488', N'023312355', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000006', N'Vũ Khắc Tiệp', CAST(N'1978-08-07' AS Date), CAST(N'2021-11-19' AS Date), N'LD', N'LD000006', N'234775748', N'0233222555', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000007', N'Dương Đại Vũ', CAST(N'1978-04-07' AS Date), CAST(N'2021-11-19' AS Date), N'LD', N'LD000007', N'234785748', N'0933228555', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000008', N'Hoàng Văn Quý', CAST(N'1996-02-01' AS Date), CAST(N'2021-11-18' AS Date), N'LD', N'LD000008', N'243633133', N'034332242', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000009', N'Lê Minh An', CAST(N'1997-02-10' AS Date), CAST(N'2021-11-18' AS Date), N'LD', N'LD000009', N'243223133', N'031113542', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000010', N'Nguyễn Thu Đông', CAST(N'2000-02-10' AS Date), CAST(N'2021-11-18' AS Date), N'LD', N'LD000010', N'245688533', N'0932666242', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000011', N'Đỗ Thị Cẩm Hằng', CAST(N'1989-02-10' AS Date), CAST(N'2021-11-18' AS Date), N'LD', N'LD000011', N'245693233', N'0932686242', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000012', N'Đỗ Thị Cẩm Hằng', CAST(N'1989-02-10' AS Date), CAST(N'2021-12-23' AS Date), N'LD', N'LD000012', N'245693233', N'0932686242', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'LD000013', N'Tô Thị Phở', CAST(N'1989-02-10' AS Date), CAST(N'2021-12-24' AS Date), N'LD', N'LD000013', N'245693256', N'093268655', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000001', N'Bùi Mạnh', CAST(N'2002-12-16' AS Date), CAST(N'2021-11-11' AS Date), N'HC', N'NV000001', N'243633333', N'0334324242', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000002', N'Hoàng Tiến Mạnh Đức', CAST(N'2001-01-12' AS Date), CAST(N'2021-01-01' AS Date), N'HC', N'NV000002', N'234643367', N'034567221', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000003', N'Đào Cao Thắng', CAST(N'2001-05-08' AS Date), CAST(N'2021-05-01' AS Date), N'HC', N'NV000003', N'246547457', N'083456733', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000004', N'Đinh Diệp Vương', CAST(N'2000-05-12' AS Date), CAST(N'2021-02-01' AS Date), N'HC', N'NV000004', N'298387830', N'0123456744', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000005', N'Lê Hoàng Phong', CAST(N'1985-07-01' AS Date), CAST(N'2020-03-01' AS Date), N'HC', N'NV000005', N'289990821', N'092345675', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000006', N'Đinh Đức Đồng', CAST(N'1990-09-12' AS Date), CAST(N'2021-11-19' AS Date), N'LD', N'NV000006', N'234674488', N'0923352355', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000007', N'Nguyễn Thị Yến', CAST(N'1996-09-12' AS Date), CAST(N'2021-11-20' AS Date), N'HC', N'NV000007', N'234593837', N'095837393', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000008', N'Nguyễn Như', CAST(N'1997-09-12' AS Date), CAST(N'2021-11-22' AS Date), N'HC', N'NV000008', N'234575437', N'0958545393', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000009', N'Bùi Thị Cẩm Hằng', CAST(N'1989-09-12' AS Date), CAST(N'2021-11-18' AS Date), N'HC', N'NV000009', N'238799943', N'0958534553', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000010', N'Lê Mĩ Oanh', CAST(N'1998-09-11' AS Date), CAST(N'2021-11-18' AS Date), N'HC', N'NV000010', N'238747543', N'095853433', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000011', N'Tường Vi', CAST(N'1997-02-10' AS Date), CAST(N'2021-11-19' AS Date), N'HC', N'NV000011', N'245622633', N'093260242', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000012', N'Nguyễn Thị Thu Thủy', CAST(N'1989-12-01' AS Date), CAST(N'2021-11-18' AS Date), N'HC', N'NV000012', N'248990800', N'0380594068', 0, 1, 0)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000013', N'Võ Minh Phong', CAST(N'1995-10-01' AS Date), CAST(N'2021-11-18' AS Date), N'HC', N'NV000013', N'248600486', N'0125166845', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000014', N'Phạm Hải Minh', CAST(N'1999-10-11' AS Date), CAST(N'2021-11-18' AS Date), N'HC', N'NV000014', N'248253375', N'0213537357', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000015', N'Thắng', CAST(N'2001-08-05' AS Date), CAST(N'2021-11-19' AS Date), N'HC', N'NV000015', N'875543235', N'123234567 ', 0, 0, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000016', N'Đào Minh Quang', CAST(N'2000-01-01' AS Date), CAST(N'2021-12-22' AS Date), N'HC', N'NV000016', N'241908303', N'0944079865', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000017', N'Đào Minh Quang', CAST(N'2000-01-01' AS Date), CAST(N'2021-12-22' AS Date), N'HC', N'NV000017', N'241908303', N'0944079899', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000018', N'Thắng', CAST(N'2000-01-01' AS Date), CAST(N'2021-12-23' AS Date), N'HC', N'NV000018', N'241908303', N'0123557890', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000019', N'Thắng', CAST(N'2000-01-01' AS Date), CAST(N'2021-12-23' AS Date), N'HC', N'NV000019', N'241908303', N'0123559000', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000020', N'Đào Minh Quang', CAST(N'2000-01-01' AS Date), CAST(N'2021-12-22' AS Date), N'HC', N'NV000020', N'241908303', N'0944079891', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000021', N'Đào Minh Quang', CAST(N'2000-01-01' AS Date), CAST(N'2021-12-22' AS Date), N'HC', N'NV000021', N'241908303', N'0944079890', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'NV000022', N'Đào Minh Quang', CAST(N'2000-01-01' AS Date), CAST(N'2021-12-22' AS Date), N'HC', N'NV000022', N'241908303', N'0944079811', 0, 1, 1)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [ngaySinh], [ngayVaolam], [maPB], [userName], [CMND], [SDT], [quanLy], [trangThai], [gioiTinh]) VALUES (N'QL000001', N'Đào Cao Thắng', CAST(N'2001-05-08' AS Date), CAST(N'2021-01-01' AS Date), N'HC', N'QL000001', N'112211145', N'092352560', 1, 1, 1)
GO
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD001', N'200       ', 1, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD001', N'300       ', 2, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD001', N'350       ', 3, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD001', N'330       ', 4, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD001', N'325       ', 5, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD001', N'400       ', 6, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD001', N'240       ', 7, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD001', N'150       ', 8, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD001', N'250       ', 9, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD003', N'100       ', 1, 2020, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD003', N'300       ', 10, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD005', N'300       ', 11, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000001', N'CD005', N'250       ', 12, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD002', N'300       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD002', N'150       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD002', N'200       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD002', N'150       ', 7, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD002', N'260       ', 9, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD002', N'300       ', 10, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD003', N'100       ', 2, 2020, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD004', N'265       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD005', N'350       ', 11, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD005', N'350       ', 12, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD006', N'400       ', 4, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD006', N'300       ', 6, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000002', N'CD006', N'250       ', 8, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD001', N'200       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD002', N'240       ', 8, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD003', N'100       ', 3, 2020, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD003', N'200       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD003', N'100       ', 4, 2020, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD003', N'100       ', 5, 2020, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD003', N'250       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD003', N'200       ', 7, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD003', N'100       ', 8, 2020, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD003', N'100       ', 12, 2020, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD005', N'200       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD005', N'330       ', 11, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD005', N'250       ', 12, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD006', N'300       ', 6, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD006', N'289       ', 9, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD006', N'380       ', 10, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000003', N'CD008', N'290       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD001', N'250       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD002', N'250       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD002', N'150       ', 6, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD003', N'280       ', 9, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD005', N'350       ', 12, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD006', N'250       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD006', N'500       ', 11, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD008', N'250       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD008', N'350       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD008', N'250       ', 7, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD008', N'350       ', 8, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000004', N'CD008', N'400       ', 10, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD001', N'310       ', 10, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD003', N'280       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD003', N'200       ', 6, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD003', N'268       ', 7, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD003', N'280       ', 8, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD004', N'300       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD004', N'280       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD005', N'300       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD005', N'450       ', 12, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD006', N'315       ', 11, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD007', N'280       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000005', N'CD008', N'300       ', 9, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD001', N'300       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD001', N'320       ', 12, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD004', N'320       ', 9, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD005', N'260       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD005', N'220       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD006', N'260       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD007', N'268       ', 7, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD007', N'290       ', 10, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD007', N'300       ', 11, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD008', N'280       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD008', N'250       ', 6, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000006', N'CD008', N'320       ', 8, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD001', N'250       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD002', N'250       ', 12, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD004', N'320       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD004', N'220       ', 7, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD004', N'310       ', 8, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD005', N'350       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD005', N'290       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD005', N'290       ', 9, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD006', N'180       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD008', N'279       ', 6, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD008', N'290       ', 10, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000007', N'CD008', N'305       ', 11, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD002', N'230       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD002', N'279       ', 6, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD002', N'390       ', 9, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD002', N'390       ', 10, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD002', N'279       ', 11, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD002', N'280       ', 12, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD005', N'310       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD005', N'350       ', 7, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD005', N'320       ', 8, 2021, 0)
GO
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD006', N'270       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD006', N'220       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000008', N'CD006', N'240       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD003', N'350       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD003', N'300       ', 7, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD003', N'350       ', 10, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD003', N'390       ', 11, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD003', N'290       ', 12, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD004', N'310       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD004', N'350       ', 6, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD006', N'260       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD006', N'270       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD006', N'290       ', 8, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD006', N'350       ', 9, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000009', N'CD007', N'160       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD001', N'260       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD005', N'320       ', 6, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD006', N'278       ', 1, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD006', N'290       ', 4, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD006', N'345       ', 7, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD006', N'279       ', 9, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD006', N'330       ', 10, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD006', N'350       ', 11, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD007', N'270       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD007', N'330       ', 8, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD008', N'310       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000010', N'CD008', N'340       ', 12, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD001', N'360       ', 1, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD001', N'320       ', 5, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD001', N'330       ', 8, 2021, 1)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD001', N'300       ', 11, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD002', N'200       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD003', N'350       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD004', N'290       ', 10, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD006', N'280       ', 6, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD006', N'320       ', 7, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD006', N'260       ', 9, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD006', N'260       ', 12, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000011', N'CD007', N'240       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD003', N'275       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD003', N'280       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD003', N'340       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD003', N'310       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD003', N'340       ', 8, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD003', N'340       ', 9, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD005', N'320       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD005', N'320       ', 11, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD006', N'260       ', 12, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD007', N'260       ', 6, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD007', N'290       ', 7, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000012', N'CD008', N'280       ', 10, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD001', N'280       ', 4, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD002', N'240       ', 6, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD003', N'265       ', 1, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD003', N'260       ', 7, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD003', N'260       ', 8, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD005', N'320       ', 5, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD006', N'300       ', 2, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD006', N'260       ', 9, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD006', N'260       ', 10, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD006', N'340       ', 11, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD007', N'290       ', 3, 2021, 0)
INSERT [dbo].[NhanVien_CongDoan] ([maNhanVien], [maCongDoan], [soluong], [thang], [nam], [tinhTrang]) VALUES (N'LD000013', N'CD007', N'260       ', 12, 2021, 0)
GO
INSERT [dbo].[PhongBan] ([maPhongBan], [tenPhongBan]) VALUES (N'HC', N'Phòng hành chính')
INSERT [dbo].[PhongBan] ([maPhongBan], [tenPhongBan]) VALUES (N'LD', N'Phòng lao động')
GO
INSERT [dbo].[SanPham] ([maSP], [tenSP], [moTa], [mau]) VALUES (N'SP001', N'Áo Kaki', N'Áo Kaki trắng tay ngắn', N'Trắng')
INSERT [dbo].[SanPham] ([maSP], [tenSP], [moTa], [mau]) VALUES (N'SP006', N'Quần Jean', N'Quần Jeam xám dài', N'Xám')
GO
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000001', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000002', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000003', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000004', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000005', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000006', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000007', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000008', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000009', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000010', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000011', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000012', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'LD000013', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000001', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000002', N'123456')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000003', N'123456')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000004', N'123456')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000005', N'123456')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000006', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000007', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000008', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000009', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000010', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000011', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000012', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000013', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000014', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000015', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000016', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000017', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000018', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000019', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000020', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000021', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'NV000022', N'1')
INSERT [dbo].[TaiKhoan] ([userName], [password]) VALUES (N'QL000001', N'123456')
GO
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00001', 200000, 200000, 100000, N'LD000001', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00002', 0, 0, 0, N'LD000001', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00003', 100000, 0, 0, N'LD000001', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00004', 100000, 200000, 0, N'LD000001', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00005', 0, 200000, 0, N'LD000001', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00006', 0, 200000, 0, N'LD000001', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00007', 0, 200000, 0, N'LD000002', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00008', 0, 200000, 0, N'LD000002', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00009', 0, 200000, 0, N'LD000002', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00010', 0, 200000, 0, N'LD000003', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00011', 0, 200000, 300000, N'LD000003', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00012', 0, 200000, 300000, N'LD000003', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00013', 300000, 0, 0, N'LD000004', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00014', 300000, 200000, 0, N'LD000004', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00015', 200000, 0, 0, N'LD000004', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00016', 0, 300000, 0, N'LD000005', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00017', 0, 300000, 0, N'LD000006', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00018', 0, 300000, 0, N'LD000006', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00019', 0, 300000, 0, N'LD000006', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00020', 0, 300000, 0, N'LD000007', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00021', 0, 300000, 0, N'LD000007', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00022', 0, 300000, 0, N'LD000007', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00023', 0, 300000, 0, N'LD000008', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00024', 0, 300000, 0, N'LD000008', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00025', 0, 300000, 0, N'LD000008', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00026', 0, 300000, 0, N'LD000008', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00027', 0, 300000, 0, N'LD000009', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00028', 0, 300000, 0, N'LD000009', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00029', 0, 300000, 0, N'LD000009', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00030', 0, 300000, 0, N'LD000009', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00031', 0, 300000, 0, N'LD000010', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00032', 0, 300000, 0, N'LD000010', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00033', 0, 300000, 0, N'LD000010', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00034', 0, 300000, 200000, N'LD000010', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00035', 0, 300000, 200000, N'LD000010', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00036', 0, 300000, 200000, N'LD000011', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00037', 0, 300000, 200000, N'LD000011', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00038', 0, 300000, 200000, N'LD000011', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00039', 200000, 300000, 200000, N'LD000011', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00040', 0, 0, 200000, N'NV000002', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00041', 0, 200000, 0, N'NV000001', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00042', 0, 200000, 0, N'NV000001', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00043', 0, 200000, 0, N'NV000001', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00044', 0, 200000, 0, N'NV000002', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00045', 200000, 200000, 0, N'NV000003', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00046', 200000, 200000, 0, N'NV000003', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00047', 200000, 300000, 0, N'NV000003', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00048', 200000, 300000, 0, N'NV000004', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00049', 200000, 300000, 0, N'NV000004', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00050', 200000, 300000, 0, N'NV000004', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00051', 200000, 300000, 0, N'NV000005', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00052', 200000, 300000, 0, N'NV000005', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00053', 200000, 300000, 0, N'NV000005', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00054', 200000, 300000, 0, N'NV000005', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00055', 200000, 300000, 0, N'NV000006', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00056', 200000, 300000, 0, N'NV000006', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00057', 200000, 300000, 0, N'NV000006', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00058', 200000, 300000, 0, N'NV000006', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00059', 200000, 300000, 0, N'NV000007', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00060', 200000, 300000, 0, N'NV000007', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00061', 200000, 300000, 0, N'NV000007', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00062', 200000, 300000, 0, N'NV000008', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00063', 200000, 300000, 0, N'NV000008', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00064', 200000, 300000, 0, N'NV000008', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00065', 200000, 300000, 0, N'NV000008', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00066', 0, 300000, 0, N'NV000007', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00067', 0, 300000, 0, N'NV000009', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00068', 0, 200000, 0, N'NV000010', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00069', 0, 500000, 0, N'LD000001', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00070', 0, 500000, 0, N'LD000002', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00071', 0, 400000, 0, N'LD000003', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00072', 0, 250000, 0, N'LD000005', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00073', 200000, 200000, 100000, N'LD000001', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00074', 100000, 200000, 300000, N'LD000002', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00075', 200000, 200000, 100000, N'LD000003', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00076', 100000, 200000, 300000, N'LD000004', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00077', 100000, 200000, 300000, N'LD000005', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00078', 100000, 200000, 300000, N'LD000002', 2, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00079', 100000, 200000, 300000, N'LD000003', 3, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00080', 100000, 200000, 300000, N'LD000003', 4, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00081', 100000, 200000, 300000, N'LD000003', 5, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00082', 100000, 200000, 300000, N'LD000003', 8, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00083', 100000, 200000, 300000, N'LD000003', 12, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00084', 200000, 100000, 0, N'NV000002', 1, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00085', 200000, 100000, 0, N'NV000002', 3, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00086', 200000, 100000, 0, N'NV000002', 5, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00087', 200000, 100000, 0, N'NV000002', 7, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00088', 200000, 100000, 0, N'NV000002', 8, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00089', 200000, 100000, 0, N'NV000002', 12, 2020)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00090', 300000, 300000, 300000, N'LD000002', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00091', 300000, 300000, 300000, N'LD000003', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00092', 300000, 300000, 300000, N'LD000004', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00093', 250000, 300000, 300000, N'LD000005', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00094', 200000, 300000, 300000, N'LD000006', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00095', 200000, 300000, 300000, N'LD000007', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00096', 100000, 300000, 300000, N'LD000009', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00097', 100000, 300000, 300000, N'LD000008', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00098', 150000, 300000, 300000, N'LD000012', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00099', 150000, 300000, 200000, N'LD000013', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00100', 150000, 300000, 200000, N'LD000002', 2, 2021)
GO
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00101', 300000, 300000, 200000, N'LD000003', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00102', 300000, 300000, 300000, N'LD000004', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00103', 200000, 300000, 300000, N'LD000005', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00104', 300000, 300000, 300000, N'LD000006', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00105', 100000, 300000, 300000, N'LD000007', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00106', 150000, 300000, 300000, N'LD000008', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00107', 300000, 300000, 300000, N'LD000009', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00108', 150000, 300000, 300000, N'LD000010', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00109', 150000, 300000, 300000, N'LD000011', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00110', 150000, 300000, 200000, N'LD000012', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00111', 300000, 300000, 200000, N'LD000013', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00112', 300000, 300000, 300000, N'LD000002', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00113', 150000, 300000, 300000, N'LD000003', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00114', 200000, 300000, 300000, N'LD000004', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00115', 100000, 300000, 300000, N'LD000005', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00116', 200000, 300000, 300000, N'LD000006', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00117', 300000, 300000, 200000, N'LD000007', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00118', 150000, 300000, 200000, N'LD000008', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00119', 250000, 300000, 200000, N'LD000009', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00120', 300000, 300000, 250000, N'LD000010', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00121', 150000, 300000, 300000, N'LD000011', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00122', 300000, 300000, 300000, N'LD000012', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00123', 260000, 300000, 300000, N'LD000013', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00124', 300000, 300000, 300000, N'LD000003', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00125', 250000, 300000, 300000, N'LD000004', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00126', 100000, 300000, 300000, N'LD000005', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00127', 150000, 300000, 300000, N'LD000006', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00128', 190000, 300000, 300000, N'LD000007', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00129', 260000, 300000, 300000, N'LD000008', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00130', 220000, 300000, 300000, N'LD000009', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00131', 290000, 300000, 300000, N'LD000011', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00132', 140000, 300000, 300000, N'LD000012', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00133', 240000, 300000, 300000, N'LD000013', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00134', 260000, 300000, 300000, N'LD000002', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00135', 300000, 300000, 300000, N'LD000003', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00136', 100000, 300000, 300000, N'LD000004', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00137', 150000, 300000, 300000, N'LD000005', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00138', 220000, 300000, 300000, N'LD000006', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00139', 240000, 300000, 300000, N'LD000007', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00140', 260000, 300000, 300000, N'LD000008', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00141', 210000, 300000, 300000, N'LD000009', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00142', 250000, 300000, 300000, N'LD000010', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00143', 250000, 300000, 300000, N'LD000012', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00144', 150000, 300000, 300000, N'LD000013', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00145', 150000, 300000, 300000, N'LD000004', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00146', 200000, 300000, 300000, N'LD000005', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00147', 300000, 300000, 300000, N'LD000006', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00148', 100000, 300000, 300000, N'LD000009', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00149', 190000, 300000, 300000, N'LD000010', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00150', 220000, 300000, 300000, N'LD000011', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00151', 250000, 300000, 300000, N'LD000012', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00152', 250000, 300000, 300000, N'LD000013', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00153', 250000, 300000, 300000, N'LD000001', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00154', 300000, 300000, 300000, N'LD000002', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00155', 100000, 300000, 300000, N'LD000003', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00156', 150000, 300000, 300000, N'LD000004', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00157', 300000, 300000, 300000, N'LD000007', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00158', 230000, 300000, 300000, N'LD000008', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00159', 180000, 300000, 300000, N'LD000011', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00160', 200000, 300000, 300000, N'LD000012', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00161', 250000, 300000, 300000, N'LD000013', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00162', 250000, 300000, 300000, N'LD000013', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00163', 150000, 300000, 300000, N'LD000001', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00164', 340000, 400000, 300000, N'LD000003', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00165', 340000, 400000, 400000, N'LD000005', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00166', 340000, 500000, 500000, N'LD000006', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00167', 500000, 500000, 500000, N'LD000007', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00168', 550000, 500000, 500000, N'LD000008', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00169', 600000, 500000, 500000, N'LD000009', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00170', 650000, 500000, 500000, N'LD000010', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00171', 700000, 500000, 500000, N'LD000012', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00172', 700000, 500000, 500000, N'LD000012', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00173', 500000, 500000, 500000, N'LD000001', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00174', 600000, 500000, 500000, N'LD000002', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00175', 700000, 500000, 500000, N'LD000004', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00176', 800000, 500000, 500000, N'LD000005', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00177', 900000, 500000, 500000, N'LD000006', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00178', 1000000, 500000, 500000, N'LD000007', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00179', 1100000, 500000, 500000, N'LD000011', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00180', 1200000, 500000, 500000, N'LD000013', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00181', 1200000, 500000, 500000, N'LD000013', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00182', 1100000, 500000, 500000, N'LD000012', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00183', 1000000, 500000, 500000, N'LD000001', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00184', 900000, 500000, 500000, N'LD000002', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00185', 1500000, 500000, 500000, N'LD000005', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00186', 800000, 500000, 500000, N'LD000010', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00187', 700000, 500000, 500000, N'LD000011', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00188', 700000, 500000, 500000, N'LD000012', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00189', 1800000, 500000, 500000, N'LD000013', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00190', 1800000, 500000, 500000, N'LD000006', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00191', 1500000, 500000, 500000, N'LD000007', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00192', 1300000, 500000, 500000, N'LD000008', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00193', 1200000, 500000, 500000, N'LD000009', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00194', 1100000, 500000, 500000, N'LD000010', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00195', 1000000, 500000, 500000, N'LD000011', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00196', 900000, 500000, 500000, N'LD000012', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00197', 800000, 500000, 500000, N'LD000013', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00198', 500000, 500000, 500000, N'NV000001', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00199', 600000, 500000, 500000, N'NV000002', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00200', 700000, 500000, 500000, N'NV000003', 1, 2021)
GO
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00201', 800000, 500000, 500000, N'NV000004', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00202', 900000, 500000, 500000, N'NV000005', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00203', 900000, 500000, 500000, N'NV000006', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00204', 1000000, 500000, 500000, N'NV000007', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00205', 1000000, 500000, 500000, N'NV000009', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00206', 1200000, 500000, 500000, N'NV000010', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00207', 1300000, 500000, 500000, N'NV000011', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00208', 1500000, 500000, 500000, N'NV000012', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00209', 1800000, 500000, 500000, N'NV000013', 1, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00210', 1800000, 500000, 500000, N'NV000013', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00211', 1200000, 500000, 500000, N'NV000001', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00212', 1100000, 500000, 500000, N'NV000003', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00213', 1300000, 500000, 500000, N'NV000002', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00214', 1500000, 500000, 500000, N'NV000005', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00215', 1700000, 500000, 500000, N'NV000006', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00216', 1800000, 500000, 500000, N'NV000007', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00217', 1200000, 500000, 500000, N'NV000008', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00218', 1200000, 500000, 500000, N'NV000009', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00219', 1400000, 500000, 500000, N'NV000010', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00220', 700000, 500000, 500000, N'NV000011', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00221', 900000, 500000, 500000, N'NV000012', 2, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00222', 900000, 500000, 500000, N'NV000012', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00223', 1000000, 500000, 500000, N'NV000013', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00224', 1100000, 500000, 500000, N'NV000011', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00225', 1200000, 500000, 500000, N'NV000010', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00226', 1300000, 500000, 500000, N'NV000009', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00227', 1400000, 500000, 500000, N'NV000008', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00228', 1500000, 500000, 500000, N'NV000007', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00229', 1600000, 500000, 500000, N'NV000006', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00230', 1900000, 500000, 500000, N'NV000005', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00231', 900000, 500000, 500000, N'NV000004', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00232', 1000000, 500000, 500000, N'NV000003', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00233', 900000, 500000, 500000, N'NV000002', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00234', 800000, 500000, 500000, N'NV000001', 3, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00235', 800000, 500000, 500000, N'NV000001', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00236', 700000, 500000, 500000, N'NV000002', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00237', 1000000, 500000, 500000, N'NV000003', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00238', 1100000, 500000, 500000, N'NV000004', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00239', 1200000, 500000, 500000, N'NV000005', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00240', 1300000, 500000, 500000, N'NV000006', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00241', 1400000, 500000, 500000, N'NV000007', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00242', 1500000, 500000, 500000, N'NV000008', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00243', 1600000, 500000, 500000, N'NV000009', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00244', 1700000, 500000, 500000, N'NV000010', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00245', 1800000, 500000, 500000, N'NV000011', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00246', 1900000, 500000, 500000, N'NV000012', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00247', 2000000, 500000, 500000, N'NV000013', 4, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00248', 2000000, 500000, 500000, N'NV000013', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00249', 1800000, 500000, 500000, N'NV000012', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00250', 1700000, 500000, 500000, N'NV000011', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00251', 1600000, 500000, 500000, N'NV000010', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00252', 1500000, 500000, 500000, N'NV000009', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00253', 1400000, 500000, 500000, N'NV000008', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00254', 1400000, 500000, 500000, N'NV000002', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00255', 1000000, 500000, 500000, N'NV000001', 5, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00256', 1000000, 500000, 500000, N'NV000001', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00257', 800000, 500000, 500000, N'NV000002', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00258', 900000, 500000, 500000, N'NV000003', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00259', 1000000, 500000, 500000, N'NV000004', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00260', 1100000, 500000, 500000, N'NV000005', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00261', 1200000, 500000, 500000, N'NV000006', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00262', 1500000, 500000, 500000, N'NV000009', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00263', 1600000, 500000, 500000, N'NV000010', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00264', 1700000, 500000, 500000, N'NV000011', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00265', 1800000, 500000, 500000, N'NV000012', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00266', 1900000, 500000, 500000, N'NV000013', 6, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00267', 1900000, 500000, 500000, N'NV000013', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00268', 1800000, 500000, 500000, N'NV000012', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00269', 1700000, 500000, 500000, N'NV000011', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00270', 1500000, 500000, 500000, N'NV000010', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00271', 1400000, 500000, 500000, N'NV000009', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00272', 1200000, 500000, 500000, N'NV000008', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00273', 1100000, 500000, 500000, N'NV000007', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00274', 1000000, 500000, 500000, N'NV000006', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00275', 800000, 500000, 500000, N'NV000004', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00276', 900000, 500000, 500000, N'NV000003', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00277', 700000, 500000, 500000, N'NV000001', 7, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00278', 700000, 500000, 500000, N'NV000001', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00279', 800000, 500000, 500000, N'NV000002', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00280', 900000, 500000, 500000, N'NV000003', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00281', 1000000, 500000, 500000, N'NV000004', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00282', 1100000, 500000, 500000, N'NV000005', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00283', 1200000, 500000, 500000, N'NV000007', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00284', 1300000, 500000, 500000, N'NV000008', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00285', 1400000, 500000, 500000, N'NV000009', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00286', 1400000, 500000, 500000, N'NV000010', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00287', 1500000, 500000, 500000, N'NV000011', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00288', 1800000, 500000, 500000, N'NV000012', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00289', 2000000, 500000, 500000, N'NV000013', 8, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00290', 2000000, 500000, 500000, N'NV000013', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00291', 1900000, 500000, 500000, N'NV000012', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00292', 1800000, 500000, 500000, N'NV000011', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00293', 1700000, 500000, 500000, N'NV000010', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00294', 1600000, 500000, 500000, N'NV000009', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00295', 1500000, 500000, 500000, N'NV000007', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00296', 1400000, 500000, 500000, N'NV000006', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00297', 1300000, 500000, 500000, N'NV000005', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00298', 1200000, 500000, 500000, N'NV000004', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00299', 800000, 500000, 500000, N'NV000002', 9, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00300', 800000, 500000, 50000, N'NV000002', 10, 2021)
GO
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00301', 900000, 500000, 50000, N'NV000003', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00302', 1000000, 500000, 50000, N'NV000004', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00303', 1200000, 500000, 50000, N'NV000008', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00304', 1300000, 500000, 50000, N'NV000009', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00305', 1400000, 500000, 50000, N'NV000010', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00306', 1500000, 500000, 50000, N'NV000011', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00307', 1600000, 500000, 50000, N'NV000012', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00308', 1900000, 500000, 50000, N'NV000013', 10, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00309', 1900000, 500000, 50000, N'NV000011', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00310', 1500000, 500000, 50000, N'NV000012', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00311', 1200000, 500000, 50000, N'NV000013', 11, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00312', 1200000, 500000, 50000, N'NV000013', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00313', 2000000, 500000, 50000, N'NV000012', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00314', 1800000, 500000, 500000, N'NV000011', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00315', 1700000, 500000, 500000, N'NV000010', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00316', 1600000, 500000, 500000, N'NV000009', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00317', 1500000, 500000, 500000, N'NV000008', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00318', 800000, 500000, 500000, N'NV000007', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00319', 1000000, 500000, 500000, N'NV000006', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00320', 1200000, 500000, 500000, N'NV000005', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00321', 1400000, 500000, 500000, N'NV000004', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00322', 1500000, 500000, 500000, N'NV000003', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00323', 1800000, 500000, 500000, N'NV000002', 12, 2021)
INSERT [dbo].[ThuNhapKhac] ([maThuNhapKhac], [luongLamThem], [phuCap], [thuong], [maNV], [thang], [nam]) VALUES (N'TN00324', 700000, 500000, 500000, N'NV000001', 12, 2021)
GO
ALTER TABLE [dbo].[BangLuong]  WITH CHECK ADD  CONSTRAINT [FK_NV_BL] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[BangLuong] CHECK CONSTRAINT [FK_NV_BL]
GO
ALTER TABLE [dbo].[ChamCongNVHC]  WITH CHECK ADD  CONSTRAINT [fk_NV_CCNVHC] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[ChamCongNVHC] CHECK CONSTRAINT [fk_NV_CCNVHC]
GO
ALTER TABLE [dbo].[CongDoan]  WITH CHECK ADD  CONSTRAINT [FK_CD_SP] FOREIGN KEY([maSanPham])
REFERENCES [dbo].[SanPham] ([maSP])
GO
ALTER TABLE [dbo].[CongDoan] CHECK CONSTRAINT [FK_CD_SP]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NV_PB] FOREIGN KEY([maPB])
REFERENCES [dbo].[PhongBan] ([maPhongBan])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NV_PB]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NV_TK] FOREIGN KEY([userName])
REFERENCES [dbo].[TaiKhoan] ([userName])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NV_TK]
GO
ALTER TABLE [dbo].[NhanVien_CongDoan]  WITH CHECK ADD  CONSTRAINT [FK_CN_CD] FOREIGN KEY([maCongDoan])
REFERENCES [dbo].[CongDoan] ([maCongDoan])
GO
ALTER TABLE [dbo].[NhanVien_CongDoan] CHECK CONSTRAINT [FK_CN_CD]
GO
ALTER TABLE [dbo].[NhanVien_CongDoan]  WITH CHECK ADD  CONSTRAINT [FK_CN_NV] FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[NhanVien_CongDoan] CHECK CONSTRAINT [FK_CN_NV]
GO
ALTER TABLE [dbo].[ThuNhapKhac]  WITH CHECK ADD  CONSTRAINT [fkTNK_NV] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[ThuNhapKhac] CHECK CONSTRAINT [fkTNK_NV]
GO
USE [master]
GO
ALTER DATABASE [QlyLuong] SET  READ_WRITE 
GO
