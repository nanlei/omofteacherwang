<@admin.page>
	<@adminApp.naviBar navi="系统管理,小升初咨询,详情,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是小升初咨询的管理页面，下面列出了小升初咨询的信息，您可以维护这些信息<br>优先级是小数优先">
	<a href="javascript:history.go(-1)" class="navlink">返回</a>
	<a href="javascript:void(0)" class="navlink" onclick="$('#newPost').toggle();this.blur();return false;">回复</a>
	</@adminApp.naviInfo>
<div id="newPost" style="display:none">
<form name="postForm" action="addPost.action?id=${primaryMap.ID}" method="post" onsubmit="return validateForm(this)">
<table class="default" width="100%">
	<col width="30%" align="center">
	<col width="70%" align="center">
	<tr class="title">
		<td colspan="2">回复：${primaryMap.TITLE}</td>
	</tr>
	<tr>
		<td>回复内容</td>
		<td><textarea name="content" cols="120" rows="6">请输入回复内容</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="提交" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn">
		</td>
	</tr>
</table>
</form>
</div>

<table class="default" width="100%">
	<col width="15%" align="center">
	<col width="15%" align="center">
	<col width="70%" align="center">
	<tr class="title">
		<td colspan="3">咨询详情</td>
	</tr>
	<tr>
		<td colspan="2">标题</td>
		<td>${primaryMap.TITLE}</td>
	</tr>
	<tr>
		<td colspan="2">发布者</td>
		<td>${primaryMap.USERNAME}</td>
	</tr>
	<tr>
		<td colspan="2">发布时间</td>
		<td>${primaryMap.POSTTIME?datetime}</td>
	</tr>
	<tr>
		<td colspan="2">发布IP</td>
		<td>${primaryMap.POSTIP}</td>
	</tr>
	<tr>
		<td colspan="2">状态</td>
		<td><#if primaryMap.STATE=1>已审核<#else>未审核</#if></td>
	</tr>
	<tr>
		<td colspan="2">优先级（小数优先）</td>
		<td>${primaryMap.PRI}</td>
	</tr>
	<tr>
		<td rowspan="3">投票信息</td>
		<td>可靠</td>
		<td>${primaryMap.VOTE1}票</td>
	</tr>
	<tr>
		<td>不可信</td>
		<td>${primaryMap.VOTE2}票</td>
	</tr>
	<tr>
		<td>不关心</td>
		<td>${primaryMap.VOTE3}票</td>
	</tr>
	<tr>
		<td colspan="2">内容</td>
		<td>${primaryMap.CONTENT}</td>
	</tr>
</table>

<#if (postList.list?size>0)>
<#assign count=(pageNum-1)*pageSize+1 />
<#list postList.list as post>
<table class="default" width="100%">
	<col width="10%" align="center">
	<col width="10%" align="center">
	<col width="10%" align="center">
	<col width="10%" align="center">
	<col width="15%" align="center">
	<col width="10%" align="center">
	<col width="15%" align="center">
	<col width="20%" align="center">
	<tr>
		<td>${count}楼</td>
		<td>发布者</td>
		<td>${post.USERNAME}</td>
		<td>发布时间</td>
		<td>${post.POSTTIME?datetime}</td>
		<td>IP</td>
		<td>${post.POSTIP}</td>
		<td><a href="deletePost.action?postId=${post.ID}&id=${primaryMap.ID}" class="navlink" onclick="return confirm('确定删除该回复吗？')">删除该楼</a></td>
	</tr>
	<tr>
		<td colspan="3">回复内容</td>
		<td colspan="5">${post.CONTENT}</td>
	</tr>
</table>
<#assign count=count+1 />
</#list>
<div align="right"><@admin.paging postList /></div>
<#else>
<div align="center" style="margin-top:15px;"><font color="red" size="+1">目前暂无回复</font></div>
</#if>
</@admin.page>