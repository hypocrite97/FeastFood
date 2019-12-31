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
import team.dlrow.foodstore.dao.CommodityClassThreeDAO;
import team.dlrow.foodstore.pojo.CommodityClassTwo;
import team.dlrow.foodstore.pojo.CommodityClassThree;

/**
 * @author dlrow
 * @date 2019年1月2日
 * 
 * 前台购买商品servlet类
 */
@WebServlet("/ShopServlet")
public class ShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommodityClassThreeDAO tc = new CommodityClassThreeDAO();

	public ShopServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/xml");
		response.setCharacterEncoding("UTF-8");
		String selected = request.getParameter("selected");
		PrintWriter out = response.getWriter();
		CommodityClassTwoDAO oc = new CommodityClassTwoDAO();

		List<CommodityClassTwo> CommodityClassTwoList = oc.find(null, null, selected);
		request.setAttribute("ol", CommodityClassTwoList);

		String action = request.getParameter("action");
		if ("upfind".equals(action)) {
			List<CommodityClassThree> CommodityClassThreeList = new ArrayList<CommodityClassThree>();
			String CommodityClassThreeId = request.getParameter("CommodityClassThreeId");
			CommodityClassThreeList = tc.find(CommodityClassThreeId, null, null, null, null, null);
			net.sf.json.JSONArray cList = new JSONArray();
			cList = net.sf.json.JSONArray.fromObject(CommodityClassThreeList);
			out.print(cList);
		}
		if ((action == null) || ("find".equals(action))) {
			List<CommodityClassThree> CommodityClassThreeList = new ArrayList<CommodityClassThree>();
			String CommodityClassThreeId = null;
			String CommodityClassThreeName = null;
			String CommodityClassThreePrice = null;
			String CommodityClassOneId = null;
			String CommodityClassTwoId = null;
			String imgsrc = null;
			if (request.getParameter("CommodityClassThreeId") != "") {
				CommodityClassThreeId = request.getParameter("CommodityClassThreeId");
			}
			if (request.getParameter("CommodityClassThreeName") != "") {
				CommodityClassThreeName = request.getParameter("CommodityClassThreeName");
			}
			if (request.getParameter("CommodityClassThreePrice") != "") {
				CommodityClassThreePrice = request.getParameter("CommodityClassThreePrice");
			}
			if (request.getParameter("CommodityClassOneId") != "") {
				CommodityClassOneId = request.getParameter("CommodityClassOneId");
			}
			if (request.getParameter("CommodityClassTwoId") != "") {
				CommodityClassTwoId = request.getParameter("CommodityClassTwoId");
			}
			CommodityClassThreeList = tc.find(CommodityClassThreeId, CommodityClassThreeName, CommodityClassThreePrice,
					CommodityClassOneId, CommodityClassTwoId, imgsrc);
			request.setAttribute("CommodityClassThreeList", CommodityClassThreeList);// 将lists放到作用域
			request.setAttribute("CommodityClassThreeId", CommodityClassThreeId);
			request.setAttribute("CommodityClassThreeName", CommodityClassThreeName);
			request.setAttribute("CommodityClassThreePrice", CommodityClassThreePrice);
			request.setAttribute("CommodityClassOneId", CommodityClassOneId);
			request.setAttribute("CommodityClassTwoId", CommodityClassTwoId);
			request.getRequestDispatcher("Home/shop.jsp").forward(request, response);// 跳转到CommodityClassThree.jsp

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	}
}
