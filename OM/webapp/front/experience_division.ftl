<#include "../common/front/config.ftl">
<@p.page>
<script type="text/javascript">
	function addViewTimes(divId){
	
		var viewCount=document.getElementById('lastestCount'+divId).value;
		viewCount++;
		$('#viewTimes'+divId).html(viewCount);
		document.getElementById('lastestCount'+divId).value=viewCount;
	}
</script>
<#-- 导航链接-->
<@p.getCurrentPage currentPage="viewExperience" />
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      <li>&#187;</li>
      <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewExperience.action">授课教育心得</a></li>
      <li>&#187;</li>
      <li class="last"><a href="#">分类信息</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->

<div class="wrapper col3">
  <div id="container">
  	<#-- 资料-->
    <div id="content">
      <h1>奥数教育心得 - 
      	<#if experienceDivedList?has_content>
			<#list experienceDivedList.list as list>
				${list.divisionName?default('-')?html}
				<#break>
			</#list>
  		</#if>
	  </h1>
      
      <h2>最近上传奥数教育心得</h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>名称</th>
            <th>所属板块</th>
            <th>更新时间</th>
            <th>点击数</th>
            <th>操作</th>
            
          </tr>
        </thead>
        <#if experienceDivedList?has_content>
			<#list experienceDivedList.list as list>
       			<tbody>
          			<tr class="light">
            			<td>${list.title?default('-')?html}</td>
            			<td>${list.divisionName?default('-')?html}</td>
            			<td>${list.updateTime?date}</td>
            			<td><span id="viewTimes${list.id}">${list.clickTimes?default('0')?html}</span></td>
            			<td><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewExperienceDetail.action?id=${list.Id}" onClick="addViewTimes(${list.id})" target="_black">查看</a></td>	
          				<input type="hidden" id="lastestCount${list.id}" value="${list.clickTimes?default('0')?html}" />
          			</tr>
        		</tbody>
        	</#list>
  		</#if>
  		
      </table>
      <table align="center" width="100%">
		<tr>
			<@p.paging experienceDivedList/>
		</tr>
	  </table>
    </div>
    <#-- /资料-->
    <div id="column">
      <#-- 资料分类-->
      <div class="subnav">
        <h2>奥数教育心得分类</h2>
        <ul>
        <#if divisionList?has_content>
			<#list divisionList as list>
          		<li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewExperienceDivision.action?id=${list.id}">${list.name?default('-')}</a></li>
         	</#list>
  		</#if>
        </ul>
      </div>
      <#-- /资料分类-->
      <div class="holder">
        <h2 class="title"><img src="${base}/images/wby_small.png" alt="" />王炳禹老师简介</h2>
        <p>自幼学习奥数，多次在全国联赛及各大杯赛中获一等奖。以竞赛优异成绩考入 北京西城实验中学 全国理科实验班。之后保送至北京大学，获理学、经济学双学位。自龙校成立，王炳禹老师就参与至龙校教学活动中，第一批培养出的孩子多数已被各重点校接收录取。王炳禹老师现担任龙校教学总监，全面负责龙校教学工作。其理念在于传授学生们解题的思想及方法，对题目的掌握要从“怎么做”深入到“怎么想”，主动培养学生思考分析问题的能力。</p>
                <p class="readmore"><a href="${base}/front/<@p.nameSpace loginUser?exists />!aboutUs.action" target="_black">更多信息 &raquo;</a></p>
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

</@p.page>