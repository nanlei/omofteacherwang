package neo.app.service;

import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class MethodService extends BaseService {
	// 获取所有奥数方法
	private static final String SQL_GET_ALL_METHODS = "select m.*,t.USERNAME as USERNAME from om_method m join om_teacher t on t.ID=m.TEACHERID";

	/**
	 * 获取所有奥数方法
	 * 
	 * @return
	 */
	public PagingList getAllMethods() {
		return getPagingList(SQL_GET_ALL_METHODS);
	}

	// 添加奥数方法
	private static final String SQL_ADD_METHOD = "insert into om_method(TEACHERID,TITLE,CONTENT,POSTTIME,UPDATETIME,UPDATEIP,ORDERS) values(?,?,?,now(),now(),?,?)";

	/**
	 * 添加奥数方法
	 * 
	 * @param parameterMap
	 * @param teacherId
	 * @param ip
	 */
	public void addMethod(Map parameterMap, String teacherId, String ip) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,content,orders");
		jt.update(SQL_ADD_METHOD, teacherId, params[0], params[1], ip,
				params[2]);
	}

	// 根据ID获取一条方法信息
	private static final String SQL_GET_METHOD_BY_ID = "select m.*,t.USERNAME as USERNAME from om_method m join om_teacher t on m.TEACHERID=t.ID where m.ID=?";

	/**
	 * 根据ID获取一条方法信息
	 * 
	 * @param id
	 * @return
	 */
	public Map getMethodById(String id) {
		return jt.queryForMap(SQL_GET_METHOD_BY_ID, id);
	}

	// 修改奥数方法信息
	private static final String SQL_UPDATE_METHOD_BY_ID = "update om_method set TITLE=?,CONTENT=?,ORDERS=? where ID=?";

	/**
	 * 修改奥数方法信息
	 * 
	 * @param parameterMap
	 * @param id
	 */
	public void updateMethodById(Map parameterMap, String id) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,content,orders");
		jt.update(SQL_UPDATE_METHOD_BY_ID, params[0], params[1], params[2], id);
	}

	// 删除奥数信息
	private static final String SQL_DELETE_METHOD_BY_ID = "delete from om_method where ID=?";

	/**
	 * 删除奥数信息
	 * 
	 * @param id
	 */
	public void deleteMethodById(String id) {
		jt.update(SQL_DELETE_METHOD_BY_ID, id);
	}
}
