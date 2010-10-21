<@admin.page>
	<@adminApp.naviBar navi="系统管理,教师管理,教师信息,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是教师用户信息页，下面列出了教师用户的详细信息，您可以修改这些信息<br>密码留空表示不修改密码">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newTeacher').toggle();this.blur();return false;">添加新教师账号</a>
	</@adminApp.naviInfo>
<table width="100%" class="default">
	<col align="center" width="30%">
	<col align="left" width="70%">
	<tr>
		<td colspan="2">教师用户信息修改（没有修改框的是不能修改项目）</td>
	</tr>
	<tr>
		<td>登录名</td><td>${teacherInfo.USERNAME!'-'}</td>
	</tr>
	<tr>
		<td>真实姓名</td><td>${teacherInfo.REALNAME!'-'}</td>
	</tr>
	<tr>
		<td>密码</td><td><input type="password" name="password" id="pwd"></td>
	</tr>
	<tr>
		<td>确认密码</td><td><input type="password" name="password2" id="pwd2"></td>
	</tr>
	<tr>
		<td>电子邮件</td><td><input type="text" name="email" value="${teacherInfo.EMAIL}"></td>
	</tr>
	<tr>
		<td>电话号码</td><td><input type="text" name="mobile" value="${teacherInfo.MOBILE}"></td>
	</tr>
	<tr>
		<td>用户角色</td>
		<td>
			<input type="radio" name="role" value="1" <#if teacherInfo.ROLE=1>checked="checked"</#if>>管理员&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="role" value="0">普通用户
		</td>
	</tr>
</table>
</@admin.page>