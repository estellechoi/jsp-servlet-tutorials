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
	var fruits = ["apple", "banana"];
	var numbers = [1,2,3];
	
	// for 문으로 요소 출력하기
	for (var i = 0; i < fruits.length; i++) {
		document.write(fruits[i] + "<br/>")
	}
	
	// forEach() 메소드 : 함수를 동작하는 메소드
	fruits.forEach(function(value, index, object) {
		document.write(value + " " + index + " " + object + "<br/>");
	});
	
	// map() 메소드 : 
	// 리턴함수를 동작하고, 리턴값을 모아 새로운 배열을 만들어 반환하는 메소드 (, 포함)
	var mapped1 = fruits.map(function(value, index) {
		return index + " " + value + "<br/>";
	});	
	document.write(mapped1);
	
	var mapped2 = numbers.map(function(value) {
		return value * 2 + "<br/>";
	});
	document.write(mapped2);
	
	
	// filter() 메소드 :
	// 각 요소가 조건에 대해 true 이면 유지하고, false 이면 제거하여 새로운 배열을 만들어 반환하는 메소드
	// filter()는 호출되는 배열을 변화시키지(mutate) 않습니다.
	var filtered1 = numbers.filter(value => value <= 2);
	document.write(filtered1 + "<br/>");
	
 	var filtered2 = numbers.filter(function(value) {
 		return value > 2;
 	});
 	document.write(filtered2);
	
	
	
</script>
</body>
</html>