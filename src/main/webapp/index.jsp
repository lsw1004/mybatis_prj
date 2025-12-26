<%@page import="day1224.UrlVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon" href="http://192.168.10.96/mybatis_prj/common/images/favicon.ico">

<script src="http://192.168.10.96/mybatis_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.96/mybatis_prj/common/css/carousel.css" rel="stylesheet">
<c:import url="http://192.168.10.96/mybatis_prj/fragments/bootstrap_css.jsp"/>
<style type="text/css">
#wrap{  margin: 0px auto; padding:0px; width: 1200px; height: 1000px; }   
#left{ width: 200px; height: 1000px; float: left; /* background-color: #ff0000; */}
#right{width: 1000px; height: 1000px; float: right;/* background-color: #0000ff; */}
a{color: inherit;text-decoration: none;}  
a:hover{color: highlight;text-decoration: underline;}  
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
   
});//ready

</script>


</head>
<body>
   <header data-bs-theme="dark">
   <c:import url="http://192.168.10.96/mybatis_prj/fragments/header.jsp"/>
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
         <%
         UrlVO[] urlArr = {
        	new UrlVO("컬럼 하나에 한행 조회","day1224/scsr"),	 
        	new UrlVO("컬럼 여러개에 한행 조회","day1224/mcsr"),	 
        	new UrlVO("컬럼 하나에 여러행 조회","day1224/scmr"),	 
        	new UrlVO("컬럼 여러개에 여러행 조회","day1224/mcmr"),	 
        	new UrlVO("domain 사용","day1226/domain"),	 
        	new UrlVO("like","day1226/like"),	 
        	new UrlVO("작다의 조회","day1226/lessThan"),	 
        	new UrlVO("크다의 조회","day1226/greaterThan"),	 
        	new UrlVO("subquery","day1226/subquery"),	 
        	new UrlVO("union","day1226/union"),	 
        	new UrlVO("join","day1226/join"), 
        	new UrlVO("subquery & join","1"), 
        	new UrlVO("$의 사용","1"), 
        	new UrlVO("dynamic query : if","1"), 
        	new UrlVO("dynamic query : choose","1"), 
        	new UrlVO("dynamic query : forEach","1"), 
        	new UrlVO("dynamic query : set","1"), 
        	new UrlVO("PL/SQL insert","1"), 
        	new UrlVO("PL/SQL update","1"),
        	new UrlVO("PL/SQL delete","1"),
        	new UrlVO("PL/SQL cursor","1") 
         };
         
         pageContext.setAttribute("urlArr", urlArr);
         %>
            <div id="wrap">
            <div id="left">
            <table>
            <c:forEach var="url" items="${urlArr }" varStatus="i">
            <tr>
			<td>
			<a href="index.jsp?url=${url.url}">
			<c:out value="${url.title }"/>
			</a>
			</td>            
            </tr>
            </c:forEach>
            </table>
            </div>
            <div id="right">
            <c:if test="${not empty param.url}">
            <c:import url="${param.url}.jsp"></c:import>
            </c:if>
            </div>
            </div>
         </div>
         <hr class="featurette-divider">
         <!-- /END THE FEATURETTES -->
      </div>
      <!-- /.container -->
      <!-- FOOTER -->
      <footer class="container">
      <c:import url="http://192.168.10.96/mybatis_prj/fragments/footer.jsp"/>
      </footer>
   </main>
   
</body>
</html>