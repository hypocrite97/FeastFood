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
import team.dlrow.foodstore.dao.CommodityClassTwoDAO;
import team.dlrow.foodstore.pojo.CommodityClassTwo;

/**
 * @author dlrow
 * @date 2018年12月26日
 * 
 * 商品二级分类servlet类
 */
@WebServlet("/CommodityClassTwoServlet")
public class CommodityClassTwoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommodityClassTwoDAO oc = new CommodityClassTwoDAO();

	public CommodityClassTwoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/xml");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if ("upfind".equals(action)) {
			List<CommodityClassTwo> CommodityClassTwoList = new ArrayList<CommodityClassTwo>();
			String CommodityClassTwoId = request.getParameter("CommodityClassTwoId");
			CommodityClassTwoList = oc.find(CommodityClassTwoId, null, null);
			net.sf.json.JSONArray oList = new JSONArray();
			oList = net.sf.json.JSONArray.fromObject(CommodityClassTwoList);
			out.print(oList);
		}
		if ((action == null) || ("find".equals(action))) {
			List<CommodityClassTwo> CommodityClassTwoList = new ArrayList<CommodityClassTwo>();
			String CommodityClassTwoId = null;
			String CommodityClassTwoName = null;
			String CommodityClassOneId = null;
			if (request.getParameter("CommodityClassTwoId") != "") {
				CommodityClassTwoId = request.getParameter("CommodityClassTwoId");
			}
			if (request.getParameter("CommodityClassTwoName") != "") {
				CommodityClassTwoName = request.getParameter("CommodityClassTwoName");
			}
			if (request.getParameter("CommodityClassOneId") != "") {
				CommodityClassOneId = request.getParameter("CommodityClassOneId");
			}
			CommodityClassTwoList = oc.find(CommodityClassTwoId, CommodityClassTwoName, CommodityClassOneId);
			request.setAttribute("CommodityClassTwoList", CommodityClassTwoList);// 将lists放到作用域
			request.setAttribute("CommodityClassTwoId", CommodityClassTwoId);
			request.setAttribute("CommodityClassTwoName", CommodityClassTwoName);
			request.setAttribute("commodityClassOneId", CommodityClassOneId);
			request.getRequestDispatcher("Admin/admin/index/CommodityClassTwo.jsp").forward(request, response);// 跳转到CommodityClassTwo.jsp
		}
		if ("del".equals(action)) {
			try {
				oc.delete(request.getParameter("CommodityClassTwoId"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("CommodityClassTwoServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		if ("add".equals(action)) {
			try {
				oc.insert(new CommodityClassTwo(request.getParameter("CommodityClassTwoId"),
						request.getParameter("CommodityClassTwoName"), request.getParameter("CommodityClassOneId")));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("CommodityClassTwoServlet");
		}
		if ("update".equals(action)) {
			try {
				oc.update(request.getParameter("CommodityClassTwoId"), request.getParameter("CommodityClassTwoName"),
						request.getParameter("CommodityClassOneId"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("CommodityClassTwoServlet");
		}
	}

}
