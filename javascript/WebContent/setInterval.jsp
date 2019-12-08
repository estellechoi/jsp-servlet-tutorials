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
	const interval = window.setInterval(()=> {
		  console.log('현재시각은', new Date());
		},1000/60);

		window.clearInterval(interval);
</script>
</body>
</html>