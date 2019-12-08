<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.test {
		position: relative;
		background: grey;
	}
</style>
</head>
<body>
<span class="test">hello</span>
<script>
	var count = 0;
	var test = document.querySelector(".test");
	test.style.left = "0px";
	
	function run() {
		if (count > 50) return;
		count++;
		test.style.left = parseInt(test.style.left) + count + "px";
		requestAnimationFrame(run);
	}
	
	// 브라우저에서 제공하는 메소드
	requestAnimationFrame(run);
	
</script>
</body>
</html>