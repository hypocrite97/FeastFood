package team.dlrow.foodstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.dlrow.foodstore.dao.AdminDAO;

/**
 * @author dlrow
 * @date 2019年1月1日
 * 
 * 后台用户修改密码servlet类
 */
@WebServlet("/ChangeAdminPasswordServlet")
public class ChangeAdminPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangeAdminPasswordServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String password3 = request.getParameter("password3");
		AdminDAO admindao = new AdminDAO();
		if (admindao.checkoldpassword(username, password1)) {
			if (password2.equals(password3)) {
				admindao.checkadminpwd(username, password2);
				out.print("<script type='text/javascript'>");
				out.print("alert('修改密码成功');");
				out.print("parent.location.reload();");
				out.print("</script>");
			} else {
				out.print("<script type='text/javascript'>");
				out.print("alert('两次密码输入不相符，请重新操作');");
				out.print("parent.location.reload();");
				out.print("</script>");
			}
		} else {
			out.print("<script type='text/javascript'>");
			out.print("alert('账号原密码输入错误，操作失败');");
			out.print("parent.location.reload();");
			out.print("</script>");
		}
	}

}
