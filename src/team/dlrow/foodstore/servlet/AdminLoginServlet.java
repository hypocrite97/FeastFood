package team.dlrow.foodstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team.dlrow.foodstore.dao.AdminDAO;
import team.dlrow.foodstore.pojo.Admin;
import team.dlrow.foodstore.pojo.LoginUserMap;
import team.dlrow.foodstore.pojo.User;

/**
 * @author dlrow
 * @date 2019年1月1日
 * 
 * 后台用户登录servlet类
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminLoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String admin = request.getParameter("admin");
		String password = request.getParameter("password");
		String verity = request.getParameter("verity");
		String sessionValidateCode = (String) request.getSession().getAttribute("SESSION_VALIDATECODE");
		if (!sessionValidateCode.equals(verity)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('请正确输入验证码');");
			out.print("window.location='/FoodStore/Admin/admin/index/login.jsp';");
			out.print("</script>");
		} else {
			// 登录
			AdminDAO admindao = new AdminDAO();
			int adminid = admindao.adminlogin(admin, password);

			if (adminid != 0) {
				Admin adminitem = new Admin(admin, password);
				request.getSession().setAttribute("SESSION_ADMIN", adminitem);
				response.sendRedirect("/FoodStore/Admin/admin/index/index.jsp");
			} else {
				// 登录失败操作
				out.print("<script type='text/javascript'>");
				out.print("alert('账号密码错误');");
				out.print("window.location='/FoodStore/Admin/admin/index/login.jsp';");
				out.print("</script>");
			}
		}
	}

}
