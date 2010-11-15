package neo.app.action.front;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONObject;

import neo.app.action.BaseAction;
import neo.core.common.Anonymous;
import neo.core.common.PagingList;
import neo.core.util.MapUtil;
import neo.core.util.json.JsonView;

public class AnonymAction extends BaseAction implements Anonymous {
	//获取客户端浏览器语言，用户请求action和系统时间
	private String locale;
	private String actionName;
	private String date;
	private String id; //公用数据库查询ID
	private List divisionList;//公用seconday导航分类
	//主页公告相关
	private Map indexMap;
	private List noticeDetail;
	//全知识点
	private Map knowledgeMap;
	private PagingList konwledgeDivedList;
	private List knowledgeDetial;
	//奥数资料分享
	private Map shareDataMap;
	private PagingList shareDataDivedList;
	//小升初咨询
	private Map primaryConsultingMap;
	private List respondList;
	//奥数方法认识
	private Map methodMap;
	private List methodDetial;
	//初中学习
	private Map juniorStudyMap;
	//奥数教育心得
	private Map experienceMap;
	private PagingList experienceDivedList;
	private List experienceDetial;
	// AJAX请求返回内容
	private JsonView json;
	// 关于我们
	private List aboutUs;
	private String checkCode;
	

	/**
	 * 网站首页
	 */
	public String viewIndex() throws Exception {
		locale = getLocaleFromBrowser();
		actionName = getActionNameFromURL();
		date = getTime();
		//将三个量存入session
		getSession().put("locale", locale);
		getSession().put("actionName", actionName);
		getSession().put("date", date);
		indexMap=getServMgr().getFrontService().getIndexMap();
		return "viewIndex";
	}
	
	/**
	 * 全知识点评测-主页
	 */
	public String viewKnowledge() throws Exception{
		knowledgeMap=getServMgr().getFrontService().getKnowladgeMap();
		return "viewKnowledge";
	}
	
	/**
	 * 全知识点评测-具体项信息
	 */
	public String viewKnowledgeDetail() throws Exception{
		knowledgeDetial=getServMgr().getFrontService().getKnowledgeDetial(id);
		return "viewKnowledgeDetail";
	}
	
	/**
	 * 全知识点评测-分类信息
	 */
	public String viewKnowledgeDivision() throws Exception{
		divisionList=getServMgr().getFrontService().getKnowLedgeDivision();
		konwledgeDivedList=getServMgr().getFrontService().getKonwledgeDivedList(id);
		return "viewKnowledgeDivision";
	}
	
	/**
	 * 奥数教育心得-主页
	 */
	public String viewExperience() throws Exception{
		experienceMap=getServMgr().getFrontService().getExperienceMap();
		return "viewExperience";
	}
	
	/**
	 * 奥数教育心得-具体项信息
	 */
	public String viewExperienceDetail() throws Exception{
		getServMgr().getFrontService().addExpClickTimes(id);
		experienceDetial=getServMgr().getFrontService().getExperienceDetial(id);
		
		return "viewExperienceDetail";
	}
	
	/**
	 * 奥数教育心得-分类信息
	 */
	public String viewExperienceDivision() throws Exception{
		divisionList=getServMgr().getFrontService().getExperienceDivision();
		experienceDivedList=getServMgr().getFrontService().getExperienceDivedList(id);
		return "viewExperienceDivision";
	}
	
	
	/**
	 * 奥数资料分享-主页
	 */
	public String shareData() throws Exception{
		this.setPageSize(20);
		shareDataMap=getServMgr().getFrontService().getShareDataMap();
		return "shareData";
	}
	
	/**
	 * 奥数资料分享分类具体信息
	 */
	public String viewShareDivision() throws Exception{
		divisionList=getServMgr().getFrontService().getShareDivision();
		shareDataDivedList=getServMgr().getFrontService().getShareDataDivedList(id);
		return "viewShareDivision";
	}
	
	/**
	 * 奥数资料下载次数+1
	 */
	public String addDataDownloadTimes() throws Exception{
		String divId = MapUtil.getStringFromMap(getParameters(), "divId");
		getServMgr().getFrontService().addDataDownloadTimes(divId);
		return null;
	}
	
	
	/**
	 * 显示公告详细内容
	 */
	public String viewNotice() throws Exception{
		noticeDetail=getServMgr().getFrontService().getNoticeInfo(id);
		return "viewNotice";
	}

	/**
	 * 主页-小升初咨询
	 */
	public String viewPrimaryConsulting() throws Exception{
		primaryConsultingMap=getServMgr().getFrontService().getPriConMap();
		checkCode=getServMgr().getFrontService().createCode();
		return "viewPrimaryConsulting";
	}
	
	/**
	 * 小升初咨询-发帖
	 */
	public String writePost() throws Exception{
		try {
			String ip = getRequest().getRemoteAddr();
			getServMgr().getFrontService().writeNewPost(this.getParameters(),ip);
			return "postSuccess";
		} catch (Exception e) {
			System.out.println(e);
			setResult(ERROR);
			addMessage("发帖发生异常");
			addRedirURL("返回", "javascript:history.go(-1)");
		}
		return EXECUTE_RESULT;
	}
	
	/**
	 * 小升初咨询-依据发帖ID List多有回帖
	 */
	public String viewRespondPost() throws Exception{
		respondList=getServMgr().getFrontService().getResopndPostById(id);
		return "viewRespondPost";
	}
	
	/**
	 * 小升初咨询-依据ID回帖
	 */
	public String respondPost() throws Exception{
		try {
			String ip = getRequest().getRemoteAddr();
			getServMgr().getFrontService().respondNewPost(this.getParameters(),ip);
			return "respondSuccess";
		} catch (Exception e) {
			System.out.println(e);
			setResult(ERROR);
			addMessage("回帖发生异常");
			addRedirURL("返回", "javascript:history.go(-1)");
		}
		return EXECUTE_RESULT;
	}
	
	/**
	 * 奥数方法认识
	 */
	public String viewMethod() throws Exception{
		methodMap=getServMgr().getFrontService().getMethodMap();
		return "viewMethod";
	}
	
	/**
	 * 奥数方法认识-依据ID得到详细信息
	 */
	public String viewMethodDetail() throws Exception{
		methodDetial=getServMgr().getFrontService().getMethodDetial(id);
		return "viewMethodDetail";
	}
	
	/**
	 * 初中学习
	 */
	public String viewJuniorStudy() throws Exception{
		juniorStudyMap=getServMgr().getFrontService().getJuniorStudyMap();
		return "viewJuniorStudy";
	}
	
	/**
	 * 关于我们
	 */
	public String aboutUs() throws Exception{
		aboutUs=getServMgr().getFrontService().getAboutUs();
		return "aboutUs";
	}

	/**
	 * 用户注册
	 */
	public String memberRegister() throws Exception {
		return "memberRegister";
	}
	
	/**
	 * 检查用户名是否存在
	 */
	public String checkMemberExist() throws Exception {
		boolean status = true;
		String userName = MapUtil.getStringFromMap(getParameters(), "userName");
		if (userName!="" & getServMgr().getFrontService().checkMemberExist(userName)==0) {
			status = true;
		} else {
			status = false;
		}
		JSONObject result = new JSONObject();
		result.put("status", status);
		json = new JsonView(result);
		return SUCCESS;
	}
	
	
	/**
	 * 检查两次输入密码是否匹配
	 */
	public String checkPassword() throws Exception {
		boolean status = true;
		String pwd1 = MapUtil.getStringFromMap(getParameters(), "pwd1");
		String pwd2 = MapUtil.getStringFromMap(getParameters(), "pwd2");
		if (pwd1.equals(pwd2)& pwd1!="" & pwd2!="") {
			status = true;
		} else {
			status = false;
		}
		JSONObject result = new JSONObject();
		result.put("status", status);
		json = new JsonView(result);
		return SUCCESS;
	}
	
	/**
	 * 添加用户
	 */
	public String addMember() throws Exception {
		boolean status = true;
		int checkResult;
		checkResult=getServMgr().getFrontService().addMember(getParameters());
		if (checkResult==1) {
			status = true;
		} else {
			status = false;
		}
		JSONObject result = new JSONObject();
		result.put("status", status);
		json = new JsonView(result);
		return SUCCESS;
	}
	

	/**
	 * 获得浏览器语言类型
	 */
	public static String getLocaleFromBrowser() {
		String locale = ServletActionContext.getRequest().getLocale().toString();
		if ("ja".equals(locale) || "ja_JP".equals(locale) || "ja_jp".equals(locale) || "jp".equals(locale)
				|| "jp_JP".equals(locale) || "jp_jp".equals(locale)) {
			locale = "ja_JP";
		}
		return locale;
	}

	/**
	 * 获得前台页面用户请求的Action的名字
	 */
	public static String getActionNameFromURL() {
		String uri = ServletActionContext.getRequest().getRequestURI();
		int begin = uri.lastIndexOf("/");
		int end = uri.lastIndexOf(".");
		String actionName = uri.substring(begin + 1, end);
		return actionName;
	}

	/**
	 * 前台页面获取系统日期
	 */
	public static String getTime() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(new Date());
		return date.toString();
	}


	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Map getIndexMap() {
		return indexMap;
	}

	public List getNoticeDetail() {
		return noticeDetail;
	}

	public Map getKnowledgeMap() {
		return knowledgeMap;
	}

	public Map getShareDataMap() {
		return shareDataMap;
	}

	public List getDivisionList() {
		return divisionList;
	}

	public List getKnowledgeDetial() {
		return knowledgeDetial;
	}

	public PagingList getShareDataDivedList() {
		return shareDataDivedList;
	}

	public PagingList getKonwledgeDivedList() {
		return konwledgeDivedList;
	}

	public Map getPrimaryConsultingMap() {
		return primaryConsultingMap;
	}

	public List getRespondList() {
		return respondList;
	}

	public Map getMethodMap() {
		return methodMap;
	}

	public List getMethodDetial() {
		return methodDetial;
	}

	public Map getJuniorStudyMap() {
		return juniorStudyMap;
	}

	public Map getExperienceMap() {
		return experienceMap;
	}

	public PagingList getExperienceDivedList() {
		return experienceDivedList;
	}

	public List getExperienceDetial() {
		return experienceDetial;
	}
	
	public JsonView getJson() {
		return json;
	}

	public List getAboutUs() {
		return aboutUs;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}


}

