<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- isELIgnored = "true" : EL 을 무시하고 텍스트로 인식하기 -->
<%@ page isELIgnored = "false" %>
<%
	request.setAttribute("key", 10);
	request.setAttribute("isTrue", true);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	key : ${key} <br />
	key + 1 : ${key + 1} <br />
	key - 1 : ${key - 1} <br />
	key * 1 : ${key * 1} <br />
	key / 1 : ${key div 1} <br />
	key > 1 : ${key > 1} <br />
	key < 1 : ${key < 1} <br />
	key <= 1 : ${key <= 1} <br />
	key >= 1 : ${key >= 1} <br />
	<hr />
	isTrue : ${isTrue} <br />
	!isTrue : ${!isTrue} <br />
	
</body>
</html>