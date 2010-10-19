<#include "config.ftl">
<@p.page>
<#assign er = executeResult?if_exists>
<#assign delay = 2>
<#if er?has_content>
<#if er.result == "success">
	<meta http-equiv="refresh" content="${execute_result_config.delay};url=${parseLink(er.redirURLs?values?first)}">
</#if>

<table border="1" cellpadding="1" align="center" width="50%" class="default">
<tr class="title">
	<td style="text-align:center;<#if er.result!='success'>color:red</#if>"><#if er.result=='success'>操作完成<#else>操作失败</#if></td>
</tr>
<tr>
	<td style="line-height:150%;padding:10px">
	<table width="100%"><tr><td style="padding:10px;background:<#if er.result=='success'>#FFFFCC<#else>#FFCCCC</#if>;border:1px solid black"><ul><#list er.messages as msg><li>${msg}</li></#list></ul></td></tr></table>
	<#if er.redirURLs?values?exists>
	<#assign redirURLs=er.redirURLs>
	<br>
	请选择以下任务继续：<br><br>
	<#assign keys = redirURLs?keys>
	| <#list keys as key><a href="${parseLink(redirURLs[key]?default(""))}">${key}</a> | </#list>
	</#if>
	</td>
</tr>
</tr>
</table>
</#if>
</@p.page>