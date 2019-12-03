<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function strings() {
		
		// 문자열을 객체로 변환 후 사용할 수 있는 메소드들 
		var arr = "a:b".split(":");
		var trimed = "  ab   ".trim();
		var replaced = "a:b".replace(":", "$");
		
		document.write(arr + "<br>");
		document.write(trimed + "<br>");
		document.write(replaced + "<br>");
		document.write(toString.call(arr));
	}
</script>
</head>
<body>
	<input type="button" value="ok" onclick="strings()">
</body>
</html>