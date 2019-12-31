package team.dlrow.foodstore.pojo;

/**
 * @author dlrow
 * @date 2019年1月1日
 * 
 * 后台用户类 
 * 属性: 
 * 		用户名称:admin
 * 		用户密码:password
 * 属性封装,对外提供get()/set()方法
 * 提供带参构造方法
 */
public class Admin {
	private String admin;// 用户名称
	private String password;// 用户密码

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Admin(String admin, String password) {
		this.admin = admin;
		this.password = password;
	}
}
