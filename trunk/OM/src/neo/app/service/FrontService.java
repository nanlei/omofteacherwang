package neo.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;


import neo.core.common.PagingList;
import neo.core.util.CommonUtil;
import neo.core.util.MapUtil;

public class FrontService extends BaseService {

	private static final String SQL_GET_STUDENT_BY_USERNAME = "select * from om_student where USERNAME=?";

	/**
	 * 根据用户名获取用户信息，用于登录
	 * 
	 * @param userName
	 * @return
	 */
	public Map getUserByUserName(String userName) {
		try {
			Map user = jt.queryForMap(SQL_GET_STUDENT_BY_USERNAME,
					new Object[] { userName });
			return user;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
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
			"from om_homePage where state=1 order by updateTime DESC limit 0,5";
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
	 * 依据ID对奥数分享资料下载数+1
	 */
	private static final String SQL_ADD_DATA_DLT="update om_data set downloadTimes=downloadTimes+1 where id=?";
	public void addDataDownloadTimes(String id) {
		jt.update(SQL_ADD_DATA_DLT,id);
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

	/**
	 * 得到初中学习列表
	 */
	private static final String SQL_GET_JUNIOR_STUDY_LIST="select om_junior.id, om_junior.title, om_junior.content, om_junior.postTime, " +
			"om_teacher.realName as teacherName from om_junior join om_teacher on om_junior.teacherId = om_teacher.id";
	public PagingList getJuniorStudyList() {
		return getPagingList(SQL_GET_JUNIOR_STUDY_LIST);
	}

	/**
	 * 从数据库里取得奥数教育心得内容，将experienceMap作为各个信息的容器
	 */
	public Map getExperienceMap() {
		HashMap map = new HashMap();
		PagingList experienceList = getExperienceList();
		map.put("experienceList", experienceList);
		List experienceDivision = getExperienceDivision();
		map.put("experienceDivision", experienceDivision);
		return map;
	}

	/**
	 * 得到所有奥数教育心得资料
	 */
	private static final String SQL_GET_EXPERIENCE_LIST="select om_experience.id, om_experience.title, " +
	"om_experience.updateTime, om_experience.clickTimes, om_experience_division.name as divisionName " +
	"from om_experience join om_experience_division on " +
	"om_experience.expDivId = om_experience_division.id order by om_experience.updateTime DESC";
	private PagingList getExperienceList() {
		return getPagingList(SQL_GET_EXPERIENCE_LIST);
	}

	/**
	 * 依据单位ID得到指定奥数教育心得信息
	 */
	private static final String SQL_GET_EXPERIENCE_DETAIL="select om_experience.id, om_experience.title, om_experience.content, " +
	"om_experience.updateTime, om_experience.clickTimes, om_experience_division.name as divisionName " +
	"from om_experience join om_experience_division on " +
	"om_experience.expDivId = om_experience_division.id where om_experience.id=? order by om_experience.updateTime DESC";

	public List getExperienceDetial(String id) {
		
		return jt.queryForList(SQL_GET_EXPERIENCE_DETAIL,id);
	}
	
	/**
	 * 依据ID更新点击次数
	 */
	private static final String SQL_EXP_CLICKTIMES_ADD="update om_experience set clickTimes=clickTimes+1 where id=?";
	public void addExpClickTimes(String id) {
		jt.update(SQL_EXP_CLICKTIMES_ADD,id);
	}

	/**
	 * 奥数教育心得分类
	 */
	private static final String SQL_GET_EXPERIENCE_DIVISION="select id, name from om_experience_division";
	public List getExperienceDivision() {
		return jt.queryForList(SQL_GET_EXPERIENCE_DIVISION);
	}

	/**
	 * 依据单位项目ID得到指定奥数教育心得某一类的信息
	 */
	private static final String SQL_GET_EXPERIENCE_DIVED_LIST="select om_experience.id, om_experience.title, " +
	"om_experience.updateTime, om_experience_division.name as divisionName, om_experience.clickTimes " +
	"from om_experience join om_experience_division on " +
	"om_experience.expDivId = om_experience_division.id where om_experience_division.id=? order by om_experience.updateTime DESC";
	public PagingList getExperienceDivedList(String id) {
		return getPagingList(SQL_GET_EXPERIENCE_DIVED_LIST, new Object[]{id});
	}

	/**
	 * 依据传入的用户名检查是否存在同名用户
	 */
	private static final String SQL_CHECK_MEMBER_EXIST="select count(*) from om_student where userName=?";
	public int checkMemberExist(String userName) {
		return jt.queryForInt(SQL_CHECK_MEMBER_EXIST, userName);
	}

	/**
	 * 添加学生用户
	 */
	private static final String SQL_ADD_MEMBER="insert into om_student(id, userName, realName, password, email, mobile, registerTime, onlineTimes) " +
			"values(null, ?, ?, ?, ?, ?, now(), 0)";
	public int addMember(Map parameters) {
		Object[] params = MapUtil.getObjectArrayFromMap(parameters, "userName, realName, password, email, mobile");
		String md5Pwd = CommonUtil.getMD5ofStr((String) params[2]);
		return jt.update(SQL_ADD_MEMBER, params[0], params[1], md5Pwd, params[3], params[4]);
	}

	/**
	 * 关于我们
	 */
	private static final String SQL_GET_ABOUT_US="select * from om_about";
	public List getAboutUs() {
		return jt.queryForList(SQL_GET_ABOUT_US);
	}

	/**
	 * 创建验证码
	 */
	public String createCode() {
		Random random = new Random(); 
		StringBuffer checkCode = new StringBuffer();
		for (int i=0; i<4; i++){
			String ranNum = String.valueOf(random.nextInt(10));
			checkCode.append(ranNum);
		}
		return checkCode.toString();
	}

	/**
	 * POST_VOTE
	 */
	private static final String SQL_POST_ADD_GOOD="update om_primary_consulting set vote1=vote1+1 where id=?";
	private static final String SQL_POST_ADD_BAD="update om_primary_consulting set vote2=vote2+1 where id=?";
	private static final String SQL_POST_ADD_NONE="update om_primary_consulting set vote3=vote3+1 where id=?";
	public void addVote(String postId, String voteType) {
		if(voteType.equals("1")){
			jt.update(SQL_POST_ADD_GOOD,postId);
		}
		if(voteType.equals("2")){
			jt.update(SQL_POST_ADD_BAD,postId);
		}
		if(voteType.equals("3")){
			jt.update(SQL_POST_ADD_NONE,postId);
		}
		
		
	}

	private static final String SQL_GET_VOTE_ALRDY="select count(*) from om_vote_validate where postId=? and studentId=?";
	public boolean getVoteAlrdy(String postId, String loginUserId) {
		if(jt.queryForInt(SQL_GET_VOTE_ALRDY, postId, loginUserId)==1){
			return false;
		}
		else{
			return true;
		}
			
	}

	private static final String SQL_ADD_VOTE_ALRDY="insert into om_vote_validate(id, postId, studentId, voteTime, voteType) " +
			"values(null, ?, ?, now(), ?)";
	public void addVoteAlrdy(String postId, String loginUserId, String voteType) {
		jt.update(SQL_ADD_VOTE_ALRDY, postId, loginUserId, voteType );
	}



	

	

	





}
