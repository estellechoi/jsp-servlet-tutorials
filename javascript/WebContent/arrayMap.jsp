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
		var data = [ {
			title : "hello",
			content : "let's test it.",
			price : 12000
		}, {
			title : "skirt",
			content : "long satin dress",
			price : 22000
		}, {
			title : "t-shirt",
			content : "sleeveless cottom shirt",
			price : 5500
		} ];
		
		var newPrice = data.map(function(v) {
			return v.price * 1.1;
			// 리턴값을 요소로하는 배열 반환
			// 10% 인상된 price 값을 요소로하는 배열 반환
		});
		
		var dataMapped = data.map(function(v) {
			var obj = {title: v.title, content: v.content, price: v.price * 10};
			return obj;
		});
		// 출력
		// console.table(dataMapped);
		dataMapped.forEach(function(v) {
			document.write(v.title + " / " + v.content + " / " + v.price + "<br />");
		});
	</script>
</body>
</html>