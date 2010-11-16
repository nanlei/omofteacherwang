package dg.app.bean;

import java.math.BigDecimal;

/**
 * 订单对象
 * 
 * @author Nanlei
 * 
 */
public class Order {
	private String num_iid;// 商品ID
	private String title;// 商品名称
	private String price;// 商品价格
	private String count;// 商品数量
	private String express_fee;// 国内运费
	private String fee;// 运费
	private String charge;// 手续费
	private double total;// 商品总价
	private String url;// 商品URL
	private String backupURL;// 备用URL
	private String remark;// 用户备注

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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getExpress_fee() {
		return express_fee;
	}

	public void setExpress_fee(String expressFee) {
		express_fee = expressFee;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getCharge() {
		return charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getBackupURL() {
		return backupURL;
	}

	public void setBackupURL(String backupURL) {
		this.backupURL = backupURL;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
