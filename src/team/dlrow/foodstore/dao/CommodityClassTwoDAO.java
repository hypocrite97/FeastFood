package team.dlrow.foodstore.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import team.dlrow.foodstore.pojo.CommodityClassTwo;
import team.dlrow.foodstore.util.DBUtil;

/**
 * @author dlrow
 * @date 2018年12月26日
 * 
 * 商品二级分类控制类 
 * 提供对商品二级分类表进行增删改查操作 
 * 提供校验商品二级分类编号方法
 */
public class CommodityClassTwoDAO {
	// 添加商品二级分类方法
	public void insert(CommodityClassTwo o) throws SQLException {
		String sql = "INSERT INTO CommodityClassTwo(CommodityClassTwoId,CommodityClassTwoName,CommodityClassOneId) VALUES (?,?,?)";
		AllController.update(sql, o.getCommodityClassTwoId(), o.getCommodityClassTwoName(), o.getCommodityClassOneId());
	}

	// 删除商品二级分类方法
	public void delete(String CommodityClassTwoId) throws SQLException {
		String sql = "DELETE FROM commodityclasstwo WHERE CommodityClassTwoId = ?";
		AllController.update(sql, CommodityClassTwoId);
	}

	// 修改商品二级分类方法
	public void update(String CommodityClassTwoId, String CommodityClassTwoName, String CommodityClassOneId)
			throws SQLException {
		String sql = "UPDATE CommodityClassTwo SET CommodityClassTwoName = ?,CommodityClassOneId = ? WHERE CommodityClassTwoId = ?";
		AllController.update(sql, CommodityClassTwoName, CommodityClassOneId, CommodityClassTwoId);
	}

	// 校验商品二级分类编号方法
	public List<String> check() {
		return AllController.findId("CommodityClassTwo");
	}

	/**
	 * 查找商品二级分类方法(复用) 
	 * 可无要求查找全部商品二级分类内容
	 * 可按商品二级分类编号查找二级分类内容
	 */
	public List<CommodityClassTwo> find(String CommodityClassTwoId, String CommodityClassTwoName,
			String CommodityClassOneId) {
		List<CommodityClassTwo> CommodityClassTwos = new ArrayList<CommodityClassTwo>();
		String sql = "";
		sql = "SELECT CommodityClassTwoId,CommodityClassTwoName,CommodityClassOneName FROM commodityclasstwo o,commodityclassone c WHERE c.CommodityClassOneId = o.CommodityClassOneId";
		if (CommodityClassTwoId != null) {
			sql += " AND CommodityClassTwoId = " + CommodityClassTwoId;
		}
		if (CommodityClassTwoName != null) {
			sql += " AND CommodityClassTwoName = '" + CommodityClassTwoName + "'";
		}
		if (CommodityClassOneId != null) {
			sql += " AND o.CommodityClassOneId = " + CommodityClassOneId;
		}
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
				o.setCommodityClassOneName(rs.getString("CommodityClassOneName"));
				CommodityClassTwos.add(o);
			}
			DBUtil.closeJDBC(rs, stat, conn);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return CommodityClassTwos;
	}

	public List<CommodityClassTwo> findO(String CommodityClassOneId) {
		List<CommodityClassTwo> CommodityClassTwos = new ArrayList<CommodityClassTwo>();
		String sql = "";
		sql = "SELECT CommodityClassTwoId,CommodityClassTwoName FROM commodityclasstwo o,commodityclassone c WHERE c.CommodityClassOneId = o.CommodityClassOneId";
		if (CommodityClassOneId != null) {
			sql += " AND o.CommodityClassOneId = " + CommodityClassOneId;
		}
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
				CommodityClassTwos.add(o);
			}
			DBUtil.closeJDBC(rs, stat, conn);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return CommodityClassTwos;
	}
}
