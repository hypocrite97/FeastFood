package team.dlrow.foodstore.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import team.dlrow.foodstore.pojo.CommodityClassThree;
import team.dlrow.foodstore.util.DBUtil;

/**
 * @author dlrow
 * @date 2018年12月27日
 * 
 * 商品控制类 
 * 提供对商品表进行增删改查操作 
 * 提供校验商品编号方法
 */
public class CommodityClassThreeDAO {
	// 添加商品方法
	public void insert(CommodityClassThree c) throws SQLException {
		String sql = "INSERT INTO CommodityClassThree(CommodityClassThreeId,CommodityClassThreeName,CommodityClassThreePrice,CommodityClassTwoId,imgsrc) VALUES (?,?,?,?,'/FoodStore/Home/picture/01.jpg')";
		AllController.update(sql, c.getCommodityClassThreeId(), c.getCommodityClassThreeName(),
				c.getCommodityClassThreePrice(), c.getCommodityClassTwoId());
	}

	// 删除商品方法
	public void delete(String CommodityClassThreeId) throws SQLException {
		String sql = "DELETE FROM commodityclassthree WHERE CommodityClassThreeId = ?";
		AllController.update(sql, CommodityClassThreeId);
	}

	// 修改商品方法
	public void update(String CommodityClassThreeId, String CommodityClassThreeName, String CommodityClassThreePrice,
			String CommodityClassTwoId) throws SQLException {
		String sql = "UPDATE CommodityClassThree SET CommodityClassThreeName = ?, CommodityClassThreePrice = ?, CommodityClassTwoId = ? WHERE CommodityClassThreeId = ?";
		AllController.update(sql, CommodityClassThreeName, CommodityClassThreePrice, CommodityClassTwoId,
				CommodityClassThreeId);
	}

	// 校验商品编号方法
	public List<String> check() {
		return AllController.findId("CommodityClassThree");
	}

	/**
	 * 查找商品方法(复用) 
	 * 可无要求查找全部商品 
	 * 可按商品编号查找商品
	 */
	public List<CommodityClassThree> find(String CommodityClassThreeId, String CommodityClassThreeName,
			String CommodityClassThreePrice, String CommodityClassOneId, String CommodityClassTwoId, String imgsrc) {
		List<CommodityClassThree> CommodityClassThrees = new ArrayList<CommodityClassThree>();
		String sql = "";
		sql = "SELECT CommodityClassThreeId,CommodityClassThreeName,CommodityClassThreePrice,CommodityClassOneName,CommodityClassTwoName,imgsrc "
				+ "FROM commodityclassone c, commodityclasstwo o, commodityclassthree t "
				+ "WHERE t.CommodityClassTwoId = o.CommodityClassTwoId AND o.CommodityClassOneId = c.CommodityClassOneId";
		if (CommodityClassThreeId != null) {
			sql += " AND CommodityClassThreeId = " + CommodityClassThreeId;
		}
		if (CommodityClassThreeName != null) {
			sql += " AND CommodityClassThreeName = '" + CommodityClassThreeName + "'";
		}
		if (CommodityClassThreePrice != null) {
			sql += " AND CommodityClassThreePrice = " + CommodityClassThreePrice;
		}
		if (CommodityClassTwoId != null) {
			sql += " AND t.CommodityClassTwoId = " + CommodityClassTwoId;
		}
		if (CommodityClassOneId != null) {
			sql += " AND o.CommodityClassOneId = " + CommodityClassOneId;
		}
		if (imgsrc != null) {
			sql += " AND imgsrc = " + imgsrc;
		}
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				CommodityClassThree t = new CommodityClassThree();
				t.setCommodityClassThreeId(rs.getString("CommodityClassThreeId"));
				t.setCommodityClassThreeName(rs.getString("CommodityClassThreeName"));
				t.setCommodityClassThreePrice(rs.getString("CommodityClassThreePrice"));
				t.setCommodityClassOneName(rs.getString("CommodityClassOneName"));
				t.setCommodityClassTwoName(rs.getString("CommodityClassTwoName"));
				t.setImgsrc(rs.getString("imgsrc"));
				CommodityClassThrees.add(t);
			}
			DBUtil.closeJDBC(rs, stat, conn);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return CommodityClassThrees;
	}
}
