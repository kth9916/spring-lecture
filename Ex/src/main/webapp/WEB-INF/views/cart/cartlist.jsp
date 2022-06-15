<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
input[type=button] {
	background-color: white;
	border: 1px solid #aeaeae !important;
	color: #2e2e2e;
}

input[type=button]:hover {
	cursor: pointer;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function quantity_change(change , val){
	var quantity = val;
	var _pro_detail_code = change.name;
	var origin = $('input[name='+_pro_detail_code+'quantity]').val();
	var ps = 0;
	var quannum = parseInt(origin);
	
	if(quantity == -1){ps = quannum-1;	}
	else{ps = quannum + 1;}
	
	var pro_detail_code = parseInt(_pro_detail_code);
	if(ps <= 0){
		alert('0�� ���Ϸδ� ������ �� �����ϴ�. ');
		return;
	}
	$.ajax({
		type : "POST",
		url : "${contextPath}/cart/UpdateCart.do",
		data : {
			quantity : ps,
			pro_detail_code : pro_detail_code
		},
		success : function(){
			location.reload();
		}
	});
	
}

function button_change_quantity(val){
	var origin = $('input[name='+val+'quantity]').val();
	var pro_detail_code = parseInt(val);
	var quantity = parseInt(origin);
	if(quantity <= 0){
		alert('0�� ���Ϸδ� ������ �� �����ϴ�.');
		location.reload();
		return;
	}
	$.ajax({
		type : "POST",
		url : "${contextPath}/cart/UpdateCart.do",
		data : {
			quantity : quantity,
			pro_detail_code : pro_detail_code
		},
		success : function(){
			location.reload();
		}
	});
}
function allcheck(){
	var allcheck = $('input[name=checkall]').is(":checked");
		if(allcheck == false){
			$('input[name=product_check]').prop('checked',false); 
		}else{
			$('input[name=product_check]').prop('checked',true); 
		}
		for(var i = 1; i < 5; i ++){
			$('#total_order_price'+i).load('${contextPath}/cart/cartlist_total_order_price.do?total_order_price=${totalprice} #total_order_price'+ i);
		}
}


function order(cli){
	var list = new Array();
	if(parseInt(cli) >= 0){
		list.push(parseInt(cli));
	}else{
		
	if(cli == '���û�ǰ�ֹ�'){
		for(var i = 0 ; i < ${cartlist.size()}; i ++){
			if($('input[name=product_check]:eq('+i+')').is(":checked")){
			var pro_detail_code = parseInt($('input[name=product_check]:eq('+i+'):checked').val());
			list.push(pro_detail_code);
			
			}
		}
	}else if (cli == '��ü��ǰ�ֹ�'){
		for(var i = 0 ; i < ${cartlist.size()}; i++){
			var pro_detail_code = parseInt($('input[name=product_check]:eq('+i+')').val());
			list.push(pro_detail_code);
		}
	}
	}
	var param = {'pro_detail_code_list' : list};
	if(list.length == 0)
		alert('�ֹ��� ��ǰ�� �������ּ���');
	else{
		console.log(param);
	$.ajaxSettings.traditional = true;
		$.ajax({
			async : false,
			type : "POST",
			url : "${contextPath}/order/orderMain.do",
			data : param,
			success : function(result){
				location.href='${contextPath}/order/orderMain.do?pro_detail_code_list='+list;
			},
			error : function(){
				alert('err');
			}
		});
	}
}

function Delete_Cart(value){		
	var list = new Array();
	
	if(parseInt(value) >= 0){
		list.push(parseInt(value));
	}else{
		
	if(value == '���û�ǰ����'){
		for(var i = 0 ; i < ${cartlist.size()}; i++){
			if($('input[name=product_check]:eq('+i+')').is(':checked')){
				list.push(parseInt($('input[name=product_check]:eq('+i+')').val()));	
			}
		}
	}else if(value == '��ü��ǰ����'){
		for(var i = 0 ; i < ${cartlist.size()}; i++){
			list.push(parseInt($('input[name=product_check]:eq('+i+')').val()));
		}			
	}else{
		
	}
	if(list.length == 0){
		alert('������ ��ǰ�� �������ּ���');
		return;
	}
	}
	$.ajaxSettings.traditional = true;
		$.ajax({
			type : "POST",
			url : "${contextPath}/cart/DeleteCart.do",
			data : {pro_detail_code_list : list} ,
			success : function(){
				location.reload();
			},
			error : function(){
				alert("err");
			}
		});

}


function ChangeTotalPrice(){
	var detail_code_list = new Array();
	for(var i = 0 ; i < ${cartlist.size()} ; i++){
		if($('input[name=product_check]:eq('+i+')').is(':checked') == true){
			detail_code_list.push($('input[name=product_check]:eq('+i+')').val());
		}
	}
	var total_price = 0 ;
	for(var i = 0 ; i < detail_code_list.length; i ++){
	  total_price += parseInt(($('input[name='+detail_code_list[i]+'total_price]').val()));
	}
	if(total_price == 0){
		total_price = ${totalprice};
	}
	console.log(total_price);
	for(var i = 1; i < 5; i ++){
	$('#total_order_price'+i).load('${contextPath}/cart/cartlist_total_order_price.do?total_order_price='+total_price+' #total_order_price'+i);
	}
}


//�ɼ� ���� ���̾� open	
function option_change(pro_code,pro_name,pro_detail_code,pro_imagefilename,pro_price,pro_quantity){
	var option_layer = $('#option_modify_layer_0'+pro_detail_code);
	
// 	console.log(pro_code + " " + pro_name + " " + pro_detail_code + " " + pro_imagefilename + " " + pro_price + " " + pro_quantity);
// 	option_layer.load('${contextPath}/cart/cartOptionupdateForm.do #option_modify_layer_0'+pro_detail_code , 
// 			{	
// 				pro_code : pro_code,
// 				pro_detail_code : pro_detail_code , 
// 				pro_imageFileName : pro_imagefilename ,
// 				pro_quantity : pro_quantity
// 			});
	$('.optionModify').hide();
	option_layer.show();


// 	window.open('${contextPath}/cart/cartOptionUpdateForm.do?pro_detail_code='+pro_detail_code+'&pro_code='+pro_code+'&pro_imageFileName='+pro_imagefilename+
// 			'&pro_name='+pro_name+'&pro_price='+pro_price+'&pro_quantity='+pro_quantity,'�ɼ� ����','left='+popupX+
// 			',top='+popupY+',width=600,height=450, location=no,menubar=no,titlebar=no,toolbar=no,resizeble=no,scrollbars=no');
	
}



function optionsChange(action , pro_code, origin_pro_detail_code, price, pro_quantity){
	var col = "";
	var code = 0 ;
	<c:choose>
		<c:when test="${memberInfo.member_code != null}">
			code = ${memberInfo.member_code};
			col = 'member';
		</c:when>
		<c:otherwise>
			code = ${nonmemberInfo.nonmember_code};
			col = 'nonmember';
		</c:otherwise>
	</c:choose>
	var color = $('select[name='+origin_pro_detail_code+'color]').val();
	var size = $('select[name='+origin_pro_detail_code+'size]').val();
	
	if(color == 'null' || size == 'null'){
		alert('�ɼ��� ������ �ּ���');
		return ;
	}
	var pro_detail_code = get_pro_Detail_code(pro_code , color , size);
	var result = cartOverlap(pro_detail_code , col , code);
	
	var confirm_result = true;
	
	if(pro_detail_code == origin_pro_detail_code){
		alert('���� ������ ��ǰ �Դϴ�.');
		return;
	}
	
	if(result == false)
		confirm_result = confirm('�̹� ��ٱ��Ͽ� ���� ��ǰ�� �ֽ��ϴ�. �׷��� '+action+'�Ͻðڽ��ϱ�?');
	var param = {
				 col  					: col ,
				 code 					: code, 
				 action	 				: action,
				 pro_detail_code 		: pro_detail_code ,
				 origin_pro_detail_code : origin_pro_detail_code ,
				 pro_code 				: pro_code,
				 pro_quantity   		: pro_quantity,
				 price 					: price,
				 color 					: color ,
				 size 					: size ,
				 result 				: result
				 };
	console.log(param);
	if(confirm_result == true){
// 		$('#content').load('${contextPath}/cart/cartOptionUpdate.do #content',param);
	$.ajax({
		type : 'POST',
		url : '${contextPath}/cart/cartOptionUpdate.do',
		data : param,
		dataType : 'json',
		async: false,
		success : function(data){	
		},
		error : function(){
		}
	});
	location.reload();
//		opener.parent.location.reload();
	}
}

function get_pro_Detail_code(pro_code, color , size){
	var pro_detail_code = 0;
	$.ajax({
		type : "POST",
		url : "${contextPath}/cart/getPro_Detail_code.do",
		async: false,
		dataType : 'json',
		data : {
			pro_code : pro_code ,
			color 	 : color ,
			size 	 : size
		},
		success : function(data){
			pro_detail_code = parseInt(data);
		},
		error : function(){
			alert('pro_detail err');
		}
		
	});
	return pro_detail_code;
}

function cartOverlap(pro_detail_code , col , code){
	var result = '';
	$.ajax({
		type : "POST",
		url : "${contextPath}/cart/cart_overlap.do",
		async : false,
		data : {
			pro_detail_code : pro_detail_code ,
			col 			: col ,
			code 			: code
		},
		dataType : 'json',
		success : function(data){
			result = data;
		},
		error : function(){
			alert('overlap_err');
		}
	});
	return result;
}

</script>

<!-- �ɼ� ���� ���̾�  -->
<style>
    *{
        margin: 0;
        padding: 0;
    }
     .optionModify{
   
    width: 450px;
    color: #707070;
    }
    .ec-base-layer2 {
    position: absolute;
    z-index: 100;
    border: 1px solid #757575;
    background: #fff;
}
    .ec-base-layer2 .content {
    padding: 20px;
    font-size: 12px;
}
.ec-base-layer2 .header {
    padding: 7px 35px 7px 19px;
    color: #fff;
    background: #495164;
}
     .optionModify .prdInfo {
    margin: 0 0 10px;
    padding: 0 0 10px;
    border-bottom: 1px dotted #b0b1b3;
    line-height: 1.5;
}
    .optionModify .prdModify li {
    padding: 6px 0 0;
}
    .ec-base-layer2 .ec-base-button {
    padding: 9px;
    border-top: 1px solid #d7d5d5;
    text-align: center;
    background: #fbfafa;
}
    .ec-base-layer2 .close {
    position: absolute;
    right: 0;
    top: 0;
    padding: 11px 20px;
    cursor: pointer;
}
    .optionModify .prdModify li select {
    float: right;
    width: 294px;
    line-height: 24px;
    font-size: 12px;
}
    .optionModify .prdModify h4 {
    color: #353535;
    font-size: 12px;
}
    .optionModify .prdInfo li {
    color: #353535;
    font-weight: bold;
}
   .optionModify .prdInfo li.option {
    color: #707070;
    font-weight: normal;
}
    a {
    text-decoration: none;
    color: #000;
}
   
    ul , li {
        list-style: none;
    }
    .ec-base-layer2 .header > h1, .ec-base-layer .header > h3 {
    font-size: 14px;
    line-height: 1.5;
}
    .header > h1, .ec-base-layer2 .header > h3 {
    font-size: 14px;
    line-height: 1.5;
}
   
    
</style>
</head>
<body>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br><br>
	
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/mypage/cart/css/1.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/mypage/cart/css/2.css" />

	<div id="wrap2" >
	

		<div id="container2">
			<div id="contents2">

				<div class="xans-element- xans-order xans-order-basketpackage ">
					<div
						class="xans-element- xans-order xans-order-tabinfo df-base-tab typeLight " style="margin: 0 !important;">
						<ul class="menu">
							<li class="selected "><a href="/order/basket.html">������ۻ�ǰ</a></li>

						</ul>

					</div>
					
					<div class="orderListArea">
						<div class="xans-element- xans-order xans-order-normtitle title ">
							<h3>�Ϲݻ�ǰ (${cartlist.size()})</h3>
						</div>

						<table width="100%" border="1" summary=""
							class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
							<caption>�⺻���</caption>
							<colgroup>
								<col style="width: 34px;" />
								<col style="width: 92px;" />
								<col style="width: auto;" />
								<col style="width: 95px;" />
								<col style="width: 100px;" />
								<col style="width: 85px;" />
								<col style="width: 85px;" />
								<col style="width: 85px;" />
								<col style="width: 85px;" />
								<col style="width: 100px;" />
							</colgroup>
							<thead>
								<tr style="text-align: center;">
									<th scope="col"><input type="checkbox" name="checkall"
										onclick="allcheck()" /></th>
									<th scope="col">�̹���</th>
									<th scope="col">��ǰ����</th>
									<th scope="col">�ǸŰ�</th>
									<th scope="col">����</th>
									<th scope="col">������</th>
									<th scope="col">��۱���</th>
									<th scope="col">��ۺ�</th>
									<th scope="col">�հ�</th>
									<th scope="col">����</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td colspan="10"><strong class="type">[�⺻���]</strong>
										��ǰ���űݾ� <strong id="total_order_price1"><fmt:formatNumber value="${totalprice}" type="number"/> <span class="displaynone">()</span></strong><span
										class="displaynone"> </span> + ��ۺ� 0<span
										class="displaynone"> </span> <span class="displaynone">
											- ��ǰ���αݾ� 0 </span> = �հ�  <strong class="total"><span id="total_order_price2"><fmt:formatNumber value="${totalprice}" type="number"/></span>��</strong>
										<span class="displaynone"> </span></td>
								</tr>
							</tfoot>
							<tbody class="xans-element- xans-order xans-order-list">
							
							<c:forEach items="${cartlist}" var="cart">
							
								<tr class="xans-record-">
									<td><input type="checkbox" id="basket_chk_id_0"
										name="product_check" value="${cart.cart_pro_detail_code}" onclick="ChangeTotalPrice()" /></td>
									<td class="thumb"><a
										href="/product/detail.html?product_no=28871&cate_no=82"><img
											src="${contextPath}/thumbnails.do?pro_code=${cart.cart_pro_code}&fileName=${cart.pro_imagefilename}"
											/></a></td>
									<td class="product"><a
										href="/product/detail.html?product_no=28871&cate_no=82"><strong
											class="name">${cart.pro_name}</strong><span class="icon"><img
												src="/web/upload/custom_4.gif" alt="" /></span></a>
										<ul
											class="xans-element- xans-order xans-order-optionall option">
											<li class="xans-record-">[�ɼ�: ${cart.cart_pro_color }/${cart.cart_pro_size }]<br />
											
											<span class=""><a href="#none"
													onclick="option_change(${cart.cart_pro_code},'${cart.pro_name}',${cart.cart_pro_detail_code},
													'${cart.pro_imagefilename}',${cart.cart_pro_price},${cart.cart_pro_quantity})"
													class="df-btn light tiny mt-7">�ɼǺ���</a></span> 
													
													
													
													
													
					<!-- �ɼǺ��� ���̾� -->
				 			<div class="optionModify ec-base-layer2" id="option_modify_layer_0${cart.cart_pro_detail_code}" style="position: absolute !important;">
                                    <div class="header">
                                        <h3  style="color: white !important;">�ɼǺ���</h3>
                                    </div>
                                    <div class="content">
                                        <ul class="prdInfo">
									<li>${cart.pro_name }</li>
                                            <li class="option">[�ɼ�: ${cart.cart_pro_color}/ ${cart.cart_pro_size }]</li>
                                        </ul>
									<div class="prdModify">
                                            <h4>��ǰ�ɼ�</h4>
                                            <ul class="xans-element- xans-order xans-order-optionlist"><li class="xans-record-">
											<span>����</span>
 											<select   id="product_option_id1" class="ProductOption0" name="${cart.cart_pro_detail_code}color">
 											<option value="null">- [�ʼ�] [�ʼ�]�ɼ��� ������ �ּ��� -</option>
 											<c:if test="${cart.color_list != null}">
 											<c:forEach items="${cart.color_list}" var="color">
 											<option value="${color}">${color}</option>
 											</c:forEach>
 											</c:if>
											</select>
											</li>
										</ul>
									<ul class="xans-element- xans-order xans-order-optionlist"><li class="xans-record-">
									<span>������</span> 
									<select id="product_option_id1" class="ProductOption0" name="${cart.cart_pro_detail_code}size" >
									<option value="null">- [�ʼ�] [�ʼ�]�ɼ��� ������ �ּ��� -</option>
									<c:if test="${cart.size_list != null }">
									<c:forEach items="${cart.size_list}" var="size">
									<option value="${size }">${size}</option>
									</c:forEach>
									</c:if>
									</select></li>
									</ul>
									</div>
                                    </div>
                                    <div class="ec-base-button">
                                        <a href="#none" class="" onclick="optionsChange('�߰�',${cart.cart_pro_code},${cart.cart_pro_detail_code},${cart.cart_pro_price},${cart.cart_pro_quantity})">
                                        <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/btn_option_add.gif" alt="�߰�"/></a>
                                        <a href="#none" class="" onclick="optionsChange('����',${cart.cart_pro_code},${cart.cart_pro_detail_code},${cart.cart_pro_price},${cart.cart_pro_quantity})">
                                        <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/btn_option_modify.gif" alt="����"/></a>
                                    </div>
                                    <a href="#none" class="close" onclick="$('.optionModify').hide();"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif" alt="�ݱ�"/></a>
									</div>
					<!-- �ɼǺ��� ���̾� -->
																
										
										
													 
											</li>
										</ul></td>
									<td class="price">
										<div class="">
											<strong><fmt:formatNumber value="${cart.cart_pro_price}" type="number"/> ��</strong>
										</div>
									</td>
									<td><span class=""> <span class="df-base-qty"><input 
												id="quantity_id_0" name="${cart.cart_pro_detail_code}quantity" size="2" value="${cart.cart_pro_quantity}"
												type="text" /><a href="javascript:;" style="margin-left: 0px !important;"
												name="${cart.cart_pro_detail_code}"
												onclick="quantity_change(this,1)" ><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif"
													alt="����" class="up" /></a><a href="javascript:;" style="margin: 0 !important;" 
													name="${cart.cart_pro_detail_code}"
												onclick="quantity_change(this,-1)" ><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif"
													alt="����" class="down" /></a></span><a href="javascript:;"
											onclick="button_change_quantity(${cart.cart_pro_detail_code})" 
											class="df-btn light tiny ml-2">����</a>
									</span> <span class="displaynone">1</span></td>
									<td class="mileage">-</td>
									<td class="delivery">�⺻���
									</td>
									<td>
										<p class="">
											0��<span class="displaynone"><br /></span><br />
										</p>
									</td>
									<td class="total"><strong><fmt:formatNumber value="${cart.cart_pro_price * cart.cart_pro_quantity}" type="number" /> ��</strong>
									<input type="hidden" name="${cart.cart_pro_detail_code}total_price" value="${cart.cart_pro_price * cart.cart_pro_quantity}">
									<div class="displaynone"></div></td>
									<td class="button"><a href="javascript:;"
										class="df-btn highlight small block"
										onclick="order(${cart.cart_pro_detail_code})"
										>�ֹ��ϱ�</a> <a
										href="javascript:;" class="df-btn light small block mt-4"
										onclick="Delete_Cart(${cart.cart_pro_detail_code})" style ="margin-top: 4px !important;">����</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="orderListArea">

					</div>
					<div
						class="xans-element- xans-order xans-order-basketpriceinfoguide  ">
						<p class="info ">���� ���� �ݾ��� �ֹ����ۼ��� ���������ݾ׿��� Ȯ�� �����մϴ�.</p>

					</div>
					<div
						class="xans-element- xans-order xans-order-selectorder df-base-button fs-0 ">
						<span class="g-left"> <a href="#none"
							class="df-btn medium normal mr-5" onclick="Delete_Cart('���û�ǰ����')">�����ϱ�</a>
						</span> <span class="g-right"> <a href="#none"
							class="df-btn light normal" onclick="Delete_Cart('��ü��ǰ����')">��ٱ��Ϻ���</a>

						</span>
					</div>
					<div class="xans-element- xans-order xans-order-totalsummary  ">
						<table width="100%" border="1" summary="">
							<caption>�� �ֹ��ݾ�</caption>
							<colgroup>
								<col style="width: 23%;" />
								<col style="width: 24%;" />
								<col style="width: 23%;" class="displaynone" />
								<col style="width: auto;" />
							</colgroup>
							<thead>
								<tr style="text-align: center;">
									<th scope="col"><span>�� ��ǰ�ݾ�</span><a href="#none"
										onclick="OrderLayer.onDiv('order_layer_detail', event);"
										class="more displaynone"><img
											src="//img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif"
											alt="��������" /></a></th>
									<th scope="col">�� ��ۺ�</th>
									<th scope="col" class="displaynone">�� ���αݾ�<a href="#none"
										onclick="OrderLayer.onDiv('order_layer_benefit', event);"><img
											src="//img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif"
											alt="��������" /></a>
									</th>
									<th scope="col">���������ݾ�</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="price"><div class="box">
											<strong id="total_order_price3"><fmt:formatNumber value="${totalprice}" /> </strong>�� <span class="tail displaynone"></span>
										</div></td>
									<td class="option"><div class="box">
											<strong></strong><strong>0</strong>�� <span
												class="tail displaynone"></span>
										</div></td>
									<td class="discount displaynone"><div class="box">
											<strong></strong><strong>0</strong>�� <span
												class="tail displaynone"></span>
										</div></td>
									<td class="total"><div class="box">
											<strong></strong><strong id="total_order_price4"><fmt:formatNumber value="${totalprice}" /> </strong>�� <span
												class="tail displaynone"></span>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- �ֹ� ��ư -->
					<div
						class="xans-element- xans-order xans-order-totalorder df-base-button justify fs-0">
						<a href="#none" onclick="order('��ü��ǰ�ֹ�')"
							class="df-btn highlight big mr-3  ">��ü��ǰ�ֹ�</a> <a href="#none"
							onclick="order('���û�ǰ�ֹ�')"
							class="df-btn medium big ml-3 ">���û�ǰ�ֹ�</a><span
							class="g-right"> <a href="${contextPath}/main/main.do" class="df-btn light big">���ΰ���ϱ�</a>
						</span>
						<!-- ���̹� üũ�ƿ� ���� ��ư  -->
						<div id="NaverChk_Button"></div>
					</div>
				</div>
				<!-- //��ٱ��� ��� Package -->

				<!-- ���ɻ�ǰ -->
				<div
					class="xans-element- xans-myshop xans-myshop-wishlist displaynone xans-record-">
					<div class="title">
						
					</div>



				</div>

			</div>
		</div>



	</div>





	<!-- 	<!-- ****** Cart Area Start ****** -->
	<!-- 	<div class="cart_area section_padding_100 clearfix"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row"> -->
	<!-- 				<div class="col-12"> -->
	<!-- 					<div class="cart-table clearfix"> -->
	<!-- 						<table class="table table-responsive"> -->
	<!-- 							<thead> -->
	<!-- 								<tr> -->
	<!-- 									<th><input type="checkbox" name="checkall" -->
	<!-- 										onclick="allcheck()"></th> -->
	<!-- 									<th>�̹���</th> -->
	<!-- 									<th>��ǰ��</th> -->
	<!-- 									<th>��ǰ����</th> -->
	<!-- 									<th>�ǸŰ�</th> -->
	<!-- 									<th>����</th> -->
	<!-- 									<th>��������Ʈ</th> -->
	<!-- 									<th>��۱���</th> -->
	<!-- 									<th>��ۺ�</th> -->
	<!-- 									<th>�հ�</th> -->
	<!-- 									<th>����</th> -->
	<!-- 								</tr> -->
	<!-- 							</thead> -->
	<!-- 							<tbody> -->
	<%-- 								<c:choose> --%>
	<%-- 									<c:when test="${cartlist.size() != 0 }"> --%>
	<%-- 										<c:forEach items="${cartlist}" var="cart"> --%>
	<!-- 											<tr> -->
	<!-- 												<th><input type="checkbox" -->
	<%-- 													value="${cart.cart_pro_detail_code }" name="product_check" --%>
	<!-- 													onclick="ChangeTotalPrice()"></th> -->


	<!-- 												<td><a -->
	<%-- 													href="${contextPath}/product/productdetail.do?pro_code=${cart.cart_pro_code}"> --%>
	<!-- 														<img width="70px" height="105px" -->
	<%-- 														src="${contextPath}/thumbnails.do?pro_code=${cart.cart_pro_code}&fileName=${cart.pro_imagefilename}"> --%>
	<!-- 												</a></td> -->


	<!-- 												<td><a -->
	<%-- 													href="${contextPath}/product/productdetail.do?pro_code=${cart.cart_pro_code}">${cart.pro_name}</a></td> --%>


	<%-- 												<td><label name="${cart.cart_pro_detail_code}size">${cart.cart_pro_size }</label><br> --%>
	<%-- 													<label name="${cart.cart_pro_detail_code}color">${cart.cart_pro_color}</label><br> --%>
	<!-- 													<input type="button" name="option" -->
	<%-- 													onclick="option_change(${cart.cart_pro_code},'${cart.pro_name}',${cart.cart_pro_detail_code}, --%>
	<%-- 					'${cart.pro_imagefilename}',${cart.cart_pro_price},${cart.cart_pro_quantity})" --%>
	<!-- 													value="�ɼ� �߰�/����" /> -->
	<!-- 													<div></div></td> -->


	<%-- 												<td><label><fmt:formatNumber --%>
	<%-- 															value="${cart.cart_pro_price}" pattern="#,###" --%>
	<%-- 															type="number" /></label></td> --%>


	<!-- 												<td><input type="text" style="float: left;" -->
	<%-- 													name="${cart.cart_pro_detail_code}quantity" --%>
	<%-- 													value="${cart.cart_pro_quantity }" maxlength="2px" --%>
	<!-- 													size="10"> <input type="button" -->
	<!-- 													style="float: left; width: 20px; height: 20px;" -->
	<%-- 													name="${cart.cart_pro_detail_code}" --%>
	<!-- 													onclick="quantity_change(this)" value="+"> <input -->
	<!-- 													style="float: left; width: 20px; height: 20px;" -->
	<%-- 													type="button" name="${cart.cart_pro_detail_code}" --%>
	<!-- 													onclick="quantity_change(this)" value="-"> <input -->
	<!-- 													type="button" style="clear: both;" -->
	<%-- 													onclick="button_change_quantity(${cart.cart_pro_detail_code})" --%>
	<!-- 													value="����"></td> -->

	<%-- 																		
<%-- 													<td class="qty"> --%>
	<%--                                             <div class="quantity"> --%>
	<%--                                                 <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span> --%>
	<%--                                                 <input type="button" class="qty-text" max="99" name="quantity" onclick="button_change_quantity(${cart.cart_pro_detail_code})" --%>
	<%-- 													> --%>
	<%--                                                 <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span> --%>
	<%--                                             </div> --%>
	<%--                                         </td> --%>
	

	<%-- 												<td><label name="${cart.cart_pro_detail_code}point"><fmt:formatNumber --%>
	<%-- 															value="${cart.cart_pro_price * 0.01 * cart.cart_pro_quantity}" --%>
	<%-- 															pattern="#,###" type="number" /></label></td> --%>

	<!-- 												<td>�⺻ ���</td> -->

	<!-- 												<td>����</td> -->
	<!-- 												<td><input type="hidden" -->
	<%-- 													value="${cart.cart_pro_price * cart.cart_pro_quantity}" --%>
	<%-- 													name="${cart.cart_pro_detail_code}total_price"> <label --%>
	<%-- 													name="${cart.cart_pro_detail_code}totalprice"><fmt:setLocale --%>
	<%-- 															value="ko_KR" /> <fmt:formatNumber --%>
	<%-- 															value="${cart.cart_pro_price * cart.cart_pro_quantity}" --%>
	<%-- 															type="currency" /></label></td> --%>
	<!-- 												<td><input type="button" value="��ǰ����" -->
	<%-- 													onclick="Delete_Cart(${cart.cart_pro_detail_code})"> --%>
	<!-- 													<input type="button" value="�ٷ��ֹ�" -->
	<%-- 													onclick="order(${cart.cart_pro_detail_code})"></td> --%>
	<!-- 											</tr> -->
	<%-- 										</c:forEach> --%>
	<%-- 									</c:when> --%>
	<%-- 								</c:choose> --%>
	<!-- 							</tbody> -->
	<!-- 						</table> -->
	<!-- 						<div id="total_order_price" style="background-color: rgba(235,235,235,1);"> -->
	<!-- 							<div style="text-align: right;"> -->
	<%-- 								<label style="font-size: 2em; float: right;"><fmt:setLocale --%>
	<%-- 										value="ko_KR" /> <fmt:formatNumber value="${totalprice}" --%>
	<%-- 										type="currency" /><br><h6>�����ݾ�</h6></label> <label --%>
	<!-- 									style="font-size: 2em; float: right;">+&nbsp;&nbsp;&nbsp;&nbsp;0 -->
	<%-- 									=<br><h6>���αݾ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6></label> <label style="font-size: 2em; margin-right: 15px;"><fmt:formatNumber --%>
	<%-- 										value="${totalprice}" type="currency" /><br><h6>�ֹ��ݾ�</h6></label> --%>
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->

	<!-- 					<div class="cart-footer d-flex mt-30">
<!-- 						<div class="back-to-shop w-50"> -->
	<!-- 							<a href="shop-grid-left-sidebar.html">Continue shooping</a> -->
	<!-- 						</div> -->
	<!-- 						<div class="update-checkout w-50 text-right"> -->
	<!-- 							<a href="#">clear cart</a> -->
	<!--                                 <a href="#">Update cart</a> -->
	<!-- 							<input type="button" value="���û�ǰ����" onclick="Delete_Cart(this)"> -->
	<!-- 							<input type="button" value="��ü��ǰ����" onclick="Delete_Cart(this)"> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	
	<!-- 					<div class="cart_area clearfix"> -->
	<!-- 						<div class="container"> -->
	<!-- 							<div class="cart-footer d-flex mt-30"> -->
	<!-- 								<div class="back-to-shop w-50"> -->
	<!-- 									<input type="button" value="���ΰ���ϱ�"> -->
	<!-- 								</div> -->
	<!-- 								<div class="update-checkout w-50 text-right"> -->
	<!-- 									<input type="button" value="���û�ǰ����" onclick="Delete_Cart(this)"> -->
	<!-- 									<input type="button" value="��ü��ǰ����" onclick="Delete_Cart(this)"> -->
	<!-- 								</div> -->

	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 					<br> -->

	<!-- 					<div class="cart_area clearfix"> -->
	<!-- 						<div class="container"> -->
	<!-- 							<div class="cart-footer d-flex"> -->
	<!-- 								<div class="back-to-shop w-50"></div> -->
	<!-- 								<div class="update-checkout w-50 text-right"> -->
	<!-- 									<input type="button" value="���û�ǰ�ֹ�" onclick="order(this)"> -->
	<!-- 									<input type="button" value="��ü��ǰ�ֹ�" onclick="order(this)"> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->

	<!-- 				</div> -->
	<!-- 			</div> -->


	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	<!-- ****** Cart Area End ****** -->
	

</body>
</html>