<@admin.page>
	<@adminApp.naviBar navi="系统管理,奥数资料分享,资料管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是奥数资料分享管理页面，下面列出了奥数资料分享的信息，您可以维护这些信息<br>">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newData').toggle();this.blur();return false;">上传资料</a>
	<a href="javascript:void(0)" class="navlink" onclick="$('#newSearch').toggle();this.blur();return false;">分类搜索</a>
	</@adminApp.naviInfo>
<div id="newData" style="display:none">
<form name="dataForm" action="addData.action" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">上传资料</td>
	</tr>
	<tr>
		<td>标题</td><td><input type="text" name="title" size="75" emptyInfo="请填写资料标题"></td>
	</tr>
	<tr>
		<td>分类</td>
		<td>
			<select name="dataDivId" emptyInfo="请选择分类">
				<option>--请选择--</option>
				<#list categorys as category>
				<option value="${category.ID}">${category.NAME}</option>
				</#list>
			</select>
		</td>
	</tr>
	<tr>
		<td>文件</td><td><input type="file" name="data" size="60" class="fbtn" emptyInfo="请选择文件"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="添加" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>
</form>
</div>
<div id="newSearch" style="display:none">
<form name="searchForm" action="search.action" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">搜索资料</td>
	</tr>
	<tr>
		<td>分类</td>
		<td>
			<select name="dataDivId" emptyInfo="请选择分类">
				<option>--请选择--</option>
				<#list categorys as category>
				<option value="${category.ID}">${category.NAME}</option>
				</#list>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="提交" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>		
</form>
</div>
<table class="default" width="100%">
	<col width="10%" align="center">
	<col width="20%" align="center">
	<col width="15%" align="center">
	<col width="10%" align="center">
	<col width="15%" align="center">
	<col width="10%" align="center">
	<col width="20%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>标题</td>
		<td>分类</td>
		<td>上传者</td>
		<td>上传时间</td>
		<td>下载次数</td>
		<td>操作</td>
	</tr>
	<#assign count=(pageNum-1)*pageSize+1 />
	<#list dataList.list as data>
	<tr <@admin.trChangeColor />>
		<td>${count}</td>
		<td>${data.TITLE}</td>
		<td>${data.NAME}</td>
		<td>${data.USERNAME}</td>
		<td>${data.POSTTIME?datetime}</td>
		<td>${data.DOWNLOADTIMES}</td>
		<td><a href="preUpdate.action?id=${data.ID}">修改</a> | <a href="${base}${data.URL}" title="后台下载不记次数">下载</a> | <a href="delete.action?id=${data.ID}" onclick="return confirm('确定删除吗？')">删除</a></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
</@admin.page>