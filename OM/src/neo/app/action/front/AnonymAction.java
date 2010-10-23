package neo.app.action.front;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import neo.app.action.BaseAction;
import neo.core.common.Anonymous;

public class AnonymAction extends BaseAction implements Anonymous {
	//获取客户端浏览器语言，用户请求action和系统时间
	private String locale;
	private String actionName;
	private String date;
	//主页公告相关
	private Map indexMap;
	private String id;
	private List noticeInfo;

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
	 * 显示公告详细内容
	 */
	public String viewNotice() throws Exception{
		noticeInfo=getServMgr().getFrontService().getNoticeInfo(id);
		return "viewNotice";
	}

	/**
	 * 后台跳转
	 */
	public String manage() throws Exception {
		return "manage";
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

	public List getNoticeInfo() {
		return noticeInfo;
	}
}

