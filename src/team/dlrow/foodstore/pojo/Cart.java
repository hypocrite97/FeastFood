package team.dlrow.foodstore.pojo;

import java.util.HashMap;

/**
 * @author dlrow
 * @date 2019年1月2日
 * 
 * 购物车类
 * 属性封装,对外提供get()/set()方法
 * 提供带参构造方法
 */
public class Cart {
	private HashMap<String, CartItem> cartItems = new HashMap<String, CartItem>();

	private double total;// 总金额

	public HashMap<String, CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(HashMap<String, CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
}
