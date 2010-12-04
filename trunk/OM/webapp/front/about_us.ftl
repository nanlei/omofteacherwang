<#include "../common/front/config.ftl">
<@p.page>

<#-- 导航链接-->
<@p.getCurrentPage currentPage="aboutUs" />
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      <li>&#187;</li>
      <li><a href="${base}/front/<@p.nameSpace loginUser?exists/>!viewIndex.action">主页</a></li>
      <li>&#187;</li>
      <li class="last"><a href="#">关于我们</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<#-- 公告详细内容-->
<div class="wrapper col3">
  <div id="container">
  	<#if aboutUs?has_content>
		<#list aboutUs as list>
    		<h1>${list.title?default('-')?html} - ${list.updateTime?date}</h1>
    		
    		<p>${list.content?default('-')?html}</p>
		</#list>
  	</#if>
  </div>
</div>
<#-- /公告详细内容-->

</@p.page>