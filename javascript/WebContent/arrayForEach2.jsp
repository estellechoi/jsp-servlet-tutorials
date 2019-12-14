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
	var data = [{title: "hello", content: "let's test it.", price: 12000},
				{title: "skirt", content: "long satin dress", price: 22000},
				{title: "t-shirt", content: "sleeveless cottom shirt", price: 5500}];
	
	for (var i=0; i<data.length; i++) {
		document.write(data[i].title + ": " + data[i].price + "<br />");
	}
	
	function print(v) {
		document.write(v.title + ": " + v.price + "<br />");		
	}
	
	data.forEach(print); // 함수명으로 호출하면 인자값이 자동으로 들어간다.
</script>
</body>
</html>