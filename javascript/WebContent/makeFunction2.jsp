<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	// 자바스크립트는 함수가 실행되기 전, 함수 안에 필요한 변수값들을 미리 모아서 선언한다.
	// 함수 안에 있는 변수들을 모두 끌어올려서 선언한다고 해서 hoisting 이라고 한다.

	// 함수 선언문
	function test() {
		// 함수 undefined
		var name = printName();
		console.log(name);

		// 함수 호출됨
		var age = printAge();
		console.log(age);
		
		
		// 함수 표현식 -> hoisting : var printName;
		var printName = function() {
			return "hello";
		}
		
		// 함수 선언문 -> hoisting : function printAge();
		function printAge() {
			return "27";
		}
	}
	
	// 함수 호출
	test();
	
	//  undefined : 선언은 되었으나 값이 할당되지 않은 변수값 
</script>
</head>
<body>

</body>
</html>