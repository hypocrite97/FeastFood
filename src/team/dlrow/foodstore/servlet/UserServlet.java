package team.dlrow.foodstore.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.dlrow.foodstore.dao.UserDAO;
import team.dlrow.foodstore.pojo.UserPageBean;

/**
 * @author dlrow
 * @date 2018年12月31日
 * 
 * 前台用户管理servlet类
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String type = request.getParameter("type");
		if (type.equals("deleteuser")) {
			int id = Integer.parseInt(request.getParameter("id"));
			UserDAO user = new UserDAO();
			user.deleteuser(id);
			request.getRequestDispatcher("/Admin/admin/index/userlist.jsp").forward(request, response);
		} else if (type.equals("pageList")) {
			String pageNo = request.getParameter("pageNo");
			if (pageNo == null || "".equals(pageNo))
				pageNo = "1";
			UserPageBean pagination = new UserPageBean();
			pagination.setPageNo(Integer.parseInt(pageNo));
			request.setAttribute("pagination", pagination);
			request.getRequestDispatcher("/Admin/admin/index/userlist.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
