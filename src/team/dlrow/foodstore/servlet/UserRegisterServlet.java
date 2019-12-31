package team.dlrow.foodstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.dlrow.foodstore.dao.UserDAO;
import team.dlrow.foodstore.util.CookieEncryptTool;

/**
 * @author dlrow
 * @date 2018年12月30日
 * 
 * 前台用户注册servlet类
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置编码
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 获取参数
		String type = request.getParameter("type");
		String email = request.getParameter("email");
		// 实时判断是否存在相同的userid
		if ("emailAjaxValidate".equals(type)) {
			UserDAO userdao = new UserDAO();
			boolean flag = userdao.isExistEmail(email);
			if (flag) {
				out.print("邮箱已被注册");
			} else {
				out.print("邮箱可以使用");
			}
		} else {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			UserDAO userdao = new UserDAO();
			boolean flag = userdao.isExistEmail(email);
			if (flag) {
				// 邮箱已注册，进行错误提示
				out.print("<script type='text/javascript'>");
				out.print("alert('邮箱已被注册，请重新输入');");
				out.print("window.location = '/FoodStore/Home/register.jsp';");
				out.print("</script>");
			} else {
				// 邮箱未被注册，保存注册用户信息
				userdao.save(name, email, CookieEncryptTool.encodeBase64(password));
				// 注册成功，重定向到登录页面
				response.sendRedirect("/FoodStore/Home/login.jsp");
			}
		}

	}
}
