<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>JS Bin</title>
</head>
<body>
	<h1>selector test</h1>
	<section>
		<h2>red section</h2>
		<ul>
			<li class="red">apple</li>
			<li class="red">orange</li>
			<li>banana</li>
			<li>grape</li>
			<li>strawberry</li>
		</ul>
	</section>
	<Br>
	<section>
		<h2>blue section</h2>
		<ul>
			<li class="green blue">apple</li>
			<li class="red">orange</li>
			<li>banana</li>
			<li>grape</li>
			<li>strawberry</li>
		</ul>
	</section>
	<script>
		// section 태그의 자손 중에 blue라는 클래스를 가지고 있는 노드가 있다면, 그 하위에 있는 h2 노드를 삭제하시오.
		var blues = document.querySelectorAll("section .blue");

		// blues 는 NodeList, not array
	
		// NodeList 가 Array 는 아니지만, forEach() 를 사용하여 반복할 수 있습니다.
		// 또한 Array.from() 을 사용하여 Array 로 변환 할 수도 있습니다.
		// 그러나 일부 오래된 브라우저는 아직NodeList.forEach() 또는 Array.from() 를 구현하지 않았습니다.
		// 이것은 Array.prototype.forEach() 를 사용하여 회피할 수 있습니다.
		
		Array.from(blues).forEach(function(v) {
			var section = v.closest("section");
			var h2 = section.querySelector("h2");
			section.removeChild(h2);
		});
	</script>
</body>
</html>