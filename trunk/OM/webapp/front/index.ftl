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
        <li class="active"><a href="${base}/front/Member!viewIndex.action">主页</a></li>
        <li><a href="${base}/front/Member!viewKnowledge.action">全知识点评测</a></li>
        <li><a href="${base}/front/Member!shareData.action">奥数资料分享</a></li>
        <li><a href="${macro_config.om_forum}" target="_black">学生讨论区</a></li>
        <li class="last"><a href="${base}/front/Member!aboutUs.action">关于我们</a></li>
      </ul>
    </div>
    <#else>
    <div id="topnav">
      <ul>
        <li class="active"><a href="${base}/front/Anonym!viewIndex.action">主页</a></li>
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
<#-- 公告区-->
<div class="wrapper col2">

  <div id="featured_slide">
  	<#if indexMap.notice?has_content>
		<#list indexMap.notice as list>
    	<div class="featured_box"><a href="#"><img src="${base}${list.pic}" alt="" /></a>
      		<div class="floater">
       	 		<h2>${list.title?default('-')?html}</h2>
        		<p>${cutText(list.content?replace("\r\n",""),160,"......")}</p>
        		<#if loginUser?exists>
        			<p class="readmore"><a href="${base}/front/Member!viewNotice.action?id=${list.id}" target="_black">更多信息 &raquo;</a></p>
      			<#else>
        			<p class="readmore"><a href="${base}/front/Anonym!viewNotice.action?id=${list.id}" target="_black">更多信息 &raquo;</a></p>
      			</#if>
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
        <#if loginUser?exists>
          <li>
            <h2>小升初咨询</h2>
            <div class="imgholder">
            	<a href="${base}/front/Member!viewPrimaryConsulting.action">
            		<img src="${base}/images/primary_consulting.png" alt="" />
            	</a>
            </div>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p class="readmore">
            	<a href="${base}/front/Member!viewPrimaryConsulting.action">更多信息 &raquo;</a>
            </p>
          </li>
          <li class="last">
            <h2>初中学习</h2>
            <div class="imgholder">
            	<a href="${base}/front/Member!viewJuniorStudy.action">
            		<img src="${base}/images/junior_study_index.png" alt="" />
            	</a>
            </div>
            <p></p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p class="readmore">
            	<a href="${base}/front/Member!viewJuniorStudy.action">更多信息 &raquo;</a>
            </p>
          </li>	  
        <#else>
          <li>
            <h2>小升初咨询</h2>
            <div class="imgholder">
            	<a href="${base}/front/Anonym!viewPrimaryConsulting.action">
            		<img src="${base}/images/primary_consulting.png" alt="" />
            	</a>
            </div>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p class="readmore">
            	<a href="${base}/front/Anonym!viewPrimaryConsulting.action">更多信息 &raquo;</a>
            </p>
          </li>
          <li class="last">
            <h2>初中学习</h2>
            <div class="imgholder">
            	<a href="${base}/front/Anonym!viewJuniorStudy.action">
            		<img src="${base}/images/junior_study_index.png" alt="" />
            	</a>
            </div>
            <p></p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et feugiat. Adipisciniap ellentum leo ut consequam.</p>
            <p class="readmore">
            	<a href="${base}/front/Anonym!viewJuniorStudy.action">更多信息 &raquo;</a>
            </p>
          </li>		
        </#if> 
        </ul>
        <br class="clear" />
      </div>
      <div class="column2">
        <h2>王炳禹老师简介</h2>
        <img class="imgl" src="${base}/images/wby_middle.png" alt="" />
        <p>自幼学习奥数，多次在全国联赛及各大杯赛中获一等奖。以竞赛优异成绩考入 北京西城实验中学 全国理科实验班。之后保送至北京大学，获理学、经济学双学位。自龙校成立，王炳禹老师就参与至龙校教学活动中，第一批培养出的孩子多数已被各重点校接收录取。王炳禹老师现担任龙校教学总监，全面负责龙校教学工作。其理念在于传授学生们解题的思想及方法，对题目的掌握要从“怎么做”深入到“怎么想”，主动培养学生思考分析问题的能力。</p>
        <p>……</p>
      </div>
    </div>
    <#if loginUser?exists>
    <div class="fl_right">
      <h2>项目列表</h2>
      <ul>
        <li>
          <div class="imgholder">
          	<a href="${base}/front/Member!viewKnowledge.action">
          		<img src="${base}/images/knowledge.png" alt="全知识点评测" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Member!viewKnowledge.action">全知识点评测</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li>
          <div class="imgholder">
          	<a href="${base}/front/Member!viewMethod.action">
          		<img src="${base}/images/method.png" alt="" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Member!viewMethod.action">奥数方法认识</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li>
          <div class="imgholder">
          	<a href="${base}/front/Member!viewExperience.action">
          		<img src="${base}/images/experience.png" alt="" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Member!viewExperience.action">奥数教育心得</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li>
          <div class="imgholder">
          	<a href="${base}/front/Member!shareData.action">
          		<img src="${base}/images/share.png" alt="奥数资料分享" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Member!shareData.action">奥数资料分享</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li class="last">
          <div class="imgholder">
          	<a href="${base}/front/Member!viewPrimaryConsulting.action">
          		<img src="${base}/images/question.png" alt="" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Member!viewPrimaryConsulting.action">小升初咨询</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li class="last">
          <div class="imgholder">
          	<a href="${base}/front/Member!viewJuniorStudy.action">
          		<img src="${base}/images/study.png" alt="" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Member!viewJuniorStudy.action">初中学习</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
      </ul>
    </div>
    <br class="clear" />
  	</div>
    <#else>
    <div class="fl_right">
      <h2>项目列表</h2>
      <ul>
        <li>
          <div class="imgholder">
          	<a href="${base}/front/Anonym!viewKnowledge.action">
          		<img src="${base}/images/knowledge.png" alt="全知识点评测" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Anonym!viewKnowledge.action">全知识点评测</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li>
          <div class="imgholder">
          	<a href="${base}/front/Anonym!viewMethod.action">
          		<img src="${base}/images/method.png" alt="" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Anonym!viewMethod.action">奥数方法认识</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li>
          <div class="imgholder">
          	<a href="${base}/front/Anonym!viewExperience.action">
          		<img src="${base}/images/experience.png" alt="" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Anonym!viewExperience.action">奥数教育心得</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li>
          <div class="imgholder">
          	<a href="${base}/front/Anonym!shareData.action">
          		<img src="${base}/images/share.png" alt="奥数资料分享" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Anonym!shareData.action">奥数资料分享</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li class="last">
          <div class="imgholder">
          	<a href="${base}/front/Anonym!viewPrimaryConsulting.action">
          		<img src="${base}/images/question.png" alt="" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Anonym!viewPrimaryConsulting.action">小升初咨询</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
        
        <li class="last">
          <div class="imgholder">
          	<a href="${base}/front/Anonym!viewJuniorStudy.action">
          		<img src="${base}/images/study.png" alt="" />
          	</a>
          </div>
          <p><strong><a href="${base}/front/Anonym!viewJuniorStudy.action">初中学习</a></strong></p>
          <p>此处写各项目简介，不提供后台功能，在开发时写在页面，请王老师编写一段100字以内的简介，包括左侧图片</p>
        </li>
      </ul>
    </div>
    <br class="clear" />
  </div>
  </#if> 
</div>
<#-- /项目链接-->
</@p.page>