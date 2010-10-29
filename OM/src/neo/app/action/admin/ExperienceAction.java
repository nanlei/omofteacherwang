package neo.app.action.admin;

import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class ExperienceAction extends BaseAction {
	// 分类相关
	private PagingList categoryList;
	private Map categoryMap;
	private String categoryId;

	public PagingList getCategoryList() {
		return categoryList;
	}

	public Map getCategoryMap() {
		return categoryMap;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
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

	/**
	 * 获取分类详情供修改
	 * 
	 * @return
	 */
	public String preUpdateCategory() {
		categoryMap = getServMgr().getExperienceService().getCategoryById(
				categoryId);
		return "preUpdate";
	}

	/**
	 * 更新分类详情
	 * 
	 * @return
	 */
	public String updateCategory() {
		try {
			getServMgr().getExperienceService().updateCategoryById(
					getParameters(), getIP(), categoryId);
			addMessage("分类修改成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("分类修改失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 删除分类
	 * 
	 * @return
	 */
	public String deleteCategory() {
		try {
			getServMgr().getExperienceService().deleteCategoryById(categoryId);
			addMessage("分类删除成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("分类删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
}
