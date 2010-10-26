package neo.app.action.admin;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class MethodAction extends BaseAction {
	private PagingList methodList;

	public PagingList getMethodList() {
		return methodList;
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
}
