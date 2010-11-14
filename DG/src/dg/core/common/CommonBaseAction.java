package dg.core.common;

import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.InputSource;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import dg.core.Constants;
import dg.core.util.CommonUtil;
import dg.core.util.MapUtil;
import dg.core.util.QueryUtil;
import freemarker.ext.dom.NodeModel;

/**
 * Struts2的Action基类
 * 
 * @author Nanlei
 * 
 */
public class CommonBaseAction implements Action {
	/* 日志 */
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	/* 默认返回SUCCESS */
	public String execute() throws Exception {
		return SUCCESS;
	}

	/* 通用操作结果返回页 */
	public static final String EXECUTE_RESULT = Constants.EXECUTE_RESULT;

	private ExecuteResult executeResult;

	private ExecuteResult buildExecuteResult() {
		if (executeResult == null) {
			executeResult = new ExecuteResult();
			getSession().put(EXECUTE_RESULT, executeResult);
		}
		return executeResult;
	}

	public void setResult(String result) {
		buildExecuteResult().setResult(result);
	}

	public void addMessage(String message) {
		buildExecuteResult().addMessage(message);
	}

	public void addRedirURL(String desc, String url) {
		buildExecuteResult().addRedirURL(desc, url);
	}

	public ExecuteResult getExecuteResult() {
		return (ExecuteResult) getSession().get(EXECUTE_RESULT);
	}

	/* 获取基本环境 */
	public Map getParameters() {
		return ActionContext.getContext().getParameters();
	} // 封装为Map的request parameters

	public Map getSession() {
		return ActionContext.getContext().getSession();
	} // 封装为Map的session attributes

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	} // 原始的request

	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	} // 原始的response

	public ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	} // 原始的ServletContext

	/* 获取处理后的环境 */
	public Map getNaturalParameters() {
		return MapUtil.getNaturalValueMap(getParameters());
	}

	/* 分页信息 */
	protected int pageNum = 1;

	protected int pageSize = Constants.DEFAULT_PAGE_SIZE;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getMaxPageSize() {
		return Constants.MAX_PAGE_SIZE;
	}

	public int getDefaultPageSize() {
		return Constants.DEFAULT_PAGE_SIZE;
	}

	public String getQueryStringWithoutPageNum() {
		Map m = getParameters();
		m.remove("pageNum");
		return QueryUtil.getQueryString(m);
	}

	public String getFullUrlWithoutPageNum() {
		return getRequest().getServletPath() + "?"
				+ getQueryStringWithoutPageNum();
	}

	public String getQueryStringWithoutPageInfo() {
		Map m = getParameters();
		m.remove("pageNum");
		m.remove("pageSize");
		return QueryUtil.getQueryString(m);
	}

	public String getFullUrlWithoutPageInfo() {
		return getRequest().getServletPath() + "?"
				+ getQueryStringWithoutPageInfo();
	}

	/* 记录当前页面作为返回地址 */
	public void setReferUrl() {
		setReferUrl(Constants.REFER_URL_DEFAULT_KEY);
	}

	public String getReferUrl() {
		return getReferUrl(Constants.REFER_URL_DEFAULT_KEY);
	}

	public String getFullReferUrl() {
		return getFullReferUrl(Constants.REFER_URL_DEFAULT_KEY);
	}

	public void setReferUrl(String key) {
		Map referUrlMap = (Map) getSession().get(Constants.REFER_URL);
		if (referUrlMap == null) {
			referUrlMap = new HashMap();
		}
		String currUrl = QueryUtil.getRequestURL(getRequest());
		referUrlMap.put(key, currUrl);
		getSession().put(Constants.REFER_URL, referUrlMap);
	}

	public String getReferUrl(String key) {
		Map referUrlMap = (Map) getSession().get(Constants.REFER_URL);
		if (referUrlMap == null) {
			return "";
		}
		return referUrlMap.get(key) == null ? "" : (String) referUrlMap
				.get(key);
	}

	public String getFullReferUrl(String key) {
		return getRequest().getContextPath() + getReferUrl(key);
	}

	/* 工具类方法 */
	public Date getNow() {
		return new Date();
	}

	private static SimpleDateFormat fileFormatter = new SimpleDateFormat(
			"yyyyMMddHHmmssSSS");

	// 获取格式化后的日期（到毫秒）
	public String getNowString() {
		return fileFormatter.format(getNow());
	}

	public String substring(String str, int toCount, String suffix) {
		return CommonUtil.substring(str, toCount, suffix);
	}

	/* 将文本转换为Freemarker可使用的XML节点 */
	public NodeModel getXml(String text) throws Exception {
		return NodeModel.parse(new InputSource(new StringReader(text)));
	}

	/* JSON数据 */
	private String jsonString;

	public String getJsonString() {
		return jsonString;
	}

	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

	/* 通用JSON结果返回页 */
	public static final String JSON_RESULT = Constants.JSON_RESULT;

	/* 非法请求结果返回页 */
	public static final String BAD_REQUEST = Constants.BAD_REQUEST;
}