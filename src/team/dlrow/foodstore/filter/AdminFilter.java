package team.dlrow.foodstore.filter;

import java.io.IOException;
import java.io.PrintWriter;

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
 * @date 2019年1月1日
 * 
 * 后台防跳墙过滤器
 * 提供后台防跳墙功能
 */
@WebFilter(urlPatterns = { "/Admin/admin/index/*" }, initParams = {
		@WebInitParam(name = "loginPage", value = "login.jsp"), }, dispatcherTypes = { DispatcherType.REQUEST,
				DispatcherType.FORWARD })
public class AdminFilter implements Filter {
	private String loginPage = "login.jsp";

	public AdminFilter() {
	}

	public void destroy() {
		this.loginPage = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		if (null == session.getAttribute("SESSION_ADMIN") && !(req.getServletPath().indexOf("login.jsp") > 0)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('请先登录');");
			out.print("window.location='/FoodStore/Admin/admin/index/login.jsp';");
			out.print("</script>");
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		loginPage = fConfig.getInitParameter("loginPage");
		if (null == loginPage) {
			loginPage = "login.jsp";
		}
	}

}
