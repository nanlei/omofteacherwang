<#-- 后台登录后首页 -->
<@admin.page body="style=\"margin:0;color:#fff\" scroll=\"no\"">
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="fbg" style="height:100%">
	<tr>
		<td height="65px">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="bbg">
				<tr>
					<td>
						<@adminApp.header><#-- 8块 -->
								<td width="10" class="tdnormal">&nbsp;</td>
								<td width="80" class="tdselected fbg"><a class="navbar" href="home.action">系统演示</a></td>
								<td colspan="6" class="tdnormal">&nbsp;</td>
						</@adminApp.header>
					</td>
				</tr>
				<tr>
					<td height="5" class="fbg"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<@adminApp.body treeAction="tree.action" displayPage="mainpage.action"/>
		</td>
	</tr>
	<@adminApp.footer/>
</table>
</@admin.page>