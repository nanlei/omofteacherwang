<@admin.page>
	<@adminApp.naviBar navi="系统管理,教师管理,教师信息,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是教师用户信息页，下面列出了教师用户的详细信息，您可以修改这些信息<br>密码留空表示不修改密码">
	<a href="javascript:history.go(-1)" class="navlink">返回</a>
	</@adminApp.naviInfo>
<script type="text/javascript">
function checkPassword(){
	var pwd=$("#pwd").val();
	var pwd2=$("#pwd2").val();
	if(pwd!="" || pwd2!=""){
		if(pwd==pwd2){
			return true;
		} else {
			alert("两次密码输入的不一致，请检查后重新提交");
			document.teacherForm.password2.focus();
			return false;
		}
	} else {
		return true;
	}
}
</script>
<form name="teacherForm" action="update.action?id=${teacherInfo.ID}" method="post" onSubmit="return validateForm(this)">
<table width="100%" class="default">
	<col align="center" width="30%">
	<col align="left" width="70%">
	<tr class="title">
		<td colspan="2">教师用户信息修改（没有修改框的是不能修改项）</td>
	</tr>
	<tr>
		<td>登录名</td><td>${teacherInfo.USERNAME!'-'}</td>
	</tr>
	<tr>
		<td>真实姓名</td><td>${teacherInfo.REALNAME!'-'}</td>
	</tr>
	<tr>
		<td>密码</td><td><input type="password" name="password" id="pwd" size="60"></td>
	</tr>
	<tr>
		<td>确认密码</td><td><input type="password" name="password2" id="pwd2" size="60"></td>
	</tr>
	<tr>
		<td>电子邮件</td><td><input type="text" name="email" value="${teacherInfo.EMAIL}" size="60" emptyInfo="请输入E-Mail地址" emailInfo="请输入合法的E-Mail地址"></td>
	</tr>
	<tr>
		<td>电话号码</td><td><input type="text" name="mobile" value="${teacherInfo.MOBILE}" size="60" emptyInfo="请输入手机号码" numberInfo="手机号码应该为数字"></td>
	</tr>
	<tr>
		<td>用户角色</td>
		<td>
			<input type="radio" name="role" value="1" <#if teacherInfo.ROLE=1>checked="checked"</#if>>管理员&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="role" value="0" <#if teacherInfo.ROLE=0>checked="checked"</#if>>普通用户
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="提交" class="btn" onclick="return checkPassword()">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>
</form>
</@admin.page>