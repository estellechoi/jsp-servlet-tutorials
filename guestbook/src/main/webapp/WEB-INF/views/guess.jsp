<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>행운의 숫자 맞추기</h1>
	<h3>${msg}</h3>
	<!-- 숫자를 맞추면 session 의 count 가 삭제되므로 null -->
	<c:if test="${sessionScope.count != null}">
		<form action="guess" method="get">
			1 부터 100 까지의 숫자 중 단 하나의 행운의 숫자를 맞추세요. <br />
			<input type="text" name="number"> <br />
			<input type="submit" value="확인">
		</form>
	</c:if>
	<a href="guess">다시 시작하기</a>
</body>
</html>