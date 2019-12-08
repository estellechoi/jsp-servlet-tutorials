<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="test"></ul>
		
	<script>
		var test = document.querySelector(".test");
		var data = [
					{
						title : "hello",
						content : "lorem dkfief",
						price : 2000
					},
					{
						title : "world",
						content : "lorem dkfief",
						price : 3000
					},
					{
						title : "youjin",
						content : "lorem dkfief",
						price : 10000
					}
			
		];
		
		// html template literal
		// 내장된 표현식을 허용하는 문자열 리터럴 이다.
		var resultHTML = "";
		data.forEach(function (obj) {
				resultHTML += `
					<li>
						<h4>${2+4}</h4>
						<p>${obj.content}</p>
						<div>${obj.price}</div>
					</li>
				`;					
		});
		// ${} 이 부분 인식이 왜 안되지 ? ㅜ
		
		document.querySelector(".test").innerHTML = resultHTML;
	
	</script>
</body>
</html>