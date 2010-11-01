<@p.page>
<#-- 用户登录-->
<div class="wrapper col0">
  <div id="topbar">
    <div id="slidepanel">
      <div class="topbox">
        <h2>王炳禹奥数在线</h2>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎各位同学、家长、学者、专家们加入王炳禹奥数在线。这里是奥数展翅腾飞的平台，这里是奥数解密宇宙的起点，这里是奥数思维无边的海洋。让我让为构建一个奥数的世界，一起学习，一起进步。这里的资源都是免费开放给所有用户的，共享一个平台、共享一个奥数，您还在犹豫什么？</p>
        <p class="readmore"><a href="#">注册用户 &raquo;</a></p>
      </div>
      <div class="topbox">
        <h2>教师登录</h2>
        <form action="#" method="post">
          <fieldset>
            <legend>Teachers Login Form</legend>
            <label for="teachername">用户名:
              <input type="text" name="teachername" id="teachername" value="" />
            </label>
            <label for="teacherpass">密码:
              <input type="password" name="teacherpass" id="teacherpass" value="" />
            </label>
            <label for="teacherremember">
              <input class="checkbox" type="checkbox" name="teacherremember" id="teacherremember" checked="checked" />
              保留我的信息</label>
            <p>
              <input type="submit" name="teacherlogin" id="teacherlogin" value="登录" />
              &nbsp;
              <input type="reset" name="teacherreset" id="teacherreset" value="重置" />
            </p>
          </fieldset>
        </form>
      </div>
      <div class="topbox last">
        <h2>学生登录</h2>
        <form action="#" method="post">
          <fieldset>
            <legend>Pupils Login Form</legend>
            <label for="pupilname">用户名:
              <input type="text" name="pupilname" id="pupilname" value="" />
            </label>
            <label for="pupilpass">密码:
              <input type="password" name="pupilpass" id="pupilpass" value="" />
            </label>
            <label for="pupilremember">
              <input class="checkbox" type="checkbox" name="pupilremember" id="pupilremember" checked="checked" />
              保留我的信息</label>
            <p>
              <input type="submit" name="pupillogin" id="pupillogin" value="登录" />
              &nbsp;
              <input type="reset" name="pupilreset" id="pupilreset" value="重置" />
            </p>
          </fieldset>
        </form>
      </div>
      <br class="clear" />
    </div>
    <div id="loginpanel">
      <ul>
        <li class="left">点击此处登陆 &raquo;</li>
        <li class="right" id="toggle"><a id="slideit" href="#slidepanel">展开面板</a><a id="closeit" style="display: none;" href="#slidepanel">关闭面板</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<#-- /用户登录-->
<#-- 导航链接-->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><a href="#">王炳禹奥数在线</a></h1>
      <p>让奥数成为训练思维的利器！</p>
    </div>
    <div id="topnav">
      <ul>
        <li><a href="${base}/front/Anonym!viewIndex.action">主页</a></li>
        <li class="active"><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/Anonym!shareData.action">奥数资料分享</a></li>
        <li><a href="#">学生讨论区</a></li>
        <li class="last"><a href="#">联系我们</a></li>
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
      <li class="current"><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<div class="wrapper col3">
  <div id="container">
    <div id="content">
      <h1>小学奥数知识体系大纲</h1>
      <img class="imgr" src="${base}/images/Mathematics_right.png" alt="" width="125" height="125" />
      <p>小学奥数知识体系大纲</p>
      <p>结合小学课本各年级学校应掌握数学知识，在此基础上相应拓展，利于学生接受。</p>
      <img class="imgl" src="${base}/images/Mathematics_left.png" alt="" width="125" height="125" />
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
            			<td><a href="${base}/front/Anonym!viewKnowledgeDetail.action?id=${list.Id}" target="_black">查看</a></td>	
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
          		<li><a href="${base}/front/Anonym!viewKnowledgeDivision.action?id=${list.id}">${list.name?default('-')?html}</a></li>
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
            <h2>Indonectetus facilis leonib</h2>
            <p class="imgholder"><img src="${base}/images/demo/240x90.gif" alt="" /></p>
            <p>Nullamlacus dui ipsum conseque loborttis non euisque morbi penas dapibulum orna. Urnaultrices quis curabitur phasellentesque congue magnis vestibulum quismodo nulla et feugiat. Adipisciniapellentum leo ut consequam ris felit elit id nibh sociis malesuada.</p>
            <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
          </li>
        </ul>
      </div>
      <div class="holder">
        <h2>Lorem ipsum dolor</h2>
        <p>Nuncsed sed conseque a at quismodo tris mauristibus sed habiturpiscinia sed.</p>
        <ul>
          <li><a href="#">Lorem ipsum dolor sit</a></li>
          <li>Etiam vel sapien et</li>
          <li><a href="#">Etiam vel sapien et</a></li>
        </ul>
        <p>Nuncsed sed conseque a at quismodo tris mauristibus sed habiturpiscinia sed. Condimentumsantincidunt dui mattis magna intesque purus orci augue lor nibh.</p>
        <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>

<#-- 超链接-->
<div class="wrapper col4">
  <div id="footer">
    
    <br class="clear" />
  </div>
</div>
<#-- /超链接-->
<#-- CopyRight-->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2010 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Design by <strong><a href="#" title="开发者">Sarin Nan Lei & Tony Shen Mai Han</a></strong></p>
    <br class="clear" />
  </div>
</div>
<#-- /CopyRight-->
</@p.page>