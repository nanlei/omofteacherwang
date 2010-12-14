<#include "../common/front/config.ftl">
<@p.page>
<script type="text/javascript">
	function validateCode(code){
		var ramCode=$("#checkCode").val();
		var validateCode=code;
		if(ramCode==validateCode){
			$("#codeValidateInfo").html("<font color=\"green\"> &#187; 验证码正确</font>");
		}else{
			$("#codeValidateInfo").html("<font color=\"red\"> &#187; 验证码错误</font>");
			
		}
	}
	
	function errorPost(){
		alert("游客不可以投票！");
	}
	
	function addVote(postId, voteType){
		$.ajax({
	   	 	type: "POST",
	   		url: "${base}/front/addVote.action",
	   		data: { postId:postId, voteType: voteType},
	   		success: function(data){
	   			if(data.status){
	   				alert("投票成功，谢谢您！");
	   			}else{
	   				alert("投票失败，请勿重复投票");
	   			}
	   		},
	   		error:function(xmlHttpRequest,status,exception){
	   			alert("请求失败，请检查网络连接");
	   		}
		});
	}
</script>
<#-- 导航链接-->
<@p.getCurrentPage currentPage="viewPrimaryConsulting" />
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      	<li>&#187;</li>
      	<li class="last"><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewPrimaryConsulting.action">小升初咨询</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<div class="wrapper col3">
  <div id="container">
    <div id="content">
      <h1>小升初的重要性</h1>
      <img class="imgr" src="${base}/images/primary.png" alt="" width="125" height="125" />
      <p>此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括右侧图片；</p>
      <p>此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片；</p>
      <p>此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片；</p>
      <p>此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片；</p>
      <p>此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片；</p>
      
      <#-- POST列表-->
      <div id="comments">
        <h2>咨询留言</h2>
        <ul class="commentlist">
        <#if primaryConsultingMap.postList?has_content>
			<#list primaryConsultingMap.postList.list as list>
        		<form action="Anonym!respondPost.action"  method="post" >
          			<li class="comment_even">
            			<div class="author">
            				<img class="avatar" src="${base}/images/demo/avatar.gif" width="32" height="32" alt="" />
            				<span class="name"><a href="#">${list.postUserName?default('-')?html}</a></span> 
            				<span class="wrote">发表: ${list.title?default('-')?html}</span>
           				</div>
            			<div class="submitdate">
            				<a href="#">${list.postTime?default('-')?datetime}</a>
            			</div>
            			<p>${list.postContent?default('-')?html}</p>
          				
          				<tr align="center" width="80px" style="padding-top:5px">
          					<td>
          					<#assign getPostCount=servMgr.frontService.getPostCountById('${list.id}')?default("")/>
          					<a href="#" style="cursor:pointer" onclick="$('#page_explain${list.id}').toggle();this.blur();return false;">
          						<#if getPostCount?has_content>
          							看看其他用户的评论 (共 ${getPostCount?html}  条评论)
  								</#if>
          					</a>
          					
          					</td>
          					<#if loginUser?exists>
    							&nbsp;&nbsp;&nbsp;&nbsp;
          						<td width="25">
          							<a href="" onClick="addVote(${list.id} , '1')">
          								<font color="green">可信(${list.vote1?default('0')?html})</font>
          							</a>
          						</td>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<td width="25">
									<a href="" onClick="addVote(${list.id} , '2')">
										<font color="red">不可信(${list.vote2?default('0')?html})</font>
									</a>
								</td>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<td width="25">
									<a href="" onClick="addVote(${list.id} , '3')">
										<font color="blue">不关心(${list.vote3?default('0')?html})</font>
									</a>
								</td>
    						<#else>
    							&nbsp;&nbsp;&nbsp;&nbsp;
          						<td width="25">
          							<a href="" onClick="errorPost()">
          							<font color="green">可信(${list.vote1?default('0')?html})</font>
          							</a>
          						</td>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<td width="25">
									<a href="" onClick="errorPost()">
										<font color="red">不可信(${list.vote2?default('0')?html})</font>
									</a>
								</td>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<td width="25">
									<a href="" onClick="errorPost()">
										<font color="blue">不关心(${list.vote3?default('0')?html})</font>
									</a>
								</td>
    						</#if>
          					
		
          				</tr>
          				
							
						
          				
          				
          				<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_explain${list.id}" style="display:none">
							<tr>
								<td>
    								<div id="respond">
    									<input type="hidden" name="id" value="${list.id}" />
    									<#if loginUser?exists>
    										<input type="hidden" name="userName" value="${loginUser.realName}" />
    									<#else>
    										<input type="hidden" name="userName" value="游客" />
    									</#if>
    									<p><textarea name="respondContent" id="comment" cols="100%" rows="3"></textarea></p>
    									<p><input type="submit" id="submit" value="回帖"></p>
    								</div>
    							</td>
							</tr>
							<#assign respondList=servMgr.frontService.getResopndPostById('${list.id}')?default("")/>
							<#if respondList?has_content>
								<#list respondList as list>
									<tr>
										<td>
											<li class="comment_odd">
            									<div class="author">
            										<img class="avatar" src="${base}/images/demo/avatar.gif" width="32" height="32" alt="" />
            										<span class="name"><a href="#">${list.respondUserName?default('-')?html}</a> 回复:</span> 
            									</div>
            									<p>${list.respondContent?default('-')?html}</p>
          										<div class="submitdate">
          											<a href="#">${list.respondTime?default('-')?datetime}</a>
          										</div>
          									</li>	
          								</td>
									</tr>
								</#list>
  							</#if>
						</table>
          			</li>
       			</form>  
        	</#list>
  		</#if>
  		<table align="center" width="100%">
			<tr>
				<@p.paging primaryConsultingMap.postList />
			</tr>
	  	</table>
        </ul>
      </div>
      <#-- /POST列表-->
      <#-- 发表咨询-->
      <h2>发表咨询</h2>
      <div id="respond">
        <form action="Anonym!writePost.action" method="post" onsubmit="return validateForm(this)">
          <p>
            <input type="text" name="title"  value="" size="22" emptyInfo="请输入标题" maxLen="22" lengthInfo="标题不得大于22个汉字"/>
            <label for="name"><small>标题 (必填)</small></label>
          </p>
          <p>
            <textarea name="postContent" id="content" cols="100%" rows="5" emptyInfo="请输入内容" maxLen="1000" lengthInfo="内容不得大于500个汉字"></textarea>
            <label for="comment" style="display:none;"><small>咨询内容 (必填)</small></label>
          </p>
          <p>
            <input type="text" id="checkCode"  value="" size="22" onBlur="validateCode(${checkCode})" emptyInfo="验证码" maxLen="4" lengthInfo="错误输入"/>
            <label for="name">
            	<strong>
            		[
            		<font size="2" color="red">
            			<span id="ramCode">${checkCode}</span>
            			
            		</font>
            		]
            	</strong>
            	<strong><small> <span id="codeValidateInfo">验证码 (必填)</span></small></strong>
            </label>
          </p>
          <p>
          	<#if loginUser?exists>
    			<input type="hidden" name="userName" value="${loginUser.realName}" />
    		<#else>
    			<input type="hidden" name="userName" value="游客" />
    		</#if>
            <input name="submit" type="submit" id="submit" value="提交咨询" />
            &nbsp;
            <input name="reset" type="reset" id="reset" tabindex="5" value="重置留言" />
            
          </p>
        </form>
      </div>
      <#-- /发表咨询-->
    </div>
    
    <div id="column">
      <div class="holder">
        <h2 class="title"><img src="${base}/images/wby_small.png" alt="" />王炳禹老师简介</h2>
        <p>自幼学习奥数，多次在全国联赛及各大杯赛中获一等奖。以竞赛优异成绩考入 北京西城实验中学 全国理科实验班。之后保送至北京大学，获理学、经济学双学位。自龙校成立，王炳禹老师就参与至龙校教学活动中，第一批培养出的孩子多数已被各重点校接收录取。王炳禹老师现担任龙校教学总监，全面负责龙校教学工作。其理念在于传授学生们解题的思想及方法，对题目的掌握要从“怎么做”深入到“怎么想”，主动培养学生思考分析问题的能力。</p>
        <p class="readmore"><a href="#">更多信息 &raquo;</a></p>
      </div>
      <!--
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
      -->
    </div>
    <div class="clear"></div>
  </div>
</div>

</@p.page>>