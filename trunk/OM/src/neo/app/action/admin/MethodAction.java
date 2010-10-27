package neo.app.action.admin;

import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class MethodAction extends BaseAction {
	private PagingList methodList;
	private Map methodMap;
	private String id;

	public PagingList getMethodList() {
		return methodList;
	}

	public Map getMethodMap() {
		return methodMap;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 获取奥数方法列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		methodList = getServMgr().getMethodService().getAllMethods();
		return "list";
	}

	/**
	 * 添加奥数方法
	 * 
	 * @return
	 */
	public String addMethod() {
		try {
			getServMgr().getMethodService().addMethod(getParameters(),
					getLoginUserId(), getIP());
			addMessage("奥数方法添加成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("奥数方法添加失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 获取一条方法信息供修改
	 * 
	 * @return
	 */
	public String preUpdate() {
		methodMap = getServMgr().getMethodService().getMethodById(id);
		return "preUpdate";
	}

	/**
	 * 更新奥数方法
	 * 
	 * @return
	 */
	public String update() {
		try {
			getServMgr().getMethodService().updateMethodById(getParameters(),
					id);
			addMessage("奥数方法更新成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("奥数方法更新失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 删除奥数方法
	 * 
	 * @return
	 */
	public String delete() {
		try {
			getServMgr().getMethodService().deleteMethodById(id);
			addMessage("奥数方法删除成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("奥数方法删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
}
