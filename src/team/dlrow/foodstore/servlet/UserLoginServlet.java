package team.dlrow.foodstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team.dlrow.foodstore.dao.UserDAO;
import team.dlrow.foodstore.pojo.LoginUserMap;
import team.dlrow.foodstore.pojo.User;
import team.dlrow.foodstore.util.CookieEncryptTool;

/**
 * @author dlrow
 * @date 2018年12月30日
 * 
 * 前台用户登录servlet类
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 获取登录信息
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe");
		String requestPath = request.getParameter("requestPath");
		// 实例化UserDao
		UserDAO dao = new UserDAO();
		// 进行登录操作并返回用户Id
		int userID = dao.login(email, password);
		// 查询成功会返回用户id，否则返回0
		if (userID != 0) {
			// 登录成功
			User user = new User(userID, email, password);
			// 设置session
			request.getSession().setAttribute("loginId", email);
			request.getSession().setAttribute("SESSION_USER", user);
			request.getSession().setAttribute("islogin", "true");
			// 记住密码操作
			rememberMe(rememberMe, email, password, request, response);
			HttpSession session = request.getSession();
			// 将当前登录的用户id和当前会话的session存入Map表
			LoginUserMap.setLoginUsers(email, session.getId());
			// 跳转页面
			if (!"".equals(requestPath) && null != requestPath) {
				response.sendRedirect(requestPath);
			} else {
				response.sendRedirect("/FoodStore/Home/index.jsp");
			}

		} else {
			// 登录失败操作
			out.print("<script type='text/javascript'>");
			out.print("alert('账号密码错误');");
			out.print("window.location='/FoodStore/Home/login.jsp';");
			out.print("</script>");
		}
	}

	private void rememberMe(String rememberMe, String email, String password, HttpServletRequest request,
			HttpServletResponse response) {
		if ("true".equals(rememberMe)) {
			Cookie cookie = new Cookie("COOKIE_USEREMAIL", CookieEncryptTool.encodeBase64(email));
			cookie.setPath("/");
			cookie.setMaxAge(365 * 24 * 3600);
			response.addCookie(cookie);
			cookie = new Cookie("COOKIE_USERPWD", CookieEncryptTool.encodeBase64(password));
			cookie.setPath("/");
			cookie.setMaxAge(365 * 24 * 3600);
			response.addCookie(cookie);
		} else {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if ("COOKIE_USEREMAIL".equals(cookie.getName()) || "COOKIE_USERPWD".equals(cookie.getName())) {
						cookie.setMaxAge(0);
						cookie.setPath("/");
						response.addCookie(cookie);
					}
				}
			}
		}
	}
}
