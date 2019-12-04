<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int value1 = (int) request.getAttribute("value1");
		int value2 = (int) request.getAttribute("value2");
		int sum = (int) request.getAttribute("sum");
	%>

	<%=value1%>
	+
	<%=value2%>
	=
	<%=sum%>
</body>
</html>