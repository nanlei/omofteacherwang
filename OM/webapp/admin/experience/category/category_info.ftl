<@admin.page>
	<@adminApp.naviBar navi="系统管理,奥数教育心得,心得分类管理,修改,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是奥数教育心得分类信息页面，您可以维护这些信息<br>">
	<a href="javascript:history.go(-1)" class="navlink">返回</a>
	</@adminApp.naviInfo>
<form name="experienceForm" action="update.action?categoryId=${categoryMap.ID}" method="post" onsubmit="return validateForm(this)">
<table width="100%" class="default">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">修改教育心得分类（带<@admin.mustMark/>的项是必填项）</td>
	</tr>
	<tr>
		<td>分类名称</td>
		<td><input type="text" name="name" value="${categoryMap.NAME}" size="60"  emptyInfo="请填写分类名称"></td>
	</tr>
	<tr>
		<td>描述</td>
		<td><input type="text" name="description" value="${categoryMap.DESCRIPTION}" size="60"  emptyInfo="请填写一些描述"></td>
	</tr>
	<tr>
		<td>创建时间</td>
		<td>${categoryMap.POSTTIME?datetime}</td>
	</tr>
	<tr>
		<td>最后修改时间</td>
		<td>${categoryMap.UPDATETIME?datetime}</td>
	</tr>
	<tr>
		<td>最后修改IP</td>
		<td>${categoryMap.UPDATEIP}</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="提交" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>
</form>
</@admin.page>