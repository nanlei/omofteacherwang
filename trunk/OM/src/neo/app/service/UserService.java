package neo.app.service;

import java.util.Map;

import neo.core.common.PagingList;

import org.springframework.dao.EmptyResultDataAccessException;

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

	private static final String SQL_GET_ALL_TEACHERS = "select * from om_teacher";

	/**
	 * 获取教师用户列表，分页
	 * 
	 * @return
	 */
	public PagingList getAllTeachers() {
		return getPagingList(SQL_GET_ALL_TEACHERS);
	}
}
