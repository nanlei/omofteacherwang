<@admin.page>
	<@adminApp.naviBar navi="系统管理,教师管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是教师管理首页，下面列出了系统内的教师用户，您可以维护这些信息<br>新添加的用户没有管理员权限，您需要修改它们的信息来提升权限">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newTeacher').toggle();this.blur();return false;">添加新教师账号</a>
	</@adminApp.naviInfo>
<script type="text/javascript">
function checkPassword(){
	var pwd=$("#pwd").val();
	var pwd2=$("#pwd2").val();
	if(pwd!="" && pwd2!="" && pwd!=pwd2){
		alert("两次密码输入的不一致，请检查后重新提交");
		document.teacherForm.password2.focus();
		return false;
	}else{
		return true;
	}
}
</script>
<div id="newTeacher" style="display:none">
<form name="teacherForm" action="addTeacher.action" onsubmit="return validateForm(this)" method="post">
	<table class="default" width="100%">
		<col width="20%" align="center">
		<col width="30%" align="left">
		<col width="20%" align="center">
		<col width="30%" align="left">
		<tr class="title">
			<td colspan="4">添加新教师账号（带<@admin.mustMark/>号项目必填）</td>
		</tr>
		<tr>
			<td>登录名<@admin.mustMark/></td>
			<td><input type="text" name="userName" emptyInfo="请输入登录名"></td>
			<td>真实姓名<@admin.mustMark/></td>
			<td><input type="text" name="realName" emptyInfo="请输入真实姓名"></td>
		</tr>
		<tr>
			<td>密码<@admin.mustMark/></td>
			<td><input type="password" name="password" id="pwd" emptyInfo="请输入密码"></td>
			<td>确认密码<@admin.mustMark/></td>
			<td><input type="password" name="password2" id="pwd2" emptyInfo="请输入确认密码"></td>
		</tr>
		<tr>
			<td>手机号码<@admin.mustMark/></td>
			<td><input type="text" name="mobile" emptyInfo="请输入手机号码" numberInfo="手机号码应该为数字"></td>
			<td>E-Mail<@admin.mustMark/></td>
			<td><input type="text" name="email" emailInfo="请输入合法的Email地址"></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="submit" value="提交" class="btn" onclick="return checkPassword()">&nbsp;&nbsp;&nbsp;<input type="reset" value="重填" class="btn">
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
		<td>电子邮件</td>
		<td>电话号码</td>
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
		<td><a href="preUpdate.action?id=${teacher.ID}">修改信息</a></td>
	</tr>
	<#assign count=count+1 />
	</#list>
</table>
<div align="right"><@admin.paging teacherList/></div>
</@admin.page>