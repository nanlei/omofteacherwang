package neo.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import neo.core.common.PagingList;

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
	 * 从数据库里取得奥数资料分享要显示的内容，将shareDataMap作为各个信息的容器
	 */
	public Map getShareDataMap() {
		HashMap map = new HashMap();
		PagingList shareData = getShareData();
		map.put("shareData", shareData);
		List shareDivision = getShareDivision();
		map.put("shareDivision", shareDivision);
	return map;
	}

	/**
	 * 分类奥数分享资料
	 */
	private static final String SQL_GET_SHARE_DIVISION="select id, name from om_data_division";
	public List getShareDivision() {
		return jt.queryForList(SQL_GET_SHARE_DIVISION);
	}

	/**
	 * 得到所有奥数分享资料
	 */
	private static final String SQL_GET_SHARE_DATA="select om_data.id, om_data.title, om_data_division.name as divisionName, " +
			"om_teacher.realName as teacherName, om_data.url, om_data.downloadTimes, om_data.postTime from om_data join " +
			"om_data_division on om_data.dataDivId = om_data_division.id " +
			"join om_teacher on om_data.teacherId = om_teacher.id order by om_data.postTime DESC";
	public PagingList getShareData() {
		return getPagingList(SQL_GET_SHARE_DATA);
	}

	/**
	 * 得到分类奥数分享资料
	 */
	private static final String SQL_GET_SHARE_DATA_DIVISION_BY_ID="select om_data.id, om_data.title, om_data_division.name as divisionName, " +
	"om_teacher.realName as teacherName, om_data.url, om_data.downloadTimes, om_data.postTime from om_data join " +
	"om_data_division on om_data.dataDivId = om_data_division.id " +
	"join om_teacher on om_data.teacherId = om_teacher.id where om_data_division.id=? order by om_data.postTime DESC;";
	public List getShareDataDivision(String id) {
		return jt.queryForList(SQL_GET_SHARE_DATA_DIVISION_BY_ID,id);
	}



}
