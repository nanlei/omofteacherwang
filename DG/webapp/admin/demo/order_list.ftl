<@admin.page>
	<@adminApp.naviBar navi="订单管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是订单管理页面，下面列出了系统未处理订单的信息，您可以维护这些信息<br>">
	</@adminApp.naviInfo>
<table class="default" width="100%">
	<col width="8%" align="center">
	<col width="10%" align="center">
	<col width="20%" align="center">
	<col width="8%" align="center">
	<col width="13%" align="center">
	<col width="13%" align="center">
	<col width="8%" align="center">
	<col width="20%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>订单号</td>
		<td>商品名称</td>
		<td>下单人</td>
		<td>下单时间</td>
		<td>下单IP</td>
		<td>订单状态</td>
		<td>操作</td>
	</tr>
	<#assign count2=(pageNum-1)*pageSize+1 />
	<#list orderList.list as order>
	<tr <@admin.trChangeColor />>
		<td>${count2}</td>
		<td>${order.ORDERNO}</td>
		<td>${order.ITEMTITLE}</td>
		<td>${order.REALNAME}</td>
		<td>${order.GENERATETIME?datetime}</td>
		<td>${order.IP}</td>
		<td><#if order.ADMINTAG=0>未处理<#else>处理中</#if></td>
		<td></td>
	</tr>
	<#assign count2=count2+1 />
	</#list>
</table>
<div align="right"><@admin.paging orderList/></div>
</@admin.page>