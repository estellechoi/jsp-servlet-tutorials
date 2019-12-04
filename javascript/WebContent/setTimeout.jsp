<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// window 는 전역 객체이므로 생략 가능
// window.setTimeout();
// 1) 비동기 함수 -> 스택이 다 비워지고 나서 마지막에 실행된다. (0ms 설정을 해도 스택 내 함수가 모두 실행된 후 실행)
// 2) 인자로 함수를 받는다. -> 콜백함수 (나중에 실행되는 함수) 

	function test() {
		setTimeout(function() {
			var msg = "hello world";
			document.write(msg);
		},1000);
	}
	// 1초 (1000ms) 후에 콜백함수 실행
	
</script>
</head>
<body>
	<input type="button" value="ok" onclick="test()" >
</body>
</html>