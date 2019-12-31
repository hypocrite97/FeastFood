package team.dlrow.foodstore.listener;

import java.util.Timer;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import team.dlrow.foodstore.pojo.LoginUserMap;

/**
 * @author dlrow
 * @date 2018年12月31日
 * 
 * 前台单体登录监听器 
 * 提供前台单体登录功能
 */
@WebListener
public class SessionListener implements HttpSessionListener {

	public SessionListener() {

	}

	public void sessionCreated(HttpSessionEvent arg0) {
		// 实例化计时器类
		Timer timer = new Timer();
		HttpSession session = arg0.getSession();
		timer.schedule(new java.util.TimerTask() {
			// 计时器内置的run方法
			public void run() {
				// 获取当前会话的sessionId
				String sessionId = session.getId();
				// 获取当前会话用户登录的id
				String loginId = (String) session.getAttribute("loginId");
				// 判断session中是否存在islogin值，若存在则证明当前会话已经有用户登录，不存在则证明当前会话没有用户登录
				if (session.getAttribute("islogin") != null) {
					// 判断当前会话的sessionId和用户的id是否在Map表中，如果在则返回true，否则返回false
					// !true= falsh !false=true
					if (!LoginUserMap.isInSession(sessionId, loginId)) {
						// 移除页面上显示的用户信息
						session.removeAttribute("SESSION_USER");
						// 移除用户的登录id
						session.removeAttribute("loginId");
						// 移除判断当前会话是否已经登陆过用户
						session.removeAttribute("islogin");
						// 设置一个session的key为msg,value为true1，用于index页面的判断
						session.setAttribute("msg", "true1");
					}
				}
			}
			// 从第一秒执行，每隔3秒执行一次
		}, 1000, 5000);

	}

	public void sessionDestroyed(HttpSessionEvent event) {
		// 获取当前会话的sessionId
		HttpSession session = event.getSession();
		String sessionId = session.getId();
		session.removeAttribute("islogin");
		// 移除loginUserMap中已经被销毁的session
		LoginUserMap.removeSessionId(sessionId);
		session.invalidate();
	}
}