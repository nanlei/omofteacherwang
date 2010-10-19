package neo.app.service;

import neo.core.bean.BeanManager;
import neo.core.common.CommonBaseService;

public class BaseService extends CommonBaseService {
	/* 获取通用的 ServiceManager */
	public ServiceManager getServMgr() {
		return (ServiceManager) BeanManager.getBean("serviceManager");
	}
}
