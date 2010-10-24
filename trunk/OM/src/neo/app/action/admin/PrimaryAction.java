package neo.app.action.admin;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class PrimaryAction extends BaseAction {
	private PagingList primaryList;

	public PagingList getPrimaryList() {
		return primaryList;
	}

	/**
	 * 获取咨询列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		primaryList = getServMgr().getPrimaryService().getAllConsulting();
		return "list";
	}

	/**
	 * 添加咨询
	 * 
	 * @return
	 */
	public String addConsulting() {
		try {
			getServMgr().getPrimaryService().addConsulting(getParameters(),
					getLoginUserName(), getIP());
			addMessage("咨询添加成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("咨询添加失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

}
