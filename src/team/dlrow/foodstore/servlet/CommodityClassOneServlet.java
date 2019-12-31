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

import net.sf.json.JSONArray;
import team.dlrow.foodstore.dao.CommodityClassOneDAO;
import team.dlrow.foodstore.pojo.CommodityClassOne;

/**
 * @author dlrow
 * @date 2018年12月26日
 * 
 * 商品一级分类servlet类
 */
@WebServlet("/CommodityClassOneServlet")
public class CommodityClassOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommodityClassOneDAO cc = new CommodityClassOneDAO();

	public CommodityClassOneServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		if ("upfind".equals(action)) {
			List<CommodityClassOne> CommodityClassOneList = new ArrayList<CommodityClassOne>();
			String CommodityClassOneId = request.getParameter("CommodityClassOneId");
			CommodityClassOneList = cc.find(CommodityClassOneId, null);
			net.sf.json.JSONArray cList = new JSONArray();
			cList = net.sf.json.JSONArray.fromObject(CommodityClassOneList);
			out.print(cList);
		}
		if ((action == null) || ("find".equals(action))) {
			List<CommodityClassOne> commodityClassOneList = new ArrayList<CommodityClassOne>();
			String CommodityClassOneId = null;
			String CommodityClassOneName = null;
			if (request.getParameter("CommodityClassOneId") != "") {
				CommodityClassOneId = request.getParameter("CommodityClassOneId");
			}
			if (request.getParameter("CommodityClassOneName") != "") {
				CommodityClassOneName = request.getParameter("CommodityClassOneName");
			}
			commodityClassOneList = cc.find(CommodityClassOneId, CommodityClassOneName);
			request.setAttribute("CommodityClassOneId", CommodityClassOneId);// 将lists放到作用域
			request.setAttribute("CommodityClassOneName", CommodityClassOneName);
			request.setAttribute("commodityClassOneList", commodityClassOneList);
			request.getRequestDispatcher("Admin/admin/index/CommodityClassOne.jsp").forward(request, response);// 跳转到CommodityClassOne.jsp
		}
		if ("del".equals(action)) {
			try {
				cc.delete(request.getParameter("CommodityClassOneId"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("CommodityClassOneServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if ("add".equals(action)) {
			try {
				cc.insert(new CommodityClassOne(request.getParameter("CommodityClassOneId"),
						request.getParameter("CommodityClassOneName")));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("CommodityClassOneServlet");
		}
		if ("update".equals(action)) {
			try {
				cc.update(request.getParameter("CommodityClassOneId"), request.getParameter("CommodityClassOneName"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("CommodityClassOneServlet");
		}
	}

}
