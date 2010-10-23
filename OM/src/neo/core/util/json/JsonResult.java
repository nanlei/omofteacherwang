package neo.core.util.json;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.StrutsResultSupport;

import com.opensymphony.xwork2.ActionInvocation;

public class JsonResult extends StrutsResultSupport {
	private String contentTypeName;
	private String jsonObjName = "";

	public void setContentTypeName(String contentTypeName) {
		this.contentTypeName = contentTypeName;
	}

	public void setJsonObjName(String jsonObjName) {
		this.jsonObjName = jsonObjName;
	}

	@Override
	protected void doExecute(String finalLocation, ActionInvocation invocation) throws Exception {
		HttpServletResponse response = (HttpServletResponse) invocation.getInvocationContext().get(HTTP_RESPONSE);
		String contentType = conditionalParse(contentTypeName, invocation);
		if (contentType == null) {
			contentType = "text/json;charset=UTF-8";
		}
		response.setContentType(contentType);
		PrintWriter out = response.getWriter();
		JsonView result = (JsonView) invocation.getStack().findValue(jsonObjName);
		out.println(result);
		out.flush();
		out.close();

	}
}
