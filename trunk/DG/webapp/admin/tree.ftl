<#-- 后台导航树 -->
<@admin.page>
<@admin.tree root="用户管理中心" display="block">
<script type="text/javascript"> 
var treeMenu = [
	{ level:1, name:"代购演示", link:"${base}/admin/demo/index.action"},
	{ level:1, name:"订单管理", link:"${base}/admin/demo/order.action"}
];
</script>
</@admin.tree>
</@admin.page>