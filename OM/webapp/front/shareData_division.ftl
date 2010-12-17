<#include "../common/front/config.ftl">
<@p.page>
<script type="text/javascript">
	function addDataDownloadTimes(divId){
		$.ajax({
	   	 	type: "POST",
	   		url: "${base}/front/Anonym!addDataDownloadTimes.action",
	   		data: { divId:divId }
		});
	}
	
</script>
<#-- 导航链接-->
<@p.getCurrentPage currentPage="shareData" />
<#-- /导航链接-->
<#-- 当前位置-->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的当前位置</li>
      <li>&#187;</li>
      <li><a href="${base}/front/<@p.nameSpace loginUser?exists />!shareData.action">奥数资料分享</a></li>
      <li>&#187;</li>
      <li class="last"><a href="#">分类信息</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->

<div class="wrapper col3">
  <div id="container">
  	<#-- 资料下载-->
    <div id="content">
      <h1>奥数资料分享 - 
      	<#if shareDataDivedList?has_content>
			<#list shareDataDivedList.list as list>
				${list.divisionName?default('-')?html}
				<#break>
			</#list>
  		</#if>
	  </h1>
      
      <h3>最近上传共享文件</h3>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>资料名称</th>
            <th>所属区域</th>
            <th>教师</th>
            <th>更新时间</th>
            <th>下载次数</th>
            <th>操作</th>
            
          </tr>
        </thead>
        <tbody>
        <#if shareDataDivedList?has_content>
			<#list shareDataDivedList.list as list>
          		<tr class="light">
            		<td>${list.title?default('-')?html}</td>
           			<td>${list.divisionName?default('-')?html}</td>
           			<td>${list.teacherName?default('-')?html}</td>
            		<td>${list.postTime?date}</td>
            		<td>${list.downloadTimes?default('-')?html}</td>
            		<td><a href="${base}${list.url}" onClick="addDataDownloadTimes(${list.id}">下载</a></td>
          		</tr>
         	</#list>
  		</#if>
        </tbody>
      </table>
      
      <table align="center" width="100%">
		<tr>
			<@p.paging shareDataDivedList/>
		</tr>
	  </table>
      
    </div>
    <#-- /资料下载-->
    <div id="column">
      <#-- 资料下载分类-->
      <div class="subnav">
        <h2>共享资料下载分类</h2>
        <ul>
        <#if divisionList?has_content>
			<#list divisionList as list>
				<li><a href="${base}/front/<@p.nameSpace loginUser?exists />!viewShareDivision.action?id=${list.id}">${list.name?default('-')?html}</a></li>
         	</#list>
  		</#if>
        </ul>
      </div>
      <#-- /资料下载分类-->
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