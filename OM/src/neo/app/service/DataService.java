package neo.app.service;

import java.util.List;
import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class DataService extends BaseService {
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
}
