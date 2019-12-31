package team.dlrow.foodstore.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import team.dlrow.foodstore.util.DBUtil;
import team.dlrow.foodstore.util.ResultSetHandler;


/**
 * @author dlrow
 * @date 2018年12月26日 
 * 
 * 总控制类 
 * 将增删改方法抽象化
 */
public class AllController {
	// 增删改查方法的抽象
	public static void update(String sql, Object... args) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			if (args != null) {
				for (int i = 0; i < args.length; i++) {
					ps.setObject(i + 1, args[i]);
				}
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, ps, conn);
		}
	}

	// 查询方法的抽象
	public Object execute_query(String sql, ResultSetHandler handler, Object... args) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			if (args != null) {
				for (int i = 0; i < args.length; i++) {
					ps.setObject(i + 1, args[i]);
				}
			}
			rs = ps.executeQuery();
			return handler.doHandler(rs);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeJDBC(rs, ps, conn);
		}
	}

	// 校验代码方法
	public static List<String> findId(String name) {
		List<String> list = new ArrayList<String>();
		String names = name.toLowerCase();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = "SELECT " + name + "Id FROM " + names;
		try {
			conn = DBUtil.getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String s = rs.getString(name + "Id");
				list.add(s);
			}
			DBUtil.closeJDBC(rs, st, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}