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
        <li><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></li>
        <li class="active"><a href="${base}/front/Anonym!shareData.action">奥数资料分享</a></li>
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
      <li class="current"><a href="${base}/front/Anonym!shareData.action">奥数资料分享</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->

<div class="wrapper col3">
  <div id="container">
  	<#-- 资料下载-->
    <div id="content">
      <h5>最近上传共享文件 - 所有分类</h5>
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
        <#if shareDataMap.shareData?has_content>
			<#list shareDataMap.shareData.list as list>
          		<tr class="light">
            		<td>${list.title?default('-')?html}</td>
           			<td>${list.divisionName?default('-')?html}</td>
           			<td>${list.teacherName?default('-')?html}</td>
            		<td>${list.postTime?date}</td>
            		<td>${list.downloadTimes?default('-')?html}/td>
            		<td><a href="#">下载</a></td>
          		</tr>
         	</#list>
  		</#if>
        </tbody>
      </table>
      <table align="center" width="100%">
		<tr>
			<td align="right"><@p.paging shareDataMap.shareData/></td>
		</tr>
	  </table>
    </div>
    <#-- /资料下载-->
    <div id="column">
      <#-- 资料下载分类-->
      <div class="subnav">
        <h2>共享资料下载分类</h2>
        <ul>
        <#if shareDataMap.shareDivision?has_content>
			<#list shareDataMap.shareDivision as list>
          		<li><a href="${base}/front/Anonym!viewShareDivision.action?id=?${list.id}">${list.name?default('-')?html}</a></li>
         	</#list>
  		</#if>
        </ul>
      </div>
      <#-- /资料下载分类-->
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