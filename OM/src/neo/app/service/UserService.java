package neo.app.service;

import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.CommonUtil;
import neo.core.util.MapUtil;

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

	// 获取所有教师信息
	private static final String SQL_GET_ALL_TEACHERS = "select * from om_teacher";

	/**
	 * 获取教师用户列表，分页
	 * 
	 * @return
	 */
	public PagingList getAllTeachers() {
		return getPagingList(SQL_GET_ALL_TEACHERS);
	}

	// 添加教师用户信息
	private static final String SQL_ADD_TEACHER = "insert into om_teacher(USERNAME,REALNAME,PASSWORD,EMAIL,MOBILE,ROLE) values(?,?,?,?,?,0)";

	/**
	 * 添加教师用户信息
	 * 
	 * @param parameterMap
	 *            Map类型的参数
	 */
	public void addTeacher(Map parameterMap) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"userName,realName,password,email,mobile");
		String md5Pwd = CommonUtil.getMD5ofStr((String) params[2]);
		jt.update(SQL_ADD_TEACHER, params[0], params[1], md5Pwd, params[3],
				params[4]);
	}

	// 根据ID获取用户信息
	private static final String SQL_GET_TEACHER_BY_ID = "select * from om_teacher where ID=?";

	/**
	 * 根据ID获取用户信息
	 * 
	 * @param id
	 * @return
	 */
	public Map getTeacherById(String id) {
		return jt.queryForMap(SQL_GET_TEACHER_BY_ID, id);
	}
}
