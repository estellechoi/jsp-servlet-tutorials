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
 	<h1>방명록</h1>
 	<br /> 방명록 전체 수 : ${count}
 	<br />
 	<br />
	<c:forEach items="${list}" var="guestbook">
		${guestbook.id} <br />
		${guestbook.name} <br />
		${guestbook.content} <br />
		${guestbook.regdate} <br />
	</c:forEach>
	<br />
	
	<!-- status.index : 0 부터 레코드의 순서 -->
	<c:forEach items="${pageStartList}" var="pageStart" varStatus="status">
		<a href="list?start=${pageStart}">${status.index + 1}</a>
		&nbsp;&nbsp;
	</c:forEach>
	
	<br />
	<br />
	<form action="write" method="post">
		<input type="text" name="name" placeholder="name" /><br />
		<textarea name="content" cols="60" rows="6"></textarea><br />
		<input type="submit" value="Save" />
	</form>
</body>
</html>