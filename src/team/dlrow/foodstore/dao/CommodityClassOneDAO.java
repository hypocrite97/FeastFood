package team.dlrow.foodstore.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import team.dlrow.foodstore.pojo.CommodityClassOne;
import team.dlrow.foodstore.util.DBUtil;

/**
 * @author dlrow
 * @date 2018年12月26日
 * 
 * 商品一级分类控制类
 * 提供对商品一级分类表进行增删改查操作
 * 提供校验商品一级分类编号方法
 */
public class CommodityClassOneDAO {
	// 添加商品一级分类方法
	public void insert(CommodityClassOne c) throws SQLException {
		String sql = "INSERT INTO CommodityClassOne(CommodityClassOneId,CommodityClassOneName) VALUES (?,?)";
		AllController.update(sql, c.getCommodityClassOneId(), c.getCommodityClassOneName());
	}

	// 删除商品一级分类方法
	public void delete(String CommodityClassOneId) throws SQLException {
		String sql = "DELETE FROM commodityclassone WHERE CommodityClassOneId = ?";
		AllController.update(sql, CommodityClassOneId);
	}

	// 修改商品一级分类方法
	public void update(String CommodityClassOneId, String CommodityClassOneName) throws SQLException {
		String sql = "UPDATE commodityclassone SET CommodityClassOneName = ? WHERE CommodityClassOneId = ?";
		AllController.update(sql, CommodityClassOneName, CommodityClassOneId);
	}

	// 校验商品一级分类编号方法
	public List<String> check() {
		return AllController.findId("CommodityClassOne");
	}

	/**
	 * 查找商品一级分类方法(复用)
	 * 可无要求查找全部商品一级分类内容 
	 * 可按商品一级分类编号查找一级分类内容
	 */
	public List<CommodityClassOne> find(String CommodityClassOneId, String CommodityClassOneName) {
		List<CommodityClassOne> CommodityClassOnes = new ArrayList<CommodityClassOne>();
		String sql = "";
		sql = "SELECT CommodityClassOneId,CommodityClassOneName FROM commodityclassone WHERE 1=1";
		if (CommodityClassOneId != null) {
			sql += " AND CommodityClassOneId = " + CommodityClassOneId;
		}
		if (CommodityClassOneName != null) {
			sql += " AND CommodityClassOneName = '" + CommodityClassOneName + "'";
		}
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
}
