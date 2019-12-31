package team.dlrow.foodstore.pojo;

/**
 * @author dlrow
 * @date 2019年1月2日
 * 
 * 购物信息类
 * 属性:
 * 		商品:product
 * 		数量:buyNum
 * 		小计:subTotal
 * 属性封装,对外提供get()/set()方法
 */
public class CartItem {

	private Product product;// 商品

	private int buyNum;// 数量

	private double subTotal;// 小计

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

}
