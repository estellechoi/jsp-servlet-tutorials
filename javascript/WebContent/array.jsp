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
		// 배열 선언
		// new Array() 도 가능하지만, [] 와의 성능차이가 없기 때문에 현업에서는 특별한 경우가 아니면 []를 사용한다.
		var a = [];

		// 배열의 요소는 모든 타입 가능
		var b = [ 1, 2, 3, "hello", null, true, [[{1:0}]]];
		document.write(b.length + "<br/>");
		document.write(b[6] + "<br/>");
		
		// index 로 배열 조작하기
		var c = [4]; // index 0 선언
		c[1000] = 3; // index ~ 1000 까지 중간 요소들도 자동으로 선언
		document.write(c.length + "<br/>");
		document.write(c[500] + "<br/>"); // 중간 요소들의 값은 아직 undefined
		
		// push() 메소드로 요소를 순차적으로 추가하기
		// undefined 값을 가진 요소에 값이 할당되는 것이 아니다.
		// 새로운 요소를 추가로 선언하고, 새로운 요소에 값이 추가된다.
		c.push(5); // index 1001 선언
		document.write(c[1001] + "<br/>");
		
		// indexOf()
		// 없는 값이면, -1 반환
		document.write(c.indexOf(3) + "<br/>");
		
		// join() : 요소들을 문자열로 합치기 (undefined 요소는 공백으로 표시되고 , 는 생략되지 않음)
		document.write(c.join() + "<br/>");
		
		// slice()
		
		
		// concat() : 배열 요소 합치기
// 		var result = c.concat(1,2);
		
		// spread operator
		var result = [...c, 1, 2];
		
		document.write(result); // index 1002, 1003 추가됨
	</script>
</body>
</html>