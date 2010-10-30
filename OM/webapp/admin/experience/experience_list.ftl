<@admin.page>
	<@adminApp.naviBar navi="系统管理,奥数教育心得,信息管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是奥数教育心得信息管理页面，下面列出了奥数教育心得的信息，您可以维护这些信息<br>当分类中有文章时，您不能删除该分类">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newExperience').toggle();this.blur();return false;">添加教育心得</a>
	</@adminApp.naviInfo>
<div id="newExperience" style="display:none">
<form name="categoryFrom" action="addExperience.action" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">添加教育心得（带<@admin.mustMark/>的项是必填项）</td>
	</tr>
	<tr>
		<td><@admin.mustMark/>标题</td>
		<td><input type="text" name="title" size="60" emptyInfo="请输入标题" maxLen="40" lengthInfo="标题过长，请缩减"></td>
	</tr>
	<tr>
		<td><@admin.mustMark/>分类描述</td>
		<td>
			<select name="expDivId" emptyInfo="请选择一个分类">
				<option>--请选择--</option>
				<#list categorys as category>
				<option value="${category.ID}">${category.NAME}</option>
				</#list>
			</select>
		</td>
	</tr>
	<tr>
		<td>显示顺序(小数优先)</td>
		<td><input type="text" name="orders" size="60" emptyInfo="请填写显示顺序优先级" maxLen="10" lengthInfo="输出过长，请缩减" numberInfo="请填写数字"></td>
	</tr>
	<tr>
		<td colspan="2"><@admin.ckeditor id="content" content="请输入内容"/></td>
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
	<col width="7%" align="center">
	<col width="25%" align="center">
	<col width="10%" align="center">
	<col width="7%" align="center">
	<col width="13%" align="center">
	<col width="13%" align="center">
	<col width="10%" align="center">
	<col width="15%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>标题</td>
		<td>分类名称</td>
		<td>显示顺序</td>
		<td>创建时间</td>
		<td>最后修改时间</td>
		<td>最后修改IP</td>
		<td>操作</td>
	</tr>
	<#assign count=(pageNum-1)*pageSize+1 />
	<#list experienceList.list as experience>
	<tr <@admin.trChangeColor />>
		<td>${count}</td>
		<td>${experience.TITLE}</td>
		<td>${experience.NAME}</td>
		<td>${experience.ORDERS}</td>
		<td>${experience.POSTTIME?datetime}</td>
		<td>${experience.UPDATETIME?datetime}</td>
		<td>${experience.UPDATEIP}</td>
		<td><a href="preUpdate.action?id=${experience.ID}">修改</a> | <a href="delete.action?id=${experience.ID}" onclick="return confirm('确定要删除吗？')">删除</a></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
<div align="right"><@admin.paging experienceList/></div>
</@admin.page>