package team.dlrow.foodstore.pojo;

import java.sql.Timestamp;

/**
 * @author dlrow
 * @date 2018年12月30日
 * 
 * 前台用户类
 * 属性:
 * 		用户编号:id
 * 		用户邮箱:email
 * 		用户密码:password
 * 		用户名称:name
 * 		用户创建时间:timestamp
 * 属性封装,对外提供get()/set()方法
 * 提供默认构造方法和带参构造方法
 */
public class User {
	private Integer id;
	private String email;
	private String password;
	private Timestamp timestamp;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User() {

	}

	public User(int applicantId, String email, String password) {
		this.id = applicantId;
		this.email = email;
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

}
