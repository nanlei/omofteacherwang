<@admin.page>
	<@adminApp.naviBar navi="系统管理,奥数教育心得,信息管理,修改,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是奥数教育心得修改页面，下面列出了教育心得的详细信息，您可以维护这些信息<br>">
	<a href="javascript:history.go(-1)" class="navlink">返回</a>
	</@adminApp.naviInfo>
<form name="experienceForm" action="update.action?id=${experienceMap.ID}" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">教育心得信息修改（带<@admin.mustMark/>的项是必填项）</td>
	</tr>
	<tr>
		<td><@admin.mustMark/>标题</td>
		<td><input type="text" name="title" value="${experienceMap.TITLE}" size="60" emptyInfo="请填写标题"></td>
	</tr>
	<tr>
		<td><@admin.mustMark/>分类</td>
		<td>
			<select name="expDivId" emptyInfo="请选择一个分类">
				<option>--请选择--</option>
				<#list categorys as category>
				<option value="${category.ID}" <#if experienceMap.EXPDIVID=category.ID>selected="selected"</#if>>${category.NAME}</option>
				</#list>
			</select>
		</td>
	</tr>
	<tr>
		<td>显示顺序(小数优先)</td>
		<td><input type="text" name="orders" size="60" value="${experienceMap.ORDERS}" emptyInfo="请填写显示顺序优先级" maxLen="10" lengthInfo="输出过长，请缩减" numberInfo="请填写数字"></td>
	</tr>
	<tr>
		<td>发布时间</td>
		<td>${experienceMap.POSTTIME?datetime}</td>
	</tr>
	<tr>
		<td>最后更新时间</td>
		<td>${experienceMap.UPDATETIME?datetime}</td>
	</tr>
	<tr>
		<td>最后更新IP</td>
		<td>${experienceMap.UPDATEIP}</td>
	</tr>
	<tr>
		<td colspan="2"><@admin.ckeditor id="content" content="${experienceMap.CONTENT}" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="提交" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>
</@admin.page>