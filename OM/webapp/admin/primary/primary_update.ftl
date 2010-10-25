<@admin.page>
	<@adminApp.naviBar navi="系统管理,小升初咨询,修改,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是小升初咨询的管理页面，下面列出了小升初咨询的信息，您可以维护这些信息<br>优先级是小数优先">
	<a href="javascript:history.go(-1)" class="navlink">返回</a>
	</@adminApp.naviInfo>
<form name="consultingForm" action="update.action?id=${primaryMap.ID}" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="15%" align="center">
	<col width="15%" align="center">
	<col width="70%" align="center">
	<tr class="title">
		<td colspan="3">咨询详情</td>
	</tr>
	<tr>
		<td colspan="2">标题</td>
		<td><input type="text" name="title" value="${primaryMap.TITLE}" emptyInfo="请填写标题" size="60"></td>
	</tr>
	<tr>
		<td colspan="2">发布者</td>
		<td>${primaryMap.USERNAME}</td>
	</tr>
	<tr>
		<td colspan="2">发布时间</td>
		<td>${primaryMap.POSTTIME?datetime}</td>
	</tr>
	<tr>
		<td colspan="2">发布IP</td>
		<td>${primaryMap.POSTIP}</td>
	</tr>
	<tr>
		<td colspan="2">状态</td>
		<td>
			<input type="radio" name="state" value="1" <#if primaryMap.STATE=1>checked="checked"</#if>>已审核&nbsp;&nbsp;
			<input type="radio" name="state" value="0" <#if primaryMap.STATE=0>checked="checked"</#if>>未审核
		</td>
	</tr>
	<tr>
		<td colspan="2">优先级（小数优先）</td>
		<td>
			<#assign options=["1","2","3","4","5","6","7","8","9"]>
			<select name="pri" emptyInfo="请选择优先级">
				<option>-请选择-</option>
				<#list options as option>
				<option value="${option}" <#if option?number=primaryMap.PRI>selected="selected"</#if>>${option}</option>
				</#list>
			</select>
		</td>
	</tr>
	<tr>
		<td rowspan="3">投票信息</td>
		<td>可靠</td>
		<td>${primaryMap.VOTE1}票</td>
	</tr>
	<tr>
		<td>不可信</td>
		<td>${primaryMap.VOTE2}票</td>
	</tr>
	<tr>
		<td>不关心</td>
		<td>${primaryMap.VOTE3}票</td>
	</tr>
	<tr>
		<td colspan="3">
		<@admin.ckeditor id="content" content="${primaryMap.CONTENT}"/>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<input type="submit" value="提交" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>
</form>
</@admin.page>