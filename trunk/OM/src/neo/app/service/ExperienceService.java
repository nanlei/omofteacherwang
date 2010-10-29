package neo.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class ExperienceService extends BaseService {
	// 获取
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
