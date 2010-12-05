<#include "config.ftl">
<#include "common_function.ftl">

<#-- 页面统一基础模板 -->
<#macro page title=macro_config.default_title body="" head="" setReferUrl=false referUrlKey="" js=[] css=[]>
<#if setReferUrl><#if referUrlKey?has_content>${action.setReferUrl(referUrlKey)}<#else>${action.setReferUrl()}</#if></#if>
<#if navi?has_content>
	<#if title==macro_config.default_title>
		<#local title = navi?last>
	</#if>
</#if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
	<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"]><#-- Struts2标签库定义 -->
	<title>${macro_config.common_title} - ${title?html}</title>
	<#list macro_config.css_path as css><#-- 系统CSS加载 -->
		<link href="${base}${css}" rel="stylesheet" type="text/css">
	</#list>
	<#if css?has_content>
	<#list css as cssfile><#-- 自定义CSS加载 -->
		<link href="${base}/css/${cssfile}" rel="stylesheet" type="text/css">
	</#list>
	</#if>
	<#list macro_config.js_path as js><#-- 系统JS加载 -->
		<script language="javascript" src="${base}${js}"></script>
	</#list>
	<#if js?has_content>
	<#list js as jsfile><#-- 自定义JS加载 -->
		<script language="javascript" src="${base}/js/${jsfile}"></script>
	</#list>
	</#if>
	<meta http-equiv="Content-type" content="text/html; charset=${macro_config.charset}">
	<meta http-equiv="imagetoolbar" content="no" />
	<script type="text/javascript">
  		var _gaq = _gaq || [];
  		_gaq.push(['_setAccount', 'UA-19935766-1']);
 		_gaq.push(['_trackPageview']);

  		(function() {
    		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
   		 	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  		})();
	</script>
	${head}
</head>
<#if request.servletPath?starts_with(macro_config.manage_path)>
<body ${body}>
<#-- 用户登录-->
<div class="wrapper col0">
  <div id="topbar">
  	<#if loginUser?exists>
    <div id="slidepanel">
      <div class="topbox">
      	  
      </div>
      <div class="topbox">
        
      </div>
      <div class="topbox last">
      	<a href="${base}/studentLogout.action">退出系统 &raquo;</a> 
      </div>
      <br class="clear" />
    </div>
    <div id="loginpanel">
      <ul>
        <li class="left">欢迎&nbsp;<strong>${loginUser.REALNAME?html}</strong> &raquo;</li>
        <li class="right" id="toggle"><a id="slideit" href="#slidepanel">展开面板</a><a id="closeit" style="display: none;" href="#slidepanel">关闭面板</a></li>
      </ul>
    </div>
    <br class="clear" />
    <#else>
    <div id="slidepanel">
      <div class="topbox">
        <h2>王炳禹奥数在线</h2>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎各位同学、家长、学者、专家们加入王炳禹奥数在线。这里是奥数展翅腾飞的平台，这里是奥数解密宇宙的起点，这里是奥数思维无边的海洋。让我让为构建一个奥数的世界，一起学习，一起进步。这里的资源都是免费开放给所有用户的，共享一个平台、共享一个奥数，您还在犹豫什么？</p>
        <p class="readmore"><a href="${base}/front/Anonym!memberRegister.action">注册用户 &raquo;</a></p>
      </div>
      <div class="topbox">
        <h2>教师登录</h2>
        <form action="${base}/admin/login.action" method="post" onsubmit="return validateForm(this)">
          <fieldset>
            <legend>Teachers Login Form</legend>
            <label for="teachername">用户名:
              <input type="text" name="userName" id="teachername" value=""  emptyInfo="请输入用户名" maxLen="15" lengthInfo="长度应小于15个字符" />
            </label>
            <label for="teacherpass">密码:
              <input type="password" name="password" id="teacherpass" value="" emptyInfo="请输入密码" maxLen="32" lengthInfo="长度应小于32个字符" />
            </label>
            <label for="teacherremember">
              <input class="checkbox" type="checkbox" name="teacherremember" id="teacherremember" checked="checked" />
              保留我的信息</label>
            <p>
              <input type="submit" name="teacherlogin" id="teacherlogin" value="登录" />
              &nbsp;
              <input type="reset" name="teacherreset" id="teacherreset" value="重置" />
            </p>
          </fieldset>
        </form>
      </div>
      <div class="topbox last">
        <h2>学生登录</h2>
        <form action="${base}/studentLogin.action" method="post" onsubmit="return validateForm(this)">
          <fieldset>
            <legend>Pupils Login Form</legend>
            <label for="pupilname">用户名:
              <input type="text" name="userName" id="pupilname" value=""  emptyInfo="请输入用户名" maxLen="15" lengthInfo="长度应小于15个字符" />
            </label>
            <label for="pupilpass">密码:
              <input type="password" name="password" id="pupilpass" value="" emptyInfo="请输入密码" maxLen="32" lengthInfo="长度应小于32个字符" />
            </label>
            <label for="pupilremember">
              <input class="checkbox" type="checkbox" name="pupilremember" id="pupilremember" checked="checked" />
              保留我的信息</label>
            <p>
              <input type="submit" name="pupillogin" id="pupillogin" value="登录" />
              &nbsp;
              <input type="reset" name="pupilreset" id="pupilreset" value="重置" />
            </p>
          </fieldset>
        </form>
      </div>
      <br class="clear" />
    </div>
    <div id="loginpanel">
      <ul>
        <li class="left">点击此处登陆 &raquo;</li>
        <li class="right" id="toggle"><a id="slideit" href="#slidepanel">展开面板</a><a id="closeit" style="display: none;" href="#slidepanel">关闭面板</a></li>
      </ul>
    </div>
    <br class="clear" />
    </#if>
  </div>
</div>
<#-- /用户登录-->

<#nested>

<#-- 超链接-->
<div class="wrapper col4">
  <div id="footer">
    
    <br class="clear" />
  </div>
</div>
<#-- /超链接-->
<#-- CopyRight-->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2010 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Design by <strong><a href="#" title="开发者">Sarin Nan Lei & Tony Shen Mai Han</a></strong></p>
    <br class="clear" />
  </div>
</div>
<#-- /CopyRight-->
</body>
<#else>
<body ${body}>
<#nested>
</body>
</#if>
</html>
</#macro>

<#-- 处理分页参数 -->
<#function getPageUrl pageNum>
<#local pageUrl=base+fullUrlWithoutPageInfo>
<#if pageUrl?ends_with("?")>
<#return pageUrl + "pageSize=" + pageSize + "&pageNum=" + pageNum>
<#else>
<#return pageUrl + "&pageSize=" + pageSize + "&pageNum=" + pageNum>
</#if>
</#function>

<#-- 全部或分页显示 -->
<#function getPageUrlResize size>
<#local pageUrl=base+fullUrlWithoutPageInfo>
<#if pageUrl?ends_with("?")>
<#return pageUrl + "pageNum=1&pageSize=" + size>
<#else>
<#return pageUrl + "&pageNum=1&pageSize=" + size>
</#if>
</#function>

<#-- 分页信息 -->
<#macro paging pagingList>
<#local pageCount=pagingList.pageCount>
<#local rowCount=pagingList.rowCount>
<#local pageNum=pagingList.pageNum>
<#local pageSize=pagingList.pageSize>
<#if rowCount == 0>
	<#if useFlag?exists>
	<div style="border:1px solid #666;padding:2 5 2 5;background:#efefef;color:#333">没有相关记录</div>
	<#else>
	<#assign useFlag = 1>
	</#if>
<#else>
<table>
<tr>
	<td style="line-height:150%">
	共 ${rowCount} 条记录 ${pageCount} 页 <#if pageCount gt 1 && pageSize!=maxPageSize><span class="selectedPage" style="padding:2px 3px 0 3px"><a class="page" href="${getPageUrlResize(maxPageSize)}">全部显示</a></span><#elseif pageSize==maxPageSize><span class="selectedPage" style="padding:2px 3px 0 3px"><a class="page" href="${getPageUrlResize(defaultPageSize)}">分页显示</a></span></#if>
	<#if (pageCount <= 11)>
		<#local startPage = 1>
		<#local endPage = pageCount>
	<#elseif (pageNum + 5 > pageCount)>
		<#local startPage = pageCount - 10>
		<#local endPage = pageCount>
	<#elseif (pageNum - 5 < 1)>
		<#local startPage = 1>
		<#local endPage = 11>
	<#else>
		<#local startPage = pageNum - 5>
		<#local endPage = pageNum + 5>
	</#if>
	<#if (pageCount > 1)><#if (pageNum != 1)><#if (pageCount > 11)><a class="page" href="${getPageUrl(1)}" style="font-family:Webdings" title="首页">9</a></#if><a class="page" href="${getPageUrl(pageNum-1)}" style="font-family:Webdings" title="上页">3</a><#else><#if (pageCount > 11)><span style="font-family:Webdings;color:#999">9</span></#if><span style="font-family:Webdings;color:#999">3</span></#if><#list startPage..endPage as x><#if x=pageNum><span class="selectedPage">${x}</span><#else><span class="noSelectedPage"><a class="page" href="${getPageUrl(x)}">${x}</a></span></#if></#list><#if (pageCount != pageNum)><a class="page" href="${getPageUrl(pageNum+1)}" style="font-family:Webdings" title="下页">4</a><#if (pageCount > 11)><a class="page" href="${getPageUrl(pageCount)}" style="font-family:Webdings" title="尾页">:</a></#if><#else><span style="font-family:Webdings;color:#999">4</span><#if (pageCount > 11)><span style="font-family:Webdings;color:#999">:</span></#if></#if></#if>
	</#if>
	</td>
</tr>
</table>
</#macro>

<#-- 信息 -->
<#macro nameSpace flag>
	<#if flag==true>
Member
	<#else>	
Anonym
	</#if>
	
</#macro>

<#-- CKEditor编辑器 -->
<#macro ckeditor id upload=true>
${importJS("/components/ckeditor/ckeditor.js")}
<#if upload>
<script type="text/javascript">
CKEDITOR.replace('${id}',{
	filebrowserUploadUrl : '${base}/ckeditor/uploader?Type=File',
	filebrowserImageUploadUrl : '${base}/ckeditor/uploader?Type=Image',
	filebrowserFlashUploadUrl : '${base}/ckeditor/uploader?Type=Flash'
});
</script>
<#else>
<script type="text/javascript">
CKEDITOR.replace('${id}');
</script>
</#if>
</#macro>

<#-- 日历控件  id : 目标input元素的id（注意，不是name属性，是id属性）-->
<#macro cal id format="%Y-%m-%d" text="选择日期">
<#if calcount?exists>
<#assign calcount=calcount+1>
<#else>
<#assign calcount=0>
${importCSS("/components/calendar/skins/aqua/theme.css")}
${importJS("/components/calendar/calendar.js")}
${importJS("/components/calendar/calendar-setup.js")}
${importJS("/components/calendar/lang/calendar-zh-utf8.js")}
</#if>
<img id="calImg${calcount}" src="${base}/components/calendar/skins/aqua/cal.gif" border="0" alt="${text}" style="cursor:pointer">
<script language="JavaScript">Calendar.setup({inputField:"${id}",ifFormat:"${format}",button:"calImg${calcount}"});</script>
</#macro>

<#-- 表单必填项标识 -->
<#macro mustMark><span class="notNull">*</span></#macro>

<#-- 表格鼠标覆盖后换色 -->
<#macro trChangeColor>
 onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"
</#macro>
	
<#-- 导航链接-->
<#macro getCurrentPage currentPage>
	<div class="wrapper col1">
  		<div id="header">
    		<div id="logo">
      		<h1><a href="#">王炳禹奥数在线</a></h1>
      		<p>让奥数成为训练思维的利器！</p>
    	</div>
    	<div id="topnav">
      	<ul>
        	<li <#if currentPage=="viewIndex"> class="active" </#if> ><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewIndex.action">主页</a></li>
        	<li <#if currentPage=="viewKnowledge"> class="active" </#if> ><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewKnowledge.action">全知识点评测</a></li>
        	<li <#if currentPage=="viewPrimaryConsulting"> class="active" </#if> ><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewPrimaryConsulting.action">小升初咨询</a></li>
        	<li <#if currentPage=="viewMethod"> class="active" </#if> ><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewMethod.action">方法认知</a></li>
        	<li <#if currentPage=="shareData"> class="active" </#if><#if currentPage=="aboutUs"> <#else> class="last" </#if>   ><a href="${base}/front/<@p.nameSpace loginUser?exists />!shareData.action">资料分享</a></li>
      	</ul>
      	<br class="clear" />
      	<ul>
        	<li <#if currentPage=="viewExperience"> class="active" </#if> ><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewExperience.action">授课教育心得</a></li>
        	<li <#if currentPage=="viewJuniorStudy"> class="active" </#if> ><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewJuniorStudy.action">初中段学习</a></li>
        	<li><a href="${macro_config.om_forum}" target="_black">奥数论坛</a></li>
        	<li <#if currentPage=="aboutUs"> class="active"  </#if><#if currentPage=="shareData"> <#else> class="last" </#if>  ><a href="${base}/front/<@p.nameSpace loginUser?exists />!aboutUs.action">关于我们</a></li>
      	</ul>
    </div>
    <br class="clear" />
  </div>
</div>
	
</#macro>
