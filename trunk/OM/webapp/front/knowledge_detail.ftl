<@p.page>

<#-- 导航链接-->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><a href="#">王炳禹奥数在线</a></h1>
      <p>让奥数成为训练思维的利器！</p>
    </div>
    <#if loginUser?exists>
    <div id="topnav">
      <ul>
        <li><a href="${base}/front/Member!viewIndex.action">主页</a></li>
        <li class="active"><a href="${base}/front/Member!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/Member!shareData.action">奥数资料分享</a></li>
        <li><a href="#">学生讨论区</a></li>
        <li class="last"><a href="#">联系我们</a></li>
      </ul>
    </div>
    <#else>
    <div id="topnav">
      <ul>
        <li><a href="${base}/front/Anonym!viewIndex.action">主页</a></li>
        <li class="active"><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/Anonym!shareData.action">奥数资料分享</a></li>
        <li><a href="#">学生讨论区</a></li>
        <li class="last"><a href="#">联系我们</a></li>
      </ul>
    </div>
    </#if>
    <br class="clear" />
  </div>
</div>
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      <li>&#187;</li>
      <#if loginUser?exists>
      	<li class="last"><a href="${base}/front/Member!viewKnowledge.action">全知识点评测</a></li>
      <#else>
      	<li class="last"><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></li>
      </#if>
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