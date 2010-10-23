package neo.app.action.admin;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.imageio.ImageIO;

import neo.app.action.BaseAction;
import neo.core.common.PagingList;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class HomePageAction extends BaseAction {
	private PagingList homepageList;
	private int count;

	// 上传文件相关
	private File pic;
	private String picFileName;

	public PagingList getHomepageList() {
		return homepageList;
	}

	public int getCount() {
		return count;
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
			String ip=getRequest().getRemoteAddr();
			// 图片格式处理
			Image img = ImageIO.read(pic);
			if (img.getWidth(null) == -1) {
				setResult(ERROR);
				addMessage("图片格式有误，请重新选择");
				addRedirURL("返回", "@back");
			} else {
				//图片格式处理
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
				getServMgr().getHomePageService().addHomepage(getParameters(), filePath, getLoginUserName(), ip);
				addMessage("信息添加成功");
				addRedirURL("返回", "list.action");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setResult(ERROR);
			addMessage("信息添加失败，请重试");
			addRedirURL("返回", "@back");
		}
		return EXECUTE_RESULT;
	}
}
