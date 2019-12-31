package team.dlrow.foodstore.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

/**
 * @author dlrow
 * @date 2018年12月24日
 * 
 * 链接数据库类
 */
public class DBUtil {
	public static String URL;// 数据库链接地址
	public static String USERNAME;// 用户名
	public static String PASSWORD;// 密码
	public static String DRIVER;// Mysql驱动
	// 禁止外部实例化

	private DBUtil() {
	}

	// 为了程序更好的解耦合，利用Properties文件保存链接Mysql的配置文件
	private static ResourceBundle rb = ResourceBundle.getBundle("team.dlrow.foodstore.util.db");
	/**
	 * 使用static,加载数据库的配置文件和数据库的驱动
	 */
	static {
		URL = rb.getString("jdbc.url");
		USERNAME = rb.getString("jdbc.username");
		PASSWORD = rb.getString("jdbc.password");
		DRIVER = rb.getString("jdbc.driver");
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 定义一个获取数据链接的方法
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 释放数据库的链接
	public static void closeJDBC(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
