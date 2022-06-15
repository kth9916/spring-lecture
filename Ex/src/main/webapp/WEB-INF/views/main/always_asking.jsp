<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="${contextPath}/resources/k/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${contextPath}/resources/k/js/popper.min.js"></script>
<script src="${contextPath}/resources/k/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/k/js/plugins.js"></script>
<script src="${contextPath}/resources/k/js/active.js"></script>

<script
	src="${contextPath}/resources/c/vendor/animsition/js/animsition.min.js"></script>
<script src="${contextPath}/resources/c/vendor/bootstrap/js/popper.js"></script>
<script
	src="${contextPath}/resources/c/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/c/vendor/select2/select2.min.js"></script>
<script>
	$(".js-select2").each(function() {
		$(this).select2({
			minimumResultsForSearch : 20,
			dropdownParent : $(this).next('.dropDownSelect2')
		});
	})
</script>
<script
	src="${contextPath}/resources/c/vendor/daterangepicker/moment.min.js"></script>
<script
	src="${contextPath}/resources/c/vendor/daterangepicker/daterangepicker.js"></script>
<script src="${contextPath}/resources/c/vendor/slick/slick.min.js"></script>
<script src="${contextPath}/resources/c/js/slick-custom.js"></script>
<script
	src="${contextPath}/resources/c/vendor/parallax100/parallax100.js"></script>
<script>
	$('.parallax100').parallax100();
</script>
<script
	src="${contextPath}/resources/c/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
	$('.gallery-lb').each(function() { // the containers for all your galleries
		$(this).magnificPopup({
			delegate : 'a', // the selector for gallery item
			type : 'image',
			gallery : {
				enabled : true
			},
			mainClass : 'mfp-fade'
		});
	});
</script>
<script
	src="${contextPath}/resources/c/vendor/isotope/isotope.pkgd.min.js"></script>
<script
	src="${contextPath}/resources/c/vendor/sweetalert/sweetalert.min.js"></script>
<script>
	$('.js-addwish-b2').on('click', function(e) {
		e.preventDefault();
	});

	$('.js-addwish-b2').each(function() {
		var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
		$(this).on('click', function() {
			swal(nameProduct, "is added to wishlist !", "success");

			$(this).addClass('js-addedwish-b2');
			$(this).off('click');
		});
	});

	$('.js-addwish-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().find(
						'.js-name-detail').html();

				$(this).on('click', function() {
					swal(nameProduct, "is added to wishlist !", "success");

					$(this).addClass('js-addedwish-detail');
					$(this).off('click');
				});
			});

	$('.js-addcart-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().parent()
						.find('.js-name-detail').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to cart !", "success");
				});
			});
</script>
<script
	src="${contextPath}/resources/c/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
	$('.js-pscroll').each(function() {
		$(this).css('position', 'relative');
		$(this).css('overflow', 'hidden');
		var ps = new PerfectScrollbar(this, {
			wheelSpeed : 1,
			scrollingThreshold : 1000,
			wheelPropagation : false,
		});

		$(window).on('resize', function() {
			ps.update();
		})
	});
</script>
<script src="${contextPath}/resources/c/js/main.js"></script>
<style>

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

<body>
<Br><Br>
	<section class="single_product_details_area section_padding_0_100">
	<div class="container">
		<div class="row">



			<div class="col-12">
				<div class="single_product_desc">


					<div id="accordion" role="tablist">
						<h5 style="color: #ff0081">���</h5>
						<div class="card">
							<div class="card-header" role="tab" id="a">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#aa"
										aria-expanded="false" aria-controls="aa">������� ��ǰ�� ��ġ�� Ȯ���ϰ�
										�;��.</a>
								</h6>
							</div>
							<div id="aa" class="collapse" role="tabpanel" aria-labelledby="a"
								data-parent="#accordion">
								<div class="card-body">
									�� ���������� > �ֹ������ȸ > �����ȸ���� Ȯ�� ���� ( ��/��ǰ(Beta)/Ƽ��/�����װ��� ���еǾ�
									�ֽ��ϴ�. )<br> �������������� ��ǰ ������ ��� ��, ���Բ� ��� �ȳ� SMS/�˸�����
									�߼��ص帮�� �ֽ��ϴ�.<br> ������������ > �ֹ������ȸ > �����ȸ ��ư�� Ŭ���Ͻø� Ȯ���Ͻ� ��
									�ֽ��ϴ�.<br> �� ����� ��� ��, �ù�� ������ ���� ���� ������ȸ�� �ݿ��Ǵµ� ���� �����ϱ���
									1�� ���� �ҿ�� �� �ֽ��ϴ�. �ù�翡�� ���ϵ� ��ǰ�� ����� ��ġ������ ��ưų�, �帧��ȸ�� ����� ��� ����
									����� ����ϰ� �ִ� �ù�������� ���Ǹ� ��Ź�帮�ڽ��ϴ�.<br> (�����ȸ�� �ù��� ����ó�� Ȯ�ε���
									�ʴ� ���, �ù�� Ȩ�������� ���� Ȯ���Ͻ� �� �ֽ��ϴ�.) �� �����ۻ�ǰ�� ��� ������� �ȳ��帮�� �ֽ��ϴ�.
									���� �߼� ������ ���� ������ ���� 5�Ͽ��� �ִ� 14�� ���� �ҿ�� �� �ֽ��ϴ�. (������ Ȯ�� �ʿ�)<br>

									�� ����, ���� �� ���� ȭ�� ��ۻ�ǰ�� ���, ��ü ������ ���� ��ۿ������� ������ ���ɼ��� �ֱ� ������,
									��Ȯ�� ��������� ��ǰ������ > Q&A�� ���Ǹ� ��Ź�帮�ڽ��ϴ�.<br> 1. CJ ������� : 1588
									- 1255<br> 2. �����ù� : 1588 - 9988<br> 3. �Ե��ù� : 1588 -
									2121<br> 4. �����ù� : 1588 - 0011<br> 5. �浿�ù� : 080 -
									873 - 2178<br> 6. KGB�ù� : 1577 - 4577<br> 7. �����ù� :
									1588 - 8848<br> 8. �յ��ù� : 080 - 877 - 8202<br> 9.
									��ü���ù� : 1588 - 1300<br> 10. GTX������ : 1588 - 1756<br>
									11. ����ù� : 043-222-4582<br> 12. �Ͼ������ : 1588-0002<br>
									13. õ���ù� : 031-462-1001 (����,����) / 055-371-2200 (�λ�,�泲) /
									053-353-8911 (�뱸,���) 062-361-2340 (ȣ��,����) / 042-284-1006
									(����,��û) / 033-743-1007 (����)<br> 14. ����ù� : 031-240-2400<br>
									15. �ǿ��ù� : 031-460-2700 (����,���) / 051-645-3351 (�λ�) /
									053-345-3001 (�뱸)<br>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="b">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#bb"
										aria-expanded="false" aria-controls="bb">�̹� �ֹ��� �ߴµ�, �������
										�����ϰ� �;��.</a>
								</h6>
							</div>
							<div id="bb" class="collapse" role="tabpanel" aria-labelledby="b"
								data-parent="#accordion">
								<div class="card-body">
									�� ���������� > �ֹ������ȸ ������ ���� ���氡��<br> ������� ������ ���������� > �ֹ������ȸ
									���������� ���Ż󼼳��� > �������/����� ���� ��ư�� Ŭ���Ͽ� ������ �� �ֽ��ϴ�.<br> �������
									������ ��ǰ�� �߼۵Ǳ� �� '�Աݴ��' �� '����غ���/�ű��ֹ�' �ܰ迡���� ������ �����մϴ�.<br>
									���� ������ȣ�� �ϳ��� ������� �����Ͻ� �� �ֽ��ϴ�.<br> ��'��ǰ�����/��ǰ�غ���' �ܰ迡����
									������ ����� ��ҽ�û ��Ź�帳�ϴ�. �ٸ� �ﰢ���� ��Ұ� ������, ��ǰ�� ���Ǿ��� ��쿡�� ��Ұ� ����� ��
									�ֽ��ϴ�.<br> ����ǰ�� �̹� ���Ǿ� ������� ���¿����� ����� ������ �Ұ����մϴ�.<br>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="c">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#cc"
										aria-expanded="false" aria-controls="cc">��ǰ ���� �� �ּ� ������
										�Ϸ��� ��� �ؾ� �ϳ���?</a>
								</h6>
							</div>
							<div id="cc" class="collapse" role="tabpanel" aria-labelledby="c"
								data-parent="#accordion">
								<div class="card-body">


									����ǰ ���� �� ����غ� �۾� ���� �������� �������, ���û��� ������ ����� �� �ֽ��ϴ�. <br>
									���ֹ����ۻ�ǰ �� �ؿ������ �̿� ��ǰ�� �ּ� ������ ���Ͻô� ��� ������ 1:1���Ǹ� ���� ���� �ֽø� Ȯ��
									�� ���� ���ɿ��ο� ���� �ȳ��帮�ڽ��ϴ�.<br>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="d">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#dd"
										aria-expanded="false" aria-controls="dd">���Ͽ� ��ǰ�� ���� �� �ֳ���?</a>
								</h6>
							</div>
							<div id="dd" class="collapse" role="tabpanel" aria-labelledby="d"
								data-parent="#accordion">
								<div class="card-body">��ǰ ����� �ù� ���񽺰� ����Ǵ� ���ϰ� ����Ͽ� ����ǰ�
									�־�, �Ͽ���, ������ ����� �Ұ��մϴ�.</div>
							</div>
						</div>
						<br>
						<br>
						<h5 style="color: #ff0081">��ȯ / ��ǰ / ȯ��</h5>
						<div class="card">
							<div class="card-header" role="tab" id="e">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#ee"
										aria-expanded="false" aria-controls="ee"> ȯ���� ��û�ߴµ� ȯ�� �Ⱓ��
										�󸶳� �ҿ�ǳ���? </a>
								</h6>
							</div>
							<div id="ee" class="collapse" role="tabpanel" aria-labelledby="e"
								data-parent="#accordion">
								<div class="card-body">
									�� �������ܺ� ȯ�� �Ⱓ ���� ȯ�� ���� �Ϸ� ��, ���� ���ܺ� ȯ�� ������ �Ʒ��� ���� �ҿ�˴ϴ�. (��ǰȯ����
									��ǰ ȸ��>��ü �԰�>ȯ�ҽ��δܰ踦 ���� ����ǿ��� ���� ��Ź�帳�ϴ�.)<br> - �ſ�ī�� : 2
									������ �̳�, ī��� ���� ���(������,��������,���̳��� �� ������� ����)<br> - üũī�� : 2
									������ �̳�, ī��� ���� ��� �� �ش� ī�忡 ����� ���·� �Ա�<br> - �ǽð� ������ü : 2
									������ �̳�, ���� ��� �� ���� ���·� �Ա�<br> - �޴��� ���� : �޴��� ���� ��ü ��� ��,
									��� ��� �ݿ� (�޴��� ���� ���� �ֹ� �� �κ� ��� ���� ȯ���� ��쿡�� �Ʒ� �������Ա� ȯ�Ұ� �����ϰ�
									����˴ϴ�.)<br> - �������Ա� : 2 ������ �̳� ȯ�ҽ�û ���·� �Ա� (Ex. 7�� 6��(��)
									������/���/ȯ�� ���� > 7�� 10��(ȭ) �̳� ������ ��� �ݿ�)<br> - ������ ����Ʈ : ���
									���� (��, �������Ա�+����Ʈ ���� ������ �������Աݰ� ȯ��ó�� ���� ����Ʈ �����˴ϴ�.)


								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="f">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#ff"
										aria-expanded="false" aria-controls="cc"> ������ ��ǰ��
										���/��ȯ/��ǰ�Ϸ��� ��� �ؾ� �ϳ���? </a>
								</h6>
							</div>
							
							<div id="ff" class="collapse" role="tabpanel" aria-labelledby="f"
								data-parent="#accordion">
								<div class="card-body">
									�� ���������� > �ֹ������ȸ ���������� ��û ���� ( ��/��ǰ(Beta)/Ƽ��/�����װ��� ���еǾ� �ֽ��ϴ�. )<br>


									�� ��� / ��ȯ / ��ǰ ��û ��� 1. ��ۻ�ǰ �� ��ۻ�ǰ�� ��ǰ ������ ���� ���� ���� 7�� �̳�,
									���������� > �ֹ������ȸ ������ �� ���/��ǰ ��û�� ���� ���Ͻô� �ɼ�, ȸ�� �ּ��� ���� �����Ͻø� ������
									��Ȯ�� ��û�� �����մϴ�.<br> �� ����� ���¿����� ��ȯ/��ǰ ��û�� �Ұ��ϸ�, ��� �Ϸ� ����
									[����������>�ֹ������ȸ]���� �����Ͽ� ��ȯ/��ǰ ��û�� �����մϴ�. ��� ���°� ������� ��� ����Ȯ�� �� ��û
									��Ź�帳�ϴ�.<br> �� ����� �� ��ۿϷ� ���·� ��������, ���� ��ǰ�� �������� ���� ��ǰ�� ����
									�ش� ����������� ����� �ù�븮�� �Ǵ� �ù������ ���� ��ۻ�ǰ ��ġ Ȯ�� �� ��ǰ�ǻ縦 �����Ͻ� ����,
									�������������� ���� ��ǰ ��û���ֽø� ��ҽ�û�� �����մϴ�.<br> �� ��ۻ�ǰ�� ���, ��ȯ/��ǰ ��û
									�Ϸ��, �ù������ �湮 ������ �� �ֵ��� ���������� ���� ȸ�������� �ص帳�ϴ�. (��û �Ϸ� ���� �ù� ����
									�湮���� ��� ������ ���� 2~3�� ���� �ҿ�Ǹ�, �ù�� ������ ���� ������ �߻��� �� �ֽ��ϴ�.)<br>
									�� ȸ�� �Ϸ� �� �����ϱ��� 1~2���̳� ����������>���/��ȯ/��ǰ ��ȸ > �����Ȳ Ŭ���� ���� ������� Ȯ����
									�����մϴ�. (�ٸ�, ���Բ��� ���� �ݼ��� ���ֽ� ���, �ݼ����ȣ�� ���� ������ּž� ������� Ȯ����
									�����մϴ�.)<br> �� ��ȯ/��ǰ�� ���õ� �ڼ��� ������ '��ȯ/��ǰ �ȳ�' ���������� Ȯ����
									�����մϴ�. <br> ��1���� �����ǿ��� ���ÿ� ���/��ȯ/��ǰ ��û�� �Ұ��� �� �����Ƿ�, ��û��
									�Ұ��� ��� 1:1���Ǹ� �̿� ��Ź�帳�ϴ�.<br> ������������ �������Ա� �Ǵ� �޴��� �������� �ֹ� ��
									�κ���ҷ� ���� ȯ���� �ʿ��ϳ� ���¹�ȣ Ȯ���� ����� ���<br> ������ ��������Ʈ�� �켱 ȯ�� �� ��
									������, ����Ʈ ����� ��ġ ���� ��� 1:1���Ǹ� �������ֽø� ���޵� ����Ʈ ȸ�� �� ���� ���� ȯ����
									�����մϴ�.<br> 2. Ƽ�ϻ�ǰ(����/����/��������/�¶��λ�ǰ)<br> Ƽ�ϻ�ǰ�� �Ǹ�,
									���ó�� ����� ���� ��ҽ�û ����� �����մϴ�. <br> ����������>�ֹ������ȸ ���������� ��ҽ�û
									��ư�� ������ �ʴ� ���, �����ͷ� ���� ��Ź�帳�ϴ�. (�������� �� ȯ�ұ��� ����)<br> ��
									��ȯ/��ǰ ���� �Ⱓ<br> - ������ �ܼ����� : ��ǰ ������ ���� ���κ��� 7�� �̳�<br>
									- ǥ��, ���� ����, ��ǰ ���� (�ʱ� �ҷ�) : �� ����� �� �� �Ǵ� �� �� �־��� ������ 30�� �̳� <br>

									�� ���/��ȯ/��ǰ ��û���� �Ⱓ ���� <br> 1. ��� ��ǰ <br> - ������ : 1/1
									<br> - ��ǰ ������ : 1/3<br> - ���/��ȯ/��ǰ ������ : 1/3~1/10 (��ǰ
									������ ���� ���� ���� +7�ϱ���)<br> 2. ���� ��ǰ<br> - ������ : 1/1 <br>
									- Ƽ�� ������ : 1/1<br> - ���/��ȯ/��ǰ ������ : 1/1~1/8 (������ ���� ���� ����
									+7�ϱ���)<br> * �� �Ϻ� ���񽺻�ǰ�� ��ȿ�Ⱓ�� ���� ��� ���� ���� ���� �� �� �ֽ��ϴ�.<br>

									�� ��ȯ/��ǰ ��ۺ� ����<br> �� �ʱ� �ҷ� ��ǰ�� ���, �Ǹž�ü���� �պ���ۺ� �δ��Ͽ��� ��ǰ
									�� �԰� Ȯ�� �� ȯ�ҵ˴ϴ�.<br> �� ���ɿ� ���� ��ȯ/��ǰ�� �߻��Ǵ� ��ۺ�� �� �δ����� ��ǰ��
									���� ��ǰ ���ڿ� �����Ͽ� �����ֽðų� �Ǹž�ü ���·� �Ա� ��Ź�帳�ϴ�.<br> (������, ��۷�
									���Ұ��� ������. ȯ�ҽ�, ���� ��۷�� ��ǰ��ݰ� �Բ� ��ü ȯ�ҵǸ�, ȯ�Ұ����Դ� �������� �������� ����)
									�� ��ǰ�� ���� �պ���ۺ� �����ϹǷ�, ��ǰ������ > �ȳ����� �Ǵ� ��ȯ �� ��ǰ��û ����������
									Ȯ�κ�Ź�帳�ϴ�.<br> �� ��ȯ / ��ǰ ó���Ⱓ<br> �� ȸ���� ��ǰ�� �Ǹž�ü�� �԰� ��
									�˼��� ����, ��ȯ/��ǰ�� ����˴ϴ�. <br> �� ��������� ��ǰ�� �԰��Ϸκ��� 1~2�̳�
									ȯ��ó���Ǹ�, ��ȯ�� �԰��Ϸκ��� 2~3���̳� ��ȯ ���˴ϴ�. (��, ��ǰ �˼����� �� Ư�̻��� �߻� �� �ټ�
									������ �� �� �ֽ��ϴ�.)<br> �� ��ȯ �� ��ǰ�� �Ұ��� ���<br> �� �Һ����� å�� �ִ�
									������ ��ǰ ���� ���/�Ѽյ� ���<br> �� �Һ����� ���/�Һ� ���� ��ǰ ���� ��ġ�� ������ ������
									���<br> �� �ð��� ����� ���� ���ǸŰ� ����� ������ ��ǰ ���� ��ġ�� ������ ������ ���<br>
									�� ������ ������ ��ǰ ���� ������ �Ѽ��� ���<br> �� �Ǹ�/�������� Ư����, ��ȯ/��ǰ �� �Ǹ���
									���� ȸ���� �� ���� ���ذ� �߻��ϴ� ��� (�ֹ� ���� �� ��������, ���� ���� ��)<br> ��
									��ȯ/��ǰ öȸ �� ���� ����<br> ��ǰ �Ǵ� ��ȯ �������Ŀ��� ������������ ���� ��ǰ,��ȯ ��� ��
									������ ����� �� �־�, 1:1���Ǹ� �̿� ��Ź�帮���ϴ�.


								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="g">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#gg"
										aria-expanded="false" aria-controls="gg"> ��ۻ�ǰ �� �ܼ� ��������
										ȯ���� �Ұ��� ��ǰ�� �ֳ���? </a>
								</h6>
							</div>
							
							<div id="gg" class="collapse" role="tabpanel" aria-labelledby="g"
								data-parent="#accordion">
								<div class="card-body">
									����ǰ(����/�õ�)��ǰ �� �Ϻδ� ��ǰ Ư���� ȯ���� �Ұ��� ��찡 �ֽ��ϴ�.<br> ����ǰ�� �ƴϴ���
									��ǰ Ư���� ȯ���� �Ұ��� ��ǰ�� ������ ��ǰ ���������� ���������� �ȳ������� �ʵ��� �ֽñ� �ٶ��ϴ�.<br>


								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="h">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#hh"
										aria-expanded="false" aria-controls="cc"> ��ۻ�ǰ�� ��� ����Ϸ��µ�,
										�¶������� ��ǰ ������ �Ұ����ϴٰ� �մϴ�. </a>
								</h6>
							</div>
							
							<div id="hh" class="collapse" role="tabpanel" aria-labelledby="h"
								data-parent="#accordion">
								<div class="card-body">�� ������ 1:1���Ƿ� ���� �����Ǻ� ������ ��ǰ��
									�����Ͻð� ��ǰ�غ��� �ܰ迡�� �κ� ��� ��û �� ���� ��ǰ�ݾ��� ������ ���� �ݾ׺��� ���� ��� ��ۺ�
									�߻��˴ϴ�. �� ��һ�ǰ �ݾ��� ��ۺ񺸴� ū ��쿡�� ��ǰ������ ��ۺ� ���� �� ȯ�ҵǸ�, ��һ�ǰ �ݾ���
									��ۺ񺸴� ���� ��쿡�� ��� ��û�� �Ұ��մϴ�. �� ��ۺ񺸴� ���� �ݾ��� ��ǰ�� ����Ͻð��� �Ͻô� ���,
									������ 1:1���Ƿ� ���� ��Ź�帳�ϴ�. ����) �� 5 ���� �̻� ���Ž�, ������ ��ǰ (��ۺ� 2,500����
									���)�� ���� : A �ɼ� 4 ���� + B �ɼ� 2���� = �� 6 ���� ��� : B �ɼ� 2���� �κ���� ��� ��
									���� ��ǰ�ݾ� A �ɼ� 4 ������ ������ ������ 5 ������ �������� �ʱ� ������ ��һ�ǰ�� B�ɼǿ��� ��ۺ�
									���� ��, ȯ�ҵ˴ϴ�. �� 1���� �̻� ���Ž�, ������ ��ǰ (��ۺ� 2,500���� ���)�� ���� : A �ɼ�
									2õ�� * 5�� = �� 1���� ��� : A �ɼ� 1�� 2õ�� �κ� ��� ��� �� ���� ��ǰ�ݾ��� A�ɼ� 2õ��
									*4=8õ������ ������ ������ 1������ �������� �ʱ� ������ ��ۺ� �߻�������, ��һ�ǰ �ݾ��� ��ۺ񺸴�
									�۱� ������ �¶������δ� ��ҽ�û�� �������� �ʽ��ϴ�.</div>
							</div>
						</div>
						<br>
						<br>
						<h5 style="color: #ff0081">����(����)</h5>
						<div class="card">
							<div class="card-header" role="tab" id="i">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#ii"
										aria-expanded="false" aria-controls="ii"> �����Ϳ��� ��ȭ������ ����
										Ȯ�� �� �븮 ������ �����Ѱ���? </a>
								</h6>
							</div>
							
							<div id="ii" class="collapse" role="tabpanel" aria-labelledby="i"
								data-parent="#accordion">
								<div class="card-body">�� �ڷ���Ʈ �����͸� ���� ����(����) ���� ���� ����ȭ�ֹ�
									�̿� ���� ��� �� ������������ ������ ���Բ����� ������ �� �� ��ǰ ���� �̿� �����մϴ�. (��,
									��ó/����, �Ե���ȭ�� �� �������Ա� ���ܵ��� �Ұ�) �������� �Ա� �������ܸ� �����մϴ�. ���ڷ���Ʈ ������ :
									1644-4555 | ���� 09��~18�� (���ɽð� 13��~14��)</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="j">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#jj"
										aria-expanded="false" aria-controls="jj"> �������Ա� �ֹ� ��,
										�Ա��Ͽ��µ� ��� ���ڸ� �޾ҽ��ϴ�. </a>
								</h6>
							</div>
							
							<div id="jj" class="collapse" role="tabpanel" aria-labelledby="j"
								data-parent="#accordion">
								<div class="card-body">�� ȯ�Ұ��� Ȯ�� �� ������ 1:1���� ���� �ʿ�



									���������Ա����� �ֹ��Ͽ� ��������� �ԱݿϷ��� ������ �ֹ���ǰ�� ��� �����Ǿ��ų�, �Ǹ����� �Ǿ��� ���, ��ü
									�ֹ� ��Ұ� �� �� �ֽ��ϴ�. (�ֹ����� ��ҽ� ���������� �� �ֹ������ȸ ������������ Ȯ�ε��� �ʽ��ϴ�.)

									�����Բ��� �Ա� �� �̿��Ͽ��� ���¹�ȣ�� �������� �ش��ϱ� ������ ��翡�� ���� �� Ȱ������ �ʾ�, ������
									ȯ����ġ�� �ʿ��մϴ�. �����ŷο�ð����� �Աݱݾ׿� ���� ȯ��ó���� ����, ȸ�� ���θ��� ȯ�Ұ��¸� �����Ͻþ�
									1:1���Ƿ� �������ֽø� ������� ȯ�ҷ� ����帮�ڽ��ϴ�. �����¹�ȣ Ȯ���� ����� ��� ������ ��������Ʈ�� �켱
									ȯ�� �� �� ������, ����Ʈ ����� ��ġ ���� ��� 1:1���Ǹ� �������ֽø� ���޵� ����Ʈ ȸ�� �� ���� ����
									ȯ���� �����մϴ�. �������͸� ���� ȯ�� �����Ϸ� �� �����ϱ��� 2�� �̳� ��û�Ͻ� ȯ�Ұ��·� �Աݵ˴ϴ�.</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="k">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#kk"
										aria-expanded="false" aria-controls="cc"> �ǽð� ������ü �̿� ����
										�ð��� ��� �ǳ���? </a>
								</h6>
							</div>
							
							<div id="kk" class="collapse" role="tabpanel" aria-labelledby="k"
								data-parent="#accordion">
								<div class="card-body">��ǰ ����� �ù� ���񽺰� ����Ǵ� ���ϰ� ����Ͽ� ����ǰ�
									�־�, �Ͽ���, ������ ����� �Ұ��մϴ�.�ǽð� ������ü ���ະ �̿� ���� �ð��� �Ʒ��� �����ϴ�. - ��������
									: 00:00 ~ 24:00 - �������� : 00:30 ~ 24:00 - �츮���� : 00:00 ~ 24:00 -
									SC���� : 00:00 ~ 24:00 - ������� : 00:00 ~ 24:00 - ��ȯ���� : 00:10 ~
									23:50 - �����߾�ȸ : 00:10 ~ 23:55 - �������� : 00:05 ~ 23:55 - �ѱ���Ƽ :
									00:00 ~ 24:00 - �뱸���� : 00:00 ~ 24:00 - �λ����� : 00:05 ~ 24:00 -
									�ѱ�������� : 00:30 ~ 24:00 - �������� : 00:10 ~ 23:55 - �������� : 00:20 ~
									23:55 - �������� : 00:10 ~ 24:00 - �泲���� : 00:00 ~ 24:00 - �ϳ����� :
									00:15 ~ 23:50 - ��ü�� : 00:10 ~ 24:00 - �������ݰ� : 00:30 ~ 23:30 -
									�������� : 00:10 ~ 23:50 - �긲���� : 00:30 ~ 23:30</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="l">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#ll"
										aria-expanded="false" aria-controls="cc"> �ǽð� ������ü �ѵ���
										���ΰ���? ���ΰ��·� �����Ѱ���? </a>
								</h6>
							</div>
							
							<div id="ll" class="collapse" role="tabpanel" aria-labelledby="l"
								data-parent="#accordion">
								<div class="card-body">�����࿡ ���� �̿밡�� �ݾ׿� ���̰� ������, �ּ�
									160��/1�� �ִ� 300�������� ������ �����մϴ�. �����Բ��� ���ͳ� ��ŷ ��û ��, ������ ������ 1��
									�ִ� ��ü�ݾ� �ѵ��ݾ��� 300�������� ���� ��� ��ü�ѵ��� ������ ��ü �ִ��ѵ� �ݾ��� �켱�� �մϴ�.

									[���ΰ��� �ǽð� ������ü] ���ΰ��µ� �ǽð� ������ü�� �����մϴ�.</div>
							</div>
						</div>






					</div>

				</div>
				
			</div>
		</div>
	</div>
	
	
	</section>
	<center>
	<button onclick="history.back();" class="bubbly-buttons">�ڷΰ���</button>
<%-- 						<center>
<button type="submit" name="addtocart" style="background-color: #111;" value="5" class="btn cart-submit d-block">Add to cart</button>
				</center> --%>
				</center>
</body>

<!--===============================================================================================-->


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