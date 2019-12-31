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

import team.dlrow.foodstore.pojo.LoginUserMap;

/**
 * @author dlrow
 * @date 2018年12月31日
 * 
 * 前台单体登录过滤器 
 * 提供前台单体登录功能
 */
@WebFilter(
		servletNames = { "team.dlrow.foodstore.servlet.UserLoginServlet" }, initParams = {
				@WebInitParam(name = "loginPage", value = "login.jsp"), }, dispatcherTypes = { DispatcherType.REQUEST,
						DispatcherType.FORWARD })
public class LoginLimitFilter implements Filter {
	private String loginPage = "login.jsp";

	public LoginLimitFilter() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		// 获取项目路径
		String path = servletRequest.getContextPath();
		String basePath = servletRequest.getScheme() + "://" + servletRequest.getServerName() + ":"
				+ servletRequest.getServerPort() + path;
		try {
			// 获取用户登录id
			String loginId = request.getParameter("email");
			// 判断当前用户的Id是否在loginUsers中，如果没有执行if后的操作
			if (LoginUserMap.isInLoginUsers(loginId)) {
				// 根据用户登录的id将当前登录的用户从Map表移除
				LoginUserMap.removeUser(loginId);
			} else {
				// 移除判断是否已有用户登录的判断标识
				servletRequest.getSession().removeAttribute("islogin");
			}
		} catch (Exception e) {
			System.out.println("错误");
		} finally {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
