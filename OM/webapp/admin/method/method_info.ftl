<@admin.page>
	<@adminApp.naviBar navi="系统管理,奥数方法认识,详情信息,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是奥数方法认识的详情页面，您可以维护这些信息<br>">
	<a href="javascript:history.go(-1)" class="navlink">返回</a>
	</@adminApp.naviInfo>
<form name="methodForm" action="update.action?id=${methodMap.ID}" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="20%" align="center">
	<col width="30%" align="center">
	<col width="20%" align="center">
	<col width="30%" align="center">
	<tr class="title">
		<td colspan="4">奥数方法认识</td>
	</tr>
	<tr>
		<td>标题</td>
		<td><input type="text" name="title" value="${methodMap.TITLE}" size="40"></td>
		<td>排序（升序显示）</td>
		<td><input type="text" name="orders" value="${methodMap.ORDERS}" size="40"></td>
	</tr>
	<tr>
		<td>发布人</td>
		<td>${methodMap.USERNAME!'游客'}</td>
		<td>发布时间</td>
		<td>${methodMap.POSTTIME?datetime}</td>
	</tr>
	<tr>
		<td>最后修改时间</td>
		<td>${methodMap.UPDATETIME?datetime}</td>
		<td>最后修改IP</td>
		<td>${methodMap.UPDATEIP}</td>
	</tr>
	<tr>
		<td colspan="4"><@admin.ckeditor id="content" content="${methodMap.CONTENT}"/></td>
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