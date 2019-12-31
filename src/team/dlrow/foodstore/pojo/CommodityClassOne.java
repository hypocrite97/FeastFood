package team.dlrow.foodstore.pojo;

import java.sql.Timestamp;

/**
 * @author dlrow
 * @date 2018年12月26日
 * 
 * 商品分类一类
 * 属性:
 * 		商品分类一编号:CommodityClassOneId
 * 		商品分类一名称:CommodityClassOneName
 * 		增加时间:add_time
 * 		修改时间:update_time
 * 属性封装,对外提供get()/set()方法
 * 提供默认构造方法和带参构造方法
 * 提供toString()方法
 */
public class CommodityClassOne {
	private String CommodityClassOneId;//商品分类一编号
	private String CommodityClassOneName;//商品分类一名称
	private Timestamp add_time;//创建时间
	private Timestamp update_time;//修改时间
	
	public CommodityClassOne() {
		super();
	}

	public CommodityClassOne(String commodityClassOneId, String commodityClassOneName) {
		super();
		CommodityClassOneId = commodityClassOneId;
		CommodityClassOneName = commodityClassOneName;
	}

	public String getCommodityClassOneId() {
		return CommodityClassOneId;
	}

	public void setCommodityClassOneId(String commodityClassOneId) {
		CommodityClassOneId = commodityClassOneId;
	}

	public String getCommodityClassOneName() {
		return CommodityClassOneName;
	}

	public void setCommodityClassOneName(String commodityClassOneName) {
		CommodityClassOneName = commodityClassOneName;
	}

	public Timestamp getAdd_time() {
		return add_time;
	}

	public void setAdd_time(Timestamp add_time) {
		this.add_time = add_time;
	}

	public Timestamp getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}

	@Override
	public String toString() {
		return "CommodityClassOne [CommodityClassOneId=" + CommodityClassOneId + ", CommodityClassOneName="
				+ CommodityClassOneName + ", add_time=" + add_time + ", update_time=" + update_time + "]";
	}
	
}
