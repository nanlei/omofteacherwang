<@admin.page>
	<@adminApp.naviBar navi="系统管理,首页管理,首页信息,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是首页信息管理页面，下面列出了在首页显示的信息，您可以维护这些信息<br>">
	<a href="javascript:history.go(-1)" class="navlink">返回</a>
	</@adminApp.naviInfo>
<form name="homepageForm" action="update.action?id=${homepageInfo.ID}" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">

<table width="100%" class="default">
	<col width="20%" align="center">
	<col width="30%" align="center">
	<col width="20%" align="center">
	<col width="30%" align="center">
	<tr class="title">
		<td colspan="4">首页信息修改（带<@admin.mustMark/>的项是必填项）</td>
	</tr>
	<tr>
		<td rowspan="6" colspan="2"><img src="${base}/${homepageInfo.PIC}"></td>
		<td><@admin.mustMark/>标题</td>
		<td><input type="text" name="title" value="${homepageInfo.TITLE}" size="40" emptyInfo="请输入标题"></td>
	</tr>
	<tr>
		<td><@admin.mustMark/>是否首页显示</td>
		<td>
			<input type="radio" name="state" value="1" <#if homepageInfo.STATE=1>checked="checked"</#if>>是&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="state" value="0" <#if homepageInfo.STATE=0>checked="checked"</#if>>否&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td>图片</td>
		<td><input type="file" name="pic" class="fbtn" size="40"></td>
	</tr>
	<tr>
		<td>上次修改人</td>
		<td>${homepageInfo.UPDATEUSER}</td>
	</tr>
	<tr>
		<td>上次修改时间</td>
		<td>${homepageInfo.UPDATETIME}</td>
	</tr>
	<tr>
		<td>上次修改IP</td>
		<td>${homepageInfo.UPDATEIP}</td>
	</tr>
	<tr>
		<td colspan="4">
		<@admin.ckeditor id="content" content="${homepageInfo.CONTENT}" />
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