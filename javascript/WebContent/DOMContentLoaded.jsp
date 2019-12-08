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
	background: pink;
	width: 100px;
	left: 100px;
	/* scale(2) : 원래 크기의 2배로 */
	transform: scale(1);
	transition: all 0.5s ease-out;
	/*  		transition: transform 2s; */
}
</style>
</head>
<body>
	<div class="test" style="left: 100px">hello</div>
	<input type="button" value="click" id="btn" />
	<script>
		function init() {
			var test = document.querySelector(".test");
			var btn = document.querySelector("#btn");

			btn.addEventListener("click", function() {
				var left_pre = parseInt(test.style.left); // inline style 값만 불러올 수 있다?
				test.style.transform = "scale(2)";
				test.style.left = left_pre + 50 + "px";
			});
		}

		// 보통 DOM tree가 다 만들어지면 DOM APIs를 통해서 DOM에 접근할 수 있기 때문에, 
		// 실제로 실무에서는 대부분의 자바스크립트코드는 DOMContentLoaded 이후에 동작하도록 구현한다. 
		// 그 방법이 로딩속도 성능에 유리하다고 생각하기 때문이다.
		document.addEventListener("DOMContentLoaded", function() {
			init();
		});
		window.addEventListener("load", function() {

		});
	</script>
</body>
</html>