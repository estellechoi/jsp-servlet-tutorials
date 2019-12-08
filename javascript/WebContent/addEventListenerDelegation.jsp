<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><img src="https://images-na.,,,,,/513hgbYgL._AC_SY400_.jpg"
			class="product-image"></li>
		<li><img src="https://images-n,,,,,/41HoczB2L._AC_SY400_.jpg"
			class="product-image"></li>
		<li><img src="https://images-na.,,,,51AEisFiL._AC_SY400_.jpg"
			class="product-image"></li>
		<li><img src="https://images-na,,,,/51JVpV3ZL._AC_SY400_.jpg"
			class="product-image"></li>
	</ul>
	<section class="log"></section>
	
	<script>
		var log = document.querySelector(".log");
		var lists = document.querySelectorAll("ul > li");
		var ul = document.querySelector("ul");
		
		// for 문으로 이벤트 등록하기 (비효율)
		/*
		for (var i=0; i<lists.length; i++) {
			lists[i].addEventListener("click", function(evt) {
				log.innerHTML = "clicked : " + evt.currentTarget.firstElementChild.src;
			});
		}
		*/
		
		// 그런데 list가 훨씬 더 많다면 브라우저는 기억해야 할 이벤트 리스너도 그만큼 많아집니다. 비효율적이죠.		
		// 만약 list가 한 개 더 동적으로 추가된다면 어떻게 될까요? 네, 추가된 엘리먼트에 역시 addEventListener를 해줘야 합니다.
				
				
				
		// * 이벤트 버블링 : 이벤트가 등록된 요소에 포함된 요소들에 대해서도 이벤트가 발생한다.
		// 클릭한 지점이 하위엘리먼트라고 하여도, 그것을 감싸고 있는 상위 엘리먼트까지 올라가면서 이벤트리스너가 있는지 찾는 과정입니다.
		// currentTarget : ul (이벤트가 등록된 요소) -> event delegation(대표자)
		// target : img (실제 클릭한 요소)
		ul.addEventListener("click", function(evt) {
// 			log.innerHTML = evt.currentTarget.tagName + ", " + evt.target.tagName;
			if(evt.target.tagName === "IMG") {
				log.innerHTML = "clicked : " + evt.target.src;
			}
			else if(evt.target.tagName === "LI") {
				log.innerHTML = "clicked : " + evt.target.firstElementChild.src;
			}
		});
		
		
		
	</script>
</body>
</html>