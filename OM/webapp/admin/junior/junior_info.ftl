<@admin.page>
	<@adminApp.naviBar navi="系统管理,初中学习,详情,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是初中学习的信息详情的管理页面，下面列出了初中学习信息的详情，您可以维护这些信息<br>">
	<a href="javascript:void(0)" class="navlink" onclick="javascript:history.go(-1)">返回</a>
	</@adminApp.naviInfo>
<form name="juniorForm" action="update.action?id=${juniorMap.ID}" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">修改初中学习</td>
	</tr>
	<tr>
		<td>标题</td>
		<td><input type="text" name="title" value="${juniorMap.TITLE}" size="60"></td>
	</tr>
	<tr>
		<td colspan="2"><@admin.ckeditor id="content" content="${juniorMap.CONTENT}"/></td>
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