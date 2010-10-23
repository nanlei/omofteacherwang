package neo.app.action.admin;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.Map;

import javax.imageio.ImageIO;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class HomePageAction extends BaseAction {
	private PagingList homepageList;
	private int count;

	private Map homepageInfo;
	private String id;

	// 上传文件相关
	private File pic;
	private String picFileName;

	public PagingList getHomepageList() {
		return homepageList;
	}

	public int getCount() {
		return count;
	}

	public Map getHomepageInfo() {
		return homepageInfo;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	/**
	 * 获取首页文章全部列表
	 * 
	 * @return
	 */
	public String list() {
		homepageList = getServMgr().getHomePageService().getAllHomepages();
		count = getServMgr().getHomePageService().getHomepageCount();
		return "list";
	}

	/**
	 * 添加首页文章
	 * 
	 * @return
	 */
	public String addHomepage() {
		try {
			// 上传数据准备
			long nowTime = new Date().getTime();
			int pot = picFileName.lastIndexOf(".");
			String ext = null;
			// 取扩展名
			if (pot != -1) {
				String tmp = picFileName.substring(pot);
				ext = tmp.substring(1, tmp.length());
			} else {
				ext = "";
			}
			String filePath = "/pic/" + nowTime + "." + ext;
			String URL = getServletContext().getRealPath(filePath);
			String ip = getRequest().getRemoteAddr();
			// 图片格式处理
			Image img = ImageIO.read(pic);
			if (img.getWidth(null) == -1) {
				setResult(ERROR);
				addMessage("图片格式有误，请重新选择");
				addRedirURL("返回", "@back");
			} else {
				// 图片格式处理
				int newWidth = 450;
				int newHeight = 300;
				BufferedImage bi = new BufferedImage((int) newWidth,
						(int) newHeight, BufferedImage.TYPE_INT_RGB);
				bi.getGraphics().drawImage(
						img.getScaledInstance(newWidth, newHeight,
								Image.SCALE_SMOOTH), 0, 0, null);
				// 文件上传
				FileOutputStream out = new FileOutputStream(URL);
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
				encoder.encode(bi);
				out.close();
				// 写数据库
				getServMgr().getHomePageService().addHomepage(getParameters(),
						filePath, getLoginUserName(), ip);
				addMessage("信息添加成功");
				addRedirURL("返回", "list.action");
			}
		} catch (Exception e) {
			setResult(ERROR);
			addMessage("信息添加失败，请重试");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	/**
	 * 获取信息供修改
	 * 
	 * @return
	 */
	public String preUpdate() {
		homepageInfo = getServMgr().getHomePageService()
				.getHomepageInfoById(id);
		return "preUpdate";
	}

	/**
	 * 修改首页信息文章
	 * 
	 * @return
	 */
	public String update() {
		String ip = getRequest().getRemoteAddr();
		try {
			if (pic == null) {
				getServMgr().getHomePageService().updateHomepageById(
						getParameters(), null, getLoginUserName(), ip, id);
				addMessage("信息更新成功，没有更新图片");
				addRedirURL("返回", "list.action");
			} else {
				// 先删除原有文件
				Map map = getServMgr().getHomePageService()
						.getHomepageInfoById(id);
				File file = new File(getServletContext().getRealPath(
						(String) map.get("PIC")));
				boolean flag = file.delete();
				if (flag) {// 更新文件
					// 上传数据准备
					long nowTime = new Date().getTime();
					int pot = picFileName.lastIndexOf(".");
					String ext = null;
					// 取扩展名
					if (pot != -1) {
						String tmp = picFileName.substring(pot);
						ext = tmp.substring(1, tmp.length());
					} else {
						ext = "";
					}
					String filePath = "/pic/" + nowTime + "." + ext;
					String URL = getServletContext().getRealPath(filePath);
					// 图片格式处理
					Image img = ImageIO.read(pic);
					if (img.getWidth(null) == -1) {
						setResult(ERROR);
						addMessage("图片格式有误，请重新选择");
						addRedirURL("返回", "@back");
					} else {
						// 图片格式处理
						int newWidth = 450;
						int newHeight = 300;
						BufferedImage bi = new BufferedImage((int) newWidth,
								(int) newHeight, BufferedImage.TYPE_INT_RGB);
						bi.getGraphics().drawImage(
								img.getScaledInstance(newWidth, newHeight,
										Image.SCALE_SMOOTH), 0, 0, null);
						// 文件上传
						FileOutputStream out = new FileOutputStream(URL);
						JPEGImageEncoder encoder = JPEGCodec
								.createJPEGEncoder(out);
						encoder.encode(bi);
						out.close();
						// 写数据库
						getServMgr().getHomePageService().updateHomepageById(
								getParameters(), filePath, getLoginUserName(),
								ip, id);
						addMessage("信息更新成功，更新图片成功");
						addRedirURL("返回", "list.action");
					}
				} else {
					setResult(ERROR);
					addMessage("原有文件删除异常，请重新操作");
					addRedirURL("返回", "@back");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			setResult(ERROR);
			addMessage("信息更新失败，请重试");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}

	public String delete() {
		try {
			Map map = getServMgr().getHomePageService().getHomepageInfoById(id);
			File file = new File(getServletContext().getRealPath(
					(String) map.get("PIC")));
			boolean flag = file.delete();
			if (flag) {
				// 数据库操作
				getServMgr().getHomePageService().deleteHomepageById(id);
				addMessage("信息删除成功");
				addRedirURL("返回", "list.action");
			} else {
				setResult(ERROR);
				addMessage("图片删除失败");
				addRedirURL("返回", "@back");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setResult(ERROR);
			addMessage("信息删除失败");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
}
