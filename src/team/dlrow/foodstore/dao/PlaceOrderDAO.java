package team.dlrow.foodstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import team.dlrow.foodstore.util.DBUtil;
import team.dlrow.foodstore.pojo.*;

/**
 * @author dlrow
 * @date 2019年1月2日
 * 
 * 购物车类
 * 提供添加购物信息功能
 * 提供删除购物订单功能
 */
public class PlaceOrderDAO {
	public void saveplaceorder(String str, double total, String loginId) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO placeorder(placeorder_str,total,ordertime,userEmail) VALUES (?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);
			pstmt.setDouble(2, total);
			pstmt.setTimestamp(3, new Timestamp(new Date().getTime()));
			pstmt.setString(4, loginId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	public List<MerchOrder> find() {
		List<MerchOrder> MerchOrders = new ArrayList<MerchOrder>();
		String sql = "SELECT * FROM placeorder";
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				MerchOrder m = new MerchOrder();
				m.setId(rs.getString("id"));
				m.setPlaceorder_str(rs.getString("placeorder_str"));
				m.setTotal(rs.getString("total"));
				m.setOrdertime(rs.getString("ordertime"));
				m.setUserEmail(rs.getString("userEmail"));
				MerchOrders.add(m);
			}
			DBUtil.closeJDBC(rs, stat, conn);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return MerchOrders;
	}

	public void delete(String MerchOrderId) throws SQLException {
		String sql = "DELETE FROM placeorder WHERE id = ?";
		AllController.update(sql, MerchOrderId);
	}

}
