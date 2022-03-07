package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sun.net.httpserver.Authenticator.Result;

import connect.Connect;
import entity.BangLuong;
import entity.NhanVien;
import entity.PhongBan;

public class ThongKe_DAO {
	public ArrayList<BangLuong> getAllBangLuong(int nam, int thoiGian, int thangHoacQuy, int loaiNV){
		ArrayList<BangLuong> list = new ArrayList<BangLuong>();
		Connection con = new Connect().getConnect();
		/**
		 * 0: Tất cả danh sách
		 * 1: Chọn tiêu chí Quý
		 * 2: Chọn tiêu chí Tháng
		 */
		

		
		String sql = "select * from BangLuong l join NhanVien n on l.maNV = n.maNV where";
		
		sql += " nam = " + nam + " and ";
		if(thangHoacQuy == 1) {
			if(thoiGian == 1)
				sql += " thang between 1 and 3 and ";
			else if(thoiGian == 2)
				sql += " thang between 4 and 6 and ";
			else if(thoiGian == 3)
				sql += " thang between 7 and 9 and ";
			else
				sql += " thang between 10 and 12 and ";
		} else if(thangHoacQuy == 2) 
			sql += " thang = " + thoiGian + " and ";
		if(loaiNV == 1)
			sql += " maPB = N'LD' ";
		else if (loaiNV == 2)
			sql += " maPB = N'HC' ";
		else
				sql = sql.substring(0, sql.length()-4);
		try {
			
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String ma = rs.getString("maBangluong");
				String maNV = rs.getString("maNV");
				int thang = rs.getInt("thang");
				int tgnam= rs.getInt("nam");
				double luong = rs.getDouble("luong");
				String name= rs.getString("tenNV");
		
		        NhanVien nhanVien =new NhanVien();
		        nhanVien.setTenNV(name);
		        nhanVien.setMaNV(maNV);
			
				BangLuong b = new BangLuong();
				b.setLuong(luong);
				b.setNhanVien(nhanVien);
				b.setMaBL(ma);
				b.setNam(tgnam);
				b.setThang(thang);
	
				list.add(b);
				
				
			}
		} catch (Exception e) {
				// TODO: handle exception
		}
	return list;
		
	}

}
