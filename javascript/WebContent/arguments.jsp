<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function test() {
		// return undefined 
		if (arguments.length < 3) return;
		
		// 반복문으로 값 확인하기
		for (var i=0, len = arguments.length; i<len; i++) {
			console.log(arguments[i]);
		}
		
		// 다른 메소드의 인자로 활용
		otherMethod(arguments[1]);
		
		function otherMethod(a) {
			console.log(a);
		}
	}
	
	// 매개변수 선언이 되지 않은 함수에도 매개변수를 넣을 수 있다.
	// 함수 내에서 선언되지 않은 매개변수 값들은 arguments 라는 내장 배열에 저장된다.
	test(1, 2, 3);
</script>
</head>
<body>

</body>
</html>