<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 표현식 -->
	str : <%=getStr()%>
	
	<!-- 선언문 -->
	<%!
		// 멤버변수 선언 
		String str = "hello";
	
		// 메소드 선언 
		public String getStr() {
			return str;
		}
	%>
</body>
</html>