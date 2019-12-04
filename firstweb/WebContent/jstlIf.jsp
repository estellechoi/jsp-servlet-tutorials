<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 1) 스크립트릿  -->
<%-- <%
	request.setAttribute("n", 10);
%> --%>

<!-- 2) JSTL -->
<c:set var="n" scope="request" value="10" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 조건이 맞지 않으면 실행되지 않는다. -->
	<c:if test="${n == 0}">
		n 과 0은 같습니다.
	</c:if>
	<c:if test="${n == 10}">
		n 과 10은 같습니다.
	</c:if>
</body>
</html>