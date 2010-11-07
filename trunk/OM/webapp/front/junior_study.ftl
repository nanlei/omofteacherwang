<#include "../common/front/config.ftl">
<@p.page>
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
        <li><a href="${macro_config.om_forum}" target="_black">学生讨论区</a></li>
        <li class="last"><a href="${base}/front/Member!aboutUs.action">关于我们</a></li>
      </ul>
    </div>
    <#else>
    <div id="topnav">
      <ul>
        <li><a href="${base}/front/Anonym!viewIndex.action">主页</a></li>
        <li><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/Anonym!shareData.action">奥数资料分享</a></li>
        <li><a href="${macro_config.om_forum}" target="_black">学生讨论区</a></li>
        <li class="last"><a href="${base}/front/Anonym!aboutUs.action">关于我们</a></li>
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
      <#if loginUser?exists>
      	<li>&#187;</li>
      	<li class="last"><a href="${base}/front/Member!viewJuniorStudy.action">初中学习咨询</a></li>
      <#else>
     	<li>&#187;</li>
     	<li class="last"><a href="${base}/front/Anonym!viewJuniorStudy.action">初中学习咨询</a></li>
      </#if>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<div class="wrapper col3">
  <div id="container">
    <div id="content">
      <h1>如何衔接好初中学习</h1>
      <img class="imgr" src="${base}/images/junior_study.png" alt="" width="125" height="125" />
      <p>此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括右侧图片；</p>
      <p>此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片；</p>
      <p>此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片；</p>

      
      <#-- 遍历留言-->
      <div id="comments">
        <h2>初中学习信息发布区</h2>
        <ul class="commentlist">
        <#if juniorStudyMap.juniorStudyList?has_content>
			<#list juniorStudyMap.juniorStudyList.list as list>
          		<li class="comment_odd">
            		<div class="author">
            			<img class="avatar" src="${base}/images/demo/avatar.gif" width="32" height="32" alt="" />
            			<span class="name"><a href="#">${list.teacherName?default('-')?html}</a></span> 
            			<span class="wrote">发表: ${list.title?default('-')?html}</span></div>
            		<div class="submitdate"><a href="#">${list.postTime?default('-')?datetime}</a></div>
            		<a href="#" style="cursor:pointer" onclick="$('#page_explain${list.id}').toggle();this.blur();return false;">
          				<br/>
          				查看详细内容	
          				<br/>
          			</a>
          			<br/>
          			<table cellpadding="0" cellspacing="0" id="page_explain${list.id}" style="display:none">
            			<tr>
            				<td><p>${list.content?default('-')?html}</p></td>
            			</tr>
          			</table>
          		</li>
         	</#list>
  		</#if>
  		<table align="center" width="100%">
			<tr>
				<@p.paging juniorStudyMap.juniorStudyList />
			</tr>
	  	</table>
        </ul>
      </div>
      <#-- /遍历留言-->
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

</@p.page>>