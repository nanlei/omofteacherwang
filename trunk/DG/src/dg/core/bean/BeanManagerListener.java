package dg.core.bean;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Bean管理器所需的Servlet上下文监听器
 * 
 * @author Nanlei
 * 
 */
public class BeanManagerListener implements ServletContextListener {
	public void contextInitialized(ServletContextEvent event) {
		BeanManager.init(event.getServletContext());
	}

	public void contextDestroyed(ServletContextEvent event) {
	}
}
