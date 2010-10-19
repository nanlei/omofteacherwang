<@admin.page>
	<@adminApp.naviBar navi="系统管理,教师管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是教师管理首页，下面列出了系统内的教师用户，您可以维护这些信息">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newTeacher').toggle();this.blur();return false;">添加新教师账号</a>
	</@adminApp.naviInfo>
<div id="newTeacher" style="display:none">
<form name="businessNewsForm" action="${base}/businessNews.do" onsubmit="return validateForm(this)">
<input type="hidden" name="com.roiland.command" value="add">
	<table class="default" width="100%">
		<col width="30%" align="center">
		<col width="70%" align="left">
		<tr class="title">
			<td colspan="2">添加新教师账号</td>
		</tr>
		<tr>
			<td>登录名</td>
			<td>
				<input type="text" name="userName" size="80" emptyInfo="请输入登录名">
			</td>
		</tr>
		<tr>
			<td>真实姓名</td>
			<td>
				<input type="text" size="80" emptyInfo="请输入真实姓名">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="发布" class="btn">&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重填" class="btn">
			</td>
		</tr>
	</table>
</form>
</div>
<table class="default" width="100%">
	<col width="10%" align="center">
	<col width="10%" align="center">
	<col width="10%" align="center">
	<col width="25%" align="center">
	<col width="15%" align="center">
	<col width="10%" align="center">
	<col width="20%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>登录名</td>
		<td>姓名</td>
		<td>邮件</td>
		<td>电话</td>
		<td>角色</td>
		<td>操作</td>
	</tr>
	<#assign count=(pageNum-1)*pageSize+1 />
	<#list teacherList.list as teacher>
	<tr <@admin.trChangeColor />>
		<td>${count}</td>
		<td>${teacher.USERNAME}</td>
		<td>${teacher.REALNAME}</td>
		<td>${teacher.EMAIL!'-'}</td>
		<td>${teacher.MOBILE!'-'}</td>
		<td><#if teacher.ROLE=1>管理员<#else>普通用户</#if></td>
		<td><a href="update.action?id=${teacher.ID}">修改</a></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
<div align="right"><@admin.paging teacherList/></div>
</@admin.page>