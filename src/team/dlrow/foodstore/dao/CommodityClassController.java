package team.dlrow.foodstore.dao;

import team.dlrow.foodstore.pojo.*;
import team.dlrow.foodstore.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author dlrow
 * @date 2018年12月27日
 */
public class CommodityClassController {
	// 查找商品分类一级名称
	public List<CommodityClassOne> findCommodityClassOne() {
		List<CommodityClassOne> CommodityClassOnes = new ArrayList<CommodityClassOne>();
		String sql = "SELECT CommodityClassOneId,CommodityClassOneName FROM commodityclassone";
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				CommodityClassOne c = new CommodityClassOne();
				c.setCommodityClassOneId(rs.getString("CommodityClassOneId"));
				c.setCommodityClassOneName(rs.getString("CommodityClassOneName"));
				CommodityClassOnes.add(c);
			}
			DBUtil.closeJDBC(rs, stat, conn);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return CommodityClassOnes;
	}

	// 查找商品分类二级名称
	public List<CommodityClassTwo> findCommodityClassTwo() {
		List<CommodityClassTwo> CommodityClassTwo = new ArrayList<CommodityClassTwo>();
		String sql = "";
		sql = "SELECT CommodityClassTwoId,CommodityClassTwoName FROM commodityclasstwo";
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				CommodityClassTwo o = new CommodityClassTwo();
				o.setCommodityClassTwoId(rs.getString("CommodityClassTwoId"));
				o.setCommodityClassTwoName(rs.getString("CommodityClassTwoName"));
				CommodityClassTwo.add(o);
			}
			DBUtil.closeJDBC(rs, stat, conn);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return CommodityClassTwo;
	}
}
