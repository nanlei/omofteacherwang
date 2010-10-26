<@admin.page>
	<@adminApp.naviBar navi="系统管理,奥数方法认识,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是奥数方法认识管理页面，下面列出了奥数方法认识的信息，您可以维护这些信息<br>">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newMethod').toggle();this.blur();return false;">添加奥数方法</a>
	</@adminApp.naviInfo>
<div id="newMethod" style="display:none">
<form name="methodForm" action="addMethod.action" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">添加奥数方法</td>
	</tr>
	<tr>
		<td>标题</td><td><input type="text" name="title" size="60" emptyInfo="请填写标题"></td>
	</tr>
	<tr>
		<td>顺序（填写数字，升序显示）</td><td><input type="text" name="order" size="60" numberInfo="请填写数字"></td>
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
	<col width="7%" align="center">
	<col width="10%" align="center">
	<col width="24%" align="center">
	<col width="13%" align="center">
	<col width="13%" align="center">
	<col width="10%" align="center">
	<col width="8%" align="center">
	<col width="15%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>发布人</td>
		<td>标题</td>
		<td>发布时间</td>
		<td>最后修改时间</td>
		<td>最后修改IP</td>
		<td>排序</td>
		<td>操作</td>
	</tr>
	<#assign count=(pageNum-1)*pageSize+1 />
	<#list methodList.list as method>
	<tr>
		<td>${count}</td>
		<td>${method.USERNAME!'游客'}</td>
		<td>${method.TITLE}</td>
		<td>${method.POSTTIME?datetime}</td>
		<td>${method.UPDATETIME?datetime}</td>
		<td>${method.UPDATEIP}</td>
		<td>${method.ORDERS}</td>
		<td><a href="preUpdate.action?id=${method.ID}">修改</a> | <a href="delete.action?id=${method.ID}" onclick="return confirm('确定要删除吗？')">删除</a></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
<div align="right"><@admin.paging methodList/></div>
</@admin.page>