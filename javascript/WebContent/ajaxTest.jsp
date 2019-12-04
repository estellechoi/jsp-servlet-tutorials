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
	function reqListener() {
		document.write(this.responseText); // 4) 서버에서 응답한 데이터를 responseText로 호출하여 출력
	}
	
	var oReq = new XMLHttpRequest();

	oReq.addEventListener("load", reqListener); // 3) load 이벤트 발생시 reqListener 메소드 실행
	oReq.open("GET", "./etc/json.txt"); // 1) GET 메소드로 json.txt 파일을 서버에 요청하기 위해 준비
	oReq.send(); // 2) 요청 전송

	</script>
</html>