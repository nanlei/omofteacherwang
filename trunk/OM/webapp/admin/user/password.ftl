<@admin.page>
	<@adminApp.naviBar navi="系统管理,密码修改" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是密码修改页面，您可以根据提示信息来修改个人密码">
	</@adminApp.naviInfo>
<script type="text/javascript">
var flag_now;
function checkNowPwd(){
	var nowPwd=$("#nowPwd").val();
	if(nowPwd==""){
		alert("请输入原密码");
	} else {
		$.ajax({
	   	 	type: "POST",
	   		url: "${base}/admin/user/checkPassword.action",
	   		data: { now: nowPwd, time: new Date().getTime() },
	   		success: function(data){
	   			if(data.status){
	   				flag_now=true;
	   				$("#tipNow").html("<font color=\"green\">原密码验证成功</font>");
	   			}else{
	   				flag_now=false;
	   				$("#tipNow").html("<font color=\"red\">原密码验证失败</font>");
	   			}
	   		},
	   		error:function(xmlHttpRequest,status,exception){
				flag_now=false;
	   			alert("请求失败，请检查网络连接");
	   		}
		});
	}
}

function updatePassword(){
	var pwd=$("#newPwd").val();
	var pwd2=$("#newPwd2").val();
	if(pwd==""){
		$("#tipPwd").html("<font color=\"red\">请输入密码</font>");
	} else if(pwd2==""){
		$("#tipPwd2").html("<font color=\"red\">请输入确认密码</font>");
	} else if(pwd!=pwd2){
		$("#tipPwd2").focus();
	} else if(pwd==pwd2 && flag_now){
		$.ajax({
	   	 	type: "POST",
	   		url: "${base}/admin/user/updatePassword.action",
	   		data: { password: pwd, password2: pwd2, time: new Date().getTime() },
	   		success: function(data){
	   			if(data.status){
	   				alert("密码修改成功");
	   				clean();
	   			}else{
	   				alert("密码修改失败，请重试");
	   			}
	   		},
	   		error:function(xmlHttpRequest,status,exception){
				flag_now=false;
	   			alert("请求失败，请检查网络连接");
	   		}
		});
	} else {
		alert("有输入项不正确，请重新输入");
	}
}

function clean(){
	$("#nowPwd").attr('value','');
	$("#newPwd").attr('value','');
	$("#newPwd2").attr('value','');
}
</script>
<table class="default" width="100%">
	<col width="30%" align="center">
	<col width="50%" align="center">
	<col width="20%" align="center">
	<tr class="title">
		<td colspan="3">请输入相关信息（带<@admin.mustMark/>符号的必填）</td>
	</tr>
	<tr>
		<td><@admin.mustMark/>当前密码</td>
		<td><input type="password" id="nowPwd" size="60" onBlur="checkNowPwd()"></td>
		<td><span id="tipNow"></td>
	</tr>
	<tr>
		<td><@admin.mustMark/>新密码</td>
		<td><input type="password" id="newPwd" size="60"></td>
		<td><span id="tipPwd"></td>
	</tr>
	<tr>
		<td><@admin.mustMark/>新密码确认</td>
		<td><input type="password" id="newPwd2" size="60"></td>
		<td><span id="tipPwd2"></td>
	</tr>
	<tr>
		<td colspan="3">
			<input type="submit" value="提交" class="btn" onclick="updatePassword()">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="重置" class="btn" onclick="clean()">
		</td>
	</tr>
</table>
</@admin.page>
