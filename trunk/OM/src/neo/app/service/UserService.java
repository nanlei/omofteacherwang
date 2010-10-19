package neo.app.service;

import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;

public class UserService extends BaseService {
	private static final String SQL_GET_USER_BY_USERNAME = "select * from om_user where USERNAME=?";

	/**
	 * 根据用户名获取用户信息，用于登录
	 * 
	 * @param userName
	 * @return
	 */
	public Map getUserByUserName(String userName) {
		try {
			Map user = jt.queryForMap(SQL_GET_USER_BY_USERNAME, userName);
			return user;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
}
