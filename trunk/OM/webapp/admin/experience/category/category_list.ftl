<@admin.page>
	<@adminApp.naviBar navi="系统管理,奥数教育心得,心得分类管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是奥数教育心得分类管理页面，下面列出了奥数教育心得分类的信息，您可以维护这些信息<br>当分类中有文章时，您不能删除该分类">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newCategory').toggle();this.blur();return false;">新建分类</a>
	</@adminApp.naviInfo>
<div id="newCategory" style="display:none">
<form name="categoryFrom" action="addCategory.action" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">添加教育心得分类</td>
	</tr>
	<tr>
		<td>分类名称</td>
		<td><input type="text" name="name" size="60" emptyInfo="请输入分类名称" maxLen="40" lengthInfo="名称过长，请缩减"></td>
	</tr>
	<tr>
		<td>分类描述</td>
		<td><input type="text" name="description" size="60" emptyInfo="请输入分类描述" maxLen="190" lengthInfo="描述过长，请缩减"></td>
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
	<col width="25%" align="center">
	<col width="15%" align="center">
	<col width="15%" align="center">
	<col width="15%" align="center">
	<col width="20%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>分类名称</td>
		<td>创建时间</td>
		<td>最后修改时间</td>
		<td>最后修改IP</td>
		<td>操作</td>
	</tr>
	<#assign count=(pageNum-1)*pageSize+1 />
	<#list categoryList.list as category>
	<tr <@admin.trChangeColor />>
		<td>${count}</td>
		<td>${category.NAME}</td>
		<td>${category.POSTTIME?datetime}</td>
		<td>${category.UPDATETIME?datetime}</td>
		<td>${category.UPDATEIP}</td>
		<td><a href="preUpdate.action?categoryId=${category.ID}">修改</a> | <a href="delete.action?categoryId=${category.ID}" onclick="return confirm('确定要删除吗？')">删除</a></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
<div align="right"><@admin.paging categoryList/></div>
</@admin.page>