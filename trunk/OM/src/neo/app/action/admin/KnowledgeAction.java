package neo.app.action.admin;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class KnowledgeAction extends BaseAction {
	// 知识信息相关
	private PagingList knowledgeList;
	private List categorys;
	private String id;
	private Map knowledgeMap;

	// 文件上传相关
	private File attachment;
	private String attachmentFileName;

	// 分类相关
	private PagingList categoryList;
	private String categoryId;
	private Map categoryMap;

	public PagingList getKnowledgeList() {
		return knowledgeList;
	}

	public List getCategorys() {
		return categorys;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Map getKnowledgeMap() {
		return knowledgeMap;
	}

	public void setAttachment(File attachment) {
		this.attachment = attachment;
	}

	public void setAttachmentFileName(String attachmentFileName) {
		this.attachmentFileName = attachmentFileName;
	}

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
	 * 获取知识列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		knowledgeList = getServMgr().getKnowledgeService().getAllKnowledges();
		categorys = getServMgr().getKnowledgeService()
				.getAllCategoryForSelect();
		return "list";
	}

	/**
	 * 添加知识，带文件上传
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addKnowledge() throws Exception {
		String ip = getRequest().getRemoteAddr();
		try {
			if (attachment != null) {// 处理上传
				// 上传数据准备
				long nowTime = new Date().getTime();
				int pot = attachmentFileName.lastIndexOf(".");
				String ext = null;
				// 取扩展名
				if (pot != -1) {
					String tmp = attachmentFileName.substring(pot);
					ext = tmp.substring(1, tmp.length());
				} else {
					ext = "";
				}
				String filePath = "/fileUpload/" + nowTime + "." + ext;
				String URL = getServletContext().getRealPath(filePath);
				// 文件上传
				attachment.renameTo(new File(URL));
				// 写数据库
				getServMgr().getKnowledgeService().addKnowledge(
						getParameters(), filePath, ip);
			} else {// 无文件上传
				getServMgr().getKnowledgeService().addKnowledge(
						getParameters(), "", ip);
			}
			addMessage("知识点添加成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("知识点添加失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 获取知识点内容供修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String preUpdate() throws Exception {
		knowledgeMap = getServMgr().getKnowledgeService().getKnowledgeById(id);
		categorys = getServMgr().getKnowledgeService()
				.getAllCategoryForSelect();
		return "preUpdate";
	}

	/**
	 * 更新知识点信息
	 * 
	 * @return
	 */
	public String update() {
		String ip = getRequest().getRemoteAddr();
		try {
			Map map = getServMgr().getKnowledgeService().getKnowledgeById(id);
			if (attachment != null) {// 处理上传
				// 删除老文件
				File file = new File(getServletContext().getRealPath(
						(String) map.get("URL")));
				boolean flag = false;
				if (StringUtils.isNotEmpty((String) map.get("URL"))) {
					flag = file.delete();
				} else {
					flag = true;
				}
				if (flag) {
					// 上传数据准备
					long nowTime = new Date().getTime();
					int pot = attachmentFileName.lastIndexOf(".");
					String ext = null;
					// 取扩展名
					if (pot != -1) {
						String tmp = attachmentFileName.substring(pot);
						ext = tmp.substring(1, tmp.length());
					} else {
						ext = "";
					}
					String filePath = "/fileUpload/" + nowTime + "." + ext;
					String URL = getServletContext().getRealPath(filePath);
					// 文件上传
					attachment.renameTo(new File(URL));
					// 写数据库
					getServMgr().getKnowledgeService().updateKnowledgeById(
							getParameters(), filePath, ip, id);
					addMessage("知识点更新成功");
					addRedirURL("返回", "list.action");
				} else {
					setResult(ERROR);
					addMessage("原文件删除失败，请重新操作");
					addRedirURL("返回", "@back");
				}
			} else {
				// 写数据库
				getServMgr().getKnowledgeService().updateKnowledgeById(
						getParameters(),
						StringUtils.isEmpty((String) map.get("URL")) ? ""
								: (String) map.get("URL"), ip, id);
				addMessage("知识点更新成功");
				addRedirURL("返回", "list.action");
			}
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("知识点更新失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 删除附件
	 * 
	 * @return
	 */
	public String deleteAttachment() {
		try {
			Map map = getServMgr().getKnowledgeService().getKnowledgeById(id);
			File file = new File(getServletContext().getRealPath(
					(String) map.get("URL")));
			boolean flag = file.delete();
			if (flag) {
				// 更新数据库
				getServMgr().getKnowledgeService().deleteAttachmentById(id);
				addMessage("附件删除成功");
				addRedirURL("返回", "list.action");
			} else {
				setResult(ERROR);
				addMessage("附件删除失败");
				addRedirURL("返回", "@back");
			}
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("附件删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 删除知识点信息
	 * 
	 * @return
	 */
	public String delete() {
		try {
			Map map = getServMgr().getKnowledgeService().getKnowledgeById(id);
			if (StringUtils.isNotEmpty((String) map.get("URL"))) {
				File file = new File(getServletContext().getRealPath(
						(String) map.get("URL")));
				file.delete();
			}
			getServMgr().getKnowledgeService().deleteKnowledgeById(id);
			addMessage("知识点删除成功");
			addRedirURL("返回", "list.action");
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("知识点删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 按分类查找知识点
	 * 
	 * @return
	 * @throws Exception
	 */
	public String searchKnowledge() throws Exception {
		knowledgeList = getServMgr().getKnowledgeService()
				.getKnowledgeByCategoryId(categoryId);
		categorys = getServMgr().getKnowledgeService()
				.getAllCategoryForSelect();
		return "searchKnowledge";
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
