package team.dlrow.foodstore.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team.dlrow.foodstore.pojo.Cart;
import team.dlrow.foodstore.pojo.CartItem;
import team.dlrow.foodstore.pojo.Product;

/**
 * @author dlrow
 * @date 2019年1月2日
 * 
 * 处理购物车内容servlet类
 */
@WebServlet("/ProductlistServlet")
public class ProductlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductlistServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String type = request.getParameter("type");
		if ("addsessionlist".equals(type)) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			double price = Double.parseDouble(request.getParameter("price"));
			int buyNum = Integer.parseInt(request.getParameter("num"));
			if ("null".equals(buyNum)) {
				buyNum = 1;
			}
			Product product = new Product(id, name, price);
			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart == null) {
				cart = new Cart();
			}
			CartItem cartItem = new CartItem();
			cartItem.setBuyNum(buyNum);
			cartItem.setProduct(product);
			double subTotal = price * buyNum;
			cartItem.setSubTotal(subTotal);
			HashMap<String, CartItem> cartItems = cart.getCartItems();
			System.out.println(cartItems);
			double newSubTotal = 0;
			if (cartItems.containsKey(Integer.toString(id))) {
				CartItem item = cartItems.get(Integer.toString(id));
				// 修改数量
				int oldBuyNum = item.getBuyNum();
				oldBuyNum = oldBuyNum + buyNum;
				item.setBuyNum(oldBuyNum);
				// 修改小计
				double oldSubTotal = item.getSubTotal();
				newSubTotal = buyNum * price;
				oldSubTotal = oldSubTotal + newSubTotal;
				item.setSubTotal(oldSubTotal);
			} else {
				cartItems.put(Integer.toString(id), cartItem);
				newSubTotal = buyNum * price;
				System.out.println(cartItems);
			}
			// 计算总计
			double total = cart.getTotal() + newSubTotal;
			cart.setTotal(total);
			cart.setCartItems(cartItems);
			session.setAttribute("cart", cart);
		} else if (type.equals("deleteproduct")) {
			String id = request.getParameter("id");
			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart != null) {
				HashMap<String, CartItem> cartItems = cart.getCartItems();
				// 修改总价
				CartItem cartItem = cartItems.get(id);
				cart.setTotal(cart.getTotal() - cartItem.getSubTotal());
				cartItems.remove(id);
				cart.setCartItems(cartItems);
			}
			session.setAttribute("cart", cart);
			response.sendRedirect("/FoodStore/Home/shop-cart.jsp");
		} else if (type.equals("clearcart")) {
			HttpSession session = request.getSession();
			if (session.getAttribute("cart") != null) {
				session.removeAttribute("cart");
			}
			response.sendRedirect("/FoodStore/Home/shop-cart.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
