<#include "../common/front/config.ftl">
<@p.page>
<#-- 导航链接-->
<@p.getCurrentPage currentPage="viewExperience" />
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      <li>&#187;</li>
      <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewExperience.action">奥数教育心得</a></li>
      <li>&#187;</li>
      <li class="last"><a href="#">心得详细信息</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<#-- 奥数教育心得详细内容-->
<div class="wrapper col3">
  <div id="container">
  		<#if experienceDetial?has_content>
			<#list experienceDetial as list>
				<h1>${list.divisionName?default('-')?html}</h1>
			</#list>
  		</#if>
	<br class="clear" />
  	<#if experienceDetial?has_content>
		<#list experienceDetial as list>
    		<p>${list.content?default('-')}</p>
		</#list>
  	</#if>
  </div>
</div>
<#-- /奥数教育心得详细内容-->

</@p.page>