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

// insertAdjacentHTML 메서드를 사용해서, orange와  banana 사이에 새로운 과일을 추가하시오.
// var pear = document.createElement("li");
// var text = document.createTextNode("pear");
// pear.appendChild(text);

// var list = document.querySelector("ul");
var banana = document.querySelector("li:nth-child(3)");

banana.insertAdjacentHTML("beforebegin", "<li>pear</li>");
</script>
</body>
</html>