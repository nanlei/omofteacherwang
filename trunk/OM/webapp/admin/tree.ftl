<#-- 后台导航树 -->
<@admin.page>
<@admin.tree root="用户管理中心" display="block">
<script type="text/javascript"> 
var treeMenu = [
	{ level:1, name:"密码修改", ico:"${base}/images/tico_way.gif", link:"${base}/admin/password.action"},
	{ level:1, name:"教师管理", ico:"${base}/images/tico_way.gif", link:"${base}/admin/user/list.action"},
	{ level:1, name:"首页管理", ico:"${base}/images/tico_way.gif", link:"${base}/admin/homepage/list.action"},
	{ level:1, name:"知识点评测"},
	{ level:2, name:"分类管理", ico:"${base}/images/tico_way.gif", link:"${base}/admin/knowledge/category/list.action"},
	{ level:2, name:"信息管理", ico:"${base}/images/tico_way.gif", link:"${base}/admin/knowledge/list.action"},
	{ level:1, name:"关于工作室", ico:"${base}/images/tico_way.gif", link:"${base}/admin/about/index.action"}
];
</script>
</@admin.tree>
</@admin.page>