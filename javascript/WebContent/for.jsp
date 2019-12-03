<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function testFor() {
		// for 문이 돌 때마다 arr.length 를 계산하지 않도록, len 변수에 할당 후 사용하는 것이 효율적이다.
		var arr = [ 1, 2, 3 ];
		for (var i = 0, len = arr.length; i < len; i++) {

		}
	}

	function testFor2() {
		// reverse for 문을 사용하는 것도 효율적이다.
		var arr = [ 1, 2, 3 ];
		for (var i = arr.length - 1; i >= 0; i--) {

		}
	}
	
	// 배열의 경우 forEach 메소드도 있고, for-of 를 통한 탐색도 자주 이용된다.
	// for-in 은 객체 탐색 시 많이 사용된다.
</script>
</head>
<body>

</body>
</html>