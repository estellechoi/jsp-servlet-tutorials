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
		// application.getAttribute() 값이 없는 경우 예외 발생 가능
		// try catch 로 예외 피하기
		try {
			// application 객체에서 "value" 라는 이름의 값 가져오기
			int value = (int) application.getAttribute("value");

			// value 값을 바꾸고 다시 application 객체에 추가하기
			value = value + 2 ;
			application.setAttribute("value", value);
	%>
		value : <%=value%>
	<%
		} catch (NullPointerException e) {
	%>
		value : null;
	<%	
		}
	%>
</body>
</html>