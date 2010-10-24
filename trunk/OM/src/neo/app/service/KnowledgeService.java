package neo.app.service;

import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class KnowledgeService extends BaseService {
	// 获取分类列表
	private static final String SQL_GET_KNOWLEDGE_CATEGORY = "select kd.*,count(k.ID) as ARTICLENUM from om_knowledge_division kd,om_knowledge k where kd.ID=k.KNOWLEDGEDIVID group by kd.ID";

	/**
	 * 获取分类列表
	 * 
	 * @return
	 */
	public PagingList getAllCategorys() {
		return getPagingList(SQL_GET_KNOWLEDGE_CATEGORY);
	}

	// 添加分类信息
	private static final String SQL_ADD_KNOWLEDGE_CATEGORY = "insert into om_knowledge_division(NAME,GRADE,DESCRIPTION,POSTTIME,UPDATETIME,UPDATEIP) values(?,?,?,now(),now(),?)";

	public void addCatrgory(Map parameterMap, String ip) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"name,grade,description");
		jt.update(SQL_ADD_KNOWLEDGE_CATEGORY, params[0], params[1], params[2],
				ip);
	}
}
