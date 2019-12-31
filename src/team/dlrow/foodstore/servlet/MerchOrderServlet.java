package team.dlrow.foodstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.dlrow.foodstore.dao.PlaceOrderDAO;
import team.dlrow.foodstore.pojo.MerchOrder;

/**
 * @author dlrow
 * @date 2019年1月3日
 * 
 * 后台购物订单servlet类
 */
@WebServlet("/MerchOrderServlet")
public class MerchOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MerchOrderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		PlaceOrderDAO p = new PlaceOrderDAO();
		List<MerchOrder> MerchOrderList = new ArrayList<MerchOrder>();
		MerchOrderList = p.find();
		request.setAttribute("MerchOrderList", MerchOrderList);
		request.getRequestDispatcher("Admin/admin/index/merch-order.jsp").forward(request, response);
		if ("del".equals(action)) {
			try {
				p.delete(request.getParameter("id"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("MerchOrderServlet");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
