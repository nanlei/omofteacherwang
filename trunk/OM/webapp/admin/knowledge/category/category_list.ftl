<@admin.page>
	<@adminApp.naviBar navi="系统管理,知识点评测,知识点分类管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是知识点分类管理页面，下面列出了知识点分类的信息，您可以维护这些信息<br>当分类中有文章时，您不能删除该分类">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newCategory').toggle();this.blur();return false;">新建分类</a>
	</@adminApp.naviInfo>
<div id="newCategory" style="display:none">
<form name="categoryForm" action="addCategory.action" method="post" onsubmit="return validateForm(this)">
<table width="100%" class="default">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">新建知识分类（带<@admin.mustMark/>的项是必填项）</td>
	</tr>
	<tr>
		<td><@admin.mustMark/>分类名称</td>
		<td><input type="text" name="name" size="60" emptyInfo="请填写分类名称"></td>
	</tr>
	<tr>
		<td><@admin.mustMark/>年级</td>
		<td><input type="text" name="grade" size="60" emptyInfo="请填写年级"></td>
	</tr>
	<tr>
		<td><@admin.mustMark/>描述</td>
		<td><input type="text" name="description" size="60" emptyInfo="请填写一些描述"></td>
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
<table width="100%" class="default">
	<col width="5%" align="center">
	<col width="14%" align="center">
	<col width="7%" align="center">
	<col width="20%" align="center">
	<col width="5%" align="center">
	<col width="13%" align="center">
	<col width="13%" align="center">
	<col width="8%" align="center">
	<col width="15%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>分类名称</td>
		<td>年级</td>
		<td>描述</td>
		<td>信息条数</td>
		<td>发布时间</td>
		<td>最后修改时间</td>
		<td>最后修改IP</td>
		<td>操作</td>
	</tr>
	<#assign count=(pageNum-1)*pageSize+1 />
	<#list categoryList.list as category>
	<tr <@admin.trChangeColor />>
		<td>${count}</td>
		<td>${category.NAME}</td>
		<td>${category.GRADE}</td>
		<td>${category.DESCRIPTION}</td>
		<td>${category.ARTICLENUM}</td>
		<td>${category.POSTTIME?datetime}</td>
		<td>${category.UPDATETIME?datetime}</td>
		<td>${category.UPDATEIP}</td>
		<td><a href="preUpdate.action?categoryId=${category.ID}">修改</a><#if (category.ARTICLENUM<=0)> | <a href="delete.action?categoryId=${category.ID}" onclick="return confirm('确定删除吗？')">删除<a><#else></#if></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
<div align="right"><@admin.paging categoryList/></div>
</@admin.page>