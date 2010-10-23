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
        <li class="active"><a href="${base}/front/Anonym!viewIndex.action">主页</a></li>
        <li><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/Anonym!shareData.action">奥数资料分享</a></li>
        <li><a href="#">学生讨论区</a></li>
        <li class="last"><a href="#">联系我们</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<#-- /导航链接-->
<#-- 公告区-->
<div class="wrapper col2">

  <div id="featured_slide">
  	<#if indexMap.notice?has_content>
		<#list indexMap.notice as list>
    	<div class="featured_box"><a href="#"><img src="${base}/${list.pic}" alt="" /></a>
      		<div class="floater">
       	 		<h2>${list.title?default('-')?html}</h2>
        		<p>${cutText("${list.content}",100,"...")}</p>
        		<p class="readmore"><a href="${base}/front/Anonym!viewNotice.action?id=${list.id}" target="_black"">更多信息 &raquo;</a></p>
      		</div>
    	</div>
    	</#list>
  	</#if>
  </div>
</div>
<#-- /公告区-->
<#-- 项目链接-->
<div class="wrapper col3">
  <div id="homecontent">
    <div class="fl_left">
      <div class="column2">
        <ul>
          <li>
            <h2>小升初咨询</h2>
            <div class="imgholder"><img src="${base}/images/demo/240x130.gif" alt="" /></div>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p class="readmore"><a href="primary_consulting.html">更多信息 &raquo;</a></p>
          </li>
          <li class="last">
            <h2>待定</h2>
            <div class="imgholder"><img src="${base}/images/demo/240x130.gif" alt="" /></div>
            <p></p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p class="readmore"><a href="#">更多信息 &raquo;</a></p>
          </li>
        </ul>
        <br class="clear" />
      </div>
      <div class="column2">
        <h2>待定</h2>
        <img class="imgl" src="${base}/images/demo/imgl.gif" alt="" />
        <p>This is a W3C standards compliant Open Source free CSS template from <a href="http://www.google.com/" title="Google">Google</a>.</p>
        <p>Morbitincidunt maurisque eros molest nunc anteget sed vel lacus mus semper. Anterdumnullam interdum eros dui urna consequam ac nisl nullam ligula vestassa.</p>
        <p>Morbitincidunt maurisque eros molest nunc anteget sed vel lacus mus semper. Anterdumnullam interdum eros dui urna consequam ac nisl nullam ligula vestassa.</p>
        <p>Condimentumfelis et amet tellent quisquet a leo lacus nec augue accumsan. Sagittislaorem dolor ipsum at urna et pharetium malesuada nis consectus odio.</p>
      </div>
    </div>
    <div class="fl_right">
      <h2>项目列表</h2>
      <ul>
        <li>
          <div class="imgholder"><a href="#"><img src="${base}/images/demo/80x80.gif" alt="" /></a></div>
          <p><strong><a href="#">全知识点评测</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        <li>
          <div class="imgholder"><a href="#"><img src="${base}/images/demo/80x80.gif" alt="" /></a></div>
          <p><strong><a href="#">奥数方法认识</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        <li>
          <div class="imgholder"><a href="#"><img src="${base}/images/demo/80x80.gif" alt="" /></a></div>
          <p><strong><a href="#">奥数教育心得</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        <li>
          <div class="imgholder"><a href="#"><img src="${base}/images/demo/80x80.gif" alt="" /></a></div>
          <p><strong><a href="#">奥数资料分享</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        <li class="last">
          <div class="imgholder"><a href="primary_consulting.html"><img src="${base}/images/demo/80x80.gif" alt="" /></a></div>
          <p><strong><a href="primary_consulting.html">小升初咨询</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        <li class="last">
          <div class="imgholder"><a href="#"><img src="${base}/images/demo/80x80.gif" alt="" /></a></div>
          <p><strong><a href="#">初中学习</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<#-- /项目链接-->
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