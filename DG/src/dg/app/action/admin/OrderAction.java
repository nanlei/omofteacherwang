package dg.app.action.admin;

import dg.app.action.BaseAction;
import dg.core.common.PagingList;

/**
 * 订单处理
 * 
 * @author Nanlei
 * 
 */
public class OrderAction extends BaseAction {
	private PagingList orderList;

	public PagingList getOrderList() {
		return orderList;
	}

	/**
	 * 获取订单列表，测试使用
	 * 
	 * @return
	 */
	public String order() {
		orderList = getAdminServMgr().getAdminOrderService().getAllOrders();
		return "order";
	}

}
