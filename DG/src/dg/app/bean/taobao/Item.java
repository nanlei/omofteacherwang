package dg.app.bean.taobao;

/**
 * 淘宝商品API数据结构
 * 
 * @author Nanlei
 * 
 */
public class Item {
	private String detail_url;// 商品URL
	private String num_iid;// 商品数字ID
	private String title;// 商品标题
	private String desc;// 商品描述
	private String pic_url;// 主图片地址
	private String nick;// 卖家昵称
	private String price;// 商品价格
	private String express_fee;// 快递价格
	private Location location;// 商品所在地

	public String getDetail_url() {
		return detail_url;
	}

	public void setDetail_url(String detailUrl) {
		detail_url = detailUrl;
	}

	public String getNum_iid() {
		return num_iid;
	}

	public void setNum_iid(String numIid) {
		num_iid = numIid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getPic_url() {
		return pic_url;
	}

	public void setPic_url(String picUrl) {
		pic_url = picUrl;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getExpress_fee() {
		return express_fee;
	}

	public void setExpress_fee(String expressFee) {
		express_fee = expressFee;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

}
