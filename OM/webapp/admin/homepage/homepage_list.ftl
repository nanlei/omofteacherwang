<@admin.page>
	<@adminApp.naviBar navi="系统管理,首页管理,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是首页信息管理页面，下面列出了在首页显示的信息，您可以维护这些信息<br>">
	<a href="javascript:void(0)" class="navlink" onclick="$('#newHomepage').toggle();this.blur();return false;">添加首页信息</a>
	</@adminApp.naviInfo>
<div align="center">
首页信息一共可设置5个，您已经设置${count}个，还剩${5-count}个可以设置
</div>
<div id="newHomepage" style="display:none">
<form name="homepageForm" action="addHomepage.action" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
	<table width="100%" class="default">
		<col width="20%" align="center">
		<col width="30%" align="center">
		<col width="20%" align="center">
		<col width="30%" align="center">
		<tr class="title">
			<td colspan="4">添加首页信息</td>
		</tr>
		<tr>
			<td>标题</td>
			<td><input type="text" name="title" size="40" emptyInfo="请输入标题"></td>
			<td>首页显示</td>
			<td>
				<#if count=5>
					不能再设置了
					<input type="hidden" name="state" value="0">
				<#else>
				<input type="radio" name="state" value="1">显示&nbsp;&nbsp;<input type="radio" name="state" value="0" checked="checked">不显示
				</#if>
			</td>
		</tr>
		<tr>
			<td>图片</td>
			<td colspan="3"><input type="file" name="pic" class="fbtn" size="40" emptyInfo="请选择图片"></td>
		</tr>
		<tr>
			<td colspan="4">
			<@admin.ckeditor id="content" />
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" class="btn" value="添加">&nbsp;&nbsp;<input type="reset" class="btn" value="重置">
			</td>
		</tr>
	</table>
</form>
</div>
<div id="newHomepage">
</div>
<table class="default" width="100%">
	<col width="10%" align="center">
	<col width="20%" align="center">
	<col width="10%" align="center">
	<col width="15%" align="center">
	<col width="15%" align="center">
	<col width="10%" align="center">
	<col width="20%" align="center">
	<tr class="title">
		<td>序号</td>
		<td>标题</td>
		<td>最后更新人</td>
		<td>最后更新时间</td>
		<td>最后更新IP</td>
		<td>首页显示</td>
		<td>操作</td>
	</tr>
	<#assign count2=(pageNum-1)*pageSize+1 />
	<#list homepageList.list as homepage>
	<tr <@admin.trChangeColor />>
		<td>${count2}</td>
		<td>${homepage.TITLE}</td>
		<td>${homepage.UPDATEUSER}</td>
		<td>${homepage.UPDATETIME?datetime}</td>
		<td>${homepage.UPDATEIP}</td>
		<td><#if homepage.STATE=1>是<#else>否</#if></td>
		<td><a href="preUpdate.action?id=${homepage.ID}">修改</a> | <a href="delete.action?id=${homepage.ID}" onclick="return confirm('确定要删除吗？')">删除<a></td>
	</tr>
	<#assign count2=count2+1 />
	</#list>
</table>
<div align="right"><@admin.paging homepageList/></div>
</@admin.page>