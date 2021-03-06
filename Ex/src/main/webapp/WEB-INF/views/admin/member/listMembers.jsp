<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set var="membersList" value="${membersMap.membersList }" />
<c:set var="totMembers" value="${membersMap.totMembers }" />
<c:set var="allMember" value="${membersMap.allMember }" />
<c:set var="allNonMember" value="${membersMap.allNonMember }" />
<c:set var="allMen" value="${membersMap.allMen }" />
<c:set var="allWomen" value="${membersMap.allWomen }" />
<c:set var="section" value="${membersMap.section }" />
<c:set var="pageNum" value="${membersMap.pageNum }" />

<c:set var="order_lately_date" value="${membersMap.order_lately_date }" />
<c:set var="order_total_buy" value="${membersMap.order_total_buy }" />
<c:set var="order_total_order" value="${membersMap.order_total_order }" />
<c:set var="member_gender" value="${membersMap.member_gender }" />
<c:set var="keyword" value="${membersMap.keyword }" />
<c:set var="selectedMembers" value="${membersMap.selectedMembers }" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
 <style type="text/css">
 
@media (min-width: 767.98px) {
  .card {
  	margin-left: 300px;
  	margin-right: 50px;
  }
  </style>
  <style type="text/css">
	 table{
		border-spacing: 30px;
	}
	tr{
		text-align: center;
	}
	th{
	padding : 5px 20px 5px 20px;
	background-color: #1f262d;
	}
	td{
	padding : 5px 10px 5px 10px;
	word-break:keep-all;
	}
	ul{
		margin: 0px;
		padding: 0px 10px 0px 15px;
	}
	li{
		margin: 0;
		padding-right:10px;
		border: 0;
		float: left;
	}
	a{
		text-decoration:none ; 
		color:#000000;
	}
	#chartContainer{
		display: block; 
		padding: 0px;
	}
	.pleft{
	text-align: left;
	}
	.smallul{
	list-style: none;
	}
  </style>
<title>???????????? ?????????</title>
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	function member_search() {
		
		var order_lately_date=$('#order_lately_date').val();
		var order_total_buy=$('#order_total_buy').val();
		var order_total_order=$('#order_total_order').val();
		var member_gender=$('input:radio[name=member_gender]:checked').val(); 
		var keyword=$('#member_name').val();
		
		

        $('#container').load('${contextPath}/admin/member/listMembers.do' , 
       		 { order_lately_date : order_lately_date, order_total_buy : order_total_buy, order_total_order :order_total_order, 
        	member_gender : member_gender, keyword : keyword
       		 });  
		
	}

</script>
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
</head>
<body> 
	<center>
 <div class="container-fluid">
             
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                       
                       
                       
                        <div class="card">
                           
                           
                           
                            
                            <div class="comment-widgets scrollable">
                             <!--membersList  -->	
	<br><br>
<h2>?????? ??????</h2>
	<hr>
	<center>
	<div id="listOrdersByStatus">
	<ul class="smallul">
	<li>??????&nbsp;<a href="${contextPath }/admin/member/listMembers.do">${allMember+allNonMember }</a>??? |</li>
	<li>??????&nbsp;<a href="${contextPath }/admin/member/listMembers.do">${allMember }</a> ???|</li>
	<li>?????????&nbsp;<a href="${contextPath }/admin/member/listMembers.do">${allNonMember }</a>??? |</li>
	<li>????????????&nbsp;<a href="${contextPath }/admin/member/listMembers.do">${allMen }</a>??? |</li>
	<li>????????????&nbsp;<a href="${contextPath }/admin/member/listMembers.do">${allWomen }</a>??? |</li>
	</ul>
	</div>
	</center>
	<br><br>
	<form action="${contextPath }/admin/membmer/listMembers.do" method="post" id="frm_search">
		<table>
			<tr>
				<td colspan="2">?????? ??????&nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					?????? ?????? : <input type="text" name="member_name" placeholder="?????? ????????? ???????????????" id="member_name" />				
				 </td>
			</tr>
			
			
			<tr>
				<td colspan="2">???????????? ??????&nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					<input type="radio" value="all" name="member_gender" checked >??????
					<input type="radio" value="??????" name="member_gender" >??????
					<input type="radio" value="??????" name="member_gender" >??????
				 </td>
			</tr>
			
			<tr>
				<td colspan="2">?????? ??????&nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					
					<select id="order_lately_date" name="order_lately_date">
						<option value="" selected>--????????? ?????? ??????--</option>
						<option value="lately_login_desc">??????????????? ???</option>
						<option value="lately_login_asc">?????????????????? ???</option>
					</select>
					
					<select id="order_total_buy" name="order_total_buy">
						<option value="" selected>--??? ???????????? ?????? ??????--</option>
						<option value="total_buy_desc">???????????? ?????? ???</option>
						<option value="total_buy_asc">???????????? ?????? ???</option>
					</select>
					
					<select id="order_total_order" name="order_total_order">
						<option value="" selected>--??? ???????????? ?????? ??????--</option>
						<option value="total_order_desc">???????????? ?????? ???</option>
						<option value="total_order_asc">???????????? ?????? ???</option>
					</select>
					
				
				 </td>
			</tr>
			<tr>
				<td colspan="7">
					<input type="button" value="??????" onClick="member_search()" />&nbsp;&nbsp;<input type="reset" value="?????????" />
				</td>
			</tr>
		</table>
	</form>
	<hr>
	
	<form>
			
	<table align="center"  width="100%" border="1" style="border-color: #ddd #ddd #848484 #ddd;">
		
		<tr style="text-align: center; color: white;">
			<th>?????? ?????????</th>
			<th>?????? ??????</th>
			<th>?????? ??????</th>
			<th>??? ????????????</th>
			<th>??? ????????????</th>
			<th>?????? ?????????</th>
			<th>?????? ????????????</th>
		</tr>
		
		<c:choose>
			<c:when test="${membersList ==null}">   <!-- ????????? ????????? ?????????  -->
			
				<h1>????????? ????????? ????????????.</h1> 
			
			</c:when>
			<c:when test="${membersList !=null}"> <!-- ????????? ????????? ????????? -->
			
			
		<c:forEach var="member" items="${membersList }">
		
		 <tr style="text-align: center;">
		 
			<td><a href="${contextPath }/admin/member/viewMember.do?member_code=${member.member_code}" style="">${member.member_id }</a></td>
			<td><a href="${contextPath }/admin/member/viewMember.do?member_code=${member.member_code}">${member.member_name }</a></td>
			<td>${member.member_gender }</td>
			<td><fmt:formatNumber value="${member.member_total_buy }" type="number" /> ???</td>
			<td>${member.member_total_order } ???</td>
			<td>${member.member_lately_date }</td>
			<td>${member.member_cre_date }</td>
			
		</tr> 
		
		</c:forEach>
	
		</c:when>
		
		</c:choose>
	
	</table>
	<br>
	 	<c:if test="${totMembers !=null}">
		<c:choose>
			<c:when test="${selectedMembers >200 }">
			
		<c:forEach var="page" begin="1" end="20" step="1">
			<c:if test="${section >1 && page==1 }"> <!--?????????????????? 1?????? pre????????? ?????? -->
				<a href="${contextPath }/admin/member/listMembers.do?section=${section-1}&pageNum=${(section-1)*20+1}">%nbsp; pre </a>
			</c:if>
				<a href="${contextPath }/admin/member/listMembers.do?section=${section}&pageNum=${page}">${(section-1)*20+page }</a>
			<c:if test="${page==10} }"><!--??????????????? 10?????? ???????????? next????????? ??????  -->
				<a href="${contextPath }/admin/member/listMembers.do?section=${section+1}&pageNum=${section*20+1}">&nbsp; next</a>
			</c:if>	
			
		</c:forEach>
		</c:when>
		<c:when test="${selectedMembers==200 }">
			<c:forEach var="page" begin="1" end="20" step="1">
				<a href="#">${page }</a>
			</c:forEach>
		</c:when>
		
		<c:when test="${selectedMembers <200 }">
			<c:forEach var="page" begin="1" end="${selectedMembers/20+1 }" step="1">
				<c:choose>
					<c:when test="${page==pageNum }">
						<a class="sel-page" href="${contextPath }/admin/member/listMembers.do?
						section=${section}
						&pageNum=${page}
						&order_lately_date=${order_lately_date}
						&order_total_buy=${order_total_buy}
						&order_total_order=${order_total_order}
						&member_gender=${member_gender}
						&keyword=${keyword}"
						>${page }</a>
					</c:when>
					<c:otherwise>
						<a class="no-uline" href="${contextPath }/admin/member/listMembers.do?
						section=${section}
						&pageNum=${page}
						&order_lately_date=${order_lately_date}
						&order_total_buy=${order_total_buy}
						&order_total_order=${order_total_order}
						&member_gender=${member_gender}
						&keyword=${keyword}">${page }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
	</c:choose>
	</c:if>
                    
       
	  
	</form>
                        </div>
                  
               
                
                    </div>
                    <!-- column -->

                    
                </div>
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
           
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
	</div>
	</center>
</body>
</html>