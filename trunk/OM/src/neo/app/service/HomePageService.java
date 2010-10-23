package neo.app.service;

import java.util.Map;

import org.apache.commons.lang.StringUtils;

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

	/**
	 * 添加信息
	 * 
	 * @param parameterMap
	 * @param pic
	 * @param updateUser
	 * @param updateIP
	 */
	public void addHomepage(Map parameterMap, String pic, String updateUser,
			String updateIP) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,content,state");
		jt.update(SQL_ADD_HOMEPAGE, params[0], params[1], pic, updateUser,
				updateIP, params[2]);
	}

	// 根据ID获取首页信息
	private static final String SQL_GET_HOMEPAGE_BY_ID = "select * from om_homepage where ID=?";

	/**
	 * 根据ID获取首页信息
	 * 
	 * @param id
	 * @return
	 */
	public Map getHomepageInfoById(String id) {
		return jt.queryForMap(SQL_GET_HOMEPAGE_BY_ID, id);
	}

	// 修改首页信息
	private static final String SQL_UPDATE_HOMEPAGE_BY_ID = "update om_homepage set TITLE=?,CONTENT=?,PIC=?,UPDATEUSER=?,UPDATETIME=now(),UPDATEIP=?,STATE=? where ID=?";

	private static final String SQL_UPDATE_HOMEPAGE_NO_PIC_BY_ID = "update om_homepage set TITLE=?,CONTENT=?,UPDATEUSER=?,UPDATETIME=now(),UPDATEIP=?,STATE=? where ID=?";

	/**
	 * 修改首页信息
	 * 
	 * @param parameterMap
	 * @param pic
	 * @param updateUser
	 * @param updateIP
	 * @param id
	 */
	public void updateHomepageById(Map parameterMap, String pic,
			String updateUser, String updateIP, String id) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameterMap,
				"title,content,state");
		if (StringUtils.isEmpty(pic)) {
			jt.update(SQL_UPDATE_HOMEPAGE_NO_PIC_BY_ID, params[0], params[1],
					updateUser, updateIP, params[2], id);
		} else {
			jt.update(SQL_UPDATE_HOMEPAGE_BY_ID, params[0], params[1], pic,
					updateUser, updateIP, params[2], id);
		}
	}

	// 删除信息
	private static final String SQL_DELETE_HOMEPAGE_BY_ID = "delete from om_homepage where ID=?";

	/**
	 * 删除信息
	 * 
	 * @param id
	 */
	public void deleteHomepageById(String id) {
		jt.update(SQL_DELETE_HOMEPAGE_BY_ID, id);
	}
}
