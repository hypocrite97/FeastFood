package team.dlrow.foodstore.pojo;

/**
 * @author dlrow
 * @date 2019年1月3日
 * 
 * 后台购物订单类
 * 属性:
 * 		商品编号:id
 * 		商品详情:placeorder_str
 * 		商品总金额:total
 * 		商品创建时间:ordertime
 * 		创建订单的用户信息:userEmail
 * 属性封装,对外提供get()/set()方法
 * 提供默认构造方法和带参构造方法
 * 提供toString()方法
 */
public class MerchOrder {
	private String id;// 商品编号
	private String placeorder_str;// 商品详情
	private String total;// 商品总金额
	private String ordertime;// 商品创建时间
	private String userEmail;// 创建订单的用户信息

	public MerchOrder() {
		super();
	}

	public MerchOrder(String id, String placeorder_str, String total, String ordertime, String userEmail) {
		super();
		this.id = id;
		this.placeorder_str = placeorder_str;
		this.total = total;
		this.ordertime = ordertime;
		this.userEmail = userEmail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPlaceorder_str() {
		return placeorder_str;
	}

	public void setPlaceorder_str(String placeorder_str) {
		this.placeorder_str = placeorder_str;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Override
	public String toString() {
		return "MerchOrder [id=" + id + ", placeorder_str=" + placeorder_str + ", total=" + total + ", ordertime="
				+ ordertime + ", userEmail=" + userEmail + "]";
	}

}
