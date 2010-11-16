package dg.app.bean.taobao;

/**
 * 淘宝商品API-货物所在地数据结构
 * 
 * @author Nanlei
 * 
 */
public class Location {
	private String zip;// 邮政编码
	private String address;// 详细地址
	private String state;// 所在城市
	private String city;// 所在省份
	private String country;//国家名称
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}



}
