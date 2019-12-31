package team.dlrow.foodstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.dlrow.foodstore.dao.CommodityClassOneDAO;
import team.dlrow.foodstore.dao.CommodityClassThreeDAO;
import team.dlrow.foodstore.dao.CommodityClassTwoDAO;

/**
 * @author dlrow
 * @date 2018年12月27日
 * 
 * 校验商品servlet类
 */
@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommodityClassTwoDAO oC = new CommodityClassTwoDAO();
	CommodityClassOneDAO collC = new CommodityClassOneDAO();
	CommodityClassThreeDAO teacC = new CommodityClassThreeDAO();

	public CheckServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String CommodityClassOneId = request.getParameter("CommodityClassOneId");
		String CommodityClassTwoId = request.getParameter("CommodityClassTwoId");
		String CommodityClassThreeId = request.getParameter("CommodityClassThreeId");

		String responseContext = "true";
		if (CommodityClassOneId != null) {
			List<String> check = collC.check();
			for (String s : check) {
				if (CommodityClassOneId.equals(s)) {
					responseContext = "false";
					break;
				}
			}
		}
		if (CommodityClassTwoId != null) {
			List<String> check = oC.check();
			for (String s : check) {
				if (CommodityClassTwoId.equals(s)) {
					responseContext = "false";
					break;
				}
			}
		}

		if (CommodityClassThreeId != null) {
			List<String> check = teacC.check();
			for (String s : check) {
				if (CommodityClassThreeId.equals(s)) {
					responseContext = "false";
					break;
				}
			}
		}

		// 将处理结果返回给客户端
		out.println(responseContext);
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
