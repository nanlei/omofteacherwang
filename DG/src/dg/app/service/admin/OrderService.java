package dg.app.service.admin;

import java.util.Map;

import dg.app.service.BaseService;
import dg.core.common.PagingList;
import dg.core.util.MapUtil;

/**
 * 订单相关Service
 * 
 * @author Nanlei
 * 
 */
public class OrderService extends BaseService {
	// 添加订单
	private static final String SQL_ADD_ORDER = "insert into dg_order(ORDERNO,USERID,GENERATETIME,NUMIID,ITEMTITLE,ITEMURL,PRICE,COUNT,EXPRESSFEE,FEE,CHARGE,TOTAL,ADMINTAG,USERTAG,BACKUPURL,REMARK,IP) values(?,?,now(),?,?,?,?,?,?,?,?,?,0,1,?,?,?)";

	/**
	 * 添加订单
	 * 
	 * @param parameterMap
	 * @param orderNo
	 * @param userId
	 * @param ip
	 */
	public void addOrder(Map parameterMap, String orderNo, String userId,
			String ip) {
		Object[] params = MapUtil
				.getObjectArrayFromMap(parameterMap,
						"num_iid,title,url,price,count,express_fee,fee,charge,total,backupURL,remark");
		jt.update(SQL_ADD_ORDER, orderNo, userId, params[0], params[1],
				params[2], params[3], params[4], params[5], params[6],
				params[7], params[8], params[9], params[10], ip);
	}

	// 获取所有订单
	private static final String SQL_GET_ALL_ORDERS = "select o.ID as ID,o.ORDERNO as ORDERNO,o.ITEMTITLE as ITEMTITLE,o.GENERATETIME as GENERATETIME,o.IP as IP,o.ADMINTAG as ADMINTAG,o.USERTAG as USERTAG,u.REALNAME as REALNAME from dg_order o join dg_user u on o.USERID=u.ID order by o.GENERATETIME desc";

	/**
	 * 获取所有订单
	 * 
	 * @return
	 */
	public PagingList getAllOrders() {
		return getPagingList(SQL_GET_ALL_ORDERS);
	}
}
