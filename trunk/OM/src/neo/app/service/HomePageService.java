package neo.app.service;

import java.util.Map;

import neo.core.common.PagingList;
import neo.core.util.MapUtil;

public class HomePageService extends BaseService {
	// 获取全部信息
	private static final String SQL_GET_ALL_HOMEPAGES = "select * from om_homepage";

	/**
	 * 获取全部信息
	 * 
	 * @return
	 */
	public PagingList getAllHomepages() {
		return getPagingList(SQL_GET_ALL_HOMEPAGES);
	}

	// 获取显示的信息数目
	private static final String SQL_GET_HOMEPAGE_COUNT = "select count(*) from om_homepage where STATE=1";

	/**
	 * 获取显示的信息数目
	 * 
	 * @return
	 */
	public int getHomepageCount() {
		return jt.queryForInt(SQL_GET_HOMEPAGE_COUNT);
	}

	// 添加信息
	private static final String SQL_ADD_HOMEPAGE = "insert into om_homepage(TITLE,CONTENT,PIC,UPDATEUSER,UPDATETIME,UPDATEIP,STATE) values(?,?,?,?,now(),?,?)";

	public void addHomepage(Map parameterMap, String pic, String updateUser,
			String updateIP) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,content,state");
		jt.update(SQL_ADD_HOMEPAGE, params[0], params[1], pic, updateUser,
				updateIP, params[2]);
	}
}
