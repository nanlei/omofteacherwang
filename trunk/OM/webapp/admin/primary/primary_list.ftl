<@admin.page>
	<@adminApp.naviBar navi="系统管理,小升初咨询,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是小升初咨询的管理页面，下面列出了小升初咨询的信息，您可以维护这些信息<br>优先级是小数优先">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newConsulting').toggle();this.blur();return false;">添加咨询</a>
	</@adminApp.naviInfo>
<div id="newConsulting" style="display:none">
<form name="consultingForm" action="addConsulting.action" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">添加咨询</td>
	</tr>
	<tr>
		<td>标题</td>
		<td><input type="text" name="title" emptyInfo="请填写标题" size="60"></td>
	</tr>
	<tr>
		<td>优先级（小数优先）</td>
		<td>
			<#assign options=["1","2","3","4","5","6","7","8","9"]>
			<select name="pri" emptyInfo="请选择优先级">
				<option>-请选择-</option>
				<#list options as option>
				<option value="${option}">${option}</option>
				</#list>
			</select>
		</td>
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
	<col width="5%" align="center">
	<col width="20%" align="center">
	<col width="9%" align="center">
	<col width="13%" align="center">
	<col width="10%" align="center">
	<col width="5%" align="center">
	<col width="5%" align="center">
	<col width="6%" align="center">
	<col width="6%" align="center">
	<col width="6%" align="center">
	<col width="15%" align="center">
	<tr class="title">
		<td rowspan="2">序号</td>
		<td rowspan="2">标题</td>
		<td rowspan="2">发布人</td>
		<td rowspan="2">发布时间</td>
		<td rowspan="2">发布IP</td>
		<td rowspan="2">优先级</td>
		<td rowspan="2">审核状态</td>
		<td colspan="3">投票信息</td>
		<td rowspan="2">操作</td>
	</tr>
	<tr class="title">
		<td>可靠</td>
		<td>不可信</td>
		<td>不关心</td>
	</tr>
	<#assign count=(pageNum-1)*pageSize+1 />
	<#list primaryList.list as primary>
	<tr <@admin.trChangeColor />>
		<td>${count}</td>
		<td>${primary.TITLE}</td>
		<td>${primary.USERNAME}</td>
		<td>${primary.POSTTIME?datetime}</td>
		<td>${primary.POSTIP}</td>
		<td>${primary.PRI}</td>
		<td><#if primary.STATE=1>已审核<#else>未审核</#if></td>
		<td>${primary.VOTE1}</td>
		<td>${primary.VOTE2}</td>
		<td>${primary.VOTE3}</td>
		<td><a href="info.action?id=${primary.ID}">回复详情</a> | <a href="preUpdate.action?id=${primary.ID}">修改</a> | <a href="delete.action?id=${primary.ID}" onclick="return confirm('将级联删除所有回复，确定删除吗？')">删除</a></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
<div align="right"><@admin.paging primaryList/></div>
</@admin.page>