package team.dlrow.foodstore.pojo;

/**
 * @author dlrow
 * @date 2019年1月2日
 * 
 * 前台购物商品类
 * 属性:
 * 		商品编号:id
 * 		商品分类id:cate_id
 * 		商品名称:product_name
 * 		商品单价:product_price
 * 属性封装,对外提供get()/set()方法
 * 提供带参构造方法
 */
public class Product {
	private int id;// 商品编号
	private int cate_id;// 商品分类id
	private String product_name;// 商品名称
	private double product_price;// 商品单价

	public Product(int id, String product_name, double product_price) {
		this.id = id;
		this.product_name = product_name;
		this.product_price = product_price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public double getProduct_price() {
		return product_price;
	}

	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}
}
