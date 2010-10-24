package neo.app.service;

import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class KnowledgeService extends BaseService {
	// 获取分类列表
	private static final String SQL_GET_KNOWLEDGE_CATEGORY = "select kd.*,ifnull(count(k.ID),0) as ARTICLENUM from om_knowledge_division kd left outer join om_knowledge k on kd.ID=k.KNOWLEDGEDIVID group by kd.ID";

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

	/**
	 * 添加分类信息
	 * 
	 * @param parameterMap
	 * @param ip
	 */
	public void addCatrgory(Map parameterMap, String ip) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"name,grade,description");
		jt.update(SQL_ADD_KNOWLEDGE_CATEGORY, params[0], params[1], params[2],
				ip);
	}

	// 获取分类信息供修改
	private static final String SQL_GET_KNOWLEDGE_CATEGORY_BY_ID = "select * from om_knowledge_division where ID=?";

	/**
	 * 获取分类信息供修改
	 * 
	 * @param id
	 * @return
	 */
	public Map getKnowledgeCategoryById(String id) {
		return jt.queryForMap(SQL_GET_KNOWLEDGE_CATEGORY_BY_ID, id);
	}

	// 修改分类信息
	private static final String SQL_UPDATE_KNOWLEDGE_DIVISION_BY_ID = "update om_knowledge_division set NAME=?,GRADE=?,DESCRIPTION=?,UPDATETIME=now(),UPDATEIP=? where ID=?";

	/**
	 * 修改知识分类信息
	 * 
	 * @param parameterMap
	 * @param ip
	 * @param id
	 */
	public void updateKnowledgeCategoryById(Map parameterMap, String ip,
			String id) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"name,grade,description");
		jt.update(SQL_UPDATE_KNOWLEDGE_DIVISION_BY_ID, params[0], params[1],
				params[2], ip, id);
	}

	// 根据分类ID获取信息条数
	private static final String SQL_GET_NUM_BY_CATEGORY_ID = "select count(ID) from om_knowledge where KNOWLEDGEDIVID=?";

	/**
	 * 根据分类ID获取信息条数
	 * 
	 * @param id
	 * @return
	 */
	public int getNumByCategoryId(String categoryId) {
		return jt.queryForInt(SQL_GET_NUM_BY_CATEGORY_ID, categoryId);
	}

	// 根据ID删除分类
	private static final String SQL_DELETE_CATEGORY_BY_ID = "delete from om_knowledge_division where ID=?";

	/**
	 * 根据ID删除分类
	 * 
	 * @param id
	 */
	public void deleteCategoryById(String id) {
		jt.update(SQL_DELETE_CATEGORY_BY_ID, id);
	}
}
