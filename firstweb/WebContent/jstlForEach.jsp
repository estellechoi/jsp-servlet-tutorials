<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 스크립트릿 -->
<%
	List<String> list = new ArrayList<String>();
	list.add("hello");
	list.add("world");
	list.add("!");
	
	// requestScope 에 List 객체 저장
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 배열 및 Collection 의 요소를 차례대로 처리한다. -->
	<!-- items : 처리할 요소들을 갖고 있는 객체 -->
	<!-- var : 요소 하나를 담을 변수 -->
	<c:forEach items="${requestScope.list}" var="item" >
		${item} <br />
	</c:forEach>

	<!-- begin, end 속성 추가해보기 -->
	<!-- 0 번 인덱스의 요소는 출력되지 않음 -->
	<c:forEach items="${requestScope.list}" var="item" begin="1">
		${item} <br />
	</c:forEach>
</body>
</html>