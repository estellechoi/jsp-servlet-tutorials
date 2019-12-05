<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 지정한 url 에 연결하여 결과를 scope 와 변수에 저장한다. -->
<c:import url="http://localhost:8080/firstweb/jstlImportTest.jsp" var="urlValue" scope="request" />

<!-- <c:param name="name" value="value" /> -->
<!-- 지정한 url 에 연결할 때 전송할 파라미터값 (url?name=value 과 같다.) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${requestScope.urlValue}
</body>
</html>