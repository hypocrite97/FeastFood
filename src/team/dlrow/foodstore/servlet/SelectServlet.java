package team.dlrow.foodstore.servlet;

import team.dlrow.foodstore.dao.CommodityClassTwoDAO;
import team.dlrow.foodstore.pojo.CommodityClassTwo;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * @author dlrow
 * @date 2018年12月28日
 * 
 * 下拉列表选择商品servlet类
 */
@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectServlet() {
	}

	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		net.sf.json.JSONArray jsonArray = new JSONArray();
		CommodityClassTwoDAO oc = new CommodityClassTwoDAO();

		String bigclass = request.getParameter("bigclass");
		String subclass = request.getParameter("subclass");
		String action = request.getParameter("action");
		if ("CommodityClassThree".equals(action)) {
			List<CommodityClassTwo> list = new ArrayList<CommodityClassTwo>();
			if (bigclass.equals("0")) {
				bigclass = null;
			}
			list = oc.findO(bigclass);
			jsonArray = net.sf.json.JSONArray.fromObject(list);
			out.print(jsonArray);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
