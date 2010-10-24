package neo.app.action;

import java.util.Map;

import neo.app.service.ServiceManager;
import neo.core.Constants;
import neo.core.bean.BeanManager;
import neo.core.common.CommonBaseAction;
import neo.core.util.CommonUtil;

import org.apache.struts2.ServletActionContext;

public class BaseAction extends CommonBaseAction {
	/**
	 * 获取MD5加密结果
	 * 
	 * @param str
	 * @return
	 */
	public String getMD5Code(String str) {
		return CommonUtil.getMD5ofStr(str);
	}

	/**
	 * ServiceManager
	 */
	public ServiceManager getServMgr() {
		return (ServiceManager) BeanManager.getBean("serviceManager");
	}

	/**
	 * 获取用户提交的方式POST或者GET
	 */
	public String getClientMethod() {
		String method = ServletActionContext.getRequest().getMethod();
		return method;
	}

	/**
	 * 获取登录用户对象
	 */
	public Map getLoginUser() {
		return (Map) getSession().get(Constants.LOGIN_USER);
	}

	/**
	 * 获取登录用户ID
	 */
	public String getLoginUserId() {
		Map user = getLoginUser();
		if (user != null) {
			return user.get("ID").toString();
		}
		return null;
	}

	/**
	 * 获取登录用户名
	 */
	public String getLoginUserName() {
		Map user = getLoginUser();
		if (user != null) {
			return (String) user.get("USERNAME");
		}
		return null;
	}

	/**
	 * 获取用户真实姓名
	 */
	public String getLoginUserRealName() {
		Map user = getLoginUser();
		if (user != null) {
			return (String) user.get("REALNAME");
		}
		return null;
	}

	/**
	 * 获取登录用户的密码
	 */
	public String getLoginUserPassword() {
		Map user = getLoginUser();
		if (user != null) {
			return (String) user.get("PASSWORD");
		}
		return null;
	}

	/**
	 * 获取IP
	 * 
	 * @return
	 */
	public String getIP() {
		return getRequest().getRemoteAddr();
	}

	/**
	 * 判断用户是否有管理员操作权限 ,默认userRole为1时是管理员
	 */
	public boolean isAccess(String roleId) {
		if (!"0".equals(roleId)) {
			return true;
		} else {
			return false;
		}
	}

}
