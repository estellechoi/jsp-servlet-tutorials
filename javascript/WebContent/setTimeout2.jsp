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
// 	setTimeout(()=> {
// 		console.log(new Date());
// 	}, 500);

	let count = 0;
	
	function animate() {
		setTimeout(()=> {
			if (count >= 20) return; // 리턴 (실행이 중지됨)
			console.log(new Date());
			count++;
			animate();
		}, 500);
	}
	
	animate();
	
</script>
</body>
</html>