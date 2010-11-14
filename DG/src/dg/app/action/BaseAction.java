package dg.app.action;

import java.util.Map;

import org.apache.struts2.ServletActionContext;

import dg.app.service.AdminServiceManager;
import dg.app.service.ServiceManager;
import dg.core.Constants;
import dg.core.bean.BeanManager;
import dg.core.common.CommonBaseAction;
import dg.core.util.CommonUtil;

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
	 * 获取后台用的ServiceManager
	 * 
	 * @return
	 */
	public AdminServiceManager getAdminServMgr() {
		return (AdminServiceManager) BeanManager.getBean("adminServiceManager");
	}

	/**
	 * 获取前台用的 ServiceManager
	 * 
	 * @return
	 */
	public ServiceManager getServMgr() {
		return (ServiceManager) BeanManager.getBean("serviceManager");
	}

	/**
	 * 获取用户提交的方式POST或者GET
	 * 
	 * @return
	 */
	public String getClientMethod() {
		String method = ServletActionContext.getRequest().getMethod();
		return method;
	}

	/**
	 * 获取登录用户对象
	 * 
	 * @return
	 */
	public Map getLoginUser() {
		return (Map) getSession().get(Constants.LOGIN_USER);
	}

	/**
	 * 获取登录用户ID
	 * 
	 * @return
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
	 * 
	 * @return
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
	 * 
	 * @return
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
	 * 
	 * @return
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
	 * 
	 * @param roleId
	 * @return
	 */
	public boolean isAccess(String ROLEID) {
		if (!"0".equals(ROLEID)) {
			return true;
		} else {
			return false;
		}
	}

}
