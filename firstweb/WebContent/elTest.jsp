<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--  스크립트릿  -->
<%
	pageContext.setAttribute("page", "page scope value");
	request.setAttribute("request", "request scope value");
	session.setAttribute("session", "session scope value");
	application.setAttribute("application", "application scope value");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	pageContext.getAttribute("page") : ${pageScope.page} <br />
	request.getAttribute("request") : ${requestScope.request} <br />
	session.getAttribute("session") : ${sessionScope.session} <br />
	application.getAttribute("application") : ${applicationScope.application} <br />
	<hr />
	<!-- scope 값을 불러오는 이름(변수)가 1 개일 때 (동명 이름이 없을 때) 객체명 생략이 가능하다. -->
	pageContext.getAttribute("page") : ${page} <br />
	request.getAttribute("request") : ${request} <br />
	session.getAttribute("session") : ${session} <br />
	application.getAttribute("application") : ${application} <br />

</body>
</html>