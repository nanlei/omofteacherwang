<@admin.page>
	<@adminApp.naviBar navi="系统管理,知识点评测,知识点管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是知识点管理页面，下面列出了知识点的信息，您可以维护这些信息<br>">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newKnowledge').toggle();this.blur();return false;">添加知识点</a>
	<a href="javascript:void(0)" class="navlink" onclick="$('#searchKnowledge').toggle();this.blur();return false;">查找知识点</a>
	</@adminApp.naviInfo>
<div id="newKnowledge" style="display:none">
<form name="newKnowledgeForm" action="addKnowledge.action" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
<table width="100%" class="default">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">添加知识点（带<@admin.mustMark/>的项是必填项）</td>
	</tr>
	<tr>
		<td><@admin.mustMark/>标题</td>
		<td><input type="text" name="title" emptyInfo="请填写标题" size="60"></td>
	</tr>
	<tr>
		<td><@admin.mustMark/>分类</td>
		<td>
			<select name="categoryId" emptyInfo="请选择一个分类">
				<option>--请选择--</option>
				<#list categorys as category>
				<option value="${category.ID}">${category.GRADE}年级-${category.NAME}</option>
				</#list>
			</select>
		</td>
	</tr>
	<tr>
		<td>附件</td>
		<td><input type="file" name="attachment" class="fbtn" size="60"></td>
	</tr>
	<tr>
		<td colspan="2"><@admin.ckeditor id="content" content="请编辑内容"/></td>
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

<div id="searchKnowledge" style="display:none">
<form name="searchKnowledgeForm" action="searchKnowledge.action" method="post" onsubmit="return validateForm(this)">
<table width="100%" class="default">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">查找知识点</td>
	</tr>
	<tr>
		<td>选择分类</td>
		<td>
			<select name="categoryId" emptyInfo="请选择一个分类">
				<option>--请选择--</option>
				<#list categorys as category>
				<option value="${category.ID}">${category.GRADE}年级-${category.NAME}</option>
				</#list>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="查找" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>
</form>
</div>
<table class="default" width="100%">
	<col width="5%" align="center">
	<col width="20%" align="center">
	<col width="10%" align="center">
	<col width="10%" align="center">
	<col width="15%" align="center">
	<col width="15%" align="center">
	<col width="10%" align="center">
	<col width="15%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>标题</td>
		<td>分类</td>
		<td>年级</td>
		<td>发布时间</td>
		<td>最后更新时间</td>
		<td>最后更新IP</td>
		<td>操作</td>
	</tr>
	<#assign count=(pageNum-1)*pageSize+1 />
	<#list knowledgeList.list as knowledge>
	<tr <@admin.trChangeColor />>
		<td>${count}</td>
		<td>${knowledge.TITLE}</td>
		<td>${knowledge.NAME}</td>
		<td>${knowledge.GRADE}</td>
		<td>${knowledge.POSTTIME?datetime}</td>
		<td>${knowledge.UPDATETIME?datetime}</td>
		<td>${knowledge.UPDATEIP}</td>
		<td><a href="preUpdate.action?id=${knowledge.ID}">修改</a> | <a href="delete.action?id=${knowledge.ID}" onclick="return confirm('确定删除吗？')">删除</a></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
<div align="right"><@admin.paging knowledgeList/></div>
</@admin.page>