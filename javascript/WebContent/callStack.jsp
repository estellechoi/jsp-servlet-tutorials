<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function printName(greeting) {
		
		var myName = "youjin";
		return greeting + " " + myName;
		
	}
	
		// 1) 호출스택에 setGreeting() 메소드가 쌓인다.
	function setGreeting(greeting) {
			
		var greeting = greeting || "hello";
		
		// 2) 다른 함수 호출시, setGreeting() 함수는 종료되지 않고 호출스택에 그대로 존재하며 대기 상태가 된다.
		// 3) printName() 함수는 실행되는 동안 호출스택에 쌓였다가
		// 4) 값을 반환하면서 호출스택에서 사라진다.
		var result = printName(greeting);
		
		// 5) 호출스택에는 setGreeting() 메소드만 남는다.
		document.write(result);
		
		// 6) setGreeting() 메소드도 호출스택에서 사라진다.
	}
	
</script>
</head>
<body>
<input type="button" value="ok" onclick="setGreeting()">

</body>
</html>