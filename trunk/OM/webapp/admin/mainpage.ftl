<#--首页主区-->
<@admin.page>
	<@adminApp.naviBar navi="系统管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是系统管理首页，您可以点击左侧的导航树对站内资源进行管理">
	</@adminApp.naviInfo>
<style type="text/css"> 
li{
	color:#000000;
}
</style>
<div style="margin-top:180px;" />
<table align="center" class="default">
	<tr class="title">
		<td>欢迎${loginUser.REALNAME}登录后台管理系统</td>
	</tr>
	<tr>
		<td style="padding-right:20px;">
			<ul id="blRoles">
				<li>您的身份是<#if loginUser.ROLE=1>管理员<#else>普通用户</#if></li>
			</ul>
		</td>
	</tr>
</table>
</@admin.page>