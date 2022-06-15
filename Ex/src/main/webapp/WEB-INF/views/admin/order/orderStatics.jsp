<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="totalAvenue" value="${viewMap.totalAvenue }" />
<c:set var="totalOrderCount" value="${viewMap.totalOrderCount }" />

		
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		
		<title>Annual Sales - 2015</title>
		
	
		
	<!-- 	<style>
			body {
				background-color: #fafafa;
				font-size: 16px;
				line-height: 1.5;
			}
			
			h1,h2,h3,h4,h5,h6 {
				font-weight: 400;	
			}
			
			#header {
				border-bottom: 5px solid #37474F;
				color: #37474F;
				margin-bottom: 1.5rem;
				padding: 1rem 0;
			}
			
			#revenue-tag {
				font-weight: inherit !important;
				border-radius: 0px !important;
			}
			
			.card {
				border: 0rem;
				border-radius: 0rem;
			}
			
			.card-header {
				background-color: #37474F;
				border-radius: 0 !important;
				color:	white;
				margin-bottom: 0;
				padding:	1rem;
			}
			
			.card-block {
				border: 1px solid #cccccc;	
			}
			
			.shadow {
				box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.14),
										0 1px 18px 0 rgba(0, 0, 0, 0.12),
										0 3px 5px -1px rgba(0, 0, 0, 0.2);
			}
			
			#revenue-column-chart, #products-revenue-pie-chart, #orders-spline-chart {
				height: 300px;
				width: 100%;
			}			
		</style> -->
		
		<!-- Scripts -->
		<script src="${contextPath}/resources/admin/order/css/jquery/jquery-3.1.0.min.js"></script>
		<script src="${contextPath}/resources/admin/order/css/tether/tether.min.js"></script>
		<script src="${contextPath}/resources/admin/order/css/bootstrap/bootstrap4-alpha3.min.js"></script>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script>

   $(document).ready(function(){
      
   
    $("#select_order").change(function(){
         if($(this).val() =="member_code"){//�����ڵ��� ���
            location.href="${contextPath}/admin/member/listMembers.do?action=member_code";
         } 
         else if($(this).val()=="member_name"){//�̸��ϰ��
            location.href="${contextPath}/admin/member/listMembers.do?action=member_name";
         }
         else if($(this).val()=="member_point"){//����Ʈ�ϰ��
            location.href="${contextPath}/admin/member/listMembers.do?action=member_point";
         }
         else if($(this).val()=="member_rank"){//����ϰ��
            location.href="${contextPath}/admin/member/listMembers.do?action=member_rank";
         }
         else{
            location.href="${contextPath}/admin/member/listMembers.do";
         }
         
      });
   });
   
</script>
		<script>
			$(function () {
				var totalRevenue = 15341110;
				
				// CanvasJS column chart to show revenue from Jan 2015 - Dec 2015
				var revenueColumnChart = new CanvasJS.Chart("revenue-column-chart", {
					animationEnabled: true,
					backgroundColor: "transparent",
					theme: "theme2",
					axisX: {
						labelFontSize: 14,
						valueFormatString: "MMM YYYY"
					},
					axisY: {
						labelFontSize: 14,
						suffix: "��"
					},
					toolTip: {
						borderThickness: 0,
						cornerRadius: 0
					},
					data: [
						{
							type: "column",
							yValueFormatString: "###,###.##��",
							dataPoints: [
								{ x: new Date("1 Jan 2019"), y: 868800 },
								{ x: new Date("1 Feb 2019"), y: 1071550 },
								{ x: new Date("1 Mar 2019"), y: 1286200 },
								{ x: new Date("1 Apr 2019"), y: 1106900 },
								{ x: new Date("1 May 2019"), y: 1033800 },
								{ x: new Date("1 Jun 2019"), y: 1017160 },
								{ x: new Date("1 Jul 2019"), y: 1458000 },
								{ x: new Date("1 Aug 2019"), y: 1165850 },
								{ x: new Date("1 Sep 2019"), y: 1594150 },
								{ x: new Date("1 Oct 2019"), y: 1501700 },
								{ x: new Date("1 Nov 2019"), y: ${totalAvenue} },
								{ x: new Date("1 Dec 2019"), y: 0 }
							]
						}
					]
				});
				
				revenueColumnChart.render();
				
				//CanvasJS pie chart to show product wise annual revenue for 2015
				var productsRevenuePieChart = new CanvasJS.Chart("products-revenue-pie-chart", {
					animationEnabled: true,
					theme: "theme2",
					legend: {
						fontSize: 14
					},
					toolTip: {
						borderThickness: 0,
						content: "<span style='\"'color: {color};'\"'>{name}</span>: ${y} (#percent%)",
						cornerRadius: 0
					},
					data: [
						{       
							indexLabelFontColor: "#676464",
							indexLabelFontSize: 14,
							legendMarkerType: "square",
							legendText: "{indexLabel}",
							showInLegend: true,
							startAngle:  90,
							type: "pie",
							dataPoints: [
								{  y: 6289855, name:"��Ʈ", indexLabel: "��Ʈ - 34%", legendText: "��Ʈ", exploded: true },
								{  y: 2761400, name:"����", indexLabel: "���� - 8%", legendText: "����" },
								{  y: 3681866, name:"����", indexLabel: "���� - 10%", legendText: "����", color: "#8064a1" },
								{  y: 2607989, name:"��Ʈ", indexLabel: "��Ʈ - 6%", legendText: "��Ʈ" },
								{  y: 2607989, name:"����", indexLabel: "���� - 10%", legendText: "����" },
								{  y: 2607989, name:"�ƿ���", indexLabel: "�ƿ��� - 5%", legendText: "�ƿ���" },
								{  y: 2607989, name:"�Ź�", indexLabel: "�Ź� - 16%", legendText: "�Ź�" },
								{  y: 2607989, name:"�Ǽ��縮", indexLabel: "�Ǽ��縮 - 11%", legendText: "�Ǽ��縮" }
							]
						}
					]
				});
				
				productsRevenuePieChart.render();
				
				//CanvasJS spline chart to show orders from Jan 2015 to Dec 2015
				var ordersSplineChart = new CanvasJS.Chart("orders-spline-chart", {
					animationEnabled: true,
					backgroundColor: "transparent",
					theme: "theme2",
					toolTip: {
						borderThickness: 0,
						cornerRadius: 0
					},
					axisX: {
						labelFontSize: 14,
						maximum: new Date("31 Dec 2019"),
						valueFormatString: "MMM YYYY"
					},
					axisY: {
						gridThickness: 0,
						labelFontSize: 14,
						lineThickness: 2
					},
					data: [
						{
							type: "spline",
							dataPoints: [
								{ x: new Date("1 Jan 2019"), y: 17376 },
								{ x: new Date("1 Feb 2019"), y: 21431 },
								{ x: new Date("1 Mar 2019"), y: 25724 },
								{ x: new Date("1 Apr 2019"), y: 22138 },
								{ x: new Date("1 May 2019"), y: 20676 },
								{ x: new Date("1 Jun 2019"), y: 25429 },
								{ x: new Date("1 Jul 2019"), y: 29160 },
								{ x: new Date("1 Aug 2019"), y: 23317 },
								{ x: new Date("1 Sep 2019"), y: 31883 },
								{ x: new Date("1 Oct 2019"), y: 30034 },
								{ x: new Date("1 Nov 2019"), y: ${totalOrderCount} },
								{ x: new Date("1 Dec 2019"), y: 0 }
							]
						}
					]
				});

				ordersSplineChart.render();
				
			});
		</script>
		
	</head>
	<body>
<!-- 		<div class="container">
			
			
			<div class="row m-b-1">
				<div class="col-lg-12">
					<div class="card shadow">
						<h4 class="card-header">�� ���� ��Ȳ <span class="tag tag-success" id="revenue-tag">0��</span></h4>
						<div class="card-block">
							<div id="revenue-column-chart"></div>
						</div>
					</div>
				</div>
			</div> row

			<div class="row m-b-1">
				<div class="col-lg-6">
					<div class="card shadow">
						<h4 class="card-header">��ǰ�� �ֹ� ����</h4>
						<div class="card-block">
							<div id="products-revenue-pie-chart"></div>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="card shadow">
						<h4 class="card-header">�ֹ���</h4>
						<div class="card-block">
							<div id="orders-spline-chart"></div>
						</div>
					</div>
				</div>
				
				
			</div> row
		</div> container -->
		
		<div class="page-wrapper">
            
            <div class="container-fluid">
                
                
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                            
                                <h3 class="card-title">�� ���� ��Ȳ &nbsp;<span class="tag tag-success" id="revenue-tag"><fmt:formatNumber value="${totalAvenue}" type="number" /> ��</span></h3>
                                <br>
                               <div class="card-block">
									<div id="revenue-column-chart" style="height:400px;" ></div>
								</div>
                                
                            </div>
                        </div>
                    </div>
                </div>
               
   
             
                   <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">��ǰ�� �ֹ� ����</h3>
                     <br>
                                <div style="height: 400px;" id="products-revenue-pie-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">�ֹ���</h3>
                                <br>
                                <div style="height: 400px;" id="orders-spline-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
             
             
                  <div class="row">
                    <div class="col-12">
                        <div class="card">
                            
                               
                                <div class="chat-box scrollable" style="height:600px;">
                                    <!--chat Row -->
                                    <ul class="chat-list">
                                        <!--chat Row -->
                                        <li class="chat-item">
                                            <div class="chat-img"><img src="${contextPath}/resources/banner/banner01.png" alt="user"></div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">GOLDEN kiwi</h6>
                                                <c:choose>
                                              		<c:when test="${isLogOn == true && memberInfo !=null }">
                                                		<div class="box bg-light-info">ȯ���մϴ� <a href="#" style="color:red;">${memberInfo.member_name }</a>��!</div> 
                                                	</c:when> 
                                                </c:choose>
                                                
                                            </div>
                                            
                                            <div class="chat-time">10:56 am</div>
                                        </li>
                                        <!--chat Row -->
                                        <li class="chat-item">
                                            <div class="chat-img"><img src="${contextPath}/resources/banner/banner01.png" alt="user"></div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">GOLDEN kiwi</h6>
                                                <c:choose>
                                                <c:when test="${isLogOn == true && memberInfo !=null }">
                                                <div class="box bg-light-info">�α׾ƿ� �Ͻðھ��?
                                                <br><a href="${contextPath }/member/memberlogout.do">�α׾ƿ��ϱ�</a></div>
                                                
                                                
                                                </c:when>
                                                </c:choose>
                                            </div>
                                            <div class="chat-time">10:57 am</div>
                                        </li>
                                        <!--chat Row -->
                                     <!--    <li class="odd chat-item">
                                            <div class="chat-content">
                                                <div class="box bg-light-inverse">�̹��� ���� ������.</div>
                                                <br>
                                            </div>
                                        </li> -->
                                       
                                        
                                                   
                                        
                                        
                                         <!--chat Row -->
                                        <li class="odd chat-item">
                                            <div class="chat-content">
                                                <div class="box bg-light-inverse">Ŭ���̾�Ʈ �������� ������.</div>
                                                <br>
                                            </div>
                                            <div class="chat-time">10:59 am</div>
                                        </li>
                                        
                                        <li class="chat-item">
                                            <div class="chat-img"><img src="${contextPath}/resources/banner/banner01.png" alt="user"></div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">GOLDEN kiwi</h6>
                                               
                                                <div class="box bg-light-info"><a href="${contextPath }/main/main.do">Ŭ���̾�Ʈ ������ �ٷΰ���</a></div>
                                            <div class="chat-time">10:57 am</div>
                                        </li>
                                        <!--chat Row -->
                                    <!--     <li class="chat-item">
                                            <div class="chat-img"><img src="assets/images/users/3.jpg" alt="user"></div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">Angelina Rhodes</h6>
                                                <div class="box bg-light-info">Well we have good budget for the project</div>
                                            </div>
                                            <div class="chat-time">11:00 am</div>
                                        </li> -->
                                        <!--chat Row -->
                                    </ul>
                                </div>
                            </div>
                            
                        </div>
                    </div>
             
             
             
             
             
             
              
               
            </div>
        
        </div>
      



		
	</body>
	<script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${contextPath}/resources/admin/dist/js/jquery.ui.touch-punch-improved.js"></script>
    <script src="${contextPath}/resources/admin/dist/js/jquery-ui.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
     <!-- this page js -->
    <script src="${contextPath}/resources/admin/assets/libs/moment/min/moment.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="${contextPath}/resources/admin/dist/js/pages/calendar/cal-init.js"></script>
</html>
