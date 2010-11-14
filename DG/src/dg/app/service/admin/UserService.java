package dg.app.service.admin;

import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;

import dg.app.service.BaseService;

/**
 * 用户管理Service
 * 
 * @author Nanlei
 * 
 */
public class UserService extends BaseService {
	// 根据用户名获取用户信息
	private static final String SQL_GET_TEACHER_BY_USERNAME = "select * from om_teacher where USERNAME=?";

	/**
	 * 根据用户名获取用户信息，用于登录
	 * 
	 * @param userName
	 * @return
	 */
	public Map getUserByUserName(String userName) {
		try {
			Map user = jt.queryForMap(SQL_GET_TEACHER_BY_USERNAME,
					new Object[] { userName });
			return user;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
}
