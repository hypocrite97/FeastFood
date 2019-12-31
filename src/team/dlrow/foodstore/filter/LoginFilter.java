package team.dlrow.foodstore.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author dlrow
 * @date 2018年12月30日
 * 
 * 前台防跳墙过滤器 
 * 提供前台防跳墙功能
 */
@WebFilter(urlPatterns = { "/Home/shop.jsp", "/Home/shop-cart.jsp" }, servletNames = {
		"team.dlrow.foodstore.ProductlistServlet" }, initParams = {
				@WebInitParam(name = "loginPage", value = "login.jsp"), }, dispatcherTypes = { DispatcherType.REQUEST,
						DispatcherType.FORWARD })
public class LoginFilter implements Filter {
	private String loginPage = "login.jsp";

	public LoginFilter() {

	}

	public void destroy() {
		this.loginPage = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		if (session.getAttribute("islogin") == null) {
			String requestPath = req.getRequestURI();
			if (req.getQueryString() != null) {
				requestPath += "?" + req.getQueryString();
				System.out.println(requestPath);
			}
			req.setAttribute("requestPath", requestPath);
			request.getRequestDispatcher("/Home/" + loginPage).forward(request, response);
			return;
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		loginPage = fConfig.getInitParameter("loginPage");
		if (null == loginPage) {
			loginPage = "login.jsp";
		}
	}

}
