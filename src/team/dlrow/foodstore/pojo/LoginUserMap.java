package team.dlrow.foodstore.pojo;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author dlrow
 * @date 2018年12月30日
 * 
 * 前台单体登录类
 * 提供前台单体登录功能
 */
public class LoginUserMap {
	private static Map<String, String> loginUsers = new ConcurrentHashMap<String, String>();

	/**
	 * 将用户和sessionId存入map
	 * 
	 * @param key
	 * @param value
	 */
	// 将用户登录的id和sessionid存到Map表
	public static void setLoginUsers(String loginId, String sessionId) {
		loginUsers.put(loginId, sessionId);
	}

	/**
	 * 获取loginUsers
	 * 
	 * @return
	 */
	// 获取Map表中信息
	public static Map<String, String> getLoginUsers() {
		return loginUsers;
	}

	/**
	 * 根据sessionId移除map中的值
	 * 
	 * @param sessionId
	 */
	// 根据当前用户的登录id移除map表中与之对应的key和value
	public static void removeUser(String loginId) {
		for (Map.Entry<String, String> entry : loginUsers.entrySet()) {
			if (loginId.equals(entry.getKey())) {
				loginUsers.remove(entry.getValue());
				loginUsers.remove(entry.getKey());
				break;
			}
		}
	}

	// 根据当前会话的sessionid移除map表中与之对应的key和value
	public static void removeSessionId(String sessionId) {
		for (Map.Entry<String, String> entry : loginUsers.entrySet()) {
			if (sessionId.equals(entry.getValue())) {
				loginUsers.remove(entry.getKey());
				loginUsers.remove(entry.getValue());
				break;
			}
		}
	}

	// 根据用户登陆的id和sessionid判断当前会话的用户是否在map表中
	public static boolean isInSession(String sessionId, String loginId) {
		return (loginUsers.containsValue(sessionId) && loginUsers.containsKey(loginId));
	}

	/**
	 * 判断用户是否在loginusers中
	 * 
	 * @param loginId(email)
	 * @param sessionId
	 * @return
	 */
	// 根据用户id判断当前用户是否在map表中
	public static boolean isInLoginUsers(String loginId) {
		return (loginUsers.containsKey(loginId));
	}
}
