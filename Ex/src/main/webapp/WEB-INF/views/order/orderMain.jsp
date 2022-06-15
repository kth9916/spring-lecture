<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="orderList" value="${orderViewMap.orderList }" />
<c:set var="total_coupons" value="${orderViewMap.total_coupons }" />
<c:set var="memberDetail" value="${orderViewMap.memberDetail }" />



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ֹ� ���� ������</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/resources/c/js/main.js"></script>
<script src="${contextPath}/resources/s/js/jquery-ui.js"></script>
<script src="${contextPath}/resources/s/js/popper.min.js"></script>
<script src="${contextPath}/resources/s/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/s/js/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/s/js/jquery.magnific-popup.min.js"></script>
<script src="${contextPath}/resources/s/js/aos.js"></script>

<script src="${contextPath}/resources/s/js/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath}/resources/s/js/jquery-ui.js"></script>
<script src="${contextPath}/resources/s/js/popper.min.js"></script>
<script src="${contextPath}/resources/s/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/s/js/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/s/js/jquery.magnific-popup.min.js"></script>
<script src="${contextPath}/resources/s/js/aos.js"></script>

<script src="${contextPath}/resources/s/js/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script src="${contextPath}/resources/k/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${contextPath}/resources/k/js/popper.min.js"></script>
<script src="${contextPath}/resources/k/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/k/js/plugins.js"></script>
<script src="${contextPath}/resources/k/js/active.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function find_addr() {
   new daum.Postcode({
      oncomplete : function(data) {
         // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

         // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
         // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
         var addr = ''; // �ּ� ����
         var extraAddr = ''; // �����׸� ����

         //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
         if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
            addr = data.roadAddress;
         } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
            addr = data.jibunAddress;
         }

         // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
         if (data.userSelectedType === 'R') {
            // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
            // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
            if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
               extraAddr += data.bname;
            }
            // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
            if (data.buildingName !== '' && data.apartment === 'Y') {
               extraAddr += (extraAddr !== '' ? ', '
                     + data.buildingName : data.buildingName);
            }
            // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
            if (extraAddr !== '') {
               extraAddr = ' (' + extraAddr + ')';
            }
            // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
            document.getElementById("jiaddr").value = extraAddr;

         } else {
            document.getElementById("jiaddr").value = '';
         }

         // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
         document.getElementById('postaddr').value = data.zonecode;
         document.getElementById("loadaddr").value = addr;
         // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
         document.getElementById("detailaddr").focus();
      }
   }).open();
   
}

function find_addr2() {
   new daum.Postcode({
      oncomplete : function(data) {
         // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

         // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
         // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
         var addr = ''; // �ּ� ����
         var extraAddr = ''; // �����׸� ����

         //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
         if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
            addr = data.roadAddress;
         } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
            addr = data.jibunAddress;
         }

         // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
         if (data.userSelectedType === 'R') {
            // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
            // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
            if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
               extraAddr += data.bname;
            }
            // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
            if (data.buildingName !== '' && data.apartment === 'Y') {
               extraAddr += (extraAddr !== '' ? ', '
                     + data.buildingName : data.buildingName);
            }
            // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
            if (extraAddr !== '') {
               extraAddr = ' (' + extraAddr + ')';
            }
            // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
            document.getElementById("jiaddr2").value = extraAddr;

         } else {
            document.getElementById("jiaddr2").value = '';
         }

         // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
         document.getElementById('postaddr2').value = data.zonecode;
         document.getElementById("loadaddr2").value = addr;
         // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
         document.getElementById("detailaddr2").focus();
      }
   }).open();
}

   $(document).ready(function(){
      
      $('#div_how_pay1').show();
      $('#div_how_pay2').hide();
      
      $('#how_pay1').click(function(){
            $('#div_how_pay1').show();
            $('#div_how_pay2').hide();
      });
      
      $('#how_pay2').click(function(){
         $('#div_how_pay2').show();
         $('#div_how_pay1').hide();
   });
      
      
      $('#email_direct').hide();
      
      $('#email2').change(function(){
      var email = $('#email2').val();
      if(email == 'direct'){
         $('#email_direct').show();
         $('#email2').hide();
      }else{
         $('#email_direct').hide();
         $('#email2').show();
      }
      });
      
      $('#delivery_choice').click(function(){
            
            var member_name =$('#member_name').val();
            var postaddr=$('#postaddr').val();
            var loadaddr=$('#loadaddr').val();
            var jiaddr=$('#jiaddr').val();
            var detailaddr=$('#detailaddr').val();
            var member_cp1=$('#member_cp1').val();
            var member_cp2=$('#member_cp2').val();
            var member_cp3=$('#member_cp3').val();
            
         if($(this).val()=='same'){
            
            $('#receiver').val(member_name);
            $('#postaddr2').val(postaddr);
            $('#loadaddr2').val(loadaddr);
            $('#jiaddr2').val(jiaddr);
            $('#detailaddr2').val(detailaddr);
            $('#receiver_hp1').val(member_cp1);
            $('#receiver_hp2').val(member_cp2);
            $('#receiver_hp3').val(member_cp3);
            
         }
      });
      
      $('#delivery_choice2').click(function(){
         
         $('#receiver').val('');
         $('#postaddr2').val('');
         $('#loadaddr2').val('');
         $('#jiaddr2').val('');
         $('#detailaddr2').val('');
         $('#receiver_hp1').val('');
         $('#receiver_hp2').val('');
         $('#receiver_hp3').val('');
      });
      
      $('#request_to_delivery').change(function(){
         
         if($(this).val()=='���� �ۼ�'){
            $('#request_to_delivery_text').val('�ù���Ե��� ���ô� ���� �Դϴ�.');
            $('#request_to_delivery_text').prop('disabled',false);
         }
         else{
         var request_to_delivery=$(this).val();
         $('#request_to_delivery_text').val(request_to_delivery);
         $('#request_to_delivery_text').prop('disabled',true);
         $('#duplicate_textarea').val(request_to_delivery);
            
         }
         
      });
      
      var total_discount=0;
      var member_saving=${memberInfo.member_saving};
      var member_point=${memberInfo.member_point};
      var apply_point=0;
      var apply_saving=0;
      
      $('#member_saving').change(function(){
         //�ʱ�ȭ
      var _member_saving=$(this).val();
         apply_saving=parseInt(_member_saving);
         
         if(apply_saving <= member_saving){
            total_discount=apply_saving+apply_point;
         }else{
            alert("������ �ѵ��� �ʰ��Ͽ����ϴ�. �ٽ� �Է����ּ���");
            $(this).val('');
            
         }
         
         $('#total_discount').text(total_discount); 
         $('#order_discount').val(total_discount);
         $('#discount_point').val(apply_point);
         $('#discount_saving').val(apply_saving);
         
      }); 
   
      $('#member_point').change(function(){
         //�ʱ�ȭ
         
         var _member_point=$(this).val();
         apply_point=parseInt(_member_point);
         
         if(apply_point <= member_point){
            total_discount=apply_saving+apply_point;
         }else{
            alert("����Ʈ �ѵ��� �ʰ��Ͽ����ϴ�. �ٽ� �Է����ּ���");   
            $(this).val('');
         }
         
         $('#total_discount').text(total_discount);
         $('#order_discount').val(total_discount);
         $('#discount_point').val(apply_point);
         $('#discount_saving').val(apply_saving);
      }); 
      
   });
   
   function order(obj){
      
      if($("input:checkbox[name='agree_to_pay']").is(":checked")==false){
         alert('�������� Ȯ�� �� �������࿡ �����ϼž� �ֹ��� �����մϴ�.');
      }else{
         if(confirm('������ �����Ͻðڽ��ϱ�?')){
            
             obj.submit();      
         }
      }
      
   }
   
   function apply_discount(){
       var _total_discount=$('#total_discount').text();
       var total_discount=parseInt(_total_discount);
       
       
       var _final_total_order_price=$('#final_total_order_price').text();
       var final_total_order_price=parseInt(_final_total_order_price);
      
       if(final_total_order_price-total_discount>0){
       var final_total_pay_price=final_total_order_price-total_discount;
       }
       
       $('#final_total_pay_price').text(final_total_pay_price);
       $('#final_total_pay_price2').text(final_total_pay_price);
       $('#order_price').val(final_total_pay_price);
   }
   
   function text(){

      var text1=('#request_to_delivery_text').text();
      alert(text1);
      $('#duplicate_textarea').val(text);
   }

</script>

<style>
 table {
   border-spacing: 30px;
}

input {
   border: 1px;
   border-color: black;
   display: inline;
}

radio {
   display: inline;
} 
</style>
<style>
 .orderinfo {
   width: 100%;
      border-top : 3px solid darkgray;
    border-left : none;
    border-right : none;
    line-height: 4;
}
.orderinfo th , .orderinfo td{
   border-right: none;
   border-left: none;
    border-bottom : 1px solid darkgray;
   text-align: center;
} 

.bubbly-buttons {
  font-family: 'Helvetica', 'Arial', sans-serif;
  display: inline-block;
  font-size: 1em;
  padding: 1em 2em;
  margin-top: 5px;
  margin-bottom: 5px;
  -webkit-appearance: none;
  appearance: none;
  background-color: #FF084E;
  color: #fff;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  position: relative;
  transition: transform ease-in 0.1s, box-shadow ease-in 0.25s;

}
.bubbly-buttons:focus {
  outline: 0;
}
.bubbly-buttons:before, .bubbly-button:after {
  position: absolute;
  content: '';
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}
.bubbly-buttons:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 20%, #ff0081 20%, transparent 30%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%, 10% 10%, 18% 18%;
}
.bubbly-buttons:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}
.bubbly-buttons:active {
  transform: scale(0.9);
  background-color: #e60074;
  box-shadow: 0 2px 25px rgba(255, 0, 130, 0.2);
}
.bubbly-buttons.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}
.bubbly-buttons.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}

@keyframes topBubbles {
  0% {
    background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%, 40% 90%, 55% 90%, 70% 90%;
  }
  50% {
    background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%, 50% 50%, 65% 20%, 90% 30%;
  }
  100% {
    background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%, 50% 40%, 65% 10%, 90% 20%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
@keyframes bottomBubbles {
  0% {
    background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%, 70% -10%, 70% 0%;
  }
  50% {
    background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%, 105% 0%;
  }
  100% {
    background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%, 110% 10%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
</style>

</head>
<body>

   <form method="post" action="${contextPath }/order/order.do"
      name="frm_order">

      <div class="site-section">
         <div class="container">



<%--             <div class="row mb-5">
               <div class="col-md-12">
                  <div class="border p-4 rounded" role="alert">
                     <strong>${memberInfo.member_name }</strong>���� <strong>${memberInfo.member_rank }</strong>ȸ��
                     �̽ʴϴ�.<br> ���������� :<strong><fmt:formatNumber
                           value="${memberInfo.member_saving }" type="number"
                           var="member_saving" />${member_saving}</strong>�� <br> ����Ʈ :<strong><fmt:formatNumber
                           value="${memberInfo.member_point }" type="number"
                           var="member_point" />${member_point}</strong>P<br> ���� :
                     ${total_coupons}��
                  </div>
               </div>
            </div> --%>
            
            
            
            
<!--             <div class="row mb-5"> -->
<!--                   <div class="col-md-12"> -->
<!--                      <div class=" p-4 rounded" role="alert"> -->
                        
<%--                         <strong id="s">${memberInfo.member_name }</strong>���� <strong id="s">${memberInfo.member_rank }</strong>ȸ�� �̽ʴϴ�.<br> --%>
<%--                         ���������� : <strong id="s"><fmt:formatNumber value="${memberInfo.member_saving }" type="number" var="member_saving"/>${member_saving}</strong>��  <br>   --%>
<%--                         ����Ʈ : <strong id="s"><fmt:formatNumber value="${memberInfo.member_point }" type="number" var="member_point"/>${member_point}P</strong><Br>  --%>
<%--                         ���� : <strong id="s">${total_coupons}</strong>�� --%>
                        
                        
<!--                      </div> -->
<!--                   </div> -->
<!--                </div> -->
               
            <table style="margin-bottom: 50px !important; width: 100%; border: 1px solid darkgray;" >
               <tr>
                  <th rowspan="4" style="border-right: 1px solid darkgray; text-align : center; width: 100px;">ȸ�� ����</th>                     
               </tr>
               <tr style="border-bottom: 1px solid darkgray; border-top : 1px solid darkgray;">
                  <th>&nbsp;&nbsp;&nbsp;<strong id="s">${memberInfo.member_name }</strong>���� <strong id="s">${memberInfo.member_rank }</strong>ȸ�� �̽ʴϴ�.<br>
                  &nbsp;&nbsp;&nbsp;���������� : <strong id="s"><fmt:formatNumber value="${memberInfo.member_saving }" type="number" var="member_saving"/>${member_saving}</strong>�� </th>  
                  </tr>
                  <tr style="border-bottom : 1px solid darkgray;">
                  <th>&nbsp;&nbsp;&nbsp;����Ʈ : <strong id="s"><fmt:formatNumber value="${memberInfo.member_point }" type="number" var="member_point"/>${member_point}P</strong><br>
                  &nbsp;&nbsp;&nbsp;���� : <strong id="s">${total_coupons}</strong>��</th>
               </tr>
                  
            </table>
            
         







         <table border="1" class="orderinfo">
         <thead>
            <tr style="text-align: center;">
               <th width="150px;">�̹���</th>
               <th width="180px;">��ǰ�� </th>
               <th width="100px">��ǰ����</th>
               <th width="100px;">�ǸŰ�</th>
               <th width="60px;">����</th>
               <th width="100px;">��������Ʈ</th>
               <th width="100px;">��۱���</th>
               <th width="50px;">��ۺ�</th>
               <th width="100px;">�հ�</th>
            </tr>
         </thead>
         <tbody>
         
         <c:choose>
            <c:when test="${orderList ==null }">
               <h1><strong>�ֹ��� ��ǰ�� �����ϴ�.</strong></h1>
            </c:when>
            <c:when test="${orderList !=null }">
         <c:forEach items="${orderList }" var="cart">
         <c:set var="pro_saving" value="${cart.cart_pro_price * cart.cart_pro_quantity * 0.01 }"  />
         <fmt:formatNumber value="${pro_saving}" type="number" var="pro_saving2"/>
         <fmt:formatNumber value="${cart.cart_pro_price}" type="number" var="pro_price"/>
            <tr>
               <th><a href="${contextPath}/product/productdetail.do?pro_code=${cart.cart_pro_code}">
               <img width="70px" height="105px" src="${contextPath}/thumbnails.do?pro_code=${cart.cart_pro_code}&fileName=${cart.pro_imagefilename}"></a></th>
               <td><a href="${contextPath}/product/productdetail.do?pro_code=${cart.cart_pro_code}">${cart.pro_name}</a></td>
               <td><strong>${cart.cart_pro_size }<br>${cart.cart_pro_color}</strong></td>
               <td>${pro_price}��</td>
               <td>${cart.cart_pro_quantity}��</td>
               <td>${pro_saving2}P</td>
               <td>[�⺻ ���]</td>
               <td>����</td>
               <td><strong><fmt:formatNumber value="${cart.cart_pro_price * cart.cart_pro_quantity  }" pattern="#,###" />��</strong></th> 
            </tr>
            <c:set var="final_total_order_price" value="${final_total_order_price+cart.cart_pro_price* cart.cart_pro_quantity }" />
            <c:set var="final_total_order_quantity" value="${final_total_order_quantity+cart.cart_pro_quantity }" />
             <c:set var="final_total_pro_saving" value="${final_total_pro_saving + pro_saving }"/> 
             
             <input type="hidden" name="${cart.cart_pro_detail_code}" value="${cart.cart_pro_detail_code} " />
             <input type="hidden" name="${cart.cart_pro_detail_code}size" value="${cart.cart_pro_size}" />
             <input type="hidden" name="${cart.cart_pro_detail_code}color"  value="${cart.cart_pro_color}"/>
              <input type="hidden" name="${cart.cart_pro_detail_code}price" value="${cart.cart_pro_price}" /> 
             <input type="hidden" name="${cart.cart_pro_detail_code}quantity" value="${cart.cart_pro_quantity}" />
             <input type="hidden" name="${cart.cart_pro_detail_code}saving" value="${pro_saving}" />
             <input type="hidden" name="${cart.cart_pro_detail_code}total" value="${cart.cart_pro_price *cart.cart_pro_quantity}" /> 
         </c:forEach>
         </c:when>
         </c:choose>
         </tbody>
      </table>
      
      <input type="hidden" name="delivery_how" value="�Ϲݹ��" />
      <input type="hidden" name="delivery_status" value="�����" />
      <input type="hidden" name="order_pro_quantity" value="${final_total_order_quantity }" />
      <input type="hidden" name="order_saving" value="${final_total_pro_saving }" />

            <div class="row">

               <!--11111111111111111111111111-->

               <div class="col-md-12 mb-5 mb-md-0">
               <Br><br>
                  <h2 class="h3 mb-3 text-black">�ֹ���</h2>
                  <div style="border: 1px solid darkgray;" class="p-3 p-lg-5">



                     <!--�̸�-->
                     <div class="form-group row">
                        <div class="col-md-12">
                           <label for="c_companyname" class="text-black">�ֹ��Ͻôº� 
                           <span style="color: red;">*</span></label> 
                           <input type="text" class="form-control" value="${memberInfo.member_name }" id="member_name" />
                        </div>
                     </div>

                     <!--�ּ�-->
                     <div class="form-group row">
                        <div class="col-md-8">
                           <label for="c_address" class="text-black">�ּ� <span
                              class="text-danger">*</span></label> <input type="text"
                              class="form-control" id="postaddr" placeholder="�����ȣ"
                              value="${memberInfo.member_addr1 }">
                        </div>

                        <div class="col-md-4">
                           <label for="c_address" class="text-black"><br></label> <input
                              type="button" class="form-control" id="c_address"
                              name="c_address" onclick="find_addr()" value="�ּ�ã��">
                        </div>
                     </div>

                     <div class="form-group">
                        <input type="text" class="form-control" id="loadaddr"
                           placeholder="�ּ�" value="${memberInfo.member_addr2 }">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" id="jiaddr"
                           placeholder="��" value="${memberInfo.member_addr3 }">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" id="detailaddr"
                           placeholder="�������ּ�" value="${memberInfo.member_addr4 }">
                     </div>


                     <!--��ȭ��ȣ-->
                     <div class="form-group row">
                        <div class="col-md-4">
                           <label for="c_state_country" class="text-black">�޴���ȭ <span
                              class="text-danger">*</span></label> <input type="text"
                              class="form-control" id="member_cp1" name="c_state_country"
                              value="${memberInfo.member_cp1 }">
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" maxlength="4"
                              id="member_cp2" value="${memberInfo.member_cp2 }"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" maxlength="4"
                              id="member_cp3" value="${memberInfo.member_cp3 }"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                     </div>

                  </div>
               </div>

               <Br><Br><Br>

               <!--22222222222222222222222222222-->

               <div class="col-md-12 mb-5 mb-md-0">
                  <Br><Br><Br><Br><Br>
                  <h2 class="h3 mb-3 text-black">�����</h2>
                  <div style="border: 1px solid darkgray;" class="p-3 p-lg-5 ">


                     <input type="radio" value="same" id="delivery_choice"
                        name="delivery_choice" chekced />�ֹ��� ������ ���� <input type="radio"
                        value="different" id="delivery_choice2" name="delivery_choice" />���ο�
                     �����
                     <!--�̸�-->
                     <div class="form-group row">
                        <div class="col-md-12">
                           <label for="c_companyname" class="text-black">�����ôº� </label> <input
                              type="text" class="form-control" name="receiver" id="receiver">
                        </div>
                     </div>


                     <!--�ּ�-->

                     <div class="form-group row">
                        <div class="col-md-8">
                           <label for="c_address" class="text-black">�ּ� <span
                              class="text-danger">*</span></label> <input type="text"
                              class="form-control" name="delivery_addr1" id="postaddr2"
                              placeholder="�����ȣ">
                        </div>

                        <div class="col-md-4">
                           <label for="c_address" class="text-black"><br></label> <input
                              type="button" class="form-control" name="c_address"
                              onclick="find_addr2()" value="�ּ�ã��">
                        </div>
                     </div>

                     <div class="form-group">
                        <input type="text" class="form-control" name="delivery_addr2"
                           id="loadaddr2" placeholder="�ּ�">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" name="delivery_addr3"
                           id="jiaddr2" placeholder="��">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" name="delivery_addr4"
                           id="detailaddr2" placeholder="�������ּ�">
                     </div>

                     <!--��ȭ��ȣ-->
                     <div class="form-group row">
                        <div class="col-md-4">
                           <label for="c_state_country" class="text-black">��ȭ��ȣ </label> <input type="text"
                              class="form-control" id="c_state_country" name="receiver_tel1">
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" id="c_postal_zip"
                              name="receiver_tel2" size="4" maxlength="4"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" id="c_postal_zip"
                              name="receiver_tel3" size="4" maxlength="4"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                     </div>

                     <!--�޴��ȣ-->
                     <div class="form-group row">
                        <div class="col-md-4">
                           <label for="c_state_country" class="text-black">�޴���ȭ <span
                              class="text-danger">*</span></label> <input type="text"
                              class="form-control" name="receiver_hp1" id="receiver_hp1">
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" name="receiver_hp2"
                              size="4" maxlength="4" id="receiver_hp2"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" name="receiver_hp3"
                              size="4" maxlength="4" id="receiver_hp3"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                     </div>




                     <div class="form-group">
                        <label for="c_diff_country" class="text-black">��۸޽��� <span
                           class="text-danger">*</span></label> <select id="request_to_delivery"
                           class="form-control">
                           <option value="���� �ۼ�">���� �ۼ�</option>
                           <option value="����� ���տ� ���ּ���" selected>����� ���տ� ���ּ���</option>
                           <option value="���տ� �ΰ��ּ���(�����Կ� �־��ּŵ� �ǿ�)" selected>���տ� �ΰ��ּ���(�����Կ� �־��ּŵ� �ǿ�)</option>
                           <option value="����� ���ǿ� �ð��ּ���">����� ���ǿ� �ð��ּ���</option>
                           <option value="�����ϱ����� ��ȭ�� ���ڸ� �����ּ���">�����ϱ����� ��ȭ�� ���ڸ� �����ּ���</option>
                           <option value="����� �̸� ���� ��Ź�帳�ϴ�">����� �̸� ���� ��Ź�帳�ϴ�</option>
                           <option value="���տ� �ΰ� �����ּ���">���տ� �ΰ� �����ּ���</option>
                           <option value="���տ� �ΰ� ��ȭ�ּ���">���տ� �ΰ� ��ȭ�ּ���</option>
                           <option value="�ù��Կ� ���ּ���">�ù��Կ� ���ּ���</option>
                           <option value="������ �����̴� ������ �ٷ��ּ���">������ �����̴� ������ �ٷ��ּ���</option>
                           
                           
                           
                        </select>
                     </div>



                     <div class="form-group">
                        <label for="c_order_notes" class="text-black">�ù� �޼���</label>
                        <textarea name="c_order_notes" cols="30" rows="5"
                           class="form-control" placeholder="�ù���Ե��� ���ô� �����Դϴ�."
                           id="request_to_delivery_text" onchange="text()" disabled></textarea>
                     </div>

                  <input type="hidden" id="duplicate_textarea" name="request_to_delivery" value="���տ� �ΰ��ּ���(�����Կ� �־��ּŵ� �ǿ�)" />

                  </div>

</div>
</div>











            <div class="row mb-5">
               <div class="col-md-12">
                  <br><br>
                     <h2 class="h3 mb-3 text-black">Your Order</h2>
                        <div style="border: 1px solid darkgray;" class="p-3 p-lg-5 border">
                           <table class="table site-block-order-table mb-5">
   
                              <tbody>
                                 <tr>
                                    <td class="text-black font-weight-bold"><strong>���ֹ��ݾ�</strong></td>

                                    <td><label  id="final_total_order_price">${final_total_order_price }</label>��</td>
                                 </tr>

                                 <tr>
                                    <td class="text-black font-weight-bold"><strong>�����αݾ�</strong></td>

                                    <td><label  id="total_discount"></label>��</td>
                                 </tr>

                                 <tr>
                                    <td>�� �������� �ݾ�</td>
                                    <td><label  id="final_total_pay_price"></label>��</td>
                                 </tr>
									<c:set var="final_total_order_price" value="${final_total_order_price }" />
                                 <tr>
                                    <td class="text-black font-weight-bold"><strong>������</strong></td>

                                    <td ><input type="text" id="member_saving" placeholder="����Ͻ� ������ �Է�" />
            ��(�� ��밡�� ������:<strong><fmt:formatNumber value="${memberInfo.member_saving }" type="number" var="member_saving"/>${member_saving}��</strong>)</td>
                                 </tr>

                                 <tr>
                                    <td>����Ʈ</td>
                                    <td><input type="text"  id="member_point"  placeholder="����Ͻ� ����Ʈ�� �Է�"  />
            ��(�� ��밡�� ����Ʈ:<strong><fmt:formatNumber value="${memberInfo.member_point }" type="number" var="member_point"/>${member_point}P</strong>)</td>
                                 </tr>


<!-- <button class="bubbly-buttons" onclick="apply_discount()" ></button>
 -->                                 
                              </tbody>                           
                              
                           </table>
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           <!-- �����ü��־� -->
                           <center>
                            <button type="button" class="bubbly-buttons"  onclick="apply_discount()">���� �����ϱ�   </button> 
                           </center>
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
<input type="hidden" id="order_discount" name="order_discount" />
            <input type="hidden" id="discount_point" name="discount_point" />
            <input type="hidden" id="discount_saving" name="discount_saving" />
            <input type="hidden" id="order_price" name="order_price" />
                     


            


                     

                     
                        </div>
                     </div>
                  </div>

















                  <!-- 33333333333333333 -->



                  <div class="col-md-12 mb-5 mb-md-0">
                     <Br>
                     <Br>
                     <Br>
                     <Br>
                     <Br>
                     <h2 class="h3 mb-3 text-black">�����</h2>
                     <div style="border: 1px solid darkgray;" class="p-3 p-lg-5 ">






                        <input type="radio" value="�������Ա�" name="how_pay" id="how_pay1"
                           checked />������ �Ա� <input type="radio" value="ī�����"
                           name="how_pay" id="how_pay2" />ī�����














                        <!--�ּ�-->

                        <div class="form-group row">
                           <div class="col-md-6">
                              <label  class="text-black">���� ���� �ݾ�</label>
                                <label class="form-control"
                                 id="final_total_pay_price2">��</label>
                                 
                           </div>

                           <div class="col-md-6">
                              <label class="text-black">�� ���������ݾ�</label>

                              <p class="form-control">${final_total_pro_saving }��</p>
                           </div>
                        </div>

                  





                        <div class="form-group row">
                           <br>
                           <div class="col-md-12">
                              <input type="checkbox" name="agree_to_pay">����������
                              Ȯ���Ͽ�����, �������࿡ �����մϴ�.
                           </div>
                        </div>

                        


<br>

                        <div id="div_how_pay1" class="form-group">
                           <label  class="text-black">�Ա�����
                            <span
                              class="text-danger">*</span></label> 
                              <select 
                              class="form-control" name="which_bank">
                              <option value="���� �ۼ�">���� �ۼ�</option>
                              <option value="" selected>:::������ �ּ���:::</option>
                              <option value="�������">�������:02-987454-54-658-������</option>
                              <option value="��������">��������:65-654846-34-654-������</option>
                              <option value="��������">��������:68-686543-65-654-������</option>
                           </select>
                           
                           
                           <br>
                           <div class="form-group row">
                              <div class="col-md-12">
                              <label class="text-black">�Ա��ڸ� </label>
                               <input
                              type="text" class="form-control" name="who_pay" >
                              </div>
                           </div>
                           
                           
                           
                        </div>










<br>
                           <div id="div_how_pay2" class="form-group">
                           <label  class="text-black">ī��ȸ�� <span
                              class="text-danger">*</span></label>
                               <select 
                              class="form-control" name="company_name_of_card">
                              <option value="" selected>:::������ �ּ���:::</option>
            <option value="����ī��">����ī��</option>
            <option value="BCī��">BCī��</option>
            <option value="����ī��">����ī��</option>
            <option value="����ī��">����ī��</option>
            <option value="�Ｚī��">�Ｚī��</option>
            <option value="�츮ī��">�츮ī��</option>
            <option value="�ϳ�ī��">�ϳ�ī��</option>
                           </select>
                           ī���ָ� <input type="text" name="who_pay" />
                        </div>




<input type="radio" value="�Ͻú�" name="card_split" checked/>�Ͻú�
         <input type="radio" value="3����" name="card_split"  />3����
         <input type="radio" value="6����" name="card_split"  />6����
         <input type="radio" value="9����" name="card_split"  />9����
         <input type="radio" value="12����" name="card_split"  />12����
            







<center>
                            <button type="button" class="bubbly-buttons"  onclick="order(this.form)">�����ϱ�   </button> 
                           </center>




                     





                     </div>







   </form>

</div>
</div>
</div>

</body>
 <script>
   var animateButton = function(e) {

      e.preventDefault;
      //reset animation
      e.target.classList.remove('animate');

      e.target.classList.add('animate');
      setTimeout(function() {
         e.target.classList.remove('animate');
      }, 700);
   };

   var bubblyButtons = document.getElementsByClassName("bubbly-buttons");

   for (var i = 0; i < bubblyButtons.length; i++) {
      bubblyButtons[i].addEventListener('click', animateButton, false);
   }
</script> 
</html>