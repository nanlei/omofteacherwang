package neo.app.action.admin;

import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.Constants;
import neo.core.common.PagingList;
import neo.core.util.CommonUtil;

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
	// 显示信息
	private PagingList teacherList;

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
	public String adminLogout() {
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
	public String list() {
		teacherList = getServMgr().getUserService().getAllTeachers();
		return "list";
	}
}
