<#include "../common/front/config.ftl">
<@p.page>
<script type="text/javascript">
	var flag_user;
	var flag_pwd;
	
	function checkMemberExist(){
		var userName=$("#userName").val();
		$.ajax({
	   	 	type: "POST",
	   		url: "${base}/front/checkMemberExist.action",
	   		data: { userName: userName },
	   		success: function(data){
	   			if(data.status){
	   				flag_user=true;
	   				$("#tipUserName").html("<font color=\"green\"> &#187; 当前用户名可用</font>");
	   			}else{
	   				flag_user=false;
	   				$("#tipUserName").html("<font color=\"red\"> &#187; 当前用户名已被注册（或为空）</font>");
	   			}
	   		},
	   		error:function(xmlHttpRequest,status,exception){
				flag_user=false;
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
	   				flag_pwd=true;
	   				$("#tipPwd2").html("<font color=\"green\"> &#187; 两次密码输入匹配</font>");
	   			}else{
	   				flag_pwd=false;
	   				$("#tipPwd2").html("<font color=\"red\"> &#187; 两次密码输入不匹配（或为空）</font>");
	   			}
	   		},
	   		error:function(xmlHttpRequest,status,exception){
				flag_pwd;
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
		var mobile=$("#mobile").val();
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
		} else if(pwd1==pwd2 && flag_user && flag_pwd){
			$.ajax({
	   		 	type: "POST",
	   			url: "${base}/front/addMember.action",
	   			data: { userName: userName, password: pwd2, realName: realName, email: email, mobile: mobile},
	   			success: function(data){
	   				if(data.status){
	   					
	   					alert("恭喜您，注册成功！即将跳转到主页，请您登陆！");
	   					forward(userName, pwd2);
	   					window.location.href="${base}/front/Anonym!viewIndex.action";
	   				}else{
	   					alert("对不起，注册失败！");
	   				}
	   			},
	   			error:function(xmlHttpRequest,status,exception){
					flag_now=false;
	   				alert("请求失败，请检查网络连接");
	   			}
			});
	   		flag_user=false;
	   		flag_pwd=false;
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
    <div id="topnav">
      <ul>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewIndex.action">主页</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewPrimaryConsulting.action">小升初咨询</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewMethod.action">奥数方法认知</a></li>
        <li class="last"><a href="${base}/front/<@p.nameSpace loginUser?exists />!shareData.action">奥数资料分享</a></li>
      </ul>
      <br class="clear" />
      <ul>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewExperience.action">授课教育心得</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewJuniorStudy.action">初中学习</a></li>
        <li><a href="${macro_config.om_forum}" target="_black">学生讨论区</a></li>
        <li class="last"><a href="${base}/front/<@p.nameSpace loginUser?exists />!aboutUs.action">关于我们</a></li>
      </ul>
    </div>
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
      <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewIndex.action">主页</a></li>
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
  		
  		
          <p>
            <input type="text" id="userName" size="22" onBlur="checkMemberExist()"/>
            <label for="name"><small>请输入用户名 (必填)</small></label>
            <label for="name"><strong><span id="tipUserName"></span></strong></label>
          </p>
          <p>
            <input type="password"  id="pwd1" size="22" onBlur="checkPwd()"/>
            <label for="name"><small>请输入密码 (必填)</small></label>
            <label for="name"><small><strong><span id="tipPwd1"></span></strong></small></label>
          </p>
          <p>
            <input type="password" id="pwd2" size="22" onBlur="checkPwd()"/>
            <label for="name"><small>请再次输入密码 (必填)</small></label>
            <label for="name"><small><strong><span id="tipPwd2"></span></strong></small></label>
          </p>
          <p>
            <input type="text" id="realName" size="22"/>
            <label for="name"><small>请输入您的真实姓名 (必填)</small></label>
            <label for="name"><small><span id="tipRealName"></span></small></label>
          </p>
          <p>
            <input type="text" id="email" size="22"/>
            <label for="name"><small>请输入您的E-mail地址 (必填)</small></label>
            <label for="name"><small><span id="tipEmail"></span></small></label>
          </p>
          <p>
            <input type="text" id="mobile"  value="" size="22" />
            <label for="name"><small>请输入您联系电话 (选填)</small></label>
            <label for="name"><small><span id="tipMoblie"></span></small></label>
          </p>
          <p>
            <input  type="submit" id="submit" value="注册" onclick="addMember()" />
            &nbsp;
            <input  type="reset" id="reset" tabindex="5" value="重置" />
          </p>
        <br class="clear" />
        <br class="clear" />
        <br class="clear" />
        <br class="clear" />
        <br class="clear" />
        <br class="clear" />
        <br class="clear" />
        <br class="clear" />
        <br class="clear" />
        <br class="clear" />
        <br class="clear" />
        
  	</div>
  </div>
</div>

<#-- /用户注册-->

</@p.page>