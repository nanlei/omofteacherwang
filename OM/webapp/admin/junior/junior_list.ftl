<@admin.page>
	<@adminApp.naviBar navi="系统管理,初中学习,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是初中学习的信息管理页面，下面列出了初中学习的信息，您可以维护这些信息<br>">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newJunior').toggle();this.blur();return false;">添加初中学习</a>
	</@adminApp.naviInfo>
<div id="newJunior" style="display:none">
<form name="juniorForm" action="addJunior.action" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">添加初中学习</td>
	</tr>
	<tr>
		<td>标题</td>
		<td><input type="text" name="title" size="60" emptyInfo="请填写标题"></td>
	</tr>
	<tr>
		<td colspan="2"><@admin.ckeditor id="content" content="请填写内容"/></td>
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
	<col width="40%" align="center">
	<col width="15%" align="center">
	<col width="15%" align="center">
	<col width="20%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>标题</td>
		<td>发布者</td>
		<td>发布时间</td>
		<td>操作</td>
	</tr>
	<#assign count=(pageNum-1)*pageSize+1 />
	<#list juniorList.list as junior>
	<tr <@admin.trChangeColor />>
		<td>${count}</td>
		<td>${junior.TITLE}</td>
		<td>${junior.USERNAME}</td>
		<td>${junior.POSTTIME?datetime}</td>
		<td><a href="preUpdate.action?id=${junior.ID}">修改</a> | <a href="delete.action?id=${junior.ID}" onclick="return confirm('确定要删除吗？')">删除</a></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
<div align="right"><@admin.paging juniorList/></div>
</@admin.page>