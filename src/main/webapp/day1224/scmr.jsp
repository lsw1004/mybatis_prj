<%@page import="java.util.List"%>
<%@page import="day1224.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>컬럼하나에 여러 행 조회</h2>
<script type="text/javascript">
$(function(){
	$("#btn").click(function() {
		$("#frm").submit();
	});// click
})
</script>
<form name="frm" id="frm" action="index.jsp">
<input type="hidden" name="url" value="${param.url}">
<label for="deptno">부서번호</label>
<input type="text" name="deptno">
<input type="button" id="btn" value="검색" class="btn btn-info btn-sm">
</form>
<div id="output">
<c:if test="${not empty param.deptno }">
<%
String deptno = request.getParameter("deptno");
SelectService ss = SelectService.getInstance();
List<String> enameList = null;
try{
	enameList = ss.scmr(Integer.parseInt(deptno));
}catch(NumberFormatException nfe){
		
}
pageContext.setAttribute("enameList", enameList);
%>
<c:out value="${param.deptno }"/>번 부서 사원 리스트<br>
<c:forEach var="ename" items="${enameList}" varStatus="i">
<input type="checkbox" name="ename" value="${ename}"><c:out value="${i.count }"/>.
<c:out value="${ename}"/> 
</c:forEach>
<c:if test="${empty enameList }">
<img src="images/na.jpg" style="width: 300px;height: 260px;">

</c:if>
</c:if>
</div>