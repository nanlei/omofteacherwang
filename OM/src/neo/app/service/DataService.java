package neo.app.service;

import java.util.List;
import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class DataService extends BaseService {
	// 获取资料列表
	private static final String SQL_GET_ALL_DATAS = "select d.*,dd.NAME as NAME,t.USERNAME as USERNAME from om_data d join om_data_division dd on d.DATADIVID=dd.ID join om_teacher t on d.TEACHERID=t.ID";

	/**
	 * 获取资料列表
	 * 
	 * @return
	 */
	public PagingList getDatas() {
		return getPagingList(SQL_GET_ALL_DATAS);
	}

	// 添加资料
	private static final String SQL_ADD_DATA = "insert into om_data(TEACHERID,DATADIVID,TITLE,URL,DOWNLOADTIMES,POSTTIME) values(?,?,?,?,0,now())";

	/**
	 * 添加资料
	 * 
	 * @param parameterMap
	 * @param teacherId
	 * @param url
	 */
	public void addData(Map parameterMap, String teacherId, String url) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"dataDivId,title");
		jt.update(SQL_ADD_DATA, teacherId, params[0], params[1], url);
	}

	// 获取资料信息供修改
	private static final String SQL_GET_DATA_BY_ID = "select d.*,dd.ID as DIVID,dd.NAME as NAME,t.USERNAME as USERNAME from om_data d join om_data_division dd on d.DATADIVID=dd.ID join om_teacher t on d.TEACHERID=t.ID where d.ID=?";

	/**
	 * 获取资料信息供修改
	 * 
	 * @param id
	 * @return
	 */
	public Map getDataById(String id) {
		return jt.queryForMap(SQL_GET_DATA_BY_ID, id);
	}

	// 修改资料信息
	private static final String SQL_UPDATE_DATA_BY_ID = "update om_data set TITLE=?,DATADIVID=?,URL=? where ID=?";

	/**
	 * 修改资料信息
	 * 
	 * @param parameterMap
	 * @param url
	 * @param id
	 */
	public void updateDataById(Map parameterMap, String url, String id) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,dataDivId");
		jt.update(SQL_UPDATE_DATA_BY_ID, params[0], params[1], url, id);
	}

	// 删除资料
	private static final String SQL_DELETE_DATA_BY_ID = "delete from om_data where ID=?";

	/**
	 * 删除资料
	 * 
	 * @param id
	 */
	public void deleteDataById(String id) {
		jt.update(SQL_DELETE_DATA_BY_ID, id);
	}

	// 根据分类ID获取资料信息
	private static final String SQL_GET_DATA_BY_DIV_ID = "select d.*,dd.NAME as NAME,t.USERNAME as USERNAME from om_data d join om_data_division dd on d.DATADIVID=dd.ID join om_teacher t on d.TEACHERID=t.ID where d.DATADIVID=?";

	/**
	 * 根据分类ID获取资料信息
	 * 
	 * @param parameterMap
	 * @return
	 */
	public PagingList getDataByDivId(Map parameterMap) {
		String dataDivId = MapUtil.getStringFromMap(parameterMap, "dataDivId");
		return getPagingList(SQL_GET_DATA_BY_DIV_ID, new Object[] { dataDivId });
	}

	// 获取资料分享分类列表
	private static final String SQL_GET_ALL_DATA_CATEORYS = "select * from om_data_division";

	/**
	 * 获取分类列表，不分页
	 * 
	 * @return
	 */
	public List getCatagorys() {
		return jt.queryForList(SQL_GET_ALL_DATA_CATEORYS);
	}

	/**
	 * 获取分类列表，分页
	 * 
	 * @return
	 */
	public PagingList getAllCategory() {
		return getPagingList(SQL_GET_ALL_DATA_CATEORYS);
	}

	// 添加资料分享分类
	private static final String SQL_ADD_CATEGORY = "insert into om_data_division(NAME,DESCRIPTION,POSTTIME,UPDATETIME,UPDATEIP) values(?,?,now(),now(),?)";

	/**
	 * 添加资料分享分类
	 * 
	 * @param parameterMap
	 * @param ip
	 */
	public void addCategory(Map parameterMap, String ip) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"name,description");
		jt.update(SQL_ADD_CATEGORY, params[0], params[1], ip);
	}

	// 获取分类信息供修改
	private static final String SQL_GET_CATEGORY_BY_ID = "select * from om_data_division where ID=?";

	/**
	 * 获取分类信息供修改
	 * 
	 * @param categoryId
	 * @return
	 */
	public Map getCategoryById(String categoryId) {
		return jt.queryForMap(SQL_GET_CATEGORY_BY_ID, categoryId);
	}

	// 修改分类信息
	private static final String SQL_UPDATE_CATEGORY_BY_ID = "update om_data_division set NAME=?,DESCRIPTION=?,UPDATETIME=now(),UPDATEIP=? where ID=?";

	/**
	 * 修改分类信息
	 * 
	 * @param parameterMap
	 * @param ip
	 * @param categoryId
	 */
	public void updateCategoryById(Map parameterMap, String ip,
			String categoryId) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"name,description");
		jt.update(SQL_UPDATE_CATEGORY_BY_ID, params[0], params[1], ip,
				categoryId);
	}

	// 获取分类下信息的条数
	private static final String SQL_GET_NUM_BY_CATEGORY_ID = "select count(*) from om_data where DATADIVID=?";

	/**
	 * 获取分类下的信息条数
	 * 
	 * @param categoryId
	 * @return
	 */
	public int getNumByCategoryId(String categoryId) {
		return jt.queryForInt(SQL_GET_NUM_BY_CATEGORY_ID, categoryId);
	}

	// 删除分类
	private static final String SQL_DELETE_CATEGORY_BY_ID = "delete from om_data_division where ID=?";

	/**
	 * 删除分类
	 * 
	 * @param categoryId
	 */
	public void deleteCategoryById(String categoryId) {
		jt.update(SQL_DELETE_CATEGORY_BY_ID, categoryId);
	}
}
