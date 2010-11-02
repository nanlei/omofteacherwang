<@admin.page>
	<@adminApp.naviBar navi="系统管理,奥数资料分享,资料管理,修改,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是奥数资料分享信息页面，下面列出了奥数资料分享的详细信息，您可以维护这些信息<br>">
	<a href="javascript:history.go(-1)" class="navlink">返回</a>
	</@adminApp.naviInfo>
<form name="dataForm" action="update.action?id=${dataMap.ID}" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">信息详情</td>
	</tr>
	<tr>
		<td>标题</td>
		<td><input type="text" name="title" value="${dataMap.TITLE}" emptyInfo="请填写标题" size="75"></td>
	</tr>
	<tr>
		<td>类型</td>
		<td>
			<select name="dataDivId" emptyInfo="请选择分类">
				<option>--请选择--</option>
				<#list categorys as category>
				<option value="${category.ID}" <#if dataMap.DIVID=category.ID>selected="selected"</#if>>${category.NAME}</option>
				</#list>
			</select>
		</td>
	</tr>
	<tr>
		<td>新文件(替换原有)</td>
		<td><input type="file" name="data" class="fbtn" size="60"></td>
	</tr>
	<tr>
		<td>发布者</td>
		<td>${dataMap.USERNAME}</td>
	</tr>
	<tr>
		<td>发布时间</td>
		<td>${dataMap.POSTTIME?datetime}</td>
	</tr>
	<tr>
		<td>下载次数</td>
		<td>${dataMap.DOWNLOADTIMES}</td>
	</tr>
	<tr>
		<td>下载文件</td>
		<td><a href="${base}${dataMap.URL}" title="后台下载不记次数">文件下载</a></td>
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