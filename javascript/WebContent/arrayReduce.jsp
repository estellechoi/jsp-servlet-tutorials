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

	// 배열의 모든 요소에 대해 콜백함수를 호출, (initialValue + 콜백함수의 리턴값 누적)하여 반환
	// array.reduce(function, initialValue);
	var total = data.reduce(function(preValue, v) {
		document.write("preValue : " + preValue + " + " + v.price + " = " + (preValue + v.price) + "<br />");
		return preValue + v.price;
	}, 10000);
	// preValue : accumulator ?
	// 콜백의 반환값을 누적한다. 
	// 콜백의 이전 반환값 또는, 콜백의 첫 번째 호출이면서 initialValue를 제공한 경우에는 initialValue의 값입니다.
	document.write(total);
</script>
</body>
</html>