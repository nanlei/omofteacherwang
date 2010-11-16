<@admin.page>
	<@adminApp.naviBar navi="代购演示,订单确认,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是网购代购演示，用于确认订单<br>">
	<a href="${base}/admin/demo/index.action" class="navlink">返回</a>
	</@adminApp.naviInfo>
<form action="submit.action">
<table class="default" width="100%">
	<col width="20%" align="center">
	<col width="50%" align="center">
	<col width="30%" align="center">
	<tr class="title">
		<td colspan="3">订单确认</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>商品ID</td>
		<td>${order.num_iid}</td>
		<td>这是淘宝商品的ID</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>商品名称</td>
		<td>${order.title}</td>
		<td>您要购买的商品名称，请确认</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>商品单价</td>
		<td>${order.price}</td>
		<td>我们不代购促销价，均以此价为准</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>购买数量</td>
		<td>${order.count}</td>
		<td>如果要修改，请返回重新下单</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>国内运费</td>
		<td>${order.express_fee}</td>
		<td>该费用多退少补，请您留意订单处理状态</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>国际运费</td>
		<td>${order.fee}</td>
		<td>该费用多退少补，请您留意订单处理状态</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>手续费</td>
		<td>${order.charge}</td>
		<td>该费用我们是不定期调整的，请您理解</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>支付费用</td>
		<td>${order.total}</td>
		<td>这是您本次需要支付的费用</td>
	</tr>
	<tr>
		<td colspan="3">
			<input type="submit" value="确认" class="btn" onclick="return confirm('确定下单吗？')">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重填" class="btn">
		</td>
	</tr>
</table>
</form>
</@admin.page>