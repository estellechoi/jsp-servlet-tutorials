<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script>
	function ajax(data) {
		var oReq = new XMLHttpRequest(); // 1) XMLHTTPRequest 객체를 만든다.
		
		// 이벤트리스너 콜백함수 !
		// 4) 서버에서 응답이 오면, 콜백함수가 실행된다. (stack 상 ajax() 함수는 남아있지 않음)
		oReq.addEventListener("load", function() {
			document.write(this.responseText);
		});
		
		String url = "";
		oReq.open("GET", url); // 2) 지정된 url과 메소드로 서버에 요청을 보내기 위해 준비한다.
		oReq.send(); // 3) 서버에 요청을 보낸다. (이때 ajax() 함수는 실행이 끝났으므로 stack에서 사라지고, 콜백함수의 실행이 시작됨)
	}
</script>
</html>