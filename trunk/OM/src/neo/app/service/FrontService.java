package neo.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FrontService extends BaseService {

	/**
	 * 从数据库里取得主页要显示的内容，将IndexMap作为各个信息的容器
	 */
	public Map getIndexMap() {
		HashMap map = new HashMap();
		List notice=getNotice();
		map.put("notice", notice);
	return map;
		
	}
	
	/**
	 * 按更新时间的降序顺序得到STATE=1的公告内容
	 */
	private static final String SQL_GET_NOTICE="select id, title, content, pic, updateTime, state " +
			"from om_homePage where state=1 order by updateTime DESC limit 0,4";
	public List getNotice(){
		return jt.queryForList(SQL_GET_NOTICE);
	}
	
	/**
	 * 按Id得到具体公告内容
	 */
	private static final String SQL_GET_NOTICE_INFO_BY_ID="select * from om_homePage where id=?";
	public List getNoticeInfo(String id) {
		return jt.queryForList(SQL_GET_NOTICE_INFO_BY_ID,id);
	}
	
	/**
	 * 从数据库里取得奥数资料分享要显示的内容，将knowladgeMap作为各个信息的容器
	 */
	public Map getShareDataMap() {
		HashMap map = new HashMap();
		List shareData=getShareData();
		map.put("shareData", shareData);
	return map;
	}

	/**
	 * 得到所有奥数分享资料
	 */
	private static final String SQL_GET_SHARE_DATA="select om_data.id, om_data.title, om_data_division.name as divisionName, " +
			"om_teacher.realName as teacherName, om_data.url, om_data.downloadTimes, om_data.postTime from om_data join " +
			"om_data_division on om_data.dataDivId = om_data_division.id " +
			"join om_teacher on om_data.teacherId = om_teacher.id order by om_data.postTime DESC;";
	private List getShareData() {
		return jt.queryForList(SQL_GET_SHARE_DATA);
	}



}
