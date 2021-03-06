<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
.head_right{
font-size: 15px;
font-weight: bold;

}
.head_right:hover {
	font-weight: bold;
	color: #ff084e;
}
.main_header_area {
    height: 80px;
    padding-top: 30px;
}
.header_area > * :hover{
color: #ff084e;
	
}
 #karl-navbar > ul > li > a:hover{
          color: #ff084e;
          font-weight: bold;
        }
        .hov-cl1:hover {color: #ff084e;}
</style>  

	
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="${contextPath}/resources/s/fonts/icomoon/style.css">

<link rel="stylesheet" href="${contextPath}/resources/s/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/s/css/magnific-popup.css">
<link rel="stylesheet" href="${contextPath}/resources/s/css/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/resources/s/css/owl.carousel.min.css">
<link rel="stylesheet" href="${contextPath}/resources/s/css/owl.theme.default.min.css">


<link rel="stylesheet" href="${contextPath}/resources/s/css/aos.css">

<link rel="stylesheet" href="${contextPath}/resources/s/css/style.css">






<!-- Core Style CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/k/css/core-style.css?">


<!-- Responsive CSS -->
<link href="${contextPath}/resources/k/css/responsive.css"
	rel="stylesheet">


</head>
<body>


	<header class="header_area"> <!-- Top Header Area Start -->
	<div class="top_header_area">
		<div class="container h-100">
			<div class="row h-100 align-items-center justify-content-end">

				<div class="col-12 col-lg-7">
					<div class="top_single_area d-flex align-items-center">
						<!-- Logo Area -->
						<div class="top_logo">
							<a href="${contextPath}/main/main.do"><img
								src="${contextPath}/resources/c/images/logo2.png" alt=""></a>


						</div>
						<!-- Cart & Menu Area -->
						<div class="header-cart-menu d-flex align-items-center ml-auto">
							<!-- Cart Area -->







							<div style="float: right;">
								<c:choose>
									<c:when
										test="${memberInfo.member_code != null && isLogOn == true}">
										<div>
											<a class="head_right"
												href="${contextPath}/mypage/memberInfo.do">MY PAGE</a>&nbsp;&nbsp;|&nbsp;
											<a class="head_right"
												href="${contextPath}/member/memberlogout.do">LOG OUT</a>&nbsp;&nbsp;|&nbsp;
												<a class="head_right"
													href="${contextPath}/cart/cartlist.do">????????????</a>
										</div>
									</c:when>
									<c:when
										test="${nonmemberInfo.nonmember_code != null && NonisLogOn == true }">
										<a class="head_right"
											href="${contextPath}/mypage/memberInfo.do">MY PAGE</a>&nbsp;&nbsp;|&nbsp;
											<a class="head_right"
											href="${contextPath}/nonmember/nonmemberlogout.do">LOG
											OUT</a>&nbsp;&nbsp;|&nbsp;
												<a class="head_right"
													href="${contextPath}/cart/cartlist.do">????????????</a>
									</c:when>
									<c:otherwise>
										<div>
											<a class="head_right"
												href="${contextPath}/member/memberloginform.do">LOG IN</a>
											&nbsp;&nbsp;|&nbsp; <a class="head_right"
												href="${contextPath}/member/membersignupchoice.do">SIGN
												UP</a>
										</div>
									</c:otherwise>
								</c:choose>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Top Header Area End -->
	<div class="main_header_area">
		<div class="container h-100">
			<div class="row h-100">
				<div class="col-12 d-md-flex justify-content-between">
					<!-- Header Social Area -->
					<div class="header-social-area"></div>
					<!-- Menu Area -->
					<div class="main-menu-area">
						<nav class="navbar navbar-expand-lg align-items-start">

						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#karl-navbar"
							aria-controls="karl-navbar" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"><i class="ti-menu"></i></span>
						</button>

						<div class="collapse navbar-collapse align-items-start collapse"
							id="karl-navbar">
							<ul class="navbar-nav animated" id="nav">
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/product/productlist.do?keyword=??????">ALL</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/product/productlist.do?keyword=??????&keyword_detail=???????????????">???????????????</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/product/productlist.do?keyword=??????&keyword_detail=??????"><span
										class="karl-level">hot</span>??????</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/product/productlist.do?keyword=??????&keyword_detail=??? ??????">???
										??????</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/product/productlist.do?keyword=??????&keyword_detail=????????? ???">?????????
										???</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/product/productlist.do?keyword=??????&keyword_detail=??????????????? ??????">???????????????
										??????</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="karlDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">HELP</a>
									<div class="dropdown-menu" aria-labelledby="karlDropdown">
										<a class="dropdown-item" href="#">???????????? ??????</a> <a
											class="dropdown-item" href="${contextPath}/notice/qna/list.do">Q&A</a> <a
											class="dropdown-item" href="${contextPath}/notice/review/list.do">REVIEW</a> <a
											class="dropdown-item" href="#">????????????</a>

									</div></li>

							</ul>
						</div>
						</nav>
					</div>
					<!-- Help Line -->
					<div class="help-line"></div>
				</div>
			</div>
		</div>
	</div>
	</header>
	<!-- ****** Header Area End ****** -->





</body>
</html>