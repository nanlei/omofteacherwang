package neo.app.action.admin;

import java.util.Map;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

public class PrimaryAction extends BaseAction {
	private PagingList primaryList;
	private Map primaryMap;
	private PagingList postList;
	private String id;
	private String postId;

	public PagingList getPrimaryList() {
		return primaryList;
	}

	public Map getPrimaryMap() {
		return primaryMap;
	}

	public PagingList getPostList() {
		return postList;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPostId(String postId) {
		this.postId = postId;
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

	/**
	 * 咨询详情，含回复
	 * 
	 * @return
	 * @throws Exception
	 */
	public String info() throws Exception {
		primaryMap = getServMgr().getPrimaryService().getConsultingById(id);
		postList = getServMgr().getPrimaryService().getPostsByConsultingId(id);
		return "info";
	}

	/**
	 * 添加回复
	 * 
	 * @return
	 */
	public String addPost() {
		try {
			getServMgr().getPrimaryService().addPost(getParameters(), id,
					getIP(), getLoginUserName());
			addMessage("回复成功");
			addRedirURL("返回", "info.action?id=" + id);
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("回复失败，请重试");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 删除回复
	 * 
	 * @return
	 */
	public String deletePost() {
		try {
			getServMgr().getPrimaryService().deletePostById(postId);
			addMessage("回复删除成功");
			addRedirURL("返回", "info.action?id=" + id);
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("回复删除失败，请重试");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

}
