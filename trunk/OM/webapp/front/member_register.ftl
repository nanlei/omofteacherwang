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
	   				$("#tipPwd2").html("<font color=\"red\"> &#187; 两次密码输入不匹配</font>");
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
        <li class="active"><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewIndex.action">主页</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewPrimaryConsulting.action">小升初咨询</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewMethod.action">方法认知</a></li>
        <li class="last"><a href="${base}/front/<@p.nameSpace loginUser?exists />!shareData.action">资料分享</a></li>
      </ul>
      <br class="clear" />
      <ul>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewExperience.action">授课教育心得</a></li>
        <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewJuniorStudy.action">初中段学习</a></li>
        <li><a href="${macro_config.om_forum}" target="_black">奥数论坛</a></li>
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
  	<div id="content">
 		<h1>注册会员</h1>
  		<div id="respond">
  			<table summary="Summary Here" cellpadding="0" cellspacing="0">
          		<p>
            		<input type="text" id="userName" size="22" onBlur="checkMemberExist()"/>
            		<label for="name">
            			<font size="3">请输入用户名 (必填)</font>
            		</label>
           	 		<label for="name">
            			<strong><font size="3"><span id="tipUserName"></span></font></strong>
            		</label>
          		</p>
          		<p>
            		<input type="password"  id="pwd1" size="22" onBlur="checkPwd()"/>
            		<label for="name">
            			<font size="3">请输入密码 (必填)</font>
           		 	</label>
            		<label for="name">
            			<strong><font size="3"><span id="tipPwd1"></span></font></strong>
           	 		</label>
          		</p>
          		<p>
            		<input type="password" id="pwd2" size="22" onBlur="checkPwd()"/>
            		<label for="name">
            			<font size="3">请再次输入密码 (必填)</font>
            		</label>
            		<label for="name">
            			<strong><font size="3"><span id="tipPwd2"></span></font></strong>
            		</label>
          		</p>
          		<p>
            		<input type="text" id="realName" size="22"/>
            		<label for="name">
            			<font size="3">请输入您的真实姓名 (必填)</font>
            		</label>
            		<label for="name">
            			<strong><font size="3"><span id="tipRealName"></span></font></strong>
            		</label>
          		</p>
          		<p>
            		<input type="text" id="email" size="22"/>
            		<label for="name">
            			<font size="3">请输入您的E-mail地址 (必填)</font>
            		</label>
            		<label for="name">
            			<strong><font size="3"><span id="tipEmail"></span></font></strong>
            		</label>
          		</p>
          		<p>
            		<input type="text" id="mobile"  value="" size="22" />
            		<label for="name">
            			<font size="3">请输入您联系电话 (选填)</font>
            		</label>
            		<label for="name">
            			<strong><font size="3"><span id="tipMoblie"></span></font></strong>
            		</label>
          		</p>
          	</table>
  		</div>
  		<strong><font size="2" color="green">更多信息（您可以在日后填写）</font></strong>
  		<div id="respond">
  			<table summary="Summary Here" cellpadding="0" cellspacing="0">
          		<p>
            		<input type="text" id="" size="22" />
            		<label for="name">
            			<font size="3">待定 (必填)</font>
            		</label>
           	 		<label for="name">
            			<strong><font size="3"><span id=""></span></font></strong>
            		</label>
          		</p>
          		<p>
            		<input type="password"  id="" size="22" />
            		<label for="name">
            			<font size="3">待定 (必填)</font>
           		 	</label>
            		<label for="name">
            			<strong><font size="3"><span id=""></span></font></strong>
           	 		</label>
          		</p>
          		<p>
            		<input type="password" id="" size="22"  />
            		<label for="name">
            			<font size="3">待定 (必填)</font>
            		</label>
            		<label for="name">
            			<strong><font size="3"><span id=""></span></font></strong>
            		</label>
          		</p>
          		<p>
            		<input type="text" id="" size="22"/>
            		<label for="name">
            			<font size="3">待定 (必填)</font>
            		</label>
            		<label for="name">
            			<strong><font size="3"><span id=""></span></font></strong>
            		</label>
          		</p>
          		<p>
            		<input type="text" id="" size="22"/>
            		<label for="name">
            			<font size="3">待定 (必填)</font>
            		</label>
            		<label for="name">
            			<strong><font size="3"><span id=""></span></font></strong>
            		</label>
          		</p>
          		<p>
            		<input type="text" id=""  value="" size="22" />
            		<label for="name">
            			<font size="3">待定 (选填)</font>
            		</label>
            		<label for="name">
            			<strong><font size="3"><span id=""></span></font></strong>
            		</label>
          		</p>
          		<p>
            		<input  type="submit" id="submit" value="注册" onclick="addMember()" />
            		&nbsp;
            		<input  type="reset" id="reset" tabindex="5" value="重置" />
          		</p>
          	</table>
  		</div>
  	</div>
  	<div id="column">
      <div class="holder">
        <h2 class="title"><img src="${base}/images/wby_small.png" alt="" />王炳禹老师简介</h2>
        <p>自幼学习奥数，多次在全国联赛及各大杯赛中获一等奖。以竞赛优异成绩考入 北京西城实验中学 全国理科实验班。之后保送至北京大学，获理学、经济学双学位。自龙校成立，王炳禹老师就参与至龙校教学活动中，第一批培养出的孩子多数已被各重点校接收录取。王炳禹老师现担任龙校教学总监，全面负责龙校教学工作。其理念在于传授学生们解题的思想及方法，对题目的掌握要从“怎么做”深入到“怎么想”，主动培养学生思考分析问题的能力。</p>
        <p class="readmore"><a href="#">更多信息 &raquo;</a></p>
      </div>
      <div id="featured">
        <ul>
          <li>
            <h2>广告位</h2>
            <p class="imgholder"><img src="${base}/images/demo/240x90.gif" alt="" /></p>
            <p></p>
            <p class="readmore"><a href="#">更多信息 &raquo;</a></p>
          </li>
        </ul>
      </div>
      <div class="holder">
        <h2>待定列表</h2>
        <p>Nuncsed sed conseque a at quismodo tris mauristibus sed habiturpiscinia sed.</p>
        <ul>
          <li><a href="#">Lorem ipsum dolor sit</a></li>
          <li>Etiam vel sapien et</li>
          <li><a href="#">Etiam vel sapien et</a></li>
        </ul>
        <p>Nuncsed sed conseque a at quismodo tris mauristibus sed habiturpiscinia sed. Condimentumsantincidunt dui mattis magna intesque purus orci augue lor nibh.</p>
        <p class="readmore"><a href="#">更多信息 &raquo;</a></p>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>

<#-- /用户注册-->

</@p.page>