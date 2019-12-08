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
	var oReq = new XMLHttpRequest();
	oReq.addEventListener("load", function() {
		document.write(this.responseText);
		// string 타입의 응답 데이터를 json 객체로 변환
		var jsonObj = JSON.parse(this.responseText);
	});
	
	oReq.open("GET", "./json.txt");
	oReq.send();
</script>
</body>
</html>