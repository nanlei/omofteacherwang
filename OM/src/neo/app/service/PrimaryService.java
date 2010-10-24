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
}
