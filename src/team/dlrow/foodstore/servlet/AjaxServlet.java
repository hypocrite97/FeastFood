package team.dlrow.foodstore.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author dlrow
 * @date 2018年12月31日
 * 
 * 前台登录ajaxservlet类
 */
@WebServlet("/AjaxServlet")
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置编码
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		// 获取session中key为msg的值
		String msg = (String) request.getSession().getAttribute("msg");
		String data = "";
		data = msg + "," + msg;
		// 将data数据返回给前台ajax处理
		response.getWriter().print(data);
		// 清除session中key为msg的值
		request.getSession().removeAttribute("msg");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
