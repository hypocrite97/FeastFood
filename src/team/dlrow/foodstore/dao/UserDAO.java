package team.dlrow.foodstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import team.dlrow.foodstore.pojo.User;
import team.dlrow.foodstore.util.CookieEncryptTool;
import team.dlrow.foodstore.util.DBUtil;

/**
 * @author dlrow
 * @date 2018年12月30日
 * 
 * 前台用户管理类
 * 提供前台用户注册，保存，登录功能方法
 * 提供后台可以删除前台用户信息功能方法
 */
public class UserDAO {
	// 注册功能：判断是否存在相同的email
	public boolean isExistEmail(String email) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM user WHERE userEmail = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return false;
	}

	// 删除用户
	public void deleteuser(int id) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	// 用户注册：保存
	public void save(String name, String email, String password) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO user(userName,userEmail,userPwd,userRegistDate) VALUES (?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			pstmt.setTimestamp(4, new Timestamp(new Date().getTime()));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	// 用户登录
	public int login(String email, String password) {
		int userID = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT userID FROM user WHERE userEmail=? and userPwd=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, CookieEncryptTool.encodeBase64(password));
			rs = pstmt.executeQuery();
			if (rs.next())
				userID = rs.getInt("userID");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return userID;
	}

	public int getRecordCount() {
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT count(*) FROM user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				recordCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return recordCount;
	}

	public List<User> getCatePageList(int pageNo, int pageSize) {

		List<User> list = new ArrayList<User>();
		int beginPos = (pageNo - 1) * pageSize;

		Connection conn = DBUtil.getConnection();
		PreparedStatement pStmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM user ORDER BY userID ASC LIMIT ?,?";
		try {
			pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, beginPos);
			pStmt.setInt(2, pageSize);
			rs = pStmt.executeQuery();
			while (rs.next()) {
				int userID = rs.getInt("userID");
				String userName = rs.getString("userName");
				String userEmail = rs.getString("userEmail");
				Timestamp userRegistDate = rs.getTimestamp("userRegistDate");
				User user = new User();
				user.setId(userID);
				user.setName(userName);
				user.setEmail(userEmail);
				user.setTimestamp(userRegistDate);
				// 加入链表
				list.add(user);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pStmt, conn);
		}
		return list;
	}
}
