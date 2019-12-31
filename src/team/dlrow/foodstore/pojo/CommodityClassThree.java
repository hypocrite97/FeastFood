package team.dlrow.foodstore.pojo;

import java.sql.Timestamp;

/**
 * @author dlrow
 * @date 2018年12月27日
 * 
 * 商品类
 * 属性:
 * 		商品编号:CommodityClassThreeId
 * 		商品名称:CommodityClassThreeName
 * 		商品价格:CommodityClassThreePrice
 * 		所属商品分类一编号:CommodityClassOneId
 * 		所属商品分类一名称:CommodityClassOneName
 * 		所属商品分类二编号:CommodityClassTwoId
 * 		所属商品分类二名称:CommodityClassTwoName
 * 		商品图片路径:Imgsrc
 * 		增加时间:add_time
 * 		修改时间:update_time
 * 属性封装,对外提供get()/set()方法
 * 提供默认构造方法和带参构造方法
 * 提供toString()方法
 */
public class CommodityClassThree {
	private String CommodityClassThreeId;//商品编号
	private String CommodityClassThreeName;//商品名称
	private String CommodityClassThreePrice;//商品价格
	private String CommodityClassOneId;//所属商品分类一编号
	private String CommodityClassOneName;//所属商品分类一名称
	private String CommodityClassTwoId;//所属商品分类二编号
	private String CommodityClassTwoName;//所属商品分类二名称
	private Timestamp add_time;//创建时间
	private Timestamp update_time;//修改时间
	private String Imgsrc;//商品图片路径
	
	public CommodityClassThree() {
		super();
	}

	public CommodityClassThree(String commodityClassThreeId, String commodityClassThreeName, String commodityClassThreePrice, String commodityClassTwoId, String imgsrc) {
		super();
		CommodityClassThreeId = commodityClassThreeId;
		CommodityClassThreeName = commodityClassThreeName;
		CommodityClassThreePrice = commodityClassThreePrice;
		CommodityClassTwoId = commodityClassTwoId;
		Imgsrc = imgsrc;
	}

	public String getCommodityClassThreeId() {
		return CommodityClassThreeId;
	}

	public void setCommodityClassThreeId(String commodityClassThreeId) {
		CommodityClassThreeId = commodityClassThreeId;
	}

	public String getCommodityClassThreeName() {
		return CommodityClassThreeName;
	}

	public void setCommodityClassThreeName(String commodityClassThreeName) {
		CommodityClassThreeName = commodityClassThreeName;
	}

	public String getCommodityClassThreePrice() {
		return CommodityClassThreePrice;
	}

	public void setCommodityClassThreePrice(String commodityClassThreePrice) {
		CommodityClassThreePrice = commodityClassThreePrice;
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

	public String getCommodityClassTwoId() {
		return CommodityClassTwoId;
	}

	public void setCommodityClassTwoId(String commodityClassTwoId) {
		CommodityClassTwoId = commodityClassTwoId;
	}

	public String getCommodityClassTwoName() {
		return CommodityClassTwoName;
	}

	public void setCommodityClassTwoName(String commodityClassTwoName) {
		CommodityClassTwoName = commodityClassTwoName;
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

	public String getImgsrc() {
		return Imgsrc;
	}

	public void setImgsrc(String imgsrc) {
		Imgsrc = imgsrc;
	}

	@Override
	public String toString() {
		return "CommodityClassThree [CommodityClassThreeId=" + CommodityClassThreeId + ", CommodityClassThreeName="
				+ CommodityClassThreeName + ", CommodityClassThreePrice=" + CommodityClassThreePrice
				+ ", CommodityClassOneId=" + CommodityClassOneId + ", CommodityClassOneName=" + CommodityClassOneName
				+ ", CommodityClassTwoId=" + CommodityClassTwoId + ", CommodityClassTwoName=" + CommodityClassTwoName
				+ ", add_time=" + add_time + ", update_time=" + update_time + ", Imgsrc=" + Imgsrc + "]";
	}

}
