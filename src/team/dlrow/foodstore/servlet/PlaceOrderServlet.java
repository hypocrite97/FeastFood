package team.dlrow.foodstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import team.dlrow.foodstore.dao.PlaceOrderDAO;
import team.dlrow.foodstore.pojo.Cart;
import team.dlrow.foodstore.pojo.CartItem;
import team.dlrow.foodstore.pojo.MerchOrder;

/**
 * @author dlrow
 * @date 2019年1月2日
 * 
 * 购物车servlet类
 */
@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PlaceOrderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		Cart cart = (Cart) session.getAttribute("cart");
		double total = cart.getTotal();
		cart.getCartItems();
		String str = "";
		for (Map.Entry<String, CartItem> entry : cart.getCartItems().entrySet()) {
			JSONObject object = JSONObject.fromObject(entry.getValue());
			System.out.println(object);
			// 购买数量
			int buyNum = (int) object.get("buyNum");
			// 商品id
			int id = (int) object.getJSONObject("product").get("id");
			// 商品名称
			String product_name = (String) object.getJSONObject("product").get("product_name");
			// 商品价格
			double product_price = (double) object.getJSONObject("product").get("product_price");
			// 小计
			double subTotal = (double) object.get("subTotal");
			str += "<table><tr><td>" + product_name + "</td><td>" + product_price + "</td><td>" + buyNum + "</td><td>"
					+ subTotal + "</td></tr></table>";
		}
		PlaceOrderDAO placeorder = new PlaceOrderDAO();
		placeorder.saveplaceorder(str, total, loginId);
		out.print("<script type='text/javascript'>");
		out.print("alert('订单提交成功');");
		out.print("window.location='/FoodStore/Home/shop.jsp';");
		out.print("</script>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
