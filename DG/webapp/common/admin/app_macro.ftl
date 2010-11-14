<#include "common_function.ftl">
<#-- Header -->
<#macro header>
<table cellspacing="0" cellpadding="0" border="0" class="navtab" width="100%">
	<tr>
		<td rowspan="2" class="tdnormal" width="380">
		<font size="5px">OM后台管理系统</font>
		</td>
		<td colspan="5">&nbsp;</td>
		<td style="text-align:right;padding-right:10px">
		当前用户：<span style="color:#ff6">${loginUser.USERNAME} - ${loginUser.REALNAME}</span> 【<a style="color:#fff" href="${base}/admin/adminLogout.action">退出</a>】
		</td>
	</tr>
	<tr>
	<#nested>
	</tr>
</table>
</#macro>

<#-- Body -->
<#macro body treeAction="" displayPage="">
<table width="100%" height="100%" cellSpacing="0" cellPadding="0" border="0" align="center">
	<tr style="background:#FFF">
		<td width="200px" id="TreeTD" rowspan="2"><iframe style="width:100%;height:100%" src="${treeAction}" name="TreeFrame" id="TreeFrame" frameborder="0"></iframe></td>
		<td width="8px" align="center" onclick="toggleTree()" style="cursor:pointer" rowspan="2" class="fbg"><img src="${base}/images/switch.gif" width="6" height="24" border="0" alt=""></td>
		<td width="*" id="navTD" height="30px"></td>
	</tr>
	<tr>
		<td width="*"><iframe style="width:100%;height:100%" src="${displayPage}" id="MainFrame" name="MainFrame" frameborder="0"></iframe></td>
	</tr>
</table>
</#macro>

<#--NaviBar -->
<#macro naviBar navi="">
<#assign content=["${navi}"]/>
<div id="navi"> 
<script language="javascript"> 
var navTD = top.document.getElementById("navTD");
var naviInfo="${navi}".split(",");
var displayInfo="<div id='navDiv'>";
for(var i=0;i<naviInfo.length;i++){
	displayInfo+="<span\><img src=\"${base}/images/arror.gif\" width=\"7\" height=\"11\" border=\"0\" alt=\"\"\></span\>&nbsp;"+ naviInfo[i] +"<span\>&nbsp;";
}
if (navTD) {
	navTD.innerHTML =displayInfo+"</div>";
}
</script> 
</div>
</#macro>

<#-- NaviInfo -->
<#macro naviInfo helpInfoTitle="" helpInfoContent="" tasks={}>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
</tr>
<tr>
	<td align="left">
	<#if (tasks?size > 0)>
		<#assign keys = tasks?keys>
			<#list keys as key><a href="${parseLink(tasks[key])}" class="navlink">${key}</a>
			</#list>
	</#if>
	<#nested>
	</td>
	<td align="right">
		<table>
			<tr>
				<td align="right" width="50px"><img src="${base}/images/help.gif" width="45" height="22" border="0" alt=""> </td>
				<td align="center" width="80px" style="padding-top:5px"><a href="#" style="cursor:pointer" onclick="$('#page_explain').toggle();this.blur();return false;">${helpInfoTitle}</a></td>
			</tr>
		</table>
	</td>
</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="explain" id="page_explain">
<tr>
	<td>${helpInfoContent}</td>
</tr>
</table>
</#macro>

<#-- Footer -->
<#macro footer>
<tr>
	<td height="18px" align="center" style="padding-right:10px;font-size:12px">Ver 0.1 Copyright &#169; All Rights Reserved,Powered By NanLei & ShenMaihan</td>
</tr>
</#macro>