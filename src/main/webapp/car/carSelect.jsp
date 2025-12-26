<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day1226.CarModelDomain"%>
<%@page import="kr.co.sist.car.CarService"%>
<%@page import="day1224.UrlVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>차량 조회</title>
<link rel="shortcut icon"
	href="http://192.168.10.96/mybatis_prj/common/images/favicon.ico">

<script src="http://192.168.10.96/mybatis_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.96/mybatis_prj/common/css/carousel.css"
	rel="stylesheet">
<c:import
	url="http://192.168.10.96/mybatis_prj/fragments/bootstrap_css.jsp" />
<style type="text/css">
#wrap {
	margin: 0px auto;
	padding: 0px;
	width: 1200px;
	height: 1000px;
}

#left {
	width: 200px;
	height: 1000px;
	float: left; /* background-color: #ff0000; */
}

#right {
	width: 1000px;
	height: 1000px;
	float: right; /* background-color: #0000ff; */
}

a {
	color: inherit;
	text-decoration: none;
}

a:hover {
	color: highlight;
	text-decoration: underline;
}
</style>
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#selCountry").change(function() {
			var country = $("#selCountry").val();// 선택된 옵션의 값 받기
			if (country === 'N/A') {// 선택 클릭시 리턴
				return;
			}// end if
			//alert(country);
			$.ajax({
				url : 'makerSearch.jsp',
				dataType : 'JSON',
				data : {
					country : country
				},
				error : function(xhr) {
					console.log(xhr.status)
				},// error
				success : function(jsonObj) {
					var sel = $("#selMaker")[0];
					sel.length = 1;// 남겨둘 옵션의 개수
					$.each(jsonObj.data, function(i, ele) {
						sel.options[i + 1] = new Option(ele.maker, ele.maker);
					});// each
				}// success
			});// ajax
		});// change

		$("#selMaker").change(function() {
			var maker = $("#selMaker").val();// 선택된 옵션의 값 받기
			if (maker === 'N/A') {// 선택 클릭시 리턴
				return;
			}// end if
			//alert(maker);
			$.ajax({
				url : 'modelSearch.jsp',
				dataType : 'JSON',
				data : {
					maker : maker
				},
				error : function(xhr) {
					console.log(xhr.status)
				},// error
				success : function(jsonObj) {
					var sel = $("#selModel")[0];
					sel.length = 1;// 남겨둘 옵션의 개수
					$.each(jsonObj.data, function(i, ele) {
						sel.options[i + 1] = new Option(ele.model, ele.model);
					});// each
				}// success
			});// ajax
		});// change

		$("#btn").click(function() {
			var country = $("#selCountry").val();// 선택된 옵션의 값 받기
			var maker = $("#selMaker").val();// 선택된 옵션의 값 받기
			var model = $("#selModel").val();// 선택된 옵션의 값 받기
			if (country === 'N/A' || maker === 'N/A' || model === 'N/A') {// 선택 클릭시 리턴
				alert("제조국, 제조사, 모델을 모두 선택해주세요");
				return;
			}// end if
			$("#frm").submit();
		});// click

	});//ready
</script>


</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="http://192.168.10.96/mybatis_prj/fragments/header.jsp" />
	</header>
	<main>
		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- Three columns of text below the carousel -->
			<!-- /.row -->
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
				<form action="carSelect.jsp" name="frm" id="frm">
					<select id="selCountry" name="selCountry"
						style="height: 30px; width: 200px;">
						<option value="N/A">---선택---</option>
						<option value="국산">국산</option>
						<option value="수입">수입</option>
					</select> <select id="selMaker" name="selMaker"
						style="height: 30px; width: 200px;">
						<option value="N/A">---선택---</option>
					</select> <select id="selModel" name="selModel"
						style="height: 30px; width: 200px;">
						<option value="N/A">---선택---</option>
					</select> <input type="button" value="검색" id="btn"
						class="btn btn-sm btn-info">
				</form>
				<div id="output">
					<%
					String country = request.getParameter("selCountry");
					String maker = request.getParameter("selMaker");
					String model = request.getParameter("selModel");

					/* System.out.println(country);
					System.out.println(maker);
					System.out.println(model); */

					CarService cs = CarService.getInstance();
					List<CarModelDomain> carList = cs.searchCarDetail(model);

					pageContext.setAttribute("carList", carList);
					%>
					<c:if test="${empty carList}">
					검색 결과가 없습니다.
					</c:if>
					<c:if test="${not empty carList}">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>이미지</th>
									<th>제조사</th>
									<th>모델명</th>
									<th>연식</th>
									<th>가격</th>
									<th>배기량</th>
									<th>입력일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty carList }">
									<tr>
										<td colspan="7" style="text-align: center;"><img
											src="images/na.jpg" style="width: 300px; height: 260px;">
										</td>
									</tr>
								</c:if>

								<c:forEach var="car" items="${carList}">
									<tr>
										<td><img src="car_img/${car.car_img}" style="width: 80px; min-height: 60px"></td>
										<td><c:out value="${car.maker}" /></td>
										<td><c:out value="${car.model}" /></td>
										<td><c:out value="${car.car_year}" /></td>
										<td><fmt:formatNumber value="${car.price}" pattern="#,###" /></td>
										<td><c:out value="${car.cc}" /></td>
										<td><fmt:formatDate value="${car.input_date}" pattern="yyyy-MM-dd EEEE" /></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</c:if>
				</div>
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<c:import url="http://192.168.10.96/mybatis_prj/fragments/footer.jsp" />
		</footer>
	</main>

</body>
</html>