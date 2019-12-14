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
	
	var newData = data.filter(function(v) {
		return v.price > 10000;
		// 리턴값이 true 인 요소만으로 재구성된 배열 반환
	});
	
	// 출력
	newData.forEach(function(v) {
		document.write(v.title + " / " + v.content + " / " + v.price + "<br />")
	});
	
	// 함수 체인
	var mappedData = data.filter(function(v) {
		return v.price > 10000;
	}).map(function(v) {
		// 원본 데이터 유지하기 (immutable)
		var obj = {};
		obj.title = v.title;
		obj.content = v.content;
		obj.price = (v.price + "").replace(/^(\d+)(\d{3})$/, "$1, $2원");
		return obj.price;
	});

	// 출력
	mappedData.forEach(function(v) {
		document.write(v + "<br />");
	});
</script>
</body>
</html>