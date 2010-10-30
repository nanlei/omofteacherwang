package neo.app.service;

import java.util.List;
import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class ExperienceService extends BaseService {
	// 获取所有教育心得
	private static final String SQL_GET_ALL_EXPERIENCE = "select e.*,ed.NAME as NAME from om_experience e join om_experience_division ed on e.EXPDIVID=ed.ID";

	// 获取所有教育心得
	public PagingList getAllExperience() {
		return getPagingList(SQL_GET_ALL_EXPERIENCE);
	}

	// 添加教育心得
	private static final String SQL_ADD_EXPERIENCE = "insert into om_experience(EXPDIVID,TITLE,CONTENT,CLICKTIMES,POSTTIME,UPDATETIME,UPDATEIP,ORDERS) values(?,?,?,0,now(),now(),?,?)";

	/**
	 * 添加教育心得
	 * 
	 * @param parameterMap
	 * @param ip
	 */
	public void addExperience(Map parameterMap, String ip) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"expDivId,title,content,orders");
		jt.update(SQL_ADD_EXPERIENCE, params[0], params[1], params[2], ip,
				params[3]);
	}

	// 获取教育心得供修改
	private static final String SQL_GET_EXPERIENCE_BY_ID = "select e.*,ed.NAME as NAME from om_experience e join om_experience_division ed on e.EXPDIVID=ed.ID where e.ID=?";

	/**
	 * 获取教育心得供修改
	 * 
	 * @param id
	 * @return
	 */
	public Map getExperienceById(String id) {
		return jt.queryForMap(SQL_GET_EXPERIENCE_BY_ID, id);
	}

	// 修改教育心得
	private static final String SQL_UPDATE_EXPERIENCE_BY_ID = "update om_experience set EXPDIVID=?,TITLE=?,CONTENT=?,UPDATETIME=now(),UPDATEIP=?,ORDERS=? where ID=?";

	/**
	 * 修改教育心得
	 * 
	 * @param parameterMap
	 * @param ip
	 * @param id
	 */
	public void updateExperienceById(Map parameterMap, String ip, String id) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"expDivId,title,content,orders");
		jt.update(SQL_UPDATE_EXPERIENCE_BY_ID, params[0], params[1], params[2],
				ip, params[3], id);
	}

	// 删除教育心得
	private static final String SQL_DELETE_EXPERIENCE_BY_ID = "delete from om_experience where ID=?";

	/**
	 * 删除教育
	 * 
	 * @param id心得
	 */
	public void deleteEexperienceById(String id) {
		jt.update(SQL_DELETE_EXPERIENCE_BY_ID, id);
	}

	// 获取所有教育心得分类
	private static final String SQL_GET_ALL_CATEGORY = "select * from om_experience_division";

	/**
	 * 获取分类列表供选择，不分页
	 * 
	 * @return
	 */
	public List getCategorys() {
		return jt.queryForList(SQL_GET_ALL_CATEGORY);
	}

	/**
	 * 教育心得分类列表，分页
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
	public void addCategory(Map parameterMap, final String ip) {
		final Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"name,description");
		jt.update(SQL_ADD_CATEGORY, params[0], params[1], ip);
		// 以下是插入并获得ID的做法
		// KeyHolder keyHolder=new GeneratedKeyHolder();
		// jt.update(new PreparedStatementCreator() {
		// public PreparedStatement createPreparedStatement(Connection conn)
		// throws SQLException {
		// PreparedStatement ps=conn.prepareStatement(SQL_ADD_CATEGORY,new
		// String[]{"NAME","DESCRIPTION","UPDATEIP"});
		// ps.setString(1, (String)params[0]);
		// ps.setString(2, (String)params[1]);
		// ps.setString(3, ip);
		// return ps;
		// }
		// },keyHolder);
		// System.out.println(keyHolder.getKey().intValue());
	}

	// 根据ID查找教育心得分类
	private static final String SQL_GET_CATEGORY_BY_ID = "select * from om_experience_division where ID=?";

	/**
	 * 根据ID查找教育心得分类
	 * 
	 * @param id
	 * @return
	 */
	public Map getCategoryById(String categoryId) {
		return jt.queryForMap(SQL_GET_CATEGORY_BY_ID, categoryId);
	}

	// 更新教育心得分类
	private static final String SQL_UPDATE_CATEGORY_BY_ID = "update om_experience_division set NAME=?,DESCRIPTION=?,UPDATETIME=now(),UPDATEIP=? where ID=?";

	/**
	 * 更新教育心得分类
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

	// 统计分类下的文章数目
	private static final String SQL_COUNT_NUM_BY_CATEGORY_ID = "select count(*) from om_experience where EXPDIVID=?";

	/**
	 * 统计分类下的文章数目
	 * 
	 * @param categoryId
	 * @return
	 */
	public int getNumByCategoryId(String categoryId) {
		return jt.queryForInt(SQL_COUNT_NUM_BY_CATEGORY_ID, categoryId);
	}

	// 删除分类
	private static final String SQL_DELETE_CATEGORY_BY_ID = "delete from om_experience_division where ID=?";

	/**
	 * 删除分类
	 * 
	 * @param categoryId
	 */
	public void deleteCategoryById(String categoryId) {
		jt.update(SQL_DELETE_CATEGORY_BY_ID, categoryId);
	}
}
