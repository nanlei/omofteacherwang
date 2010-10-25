package neo.app.service;

import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class PrimaryService extends BaseService {
	// 查询所有咨询
	private static final String SQL_GET_ALL_CONSULTING = "select * from om_primary_consulting order by STATE asc,ID desc";

	/**
	 * 查询所有咨询
	 * 
	 * @return
	 */
	public PagingList getAllConsulting() {
		return getPagingList(SQL_GET_ALL_CONSULTING);
	}

	// 添加咨询
	private static final String SQL_ADD_CONSULTING = "insert into om_primary_consulting(TITLE,CONTENT,POSTTIME,POSTIP,USERNAME,STATE,PRI,VOTE1,VOTE2,VOTE3) values(?,?,now(),?,?,1,?,0,0,0)";

	/**
	 * 添加咨询
	 * 
	 * @param parameterMap
	 * @param userName
	 * @param ip
	 */
	public void addConsulting(Map parameterMap, String userName, String ip) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,content,pri");
		jt.update(SQL_ADD_CONSULTING, params[0], params[1], ip, userName,
				params[2]);
	}

	// 根据ID获取咨询信息
	private static final String SQL_GET_CONSULTING_BY_ID = "select * from om_primary_consulting where ID=?";

	/**
	 * 根据ID获取咨询信息
	 * 
	 * @param id
	 * @return
	 */
	public Map getConsultingById(String id) {
		return jt.queryForMap(SQL_GET_CONSULTING_BY_ID, id);
	}

	// 根据咨询ID获取回复列表
	private static final String SQL_GET_CONSULTING_POSTS_BY_PID = "select * from om_primary_consulting_post where CONSULTINGID=?";

	/**
	 * 根据咨询ID获取回复列表
	 * 
	 * @param consultingId
	 * @return
	 */
	public PagingList getPostsByConsultingId(String consultingId) {
		return getPagingList(SQL_GET_CONSULTING_POSTS_BY_PID,
				new Object[] { consultingId });
	}

	// 添加回复
	private static final String SQL_ADD_POST = "insert into om_primary_consulting_post(CONSULTINGID,CONTENT,POSTTIME,POSTIP,USERNAME) values(?,?,now(),?,?)";

	/**
	 * 添加回复
	 * 
	 * @param parameterMap
	 * @param consultingId
	 * @param ip
	 * @param userName
	 */
	public void addPost(Map parameterMap, String consultingId, String ip,
			String userName) {
		String content = MapUtil.getStringFromMap(parameterMap, "content");
		jt.update(SQL_ADD_POST, consultingId, content, ip, userName);
	}

	// 删除回复
	private static final String SQL_DELETE_POST_BY_ID = "delete from om_primary_consulting_post where ID=?";

	/**
	 * 删除回复
	 * 
	 * @param postId
	 */
	public void deletePostById(String postId) {
		jt.update(SQL_DELETE_POST_BY_ID, postId);
	}
}
