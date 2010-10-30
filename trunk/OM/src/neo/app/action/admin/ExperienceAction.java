package neo.app.action.admin;

import java.util.List;
import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class ExperienceAction extends BaseAction {
	// 教育心得相关
	private PagingList experienceList;
	private List categorys;
	private Map experienceMap;
	private String id;
	// 分类相关
	private PagingList categoryList;
	private Map categoryMap;
	private String categoryId;

	public PagingList getCategoryList() {
		return categoryList;
	}

	public List getCategorys() {
		return categorys;
	}

	public Map getCategoryMap() {
		return categoryMap;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public PagingList getExperienceList() {
		return experienceList;
	}

	public Map getExperienceMap() {
		return experienceMap;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 获取所有教育心得
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		experienceList = getServMgr().getExperienceService().getAllExperience();
		categorys = getServMgr().getExperienceService().getCategorys();
		return "list";
	}

	/**
	 * 添加教育心得
	 * 
	 * @return
	 */
	public String addExperience() {
		try {
			getServMgr().getExperienceService().addExperience(getParameters(),
					getIP());
			addMessage("教育心得添加成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("教育心得添加失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 获取教育心得供修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String preUpdate() throws Exception {
		experienceMap = getServMgr().getExperienceService().getExperienceById(
				id);
		categorys = getServMgr().getExperienceService().getCategorys();
		return "preUpdate";
	}

	/**
	 * 修改教育心得
	 * 
	 * @return
	 */
	public String update() {
		try {
			getServMgr().getExperienceService().updateExperienceById(
					getParameters(), getIP(), id);
			addMessage("教育心得修改成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("教育心得修改失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 删除教育心得
	 * 
	 * @return
	 */
	public String delete() {
		try {
			getServMgr().getExperienceService().deleteEexperienceById(id);
			addMessage("教育心得删除成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("教育心得删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
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
	public String preUpdateCategory() throws Exception {
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
			int num = getServMgr().getExperienceService().getNumByCategoryId(
					categoryId);
			if (num > 0) {
				setResult(ERROR);
				addMessage("知识分类含有信息，不能删除");
				addRedirURL("返回", "@back");
			} else {
				getServMgr().getExperienceService().deleteCategoryById(
						categoryId);
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
