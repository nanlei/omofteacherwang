package neo.app.action.admin;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class DataAction extends BaseAction {
	// 数据资料相关
	private PagingList dataList;
	private String id;
	private Map dataMap;

	// 上传相关
	private File data;
	private String dataFileName;

	// 分类相关
	private PagingList categoryList;
	private List categorys;
	private Map categoryMap;
	private String categoryId;

	public PagingList getDataList() {
		return dataList;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Map getDataMap() {
		return dataMap;
	}

	public void setData(File data) {
		this.data = data;
	}

	public void setDataFileName(String dataFileName) {
		this.dataFileName = dataFileName;
	}

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

	/**
	 * 获取资料列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		dataList = getServMgr().getDataService().getDatas();
		categorys = getServMgr().getDataService().getCatagorys();
		return "list";
	}

	/**
	 * 添加资料
	 * 
	 * @return
	 */
	public String addData() {
		try {
			if (data != null) {// 文件上传
				// 上传数据准备
				long nowTime = new Date().getTime();
				int pot = dataFileName.lastIndexOf(".");
				String ext = null;
				// 取扩展名
				if (pot != -1) {
					String tmp = dataFileName.substring(pot);
					ext = tmp.substring(1, tmp.length());
				} else {
					ext = "";
				}
				String filePath = "/fileUpload/" + nowTime + "." + ext;
				String URL = getServletContext().getRealPath(filePath);
				// 文件上传
				data.renameTo(new File(URL));
				// 写数据库
				getServMgr().getDataService().addData(getParameters(),
						getLoginUserId(), filePath);
				addMessage("资料添加成功");
				addRedirURL("返回", "list.action");
			} else {
				setResult(ERROR);
				addMessage("请选择要上传的文件");
				addRedirURL("返回", "@back");
			}
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("资料添加失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 获取资料信息供修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String preUpdate() throws Exception {
		dataMap = getServMgr().getDataService().getDataById(id);
		categorys = getServMgr().getDataService().getCatagorys();
		return "preUpdate";
	}

	/**
	 * 更新奥数资料
	 * 
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception {
		try {
			Map map = getServMgr().getDataService().getDataById(id);
			if (data != null) {
				// 上传数据准备
				long nowTime = new Date().getTime();
				int pot = dataFileName.lastIndexOf(".");
				String ext = null;
				// 取扩展名
				if (pot != -1) {
					String tmp = dataFileName.substring(pot);
					ext = tmp.substring(1, tmp.length());
				} else {
					ext = "";
				}
				String filePath = "/fileUpload/" + nowTime + "." + ext;
				String URL = getServletContext().getRealPath(filePath);
				// 删除老文件
				File file = new File(getServletContext().getRealPath(
						(String) map.get("URL")));
				file.delete();
				// 文件上传
				data.renameTo(new File(URL));
				// 写数据库
				getServMgr().getDataService().updateDataById(getParameters(),
						filePath, id);
			} else {
				// 直接写数据库
				getServMgr().getDataService().updateDataById(getParameters(),
						(String) map.get("URL"), id);

			}
			addMessage("资料更新成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("资料更新失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 删除资料
	 * 
	 * @return
	 */
	public String delete() {
		try {
			Map map = getServMgr().getDataService().getDataById(id);
			File file = new File(getServletContext().getRealPath(
					(String) map.get("URL")));
			file.delete();
			getServMgr().getDataService().deleteDataById(id);
			// 删除文件
			addMessage("资料删除成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("资料删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 搜索资料
	 * 
	 * @return
	 * @throws Exception
	 */
	public String search() throws Exception {
		dataList = getServMgr().getDataService()
				.getDataByDivId(getParameters());
		categorys = getServMgr().getDataService().getCatagorys();
		return "search";
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
