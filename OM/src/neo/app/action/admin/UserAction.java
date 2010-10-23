package neo.app.action.admin;

import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.Constants;
import neo.core.common.PagingList;
import neo.core.util.CommonUtil;
import neo.core.util.MapUtil;
import neo.core.util.json.JsonView;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;

public class UserAction extends BaseAction {

	private static final String NOT_EXISTS = "该用户不存在";// 用户不存在
	private static final String WRONG_PASS = "密码错误";// 密码错误
	private static final String LOGIN_ERROR = "登录过程发生异常，请刷新页面后重试";// 登录异常，刷新重试
	// 登录的系统信息
	private String errorInfo = null;// 页面显示的错误信息
	private String indexUrl;// 记录上一次操作页面的地址

	// 登录用户的信息
	private String userName;// 用户名
	private String password;// 密码
	// 查找相关信息
	private String id;// 主键ID
	// 显示信息
	private PagingList teacherList;// 分页的列表
	private Map teacherInfo;// 一条记录的Map

	// AJAX请求返回内容
	private JsonView json;

	public String getErrorInfo() {
		return errorInfo;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public PagingList getTeacherList() {
		return teacherList;
	}

	public Map getTeacherInfo() {
		return teacherInfo;
	}

	public void setId(String id) {
		this.id = id;
	}

	public JsonView getJson() {
		return json;
	}

	/**
	 * 后台登录的方法
	 * 
	 * @return
	 */
	public String adminLogin() {
		try {
			Map dbUser = getServMgr().getUserService().getUserByUserName(
					userName);
			String md5Pwd = CommonUtil.getMD5ofStr(password);
			// 验证登录信息
			if (dbUser != null
					&& md5Pwd.equals((String) dbUser.get("PASSWORD"))) {
				indexUrl = (String) getSession().remove(Constants.ORIGINAL_URL);
				// 清除原始的session信息
				getSession().clear();
				getSession().put(Constants.LOGIN_USER, dbUser);
				// 未记录该地址则转向首页
				if (indexUrl == null) {
					return "homepage";
				}
				return SUCCESS;
			}
			// 以下是登录不成功的情况
			if (dbUser == null) {
				errorInfo = NOT_EXISTS;
				return ERROR;
			}
			if (!md5Pwd.equals((String) dbUser.get("PASSWORD"))) {
				errorInfo = WRONG_PASS;
				return ERROR;
			}
		} catch (Exception e) {
			e.printStackTrace();
			errorInfo = LOGIN_ERROR;
			return ERROR;
		}
		return ERROR;
	}

	/**
	 * 退出系统
	 * 
	 * @return
	 */
	public String adminLogout() throws Exception {
		getSession().remove(Constants.LOGIN_USER);
		getSession().remove(Constants.ORIGINAL_URL);
		getSession().clear();
		return SUCCESS;
	}

	/**
	 * 用户列表
	 * 
	 * @return
	 */
	public String list() throws Exception {
		teacherList = getServMgr().getUserService().getAllTeachers();
		return "list";
	}

	/**
	 * 添加教师用户
	 * 
	 * @return
	 */
	public String addTeacher() {
		try {
			getServMgr().getUserService().addTeacher(getParameters());
			addMessage("用户添加成功");
			addRedirURL("返回列表", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("用户添加失败，请检查数据后继续");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 根据ID获取用户信息
	 * 
	 * @return
	 */
	public String preUpdate() throws Exception {
		teacherInfo = getServMgr().getUserService().getTeacherById(id);
		return "preUpdate";
	}

	/**
	 * 更新用户信息
	 * 
	 * @return
	 */
	public String update() {
		try {
			getServMgr().getUserService().updateTeacherById(getParameters());
			addMessage("用户信息修改成功");
			addRedirURL("返回列表", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("用户信息修改失败，请检查数据后继续");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 检查用户原密码
	 * 
	 * @return
	 */
	public String checkPassword() throws Exception {
		boolean status = true;
		String now = MapUtil.getStringFromMap(getParameters(), "now");
		if (getLoginUserPassword().equals(CommonUtil.getMD5ofStr(now))) {
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
	 * 修改密码
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updatePassword() throws Exception {
		String password = MapUtil.getStringFromMap(getParameters(), "password");
		String password2 = MapUtil.getStringFromMap(getParameters(),
				"password2");
		JSONObject result = new JSONObject();
		boolean status = true;
		if (StringUtils.isNotEmpty(password) && password.equals(password2)) {// 更新
			getServMgr().getUserService().updatePasswordById(
					CommonUtil.getMD5ofStr(password), getLoginUserId());
			status = true;
		} else {
			status = false;
		}
		result.put("status", status);
		json = new JsonView(result);
		return SUCCESS;
	}
}
