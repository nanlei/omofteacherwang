package neo.app.action.admin;

import java.util.Map;

import neo.app.action.BaseAction;

public class AboutAction extends BaseAction {
	private Map aboutMap;

	public Map getAboutMap() {
		return aboutMap;
	}

	/**
	 * 获取工作室信息
	 * 
	 * @return
	 */
	public String index() throws Exception {
		aboutMap = getServMgr().getAboutService().getAbout();
		return "index";
	}

	/**
	 * 更新工作室信息
	 * 
	 * @return
	 */
	public String update() {
		try {
			getServMgr().getAboutService().updateAbout(getParameters(),
					getRequest().getRemoteAddr());
			addMessage("信息修改成功");
			addRedirURL("返回", "index.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("信息修改失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
}
