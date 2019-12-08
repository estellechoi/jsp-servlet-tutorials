<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>selector test</h1>
<ul>
	<li class="red">apple</li>
	<li class="red">orange</li>
	<li>banana</li>
	<li>grape</li>
	<li>strawberry</li>
</ul>

<script>

// class 가 'red'인 노드만 삭제하시오.
var ul = document.querySelector("ul");
var reds = document.querySelectorAll("li.red");

reds.forEach(function(value, index) {
// 	ul.removeChild(reds[index]);
reds[index].remove();
});

</script>
</body>
</html>