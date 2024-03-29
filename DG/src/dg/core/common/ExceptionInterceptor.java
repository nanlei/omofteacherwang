package dg.core.common;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import dg.core.Constants;

/**
 * Struts2配置的异常拦截器
 * 
 * @author Nanlei
 * 
 */
public class ExceptionInterceptor implements Interceptor {

	protected final Log log = LogFactory.getLog(getClass());

	public void destroy() {
	}

	public void init() {
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		try {
			ActionContext ac = invocation.getInvocationContext();
			HttpServletRequest request = (HttpServletRequest) ac
					.get(ServletActionContext.HTTP_REQUEST);
			// 处理上传时的错误
			if (request instanceof MultiPartRequestWrapper) {
				MultiPartRequestWrapper multiWrapper = (MultiPartRequestWrapper) request;
				if (multiWrapper.hasErrors()) {
					StringBuffer errorsb = new StringBuffer(128);
					for (Iterator errorIter = multiWrapper.getErrors()
							.iterator(); errorIter.hasNext();) {
						errorsb.append(errorIter.next());
					}
					String error = errorsb.toString();
					// 对jakarta的错误信息进行匹配
					Pattern p = Pattern
							.compile("the request was rejected because its size \\((\\d+)\\) exceeds the configured maximum \\((\\d+)\\)");
					Matcher m = p.matcher(error);
					if (m.find()) {
						ac.put(Constants.CONTEXT_EXCEPTION, "您上传文件的尺寸为 ("
								+ m.group(1) + ") 字节，超过了最大限制 (" + m.group(2)
								+ ") 字节。");
					} else {
						ac.put(Constants.CONTEXT_EXCEPTION, "上传时发生异常。");
					}
					ac.put(Constants.CONTEXT_EXCEPTION_INFO, error.toString());
					return Constants.EXCEPTION;
				}
			}
			return invocation.invoke();
		} catch (Exception e) {
			handleException(invocation, e);
			return Constants.EXCEPTION;
		}

	}

	private void handleException(ActionInvocation invocation, Exception e) {
		String message = "Caught exception while invoking action: "
				+ invocation.getAction();
		log.error(message, e);

		StringWriter sw = new StringWriter();
		e.printStackTrace(new PrintWriter(sw));
		invocation.getInvocationContext().put(Constants.CONTEXT_EXCEPTION,
				e.toString());
		invocation.getInvocationContext().put(Constants.CONTEXT_EXCEPTION_INFO,
				sw.toString());
	}

}
