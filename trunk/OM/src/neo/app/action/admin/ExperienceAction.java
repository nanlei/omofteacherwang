package neo.app.action.admin;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class ExperienceAction extends BaseAction {
	// 分类相关
	private PagingList categoryList;

	public PagingList getCategoryList() {
		return categoryList;
	}

	/**
	 * 获取分类列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String categoryList() throws Exception {
		categoryList = getServMgr().getExperienceService().getAllCategory();
		return "list";
	}

	/**
	 * 添加分类
	 * 
	 * @return
	 */
	public String addCategory() {
		try {
			getServMgr().getExperienceService().addCategory(getParameters(),
					getIP());
			addMessage("分类添加成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("分类添加失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
}
