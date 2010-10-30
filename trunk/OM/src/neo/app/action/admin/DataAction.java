package neo.app.action.admin;

import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class DataAction extends BaseAction {
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
		categoryList = getServMgr().getDataService().getAllCategory();
		return "categoryList";
	}

	/**
	 * 添加分类
	 * 
	 * @return
	 */
	public String addCategory() {
		try {
			getServMgr().getDataService().addCategory(getParameters(), getIP());
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
	 * 获取分类信息供修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String preUpdateCategory() throws Exception {
		categoryMap = getServMgr().getDataService().getCategoryById(categoryId);
		return "preUpdate";
	}

	/**
	 * 修改分类信息
	 * 
	 * @return
	 */
	public String updateCategory() {
		try {
			getServMgr().getDataService().updateCategoryById(getParameters(),
					getIP(), categoryId);
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
			int num = getServMgr().getDataService().getNumByCategoryId(
					categoryId);
			if (num > 0) {
				setResult(ERROR);
				addMessage("分类含有信息，不能删除");
				addRedirURL("返回", "@back");
			} else {
				getServMgr().getDataService().deleteCategoryById(categoryId);
				addMessage("分类删除成功");
				addRedirURL("返回", "list.action");
			}
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("分类删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
}
