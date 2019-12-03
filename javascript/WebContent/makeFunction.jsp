<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function printName(username) {
			var job = "programmer";
			return job + " " + username;
		}
		
		// 1) 매개변수가 있는 함수를 호출할 때, 매개변수 값이 할당되지 않으면 undefined 타입이 된다.
		console.log(printName());
		
		// 2) 매개변수의 수와 일치하게 값을 줄 때 
		console.log(printName("youjin"));
		
		// 3) 매개변수의 개수보다 많거나 작은 개수의 인자 값을 주더라도 오류 발생하지 않는다.
		console.log(printName("youjin", "bomin"));
	</script>
</head>
<body>

</body>
</html>