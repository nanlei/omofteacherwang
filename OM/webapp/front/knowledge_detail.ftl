<#include "../common/front/config.ftl">
<@p.page>
<#-- 导航链接-->
<@p.getCurrentPage currentPage="viewKnowledge" />
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      <li>&#187;</li>
      <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewKnowledge.action">全知识点评测</a></li>
      <li>&#187;</li>
      <li class="last"><a href="#">评测详细信息</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<#-- 全知识点评测详细内容-->
<div class="wrapper col3">
  <div id="container">
  		<#if knowledgeDetial?has_content>
			<#list knowledgeDetial as list>
				<h1>${list.divisionName?default('-')?html} - ${list.grade?default('-')?html}</h1>
				<#if list.url?has_content>
					<a href="${base}${list.url}">下载附件</a></td>
				</#if>
				<#break>
			</#list>
  		</#if>
	<br class="clear" />
  	<#if knowledgeDetial?has_content>
		<#list knowledgeDetial as list>
    		<p>${list.content?default('-')}</p>
		</#list>
  	</#if>
  </div>
</div>
<#-- /全知识点评测详细内容-->

</@p.page>