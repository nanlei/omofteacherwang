package neo.app.action.admin;

import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class KnowledgeAction extends BaseAction {

	// 分类相关
	private PagingList categoryList;
	private String categoryId;
	private Map categoryMap;

	public PagingList getCategoryList() {
		return categoryList;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public Map getCategoryMap() {
		return categoryMap;
	}

	/**
	 * 获取分类列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String categoryList() throws Exception {
		categoryList = getServMgr().getKnowledgeService().getAllCategorys();
		return "categoryList";
	}

	/**
	 * 添加分类
	 * 
	 * @return
	 */
	public String addCategory() {
		String ip = getRequest().getRemoteAddr();
		try {
			getServMgr().getKnowledgeService().addCatrgory(getParameters(), ip);
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
		categoryMap = getServMgr().getKnowledgeService()
				.getKnowledgeCategoryById(categoryId);
		return "preUpdate";
	}

	/**
	 * 修改分类信息
	 * 
	 * @return
	 */
	public String updateCategory() {
		String ip = getRequest().getRemoteAddr();
		try {
			getServMgr().getKnowledgeService().updateKnowledgeCategoryById(
					getParameters(), ip, categoryId);
			addMessage("知识分类信息修改成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("知识分类信息修改失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 删除分类信息
	 * 
	 * @return
	 */
	public String deleteCategory() {
		int num = getServMgr().getKnowledgeService().getNumByCategoryId(
				categoryId);
		try {
			if (num > 0) {
				setResult(ERROR);
				addMessage("知识分类含有信息，不能删除");
				addRedirURL("返回", "@back");
			} else {
				getServMgr().getKnowledgeService().deleteCategoryById(
						categoryId);
				addMessage("知识分类删除成功");
				addRedirURL("返回", "list.action");
			}
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("知识分类删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
}
