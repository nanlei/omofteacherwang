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
				"title,content,order");
		jt.update(SQL_ADD_METHOD, teacherId, params[0], params[1], ip,
				params[2]);
	}
}
