package neo.app.action.admin;

import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class JuniorAction extends BaseAction {
	private PagingList juniorList;
	private String id;
	private Map juniorMap;

	public PagingList getJuniorList() {
		return juniorList;
	}

	public Map getJuniorMap() {
		return juniorMap;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 返回初中学习信息列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		juniorList = getServMgr().getJuniorService().getAllJunior();
		return "list";
	}

	/**
	 * 添加初中学习信息
	 * 
	 * @return
	 */
	public String addJunior() {
		try {
			getServMgr().getJuniorService().addJunior(getParameters(),
					getLoginUserId());
			addMessage("初中学习信息添加成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("初中学习信息添加失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 根据ID获取初中学习信息供修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String preUpdate() throws Exception {
		juniorMap = getServMgr().getJuniorService().getJuniorById(id);
		return "preUpdate";
	}

	/**
	 * 修改初中学习信息
	 * 
	 * @return
	 */
	public String update() {
		try {
			getServMgr().getJuniorService().updateJuniorById(getParameters(),
					id);
			addMessage("初中学习信息修改成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("初中学习信息修改失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 删除初中学习
	 * 
	 * @return
	 */
	public String delete() {
		try {
			getServMgr().getJuniorService().deleteJuniorById(id);
			addMessage("初中学习信息删除成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("初中学习信息删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
}
