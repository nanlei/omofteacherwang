package dg.app.action.admin.taobao;

import org.json.simple.JSONObject;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

import dg.app.action.BaseAction;
import dg.app.bean.taobao.Item;
import dg.app.bean.taobao.Location;
import dg.app.bean.taobao.Response;
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

	public void setId(String id) {
		this.id = id;
	}

	public JsonView getJson() {
		return json;
	}

	/**
	 * 获取商品信息
	 * 
	 * @return
	 */
	public String getItem() {
		// 解析成功标识位
		boolean status = false;
		// 获取的商品ID和需要的字段
		String resultXML = GetResult.getResult("price,location,nick", id);
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

}
