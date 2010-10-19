<#-- 后台登录首页 -->
<@admin.page>
<table width="100%" height="100%">
<tr>
	<td valign="middle">
		<form action="login.action" name="loginForm" onsubmit="return validateForm(this)" method="post">
		<table border="0" align="center" cellpadding="0" cellspacing="0" class="default">
		<tr class="title">
			<td colspan="2">OM后台系统登录</td>
		</tr>
		<tr>
			<td colspan="2" class="errorMessage" align="center"><#if errorInfo?exists>${errorInfo}</#if></td>
		</tr>
		<tr>
		  <td class="item" align="right" width="40%">用户名:</td>
		  <td><input type="text" name="userName" style="width:100px" emptyInfo="请输入用户名。" value="admin"></td>
		</tr>
		<tr>
		  <td class="item" align="right">密　码:</td>
		  <td><input type="password" name="password" style="width:100px" emptyInfo="请输入密码。" value="123"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="登录" class="btn">&nbsp;&nbsp;
				<input type="reset" value="重置" class="btn">
			</td>
		</tr>
		</table>
		</form>
	</td>
</tr>
</table>
</@admin.page>