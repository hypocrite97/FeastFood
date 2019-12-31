package team.dlrow.foodstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author dlrow
 * @date 2018年12月31日
 * 
 * 检查前台用户在线状况servlet类
 */
@WebServlet("/CheckUserOnlineServlet")
public class CheckUserOnlineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckUserOnlineServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		out.print(session.getAttribute("msg"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
