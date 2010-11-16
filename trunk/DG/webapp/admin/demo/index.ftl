<@admin.page>
	<@adminApp.naviBar navi="代购演示,首页" />
	<@adminApp.naviInfo helpInfoTitle="查看页面说明" helpInfoContent="这里是网购代购演示，用于解析淘宝API获取商品信息并完成下单<br>">
	</@adminApp.naviInfo>
<script type="text/javascript">
function getItem(){
	var tid=$("#taobaoId").val();
	if(tid==""){
		alert("请输入商品ID");
		document.taobaoForm.taobaoId.focus();
	}else{
		alert("请求已经提交，请等待返回结果");
		$.ajax({
	   	 	type: "POST",
	   		url: "${base}/admin/demo/getItem.action",
	   		data: { id: tid, time: new Date().getTime() },
	   		success: function(data){
	   			if(data.status){
	   				$("#itemPrice").html(data.item.price + " 元/RMB(不代购促销价)");
	   				$("#itemNick").html(data.item.nick);
	   				$("#itemNumIid").html(data.item.num_iid);
	   				$("#itemTitle").html(data.item.title);
	   				$("#itemLocation").html(data.item.location.state+" "+data.item.location.city);
	   				$("#itemFee").html(data.item.express_fee);
	   				$("#itemURL").attr('href',data.item.detail_url);
	   				$("#itemPic").attr('src',data.item.pic_url);
	   				$("#num_iid").attr('value',data.item.num_iid);	   				
	   				$("#item").attr('style','display:block');
	   				//$("#item").toggle();
	   			}else{
	   				alert("无法获取该商品的信息，请您检查ID输入是否正确");
	   			}
	   		},
	   		error:function(xmlHttpRequest,status,exception){
				flag_now=false;
	   			alert("请求发送失败，请检查网络连接");
	   		}
		});
	}
}
</script>
<div id="taobao" style="display:block;">
<form name="taobaoForm">
<table class="default" width="100%">
	<col width="40%" align="center">
	<col width="60%" align="center">
	<tr class="title">
		<td colspan="2">一键填单</td>
	</tr>
	<tr>
		<td>淘宝商品ID</td>
		<td><input type="text" id="taobaoId" name="taobaoId" size="60"></td>
	</tr>
	<tr>
		<td colspan="2">示例：在淘宝网站浏览商品，浏览器中会出现如http://item.taobao.com/item.htm?id=8254298203这样的内容，您只需填入8254298203即可</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="提交" class="btn" onclick="getItem()">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重填" class="btn">
		</td>
	</tr>
</table>
</form>
</div>
<div id="item" style="display:none;">
<form name="itemForm" action="confirm.action" method="post" onsubmit="return validateForm(this)">
<input type="hidden" id="num_iid" name="num_iid">
<table class="default" width="100%">
	<col width="20%" align="center">
	<col width="50%" align="center">
	<col width="30%" align="center">
	<tr class="title">
		<td colspan="3">一键下单</td>
	</tr>
	<tr>
		<td>商品地址</td>
		<td><a id="itemURL" target="_blank">点击查看</a></td>
		<td rowspan="12"><img id="itemPic" height="300px" width="225px"></td>
	</tr>
	<tr>
		<td>卖家名称</td>
		<td><span id="itemNick"></td>
	</tr>
	<tr>
		<td>数字ID</td>
		<td><span id="itemNumIid"></td>
	</tr>
	<tr>
		<td>商品名称</td>
		<td><span id="itemTitle"></td>
	</tr>
	<tr>
		<td>商品所在地</td>
		<td><span id="itemLocation"></td>
	</tr>
	<tr>
		<td>商品价格</td>
		<td><span id="itemPrice"></td>
	</tr>
	<tr>
		<td>国内运费</td>
		<td><span id="itemFee"></td>
	</tr>
	<tr>
		<td>购买数量</td>
		<td><input type="text" name="count" emptyInfo="请填写购买数量">&nbsp;件</td>
	</tr>
	<tr>
		<td>运输方式</td>
		<td><select name="transport" emptyInfo="请选择运输方式">
				<option value="air">Air</option>
				<option value="sea">Sea</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>运费计算</td>
		<td><input type="text" name="fee" emptyInfo="请填写运费">&nbsp;元/RMB</td>
	</tr>
	<tr>
		<td>备用商品地址</td>
		<td><input type="text" name="backupURL" size="55" emptyInfo="请填写备用商品地址"></td>
	</tr>
	<tr>
		<td>您的备注</td>
		<td><textarea name="remark" rows="4" cols="20" style="width:300px;">无</textarea></td>
	</tr>
	<tr>
		<td colspan="3">
			<input type="submit" value="下单" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重填" class="btn">
		</td>
	</tr>
</table>
</form>
</div>
</@admin.page>