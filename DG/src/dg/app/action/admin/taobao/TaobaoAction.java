package dg.app.action.admin.taobao;

import java.math.BigDecimal;

import org.json.simple.JSONObject;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

import dg.app.action.BaseAction;
import dg.app.bean.Order;
import dg.app.bean.taobao.Item;
import dg.app.bean.taobao.Location;
import dg.app.bean.taobao.Response;
import dg.core.util.CalendarUtil;
import dg.core.util.CharacterUtil;
import dg.core.util.MapUtil;
import dg.core.util.json.JsonView;
import dg.core.util.taobao.GetResult;

/**
 * 获取淘宝信息
 * 
 * @author Nanlei
 * 
 */
public class TaobaoAction extends BaseAction {
	private String id;// 商品ID

	// AJAX请求返回内容
	private JsonView json;

	// 确认订单
	private Order order;

	public void setId(String id) {
		this.id = id;
	}

	public JsonView getJson() {
		return json;
	}

	public Order getOrder() {
		return order;
	}

	/**
	 * 获取商品信息
	 * 
	 * @return
	 */
	public String getItem() throws Exception {
		// 解析成功标识位
		boolean status = false;
		// 获取的商品ID和需要的字段
		String resultXML = GetResult
				.getResult(
						"detail_url,num_iid,title,desc,pic_url,nick,price,express_fee,location",
						id);
		// XStream解析XML
		XStream xstream = new XStream(new DomDriver());
		xstream.alias("item_get_response", Response.class);
		xstream.alias("item", Item.class);
		xstream.alias("location", Location.class);
		// XML转对象
		Response response = (Response) xstream.fromXML(resultXML);
		Item item = response.getItem();
		if (item != null) {
			status = true;
		}
		// 填充返回的JSON对象
		JSONObject result = new JSONObject();
		result.put("status", status);
		if (status == true) {
			result.put("item", item);
		}
		json = new JsonView(result);
		return SUCCESS;
	}

	/**
	 * 订单确认
	 * 
	 * @return
	 */
	public String confirm() throws Exception {
		String num_iid = MapUtil.getStringFromMap(getParameters(), "num_iid");
		// 获取的商品ID和需要的字段
		String resultXML = GetResult.getResult(
				"detail_url,title,price,express_fee", num_iid);
		// XStream解析XML
		XStream xstream = new XStream(new DomDriver());
		xstream.alias("item_get_response", Response.class);
		xstream.alias("item", Item.class);
		xstream.alias("location", Location.class);
		// XML转对象
		Response response = (Response) xstream.fromXML(resultXML);
		Item item = response.getItem();
		if (item == null) {
			setResult(ERROR);
			addMessage("获取商品信息失败");
			return EXECUTE_RESULT;
		} else {
			order = new Order();
			order.setNum_iid(num_iid);
			order.setTitle(item.getTitle());
			order.setUrl(item.getDetail_url());
			order.setBackupURL(MapUtil.getStringFromMap(getParameters(),
					"backupURL"));
			order
					.setRemark(MapUtil.getStringFromMap(getParameters(),
							"remark"));
			String count = MapUtil.getStringFromMap(getParameters(), "count");
			String price = item.getPrice();
			String fee = MapUtil.getStringFromMap(getParameters(), "fee");
			String expree_fee = item.getExpress_fee();
			order.setPrice(price);
			order.setExpress_fee(expree_fee);
			order.setCount(count);
			order.setCharge("50");
			order.setFee(fee);
			BigDecimal b_price = new BigDecimal(price);
			BigDecimal b_count = new BigDecimal(count);
			BigDecimal b_express_fee = new BigDecimal(expree_fee);
			BigDecimal b_fee = new BigDecimal(fee);
			BigDecimal b_charge = new BigDecimal("50");
			double total = b_price.multiply(b_count).add(b_express_fee).add(
					b_fee).add(b_charge).doubleValue();
			order.setTotal(total);
			return "confirm";
		}
	}

	/**
	 * 提交订单
	 * 
	 * @return
	 */
	public String submit() {
		String userId = getLoginUserId();
		String ip = getIP();
		String orderNo = CalendarUtil.getCurrentTime()
				+ CharacterUtil.getRandomString2(3).toUpperCase();
		System.out.println(orderNo);
		try {
			getAdminServMgr().getAdminOrderService().addOrder(getParameters(),
					orderNo, userId, ip);
			addMessage("下单成功，订单号：" + orderNo);
			addMessage("订单号是跟踪服务的唯一凭据，您可以在订购记录中查看详情");
			addRedirURL("返回", "index.action");
		} catch (Exception e) {
			e.printStackTrace();
			setResult(ERROR);
			addMessage("下单失败，请返回重新提交");
			addRedirURL("返回", "index.action");
		}
		return EXECUTE_RESULT;
	}
}
