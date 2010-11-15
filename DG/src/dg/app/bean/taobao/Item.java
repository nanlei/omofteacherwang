package dg.app.bean.taobao;

/**
 * 淘宝商品API数据结构
 * 
 * @author Nanlei
 * 
 */
public class Item {
	private String nick;
	private String price;
	private Location location;

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

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

}
