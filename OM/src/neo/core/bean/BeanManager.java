package neo.core.bean;

import javax.servlet.ServletContext;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * Spring控制反转容器Bean管理器
 * 
 * @author Nanlei
 * 
 */
public class BeanManager {
	private static WebApplicationContext wac;
	private static ServletContext sc;

	public BeanManager() {
	}

	public static void init(ServletContext context) {
		sc = context;
		wac = WebApplicationContextUtils
				.getRequiredWebApplicationContext(context);
	}

	public static Object getBean(String beanName) {
		return wac.getBean(beanName);
	}

	public static WebApplicationContext getWebApplicationContext() {
		return wac;
	}

	public static ServletContext getServletContext() {
		return sc;
	}
}
