package neo.app.service;

import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class ExperienceService extends BaseService {
	// 获取所有教育心得分类
	private static final String SQL_GET_ALL_CATEGORY = "select * from om_experience_division";

	/**
	 * 教育心得分类列表
	 * 
	 * @return
	 */
	public PagingList getAllCategory() {
		return getPagingList(SQL_GET_ALL_CATEGORY);
	}

	// 添加教育心得分类
	private static final String SQL_ADD_CATEGORY = "insert into om_experience_division(NAME,DESCRIPTION,POSTTIME,UPDATETIME,UPDATEIP) values(?,?,now(),now(),?)";

	/**
	 * 添加教育心得分类
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
