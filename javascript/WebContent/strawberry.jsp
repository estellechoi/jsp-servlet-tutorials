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
// strawberry 아래에 새로운 과일을 하나 더 추가하시오.
var newList = document.createElement("li");
var fruit = document.createTextNode("pear");
newList.appendChild(fruit);

var list = document.querySelector("ul");
list.appendChild(newList);
</script>
</body>
</html>