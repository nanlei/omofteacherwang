package neo.app.service;

import java.util.Map;

import neo.core.util.MapUtil;

public class AboutService extends BaseService {
	// 获取工作室信息
	private static final String SQL_GET_ABOUT = "select * from om_about where ID=1";

	/**
	 * 获取工作室信息
	 * 
	 * @return
	 */
	public Map getAbout() {
		return jt.queryForMap(SQL_GET_ABOUT);
	}

	// 修改工作室信息
	private static final String SQL_UPDATE_ABOUT = "update om_about set TITLE=?,CONTENT=?,UPDATETIME=now(),UPDATEIP=? where ID=1";

	/**
	 * 修改工作室信息
	 * 
	 * @param parameterMap
	 * @param ip
	 */
	public void updateAbout(Map parameterMap, String ip) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,content");
		jt.update(SQL_UPDATE_ABOUT, params[0], params[1], ip);
	}
}
