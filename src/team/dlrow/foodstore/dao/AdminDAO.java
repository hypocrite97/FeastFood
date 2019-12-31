package team.dlrow.foodstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import team.dlrow.foodstore.util.DBUtil;

/**
 * @author dlrow
 * @date 2019年1月1日
 * 
 * 后台用户管理类
 * 提供后台用户注册，保存，登录功能方法
 * 提供后台可删除修改后台用户信息功能方法
 */
public class AdminDAO {
	public int adminlogin(String admin, String password) {
		int adminID = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT adminID FROM admin WHERE adminName=? and adminPwd=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next())
				adminID = rs.getInt("adminID");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return adminID;
	}

	public boolean checkoldpassword(String username, String password) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM admin WHERE adminName = ? and adminPwd = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return false;
	}

	public void checkadminpwd(String username, String password) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE admin SET adminPwd = ? WHERE adminName = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, username);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
	}

}
