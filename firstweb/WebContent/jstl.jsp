<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 지시문을 통해 태그 라이브러리 사용을 설정한다. -->
<!-- uri :uri 에서 지정한 JSTL 을 사용하겠다고 설정 -->
<!-- prefix="c" : 코어 태그 사용하겠다고 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 변수 설정 -->
<c:set var="value" scope="request" value="hello" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${value} <br />
	
	<!-- 변수 삭제 -->
	<c:remove var="value" scope="request" />
</body>
</html>