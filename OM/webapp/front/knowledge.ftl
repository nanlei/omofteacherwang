<#include "../common/front/config.ftl">
<@p.page>
<#-- 导航链接-->
<@p.getCurrentPage currentPage="viewKnowledge" />
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      <li>&#187;</li>
      <li class="last"><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewExperience.action">奥数教育心得</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<div class="wrapper col3">
  <div id="container">
    <div id="content">
      <h1>小学奥数知识体系大纲</h1>
      <img class="imgr" src="${base}/images/mathematics_right.png" alt="" width="125" height="125" />
      <p>小学奥数知识体系大纲</p>
      <p>结合小学课本各年级学校应掌握数学知识，在此基础上相应拓展，利于学生接受。</p>
      <img class="imgl" src="${base}/images/mathematics_left.png" alt="" width="125" height="125" />
      <p>3~5年级是学习奥数核心时段，在此时间内有效掌握各知识板块基础方法。</p>
      <p>6年级综合提高，备战各校小升初考试。</p>
      <p>此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片；此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片；此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片；此处由王老师写内容，不提供后台功能，在开发时写在页面，请王老师编写一段600字以内的简介，包括两侧图片</p>
 		<br class="clear" />      
      
      <h2>最近上传知识点评测</h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>题目名称</th>
            <th>所属板块</th>
            <th>所属年级</th>
            <th>更新时间</th>
            <th>操作</th>
            
          </tr>
        </thead>
        <#if knowledgeMap.knowLedgeList?has_content>
			<#list knowledgeMap.knowLedgeList.list as list>
       			<tbody>
          			<tr class="light">
            			<td>${list.title?default('-')?html}</td>
            			<td>${list.divisionName?default('-')?html}</td>
            			<td>${list.grade?default('-')?html}</td>
            			<td>${list.postTime?date}</td>
            			<td><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewKnowledgeDetail.action?id=${list.Id}" target="_black">查看</a></td>	
          			</tr>
        		</tbody>
        	</#list>
  		</#if>
      </table>
      <table align="center" width="100%">
		<tr>
			<@p.paging knowledgeMap.knowLedgeList/>
		</tr>
	  </table>
    </div>
    <div id="column">
      <div class="subnav">
        <h2>知识点评测导航</h2>
        <ul>
        <#if knowledgeMap.knowLedgeDivision?has_content>
			<#list knowledgeMap.knowLedgeDivision as list>
				<li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewKnowledgeDivision.action?id=${list.id}">${list.name?default('-')}</a></li>
         	</#list>
  		</#if>
        </ul>
      </div>
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


</@p.page>