<#include "../common/front/config.ftl">
<@p.page>
<#-- 导航链接-->
<@p.getCurrentPage currentPage="viewMethod" />
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      <li>&#187;</li>
      <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewMethod.action">奥数方法认识</a></li>
      <li>&#187;</li>
      <li class="last"><a href="#">方法认识详细信息</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<#-- 全知识点评测详细内容-->
<div class="wrapper col3">
  <div id="container">
  		<#if methodDetial?has_content>
			<#list methodDetial as list>
				<h1>${list.title?default('-')?html} - ${list.teacherName?default('-')?html} - ${list.updateTime?date}</h1>
			</#list>
  		</#if>
	<br class="clear" />
  	<#if methodDetial?has_content>
		<#list methodDetial as list>
    		<p>${list.content?default('-')}</p>
		</#list>
  	</#if>
  </div>
</div>
<#-- /全知识点评测详细内容-->

</@p.page>