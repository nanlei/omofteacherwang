<#include "../common/front/config.ftl">
<@p.page>

<#-- 导航链接-->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><a href="#">王炳禹奥数在线</a></h1>
      <p>让奥数成为训练思维的利器！</p>
    </div>
    <div id="topnav">
      <ul>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewIndex.action">主页</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewPrimaryConsulting.action">小升初咨询</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewMethod.action">方法认知</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!shareData.action">资料分享</a></li>
      </ul>
      <br class="clear" />
      <ul>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewExperience.action">授课教育心得</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewJuniorStudy.action">初中段学习</a></li>
        <li><a href="${macro_config.om_forum}" target="_black">奥数论坛</a></li>
        <li class="active"><a href="${base}/front/<@p.nameSpace loginUser?exists />!aboutUs.action">关于我们</a></li>
      </ul>
    </div>
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