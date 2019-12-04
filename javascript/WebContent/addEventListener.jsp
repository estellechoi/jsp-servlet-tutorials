<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="test">hello</div>
</body>
<script>
	var test = document.querySelector("#test");
	test.addEventListener("click", function(e) {
		var target = e.target;
		document.write("clicked", e, target.id, target.nodeName, target.innerText);
	});
	
	// 이벤트 리스너의 매개변수 e 에는 이벤트 정보가 들어온다.
</script>
</html>