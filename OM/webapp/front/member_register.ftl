<@p.page>
<script type="text/javascript">
	var flag_now;
	function checkMemberExist(){
		var userName=$("#userName").val();
		$.ajax({
	   	 	type: "POST",
	   		url: "${base}/front/checkMemberExist.action",
	   		data: { userName: userName },
	   		success: function(data){
	   			if(data.status){
	   				flag_now=true;
	   				$("#tipUserName").html("<font color=\"red\"> &#187; 当前用户名已被注册</font>");
	   			}else{
	   				flag_now=false;
	   				$("#tipUserName").html("<font color=\"green\"> &#187; 当前用户名可用</font>");
	   			}
	   		},
	   		error:function(xmlHttpRequest,status,exception){
				flag_now=false;
	   			alert("请求失败，请检查网络连接");
	   		}
		});
	}	
	
	function checkPwd(){
		var pwd1=$("#pwd1").val();
		var pwd2=$("#pwd2").val();
		$.ajax({
	   	 	type: "POST",
	   		url: "${base}/front/checkPassword.action",
	   		data: { pwd1: pwd1, pwd2: pwd2 },
	   		success: function(data){
	   			if(data.status){
	   				flag_now=true;
	   				$("#tipPwd2").html("<font color=\"green\"> &#187; 两次密码输入匹配</font>");
	   			}else{
	   				flag_now=false;
	   				$("#tipPwd2").html("<font color=\"red\"> &#187; 两次密码输入不匹配（或为空）</font>");
	   			}
	   		},
	   		error:function(xmlHttpRequest,status,exception){
				flag_now=false;
	   			alert("请求失败，请检查网络连接");
	   		}
		});
	}
	
	function addMember(){
		var userName=$("#userName").val();
		var pwd1=$("#pwd1").val();
		var pwd2=$("#pwd2").val();
		var realName=$("#realName").val();
		var email=$("#email").val();
		var mobile=$("mobile").val();
		
		if(userName==""){
			$("#tipUserName").html("<font color=\"red\"> &#187; 请输入用户名</font>");
			$("#tipUserName").focus();
		} else if(pwd1==""){
			$("#tipPwd1").html("<font color=\"red\"> &#187; 请输入密码</font>");
			$("#tipPwd1").focus();
		} else if(pwd2==""){
			$("#tipPwd2").html("<font color=\"red\"> &#187; 请输入确认密码</font>");
			$("#tipPwd2").focus();
		} else if(pwd1!=pwd2){
			$("#tipPwd1").html("<font color=\"red\"> &#187; 两次密码输入不匹配（或为空）</font>");
			$("#tipPwd1").focus();
		} else if(realName==""){
			$("#tipRealName").html("<font color=\"red\"> &#187; 请输入您的真实姓名</font>");
			$("#tipRealName").focus();
		} else if(email==""){
			$("#tipEmail").html("<font color=\"red\"> &#187; 请输入您的E-mail地址</font>");
			$("#tipEmail").focus();
		}
		else if(pwd1==pwd2 && flag_now){
			$.ajax({
	   		 	type: "POST",
	   			url: "${base}/front/addMember.action",
	   			data: { userName: userName, password: pwd2, realName: realName, email: email, mobile: mobile, time: new Date().getTime() },
	   			success: function(data){
	   				if(data.status){
	   					alert("恭喜您，注册成功！");
	   					forward(userName, pwd2);
	   				}else{
	   					alert("对不起，注册失败！");
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
	
	function forward(userName, pwd2){
		var userName=userName;
		var password=pwd2;
		$.ajax({
	   	 	type: "POST",
	   		url: "${base}/loginForWard.action",
	   		data: { userName: userName, password: password },
		});
	}
</script>
<#-- 导航链接-->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><a href="#">王炳禹奥数在线</a></h1>
      <p>让奥数成为训练思维的利器！</p>
    </div>
    <#if loginUser?exists>
    <div id="topnav">
      <ul>
        <li><a href="${base}/front/Member!viewIndex.action">主页</a></li>
        <li><a href="${base}/front/Member!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/Member!shareData.action">奥数资料分享</a></li>
        <li><a href="#">学生讨论区</a></li>
        <li class="last"><a href="#">联系我们</a></li>
      </ul>
    </div>
    <#else>
    <div id="topnav">
      <ul>
        <li><a href="${base}/front/Anonym!viewIndex.action">主页</a></li>
        <li><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/Anonym!shareData.action">奥数资料分享</a></li>
        <li><a href="#">学生讨论区</a></li>
        <li class="last"><a href="#">联系我们</a></li>
      </ul>
    </div>
    </#if>
    <br class="clear" />
  </div>
</div>
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      <li>&#187;</li>
      <#if loginUser?exists>
      	<li><a href="${base}/front/Anonym!viewIndex.action">主页</a></li>
      <#else>
      	<li><a href="${base}/front/Anonym!viewIndex.action">主页</a></li>
      </#if>
      <li>&#187;</li>
      <li class="last"><a href="#">注册用户</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<#-- 用户注册-->
<div class="wrapper col3">
  <div id="container">
 	<h1>注册会员</h1>
  	<div id="respond">	
  		<table width="100%" align="center">
  		<form onsubmit="return validateForm(this)">
          <p>
            <input type="text" name="userName" id="userName" size="22" onBlur="checkMemberExist()" emptyInfo="请输入用户名" maxLen="15" lengthInfo="用户名不得大于15个英文字符"/>
            <label for="name"><small>请输入用户名 (必填)</small></label>
            <label for="name"><strong><span id="tipUserName"></strong></label>
          </p>
          <p>
            <input type="password" name="userpass1" id="pwd1" size="22" onBlur="checkPwd()" emptyInfo="请输入密码" maxLen="32" lengthInfo="密码不得大于32个英文字符"/>
            <label for="name"><small>请输入密码 (必填)</small></label>
            <label for="name"><small><strong><span id="tipPwd1"></strong></small></label>
          </p>
          <p>
            <input type="password" name="userpass2" id="pwd2" size="22" onBlur="checkPwd()" emptyInfo="请再次输入密码" maxLen="32" lengthInfo="密码不得大于32个英文字符"/>
            <label for="name"><small>请再次输入密码 (必填)</small></label>
            <label for="name"><small><strong><span id="tipPwd2"></strong></small></label>
          </p>
          <p>
            <input type="text" id="realName" size="22" emptyInfo="请输入您的真实姓名" maxLen="15" lengthInfo="真实姓名不得大于7中文字符或15个英文字符"/>
            <label for="name"><small>请输入您的真实姓名 (必填)</small></label>
            <label for="name"><small><span id="tipRealName"></small></label>
          </p>
          <p>
            <input type="text" name="email" id="email" size="22" emptyInfo="请输入您的E-mail地址" maxLen="50" lengthInfo="E-mail地址不得大于50个英文字符"/>
            <label for="name"><small>请输入您的E-mail地址 (必填)</small></label>
            <label for="name"><small><span id="tipEmail"></small></label>
          </p>
          <p>
            <input type="text" name="mobile" id="mobile"  value="" size="22" />
            <label for="name"><small>请输入您联系电话 (选填)</small></label>
            <label for="name"><small><span id="tipMoblie"></small></label>
          </p>
          <p>
            <input name="submit" type="submit" id="submit" value="注册" />
            &nbsp;
            <input name="reset" type="reset" id="reset" tabindex="5" value="重置" />
          </p>
        </form>
        <table>
  	</div>
  </div>
</div>
<#-- /用户注册-->

</@p.page>