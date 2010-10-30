package neo.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;


import neo.core.common.PagingList;
import neo.core.util.MapUtil;

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
	 * 奥数分享资料分类
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
	 * 依据ID得到奥数分享资料分类
	 */
	private static final String SQL_GET_SHARE_DATA_DIVISION_BY_ID="select om_data.id, om_data.title, om_data_division.name as divisionName, " +
	"om_teacher.realName as teacherName, om_data.url, om_data.downloadTimes, om_data.postTime from om_data join " +
	"om_data_division on om_data.dataDivId = om_data_division.id " +
	"join om_teacher on om_data.teacherId = om_teacher.id where om_data_division.id=? order by om_data.postTime DESC";
	public PagingList getShareDataDivedList(String id) {
		return getPagingList(SQL_GET_SHARE_DATA_DIVISION_BY_ID, new Object[]{id});
	}

	/**
	 * 从数据库里取得全知识点评测显示的内容，将shareDataMap作为各个信息的容器
	 */
	public Map getKnowladgeMap() {
		HashMap map = new HashMap();
		PagingList knowLedgeList = getKnowLedgeList();
		map.put("knowLedgeList", knowLedgeList);
		List knowLedgeDivision = getKnowLedgeDivision();
		map.put("knowLedgeDivision", knowLedgeDivision);
		return map;
	}

	/**
	 * 全知识点评测分类
	 */
	private static final String SQL_GET_KNOWLEGDE_DIVISION="select id, name from om_knowledge_division";
	public List getKnowLedgeDivision() {
		return jt.queryForList(SQL_GET_KNOWLEGDE_DIVISION);
	}

	/**
	 * 得到所有全知识点评测资料
	 */
	private static final String SQL_GET_KNOWLEGDE_LIST="select om_knowledge.id, om_knowledge.title, " +
			"om_knowledge.postTime, om_knowledge_division.name as divisionName, " +
			"om_knowledge_division.grade from om_knowledge join om_knowledge_division on " +
			"om_knowledge.knowledgeDivId = om_knowledge_division.id order by om_knowledge.postTime DESC";
	public PagingList getKnowLedgeList() {
		return getPagingList(SQL_GET_KNOWLEGDE_LIST);
	}

	/**
	 * 依据单位ID得到指定全知识点评测信息
	 */
	private static final String SQL_GET_KNOWLEGDE_DETAIL="select om_knowledge.id, om_knowledge.title, om_knowledge.content, " +
	"om_knowledge.url, om_knowledge.postTime, om_knowledge_division.name as divisionName, " +
	"om_knowledge_division.grade from om_knowledge join om_knowledge_division on " +
	"om_knowledge.knowledgeDivId = om_knowledge_division.id where om_knowledge.id=? order by om_knowledge.postTime DESC";
	public List getKnowledgeDetial(String id) {
		return jt.queryForList(SQL_GET_KNOWLEGDE_DETAIL,id);
	}

	/**
	 * 依据单位项目ID得到指定全知识点评测某一类的信息
	 */
	private static final String SQL_GET_KNOWLEGDE_DIVED_LIST="select om_knowledge.id, om_knowledge.title, " +
	"om_knowledge.postTime, om_knowledge_division.name as divisionName, " +
	"om_knowledge_division.grade from om_knowledge join om_knowledge_division on " +
	"om_knowledge.knowledgeDivId = om_knowledge_division.id where om_knowledge_division.id=? order by om_knowledge.postTime DESC";
	public PagingList getKonwledgeDivedList(String id) {
		return getPagingList(SQL_GET_KNOWLEGDE_DIVED_LIST, new Object[]{id});
	}

	/**
	 * 发表新的帖子 //并自动创建一个系统回帖
	 */
	private static final String SQL_WRITE_NEW_POST="insert into om_primary_consulting(id, title, content, postTime, postIp, " +
			"userName, state, pri, vote1, vote2, vote3) values(null, ?, ?, now(), ?, ?, 1, 0, 0, 0, 0)";

	public void writeNewPost(Map parameters, final String ip) {
		final Object[] params = MapUtil.getObjectArrayFromMap(parameters, "title,postContent,userName");
		KeyHolder keyHolder=new GeneratedKeyHolder();
		jt.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement ps= conn.prepareStatement(SQL_WRITE_NEW_POST, new String[]{"title","postContent","postIp","userName"});
				ps.setString(1, (String)params[0]);
				ps.setString(2, (String)params[1]);
				ps.setString(3, ip);
				ps.setString(4, (String)params[2]);
				return ps;
			}
		},keyHolder);
		//systemRespondPost(keyHolder.getKey().intValue());用于做系统自动回复
	}

	
	
	
	/**
	 * 得到所有帖子
	 */
	public Map getPriConMap() {
		HashMap map = new HashMap();
		PagingList postList = getPostList();
		map.put("postList", postList);
		//int postCount = getPostCountById();
		//map.put("postCount", postCount);
		return map;
	}
	
	/**
	 * 统计回帖数量
	 */
	private static final String SQL_COUNT_RESPOND_POST="select count(id) as countNum from om_primary_consulting_post where consultingId=?";
	public int getPostCountById(String id) {
		return jt.queryForInt(SQL_COUNT_RESPOND_POST, id);
	}

	/**
	 * 得到所有咨询帖（发帖）
	 */
	private static final String SQL_GET_POST_LIST="select id, title, content as postContent, userName as postUserName, " +
			"postTime, vote1, vote2, vote3 from om_primary_consulting where state=1 order by pri asc";
	public PagingList getPostList() {
		return getPagingList(SQL_GET_POST_LIST);
	}
	
	/**
	 * 发帖后系统自动回帖
	 */
	private static final String SQL_NEW_RESPOND_POST="insert into om_primary_consulting_post(consultingId,content,postTime,postIp,userName) values(?,'系统信息-王老师会在最快时间内回复您的咨询',now(),'10000','system')";
	public void systemRespondPost(int cid) {
		jt.update(SQL_NEW_RESPOND_POST, cid);
	}

	/**
	 * 依据ID得到相对应所有回帖帖
	 */
	private static final String SQL_GET_RESPOND_POSTS_BY_ID = "select userName as respondUserName, content as respondContent, postTime as respondTime" +
			" from om_primary_consulting_post where CONSULTINGID=?";
	public List getResopndPostById(String id) {
		return jt.queryForList(SQL_GET_RESPOND_POSTS_BY_ID,id);	
	}

	/**
	 * 依据ID回帖
	 */
	private static final String SQL_RESPOND_NEW_POST="insert into om_primary_consulting_post(consultingId,content,postTime,postIp,userName) values(?, ?, now(), ?, ?)";
	public void respondNewPost(Map parameters, String ip) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameters, "id, respondContent, userName");
		jt.update(SQL_RESPOND_NEW_POST, params[0], params[1], ip, params[2] );
	}

	/**
	 * 从数据库里取得奥数知识认知内容，将methodMap作为各个信息的容器
	 */
	public Map getMethodMap() {
		HashMap map = new HashMap();
		PagingList methodList = getMethodList();
		map.put("methodList", methodList);
		return map;
	}

	/**
	 * 得到奥数认识LIST
	 */
	private static final String SQL_GET_METHOD_LIST="select om_method.id, om_method.title, om_method.postTime, om_method.updateTime, " +
			"om_teacher.realName as teacherName from om_method join om_teacher on om_method.teacherId=om_teacher.id order by orders";
	private PagingList getMethodList() {
		return getPagingList(SQL_GET_METHOD_LIST);
	}

	/**
	 * 依据ID得到奥数认识方法具体内容
	 */
	private static final String SQL_GET_METHOD_DETAIL="select om_method.title, om_method.content, om_method.updateTime, " +
	"om_teacher.realName as teacherName from om_method join om_teacher on om_method.teacherId=om_teacher.id where om_method.id=?";
	public List getMethodDetial(String id) {
		return jt.queryForList(SQL_GET_METHOD_DETAIL, id);
	}

	/**
	 * 从数据库里取得初中学习内容，将methodMap作为各个信息的容器
	 */
	public Map getJuniorStudyMap() {
		HashMap map = new HashMap();
		PagingList juniorStudyList = getJuniorStudyList();
		map.put("juniorStudyList", juniorStudyList);
		return map;
	}

	private static final String SQL_GET_JUNIOR_STUDY_LIST="select om_junior.id, om_junior.title, om_junior.content, om_junior.postTime, " +
			"om_teacher.realName as teacherName from om_junior join om_teacher on om_junior.teacherId = om_teacher.id";
	public PagingList getJuniorStudyList() {
		return getPagingList(SQL_GET_JUNIOR_STUDY_LIST);
	}





}
