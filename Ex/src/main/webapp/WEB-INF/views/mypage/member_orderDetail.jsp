<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
td{
padding: 5px;
word-break:normal;
}
</style>
</head>
<body>
  <div class="site-section">
      <div class="container">
       
        <div class="row">
          <div class="col-md-12 mb-5 mb-md-0">
          <center>
            <h2 class="h3 mb-3 text-black">�ֹ� ����ȸ</h2>
             </center>
               <br> <br>
             <div style="border: 1px solid #AAAAAA; border-radius: 30px 30px" class="p-3 p-lg-5">
            
            <center>
            <h4><p>�ֹ� ����</p></h4>
             </center>
             
             
             <div class="form-group row">
                <div class="col-md-4">
                  <label for="c_companyname" class="text-black">�ֹ���ȣ</label>
                  <input type="text" class="form-control" value="${orderInfo.order_code }" readonly="readonly" style="background-color: white;">
                </div>
                
                <div class="col-md-4">
                  <label for="c_companyname" class="text-black">�ֹ�����</label>
                  <input type="text" class="form-control" value="${orderInfo.date_pay }" readonly="readonly" style="background-color: white;">
                </div>
                
                <div class="col-md-4">
                  <label for="c_companyname" class="text-black">�ֹ���</label>
                  <input type="text" class="form-control" value="${orderInfo.order_member_name }" readonly="readonly" style="background-color: white;">
                </div>
              </div>
              
              <br><br>
              <center>
            <h4><p>��������</p></h4>
             </center>
              
              <div class="form-group row">
                <div class="col-md-4">
                  <label for="c_companyname" class="text-black">�� �ֹ� �ݾ�</label>
                  <input type="text" class="form-control" value="${orderInfo.order_price }" readonly="readonly" style="background-color: white;">
                </div>
              
              	<div class="col-md-4">
                  <label for="c_companyname" class="text-black">�� �ΰ������ݾ�</label>
                  <input type="text" class="form-control" value="${orderInfo.order_discount }" readonly="readonly" style="background-color: white;">
                </div>
                
                <div class="col-md-4">
                  <label for="c_companyname" class="text-black">�� ���� �ݾ�</label>
                  <input type="text" class="form-control" value="${orderInfo.order_price - orderInfo.order_discount }" readonly="readonly" style="background-color: white;">
                </div>
              
              </div>
              
              <br><br>
              <center>
            <h4><p>�ֹ� ��ǰ ����</p></h4>
            <br>
             </center>
             
             <table style="width: 100%;">
             <c:forEach items="${orderlist}" var="orderlist">
             <tr>
             <td rowspan="6" width="320px">
             <a href="${contextPath}/product/productdetail.do?pro_code=${orderlist.pro_code}">
             <img width="270px" height="320px" src="${contextPath}/thumbnails.do?pro_code=${orderlist.pro_code}&fileName=${orderlist.pro_imagefilename}">
             </a></td>
             
             
             </tr>
             <tr>
             <td><label for="c_companyname" class="text-black">��ǰ���� </label>
                  <input type="text" class="form-control" value="${orderlist.pro_name}" readonly="readonly" style="background-color: white;"></td>
             
             </tr>
             <tr>
             <td><label for="c_companyname" class="text-black">��ǰ���� - �ɼ�</label>
                  <input type="text" class="form-control" value="${orderlist.pro_color } / ${orderlist.pro_size }" readonly="readonly" style="background-color: white;"></td>
             
             </tr>
             <tr>
             <td><label for="c_companyname" class="text-black">����</label>
                  <input type="text" class="form-control" value="${orderlist.order_pro_quantity }" readonly="readonly" style="background-color: white;"></td>
             
             </tr>
             <tr>
             <td><label for="c_companyname" class="text-black">��ǰ ���űݾ�</label>
                  <input type="text" class="form-control" value="${orderlist.order_price }" readonly="readonly" style="background-color: white;">
                </td>
             
             </tr>
             <tr><td><label for="c_companyname" class="text-black">��۱���</label>
                  <input type="text" class="form-control" value="${orderlist.delivery_status }" readonly="readonly" style="background-color: white;">
                </td>
             
             </tr>
             </c:forEach>
             </table>
              
              <br><br>
              <center>
            <h4><p>����� ����</p></h4>
             </center>
             
             <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_companyname" class="text-black">�����ô� ��</label>
                  <input type="text" class="form-control" value="${orderInfo.receiver }" readonly="readonly" style="background-color: white;">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-8">
                  <label for="c_companyname" class="text-black">�ּ�</label>
                  <input type="text" class="form-control" value="${orderInfo.delivery_addr3 }  ${orderInfo.delivery_addr2 }  ${orderInfo.delivery_addr4 }" 
                  readonly="readonly" style="background-color: white;">
                </div>
                
                <div class="col-md-4">
                  <label for="c_companyname" class="text-black">�����ȣ</label>
                  <input type="text" class="form-control" value="${orderInfo.delivery_addr1 }" readonly="readonly" style="background-color: white;">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_companyname" class="text-black">�޴���ȭ</label>
                  <input type="text" class="form-control" value="${orderInfo.receiver_tel1 } - ${orderInfo.receiver_tel2 } - ${orderInfo.receiver_tel3 }" 
                  readonly="readonly" style="background-color: white;">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_companyname" class="text-black">��۸޽���</label>
                  <input type="text" class="form-control" value="${orderInfo.request_to_delivery }" readonly="readonly" style="background-color: white;">
                </div>
              </div>
              
            

             
            </div>
          </div>
   
        </div>
        <!-- </form> -->
      </div>
    </div>





</body>
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
</html>