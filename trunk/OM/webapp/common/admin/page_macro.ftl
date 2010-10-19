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
<html>
<head>
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
	<script language="javascript"> 
	function toggleTree() {
		$("#TreeTD").toggle();
	}
	</script>
	<meta http-equiv="Content-type" content="text/html; charset=${macro_config.charset}">
	${head}
</head>
<#if request.servletPath?starts_with(macro_config.manage_path)>
<body ${body}>
<#nested>
</body>
<#else>
<body ${body}>
<#nested>
</body>
</#if>
</html>
</#macro>

<#-- 树形控件 tree -->
<#macro tree root="" display="">
<style type="text/css">@import url('${base}/components/dtree/dtree.css');</style>
<script type="text/javascript">var dtreeIconBasePath = "${base}/components/dtree";</script>
<script language="javascript" src="${base}/components/dtree/dtree.js"></script>
<#nested>
<div style="display:${display};margin-bottom:5px;">菜单控制:【<a href="javascript:void(0)" onclick="tree.openAll();this.blur();return false;" style="color:#333333">展开</a>】【<a href="javascript:void(0)" onclick="tree.closeAll();this.blur();return false;" style="color:#333333">折叠</a>】</div>
<div class="dtree">
<script type="text/javascript"> 
//建立新树
tree = new dTree('tree');
tree.config.target = "MainFrame";
tree.config.useCookies = false;
var selNum = -1;
var link = "";
//根目录
tree.add(0,-1,'${root}', null, null, null, '${base}/images/tico_root.gif', '${base}/images/tico_root.gif');
var count = 0;
var pLevelIdArray = new Array();
pLevelIdArray[1] = 0;
var currLevel = 1;
for (var i=0; i<treeMenu.length; i++) {
	var item = treeMenu[i];
	var itemLevel = item.level;
	pLevelIdArray[itemLevel+1] = ++count;
	if (item.link!=null && item.link!="") {
		if (item.ico!=null) {
			tree.add(count, pLevelIdArray[itemLevel], item.name, item.link, null, null, item.ico, item.ico);
		} else {
			tree.add(count, pLevelIdArray[itemLevel], item.name, item.link);
		}
	} else {
		if (item.ico!=null) {
			tree.add(count, pLevelIdArray[itemLevel], item.name, null, null, null, item.ico, item.ico);
		} else {
			tree.add(count, pLevelIdArray[itemLevel], item.name);
		}
	}
	if (item.select) {
		selNum = count;
		link = item.link;
	}
}
document.write(tree);
tree.openAll();
if (selNum != -1) {
	tree.openTo(selNum,true);
	top.document.frames["MainFrame"].location.href=link;
}
</script>
</div>
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

<#-- 导航 -->
<#macro navi navi=[] height="" font_size="" margin_left="" margin_right="" layout="">
 	<ul class="navi" <#if font_size?has_content||margin_left?has_content||margin_right?has_content>style="<#if font_size?has_content>font-size:${font_size}px;</#if><#if margin_left?has_content>margin-left:${margin_left}px;</#if><#if margin_right?has_content>margin-right:${margin_right}px;</#if>"</#if>>
 		<#list navi as n>
 		<#assign keys = n?keys>
 			<#list keys as key><li <#if layout?has_content>style="<#if layout?has_content>float:${layout};</#if>"</#if>><a href="${parseLink(n[key])}">${key}</a></li></#list>
 		</#list>
 	</ul>
</#macro>
