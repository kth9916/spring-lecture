<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${viewMap.member }" />
<c:set var="totalCoupons" value="${viewMap.totalCoupons }" />
<c:set var="averageOrder" value="${viewMap.averageOrder }" />
<c:set var="onDelivery" value="${viewMap.onDelivery }" />
<c:set var="onCart" value="${viewMap.onCart }" />
<c:set var="onRefund" value="${viewMap.onRefund }" />
<c:set var="cartList" value="${viewMap.cartList }" />
<c:set var="orderList" value="${viewMap.orderList }" />
<c:set var="refundList" value="${viewMap.refundList }" />
<style>
@media (min-width: 767.98px) {
  .card {
  	margin-left: 300px;
  	margin-right: 50px;
  }
</style>
<style>
.infotable { 
    border-top: 1px solid #ccc; 
    border-collapse: collapse; 
    border-spacing : 1px; 
    line-height : 1.5; 
    padding : 0 0 0 50px; 
} 
.infotable td { 
    width: 150px; 
    padding : 5px; 
    font-weight: bold; 
    vertical-align: top; 
    border-bottom: 1px solid #ccc; 
    border-top : 1px solid #ccc; 
    border-left : 1px solid #ccc;
    border-right : 1px solid #ccc;
    text-align: center; 
} 

#chartContainer { 
/*     padding : 0 0 0 30px;  */
}

a#linkline { 
    text-decoration: none; 
    color: #FE2E2E; 
}
a:hover {
   color : #FE2E2E;
}
</style>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ����</title>
<script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
    <!-- Charts js Files -->
    <script src="${contextPath}/resources/admin/assets/libs/flot/excanvas.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.time.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="${contextPath}/resources/admin/dist/js/pages/chart/chart-page-init.js"></script>

<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script>

window.onload = function () {

var options = {
   exportEnabled: true,
   animationEnabled: true,
   title:{
      text: "${member.member_name} �� ����Ʈ �̿���Ȳ"
   },
   subtitles: [{
      text: ""
   }],
   
   axisY: {
      title: "�湮��",
      titleFontColor: "#4F81BC",
      lineColor: "#4F81BC",
      labelFontColor: "#4F81BC",
      tickColor: "#4F81BC",
      includeZero: false
   },
   axisY2: {
      title: "��� �ֹ�����",
      titleFontColor: "#C0504E",
      lineColor: "#C0504E",
      labelFontColor: "#C0504E",
      tickColor: "#C0504E",
      includeZero: false
   },
   toolTip: {
      shared: true
   },
   legend: {
      cursor: "pointer",
      itemclick: toggleDataSeries
   },
   data: [{
      type: "spline",
      name: "�湮��",
      showInLegend: true,
      xValueFormatString: "MMM YYYY",
      yValueFormatString: "#,##0 ȸ",
      dataPoints: [
         { x: new Date(2019, 0, 1),  y: 5 },
         { x: new Date(2019, 1, 1), y: 8 },
         { x: new Date(2019, 2, 1), y: 3 },
         { x: new Date(2019, 3, 1),  y: 1 },
         { x: new Date(2019, 4, 1),  y: 5 },
         { x: new Date(2019, 5, 1),  y: 7 },
         { x: new Date(2019, 6, 1), y: 2 },
         { x: new Date(2019, 7, 1), y: 8 },
         { x: new Date(2019, 8, 1),  y: 14 },
         { x: new Date(2019, 9, 1),  y: 2 },
         { x: new Date(2019, 10, 1),  y: ${member.member_total_login} },
         { x: new Date(2019, 11, 1), y:  0 }
      ]
   },
   {
      type: "spline",
      name: "��� �ֹ�����",
      axisYType: "secondary",
      showInLegend: true,
      xValueFormatString: "MMM YYYY",
      yValueFormatString: "#,##0.#��",
      dataPoints: [
         { x: new Date(2019, 0, 1),  y: 390340.5 },
         { x: new Date(2019, 1, 1), y: 200150 },
         { x: new Date(2019, 2, 1), y: 473420 },
         { x: new Date(2019, 3, 1),  y: 50000 },
         { x: new Date(2019, 4, 1),  y: 302340 },
         { x: new Date(2019, 5, 1),  y: 290340 },
         { x: new Date(2019, 6, 1), y: 604870 },
         { x: new Date(2019, 7, 1), y: 825230 },
         { x: new Date(2019, 8, 1),  y: 1000000 },
         { x: new Date(2019, 9, 1),  y: 2000000 },
         { x: new Date(2019, 10, 1),  y: ${averageOrder} },
         { x: new Date(2019, 11, 1), y: 0 }
      ]
   }]
};
$("#chartContainer").CanvasJSChart(options);

function toggleDataSeries(e) {
   if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
      e.dataSeries.visible = false;
   } else {
      e.dataSeries.visible = true;
   }
   e.chart.render();
}

}
</script>
<script>


</script>

</head>
<body>

 <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                           
                           
                           
                            
                            <div class="comment-widgets scrollable">
                            <br><br>
                            <center>
                            <h2>ȸ�� ���</h2>
                            <hr>
   <form id="frm_search" action="${contextPath }/admin/member/searchMember.do" method="post">
      <table>
         <tr id="search">
            <td>ȸ��</td>
            <td colspan="5"><input type="text" placeholder="�̸�,���̵�" width="150" name="memberSearch"/></td>
            <td><input type="button" onClick="document.getElementById('frm_search').submit();" value="�˻�" /></td>
         </tr>
      </table>
   
   </form>
   </center>
   <br><br>
   
   <center>
   <table border="1" class="infotable">
   
   <tr>
      <td colspan="6">Ȱ�� ����</td>
   </tr>
   <tr>
      <td>�̸�</td>
      <td>${member.member_name }</td>
      <td>���̵�</td>
      <td>${member.member_id }</td>
      <td>������</td>
      <td><a href="#"><fmt:formatNumber value="${member.member_saving}" pattern="#,###" /></a>��</td>
      
   </tr>
   
   <tr>
   <td>����Ʈ</td>
      <td><a href="#"><fmt:formatNumber value="${member.member_point}" pattern="#,###" /></a>P</td>
      <td>�ֱ� �α���</td>
      <td>${member.member_lately_date}</td>
      <td>����</td>
      <td><a href="#">${totalCoupons}</a>��</td>
      
   </tr>
   
   <tr>
      <td>�湮��</td>
      <td><fmt:formatNumber value="${member.member_total_login}" pattern="#,###" />ȸ</td>
      <td>���� ���ž�</td>
      <td><fmt:formatNumber value="${member.member_total_buy}" pattern="#,###" />��</td>
      <td>���� �ֹ���</td>
      <td><a href="#"><fmt:formatNumber value="${member.member_total_order}" pattern="#,###" /></a>ȸ 
      (���:<fmt:formatNumber value="${averageOrder}" pattern="#,###" />��)</td>
   </tr>
   </table>
   </center>
   <br><br>
   
   <center>
   <div id="chartContainer" style="height: 370px; width: 50%;"></div>
   </center>
   
   <br>
   <hr>
   <center>
   <table>   <caption><Strong>�� ������</Strong></caption>
      
      <tr>
         <td colspan="2">������� ��ǰ</td>
         <td>
         <a href="${contextPath }/admin/order/listOrders.do">${onDelivery}
         <c:if test="${onDelivery ==null }">0</c:if>
         </a>��</td>
      </tr>
      <tr>
         <td colspan="2">��ǰ������� ��ǰ</td>
         <td>
         <a href="${contextPath }/admin/member/viewMember.do?member_code=${member.member_code}">${onRefund}
         <c:if test="${onRefund ==null }">0</c:if>
         </a>��</td>
      </tr>
      <tr>
         <td colspan="2">��ٱ��Ͽ� ���� ��ǰ</td>
         <td><a href="${contextPath }/admin/member/viewMember.do?member_code=${member.member_code}">${onCart}
         <c:if test="${onCart ==null }">0</c:if>
         </a>��</td>
      </tr>
      <tr>
         <td colspan="2">���԰�˸��� ��û�� ��ǰ</td>
         <td><a href="#">0</a> ��</td>
      </tr>
   </table>
   <br><br><br>
      <!--��� ���� ��ǰ  -->
      <c:choose>
         <c:when test="${orderList !=null }">
            <table>
               <tr>
                  <td colspan="8"><strong>������� ��ǰ</strong></td>
               </tr>
               <tr style="text-align: center;">
                  <td width="100px">�̹���</td>
                  <td width="100px">��ǰ��</td>
                  <td width="100px">��ǰ ����</td>
                  <td width="100px">�ֹ���</td>
                  <td width="100px">�ֹ� ����</td>
                  <td width="100px">���� ����</td>
                  <td width="100px">���� ����</td>         
                  <td width="100px">��� ����</td>
               </tr>
               
               <c:forEach var="order" items="${orderList }">
                  <tr style="text-align: center;">
                  <td width="100px;"><a href="${contextPath}/product/productdetail.do?pro_code=${order.pro_code}">
               <img width="70px" height="105px" 
               src="${contextPath}/thumbnails.do?pro_code=${order.pro_code}&fileName=${order.pro_imagefilename}"></a></td>
                  <td>${order.pro_name }</td>
                  <td>${order.pro_color} /  ${order.pro_size }</td>
                  <td>${order.order_member_name }</td>
                  <td><fmt:formatNumber value="${order.order_price}" pattern="#,###"/>��</td>
                  <td>${order.how_pay }</td>
                  <td>${order.date_pay }</td>
                  <td>${order.delivery_status}</td>
                  </tr>
               <c:set var="final_total_price" value="${final_total_price+order.order_price }" />
               </c:forEach>
                  <tr>
                     <td colspan="8" align="right"><strong>������� ��ǰ �� �ֹ� ���� : 
                     <fmt:formatNumber  value="${final_total_price}" pattern="#,###" /></strong> </td>
                  </tr>
            </table>
         </c:when>
         <c:otherwise>
         <h3>������� ��ǰ�� �����ϴ�.</h3>
         </c:otherwise>
         </c:choose>
            <!-- ��ǰ������� ��ǰ  -->
      <c:choose>
         <c:when test="${refundList !=null }">
            <table>
               <tr>
                  <td colspan="8"><strong>��ǰ������� ��ǰ</strong></td>
               </tr>
               <tr style="text-align: center;">
                  <td width="100px">�̹���</td>
                  <td width="100px">��ǰ��</td>
                  <td width="100px">��ǰ ����</td>
                  <td width="100px">�ֹ���</td>
                  <td width="100px">�ֹ� ����</td>
                  <td width="100px">���� ����</td>
                  <td width="100px">���� ����</td>         
                  <td width="100px">��� ����</td>
               </tr>
               
               <c:forEach var="refund" items="${refundList }">
                  <tr style="text-align: center;">
                  <td width="100px;"><a href="${contextPath}/product/productdetail.do?pro_code=${refund.pro_code}">
               <img width="70px" height="105px" 
               src="${contextPath}/thumbnails.do?pro_code=${refund.pro_code}&fileName=${refund.pro_imagefilename}"></a></td>
                  <td>${refund.pro_name }</td>
                  <td>${refund.pro_color} /  ${refund.pro_size }</td>
                  <td>${refund.order_member_name }</td>
                  <td><fmt:formatNumber value="${refund.order_price}" pattern="#,###"/>��</td>
                  <td>${refund.how_pay }</td>
                  <td>${refund.date_pay }</td>
                  <td>${refund.delivery_status}</td>
                  </tr>
               <c:set var="final_total_refund_price" value="${final_total_refund_price+refund.order_price }" />
               </c:forEach>
                  <tr>
                     <td colspan="8" align="right"><strong>��ǰ������� ��ǰ �� �ֹ� ���� : 
                     <fmt:formatNumber  value="${final_total_refund_price}" pattern="#,###" /></strong> </td>
                  </tr>
            </table>
         </c:when>
         <c:otherwise>
         <h3>��ǰ ��� ���� ��ǰ�� �����ϴ�.</h3>
         </c:otherwise>
      </c:choose>
      
      <!--��ٱ��Ͽ� ���� ��ǰ -->
      <c:choose>
         <c:when test="${cartList !=null }">
            <table>
               <tr>
                  <td colspan="6"><strong>��ٱ��Ͽ� ���� ��ǰ</strong></td>
               </tr>
            <tr style="text-align:center;">
               <th width="100px;">�̹���</th>
               <th width="100px;">��ǰ�� </th>
               <th width="100px;">��ǰ ����</th>
               <th width="100px;">�ǸŰ�</th>
               <th width="100px;">����</th>
               <th width="100px;">�հ�</th>
            </tr>
            <c:forEach var="cart" items="${cartList }">
               <tr style="text-align: center;">
                  <td width="100px;"><a href="${contextPath}/product/productdetail.do?pro_code=${cart.cart_pro_code}">
               <img width="70px" height="105px" 
               src="${contextPath}/thumbnails.do?pro_code=${cart.cart_pro_code}&fileName=${cart.pro_imagefilename}"></a></td>
               <td width="100px;" >${cart.pro_name }</td>
               <td width="100px">${cart.cart_pro_size } / ${cart.cart_pro_color } </td>
               <td width="100px"><fmt:formatNumber value="${cart.cart_pro_price}" pattern="#,###" />��</td>
               <td width="100px;">${cart.cart_pro_quantity}</td>
               <td width="100px;"><fmt:formatNumber value="${cart.cart_pro_price *cart.cart_pro_quantity}" pattern="#,###" />��</td>
               </tr>
            
            </c:forEach>
            </table>
         </c:when>
         <c:otherwise>
         <h3>��ٱ��Ͽ� ��� ��ǰ�̾����ϴ�.</h3>
         </c:otherwise>
      
      
      </c:choose>
      
      
   </center>

</div>
</div>
</div>
</div>
</div>


</body>
</html>