package neo.app.service;

import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class JuniorService extends BaseService {
	// 获取初中学习信息列表
	private static final String SQL_GET_ALL_JUNIOR = "select j.*,t.USERNAME as USERNAME from om_junior j join om_teacher t on j.TEACHERID=t.ID";

	/**
	 * 获取初中学习信息列表
	 * 
	 * @return
	 */
	public PagingList getAllJunior() {
		return getPagingList(SQL_GET_ALL_JUNIOR);
	}

	// 添加初中学习信息
	private static final String SQL_ADD_JUNIOR = "insert into om_junior(TITLE,CONTENT,POSTTIME,TEACHERID) values(?,?,now(),?)";

	/**
	 * 添加初中学习信息
	 * 
	 * @param parameterMap
	 * @param teacherId
	 */
	public void addJunior(Map parameterMap, String teacherId) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,content");
		jt.update(SQL_ADD_JUNIOR, params[0], params[1], teacherId);
	}

	// 根据ID获取初中学习信息
	private static final String SQL_GET_JUNIOR_BY_ID = "select j.*,t.USERNAME as USERNAME from om_junior j join om_teacher t on j.TEACHERID=t.ID where j.ID=?";

	/**
	 * 根据ID获取初中学习信息
	 * 
	 * @param id
	 * @return
	 */
	public Map getJuniorById(String id) {
		return jt.queryForMap(SQL_GET_JUNIOR_BY_ID, id);
	}

	// 修改初中学习信息
	private static final String SQL_UPDATE_JUNIOR = "update om_junior set TITLE=?,CONTENT=? where ID=?";

	/**
	 * 修改初中学习信息
	 * 
	 * @param parameterMap
	 * @param id
	 */
	public void updateJuniorById(Map parameterMap, String id) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,content");
		jt.update(SQL_UPDATE_JUNIOR, params[0], params[1], id);
	}

	// 删除初中学习信息
	private static final String SQL_DELETE_JUNIOR_BY_ID = "delete from om_junior where ID=?";

	/**
	 * 删除初中学习信息
	 * 
	 * @param id
	 */
	public void deleteJuniorById(String id) {
		jt.update(SQL_DELETE_JUNIOR_BY_ID, id);
	}
}
