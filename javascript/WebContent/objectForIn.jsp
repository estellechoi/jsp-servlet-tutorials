<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	var obj = {
		name : "estelle",
		age : 27,
		career : [{logistics : "Hyundai Glovis"}, {it : "woowabros"}]
	}
	
	// for (key in object) : 변수 key 에 각 key 값이 할당된다.
	for (key in obj) {
		document.write(key + " " + obj[key] + "<br/>");
	}

	document.write("<hr/>");
	
	// Object.keys(object) 메소드 : object 객체의 key 값들로 배열을 만들어 반환한다.
	document.write(Object.keys(obj) + "<br/>");
	
	Object.keys(obj).forEach(function(value) {
		document.write(obj[value] + "<br/>");
	});
</script>
</body>
</html>