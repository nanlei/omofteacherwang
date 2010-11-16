<@admin.page>
	<@adminApp.naviBar navi="代购演示,订单确认,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是网购代购演示，用于确认订单<br>">
	<a href="${base}/admin/demo/index.action" class="navlink">返回</a>
	</@adminApp.naviInfo>
<form action="submit.action" method="post">
<table class="default" width="100%">
	<col width="20%" align="center">
	<col width="50%" align="center">
	<col width="30%" align="center">
	<tr class="title">
		<td colspan="3">订单确认</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>商品ID</td>
		<td>${order.num_iid}<input type="hidden" name="num_iid" value="${order.num_iid}"></td>
		<td>这是淘宝商品的ID</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>商品地址</td>
		<td><a href="${order.url}" target="_blank">点击查看</a><input type="hidden" name="url" value="${order.url}"></td>
		<td>这是淘宝商品的地址</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>商品名称</td>
		<td>${order.title}<input type="hidden" name="title" value="${order.title}"></td>
		<td>您要购买的商品名称，请确认</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>商品单价</td>
		<td>${order.price}<input type="hidden" name="price" value="${order.price}"></td>
		<td>我们不代购促销价，均以此价为准</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>购买数量</td>
		<td>${order.count}<input type="hidden" name="count" value="${order.count}"></td>
		<td>如果要修改，请返回重新下单</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>国内运费</td>
		<td>${order.express_fee}<input type="hidden" name="express_fee" value="${order.express_fee}"></td>
		<td>该费用多退少补，请您留意订单处理状态</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>国际运费</td>
		<td>${order.fee}<input type="hidden" name="fee" value="${order.fee}"></td>
		<td>该费用多退少补，请您留意订单处理状态</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>手续费</td>
		<td>${order.charge}<input type="hidden" name="charge" value="${order.charge}"></td>
		<td>该费用我们是不定期调整的，请您理解</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>支付费用</td>
		<td>${order.total}<input type="hidden" name="total" value="${order.total}"></td>
		<td>这是您本次需要支付的费用</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>备用商品地址</td>
		<td>${order.backupURL}<input type="hidden" name="backupURL" value="${order.backupURL}"></td>
		<td>这是您给出的参考地址</td>
	</tr>
	<tr <@admin.trChangeColor />>
		<td>用户备注</td>
		<td>${order.remark}<input type="hidden" name="remark" value="${order.remark}"></td>
		<td>这是您给我们的留言参考</td>
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