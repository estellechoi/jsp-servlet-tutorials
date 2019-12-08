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
	<li>apple</li>
	<li>orange</li>
	<li>banana</li>
	<li>grape</li>
	<li>strawberry</li>
</ul>

<script>

// apple을 grape 와 strawberry 사이로 옮기시오.

var list = document.querySelector("ul");
var apple = document.querySelector("li:nth-child(1)");
var strawberry = document.querySelector("li:nth-child(5)");

list.insertBefore(apple, strawberry);
</script>
</body>
</html>