<@admin.page>
	<@adminApp.naviBar navi="系统管理,知识点评测,知识点管理,修改,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是知识点修改页面，下面列出了知识点的详细信息，您可以维护这些信息<br>上传新附件时会自动删除老附件">
	<a href="javascript:history.go(-1)" class="navlink">返回</a>
	</@adminApp.naviInfo>
<form name="knowledgeForm" action="update.action?id=${knowledgeMap.ID}" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">知识点信息修改（带<@admin.mustMark/>的项是必填项）</td>
	</tr>
	<tr>
		<td><@admin.mustMark/>标题</td>
		<td><input type="text" name="title" value="${knowledgeMap.TITLE}" size="60" emptyInfo="请填写标题"></td>
	</tr>
	<tr>
		<td><@admin.mustMark/>分类</td>
		<td>
			<select name="categoryId" emptyInfo="请选择一个分类">
				<option>--请选择--</option>
				<#list categorys as category>
				<option value="${category.ID}" <#if knowledgeMap.KNOWLEDGEDIVID=category.ID>selected="selected"</#if>>${category.GRADE}年级-${category.NAME}</option>
				</#list>
			</select>
		</td>
	</tr>
	<tr>
		<td>当前附件</td>
		<td><#if knowledgeMap.URL?has_content><a href="${base}${knowledgeMap.URL}">下载</a> | <a href="deleteAttachment.action?id=${knowledgeMap.ID}">删除</a><#else>未上传附件</#if></td>
	</tr>
	<tr>
		<td>新附件</td>
		<td><input type="file" name="attachment" size="60" class="fbtn"></td>
	</tr>
	<tr>
		<td>发布时间</td>
		<td>${knowledgeMap.POSTTIME?datetime}</td>
	</tr>
	<tr>
		<td>最后更新时间</td>
		<td>${knowledgeMap.UPDATETIME?datetime}</td>
	</tr>
	<tr>
		<td>最后更新IP</td>
		<td>${knowledgeMap.UPDATEIP}</td>
	</tr>
	<tr>
		<td colspan="2"><@admin.ckeditor id="content" content="${knowledgeMap.CONTENT}" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="提交" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>
</@admin.page>