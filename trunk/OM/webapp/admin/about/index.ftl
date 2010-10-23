<@admin.page>
	<@adminApp.naviBar navi="系统管理,关于工作室,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是关于工作室的信息页面，您可以维护这些信息<br>">
	</@adminApp.naviInfo>
<form name="aboutForm" action="update.action" method="post" onsubmit="return validateForm(this)">
<table width="100%" class="default">
	<col width="20%" align="center">
	<col width="30%" align="center">
	<col width="20%" align="center">
	<col width="30%" align="center">
	<tr class="title">
		<td colspan="4">关于工作室信息修改</td>
	</tr>
	<tr>
		<td><@admin.mustMark/>标题</td>
		<td colspan="3"><input type="text" name="title" value="${aboutMap.TITLE}" size="60" emptyInfo="请输入标题"></td>
	</tr>
	<tr>
		<td>上次修改时间</td>
		<td>${aboutMap.UPDATETIME?datetime}</td>
		<td>上次修改IP</td>
		<td>${aboutMap.UPDATEIP}</td>
	</tr>
	<tr>
		<td colspan="4">
		<@admin.ckeditor id="content" content="${aboutMap.CONTENT}" />
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="submit" value="提交" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>
</form>
</@admin.page>