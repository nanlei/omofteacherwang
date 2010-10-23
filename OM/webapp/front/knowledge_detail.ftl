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
      <li><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></li>
      <li>&#187;</li>
      <li class="current"><a href="#">评测详细信息</a></li>
    </ul>
  </div>
</div>
<#-- /当前位置-->
<#-- 全知识点评测详细内容-->
<div class="wrapper col3">
  <div id="container">
  
  	<h1>
  		<#if knowledgeDetial?has_content>
			<#list knowledgeDetial as list>
				${list.divisionName?default('-')?html} - ${list.grade?default('-')?html}
				<#break>
			</#list>
  		</#if>
	</h1>
  	<#if knowledgeDetial?has_content>
		<#list knowledgeDetial as list>
    		<p>${list.content?default('-')?html}</p>
		</#list>
  	</#if>
  </div>
</div>
<#-- /全知识点评测详细内容-->
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