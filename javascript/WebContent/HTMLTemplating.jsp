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
	<input type="button" value="click" id="btn" />
	
	<!-- html template 코드 숨기기 : javascript 코드에 정적인 코드 보관하지 않기 위함 -->
	<!-- script 태그의 type 이 text/javascript 가 아니면, 브라우저는 렌더링하지 않고 무시한다 -->
	<script type="text/template" id="html-template">
		<li>
			<h4>{title}</h4><p>{content}</p><div>{price}</div>
		</li>
	</script>
	
	<script>
		var html = document.querySelector("#html-template").innerHTML;
		var test = document.querySelector(".test");
		var btn = document.querySelector("#btn");
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
		
		// template
// 		var html = "<li><h4>{title}</h4><p>{content}</p><div>{price}</div></li>";
		
// 		var resultHTML = [];
// 		data.forEach((obj)=> {
// 			resultHTML.push(
// 				html.replace("{title}", obj.title)
// 					.replace("{content}", obj.content)
// 					.replace("{price}", obj.price)
// 			);
// 		});
		
		
		var i = 0;
		document.addEventListener("DOMContentLoaded", function() {
			var resultHTML = html.replace("{title}", data[i].title)
								 .replace("{content}", data[i].content)
								 .replace("{price}", data[i].price);		
			test.innerHTML = resultHTML;
		});
		
		btn.addEventListener("click", function() {
			i++;
			var resultHTML = html.replace("{title}", data[i].title)
								 .replace("{content}", data[i].content)
			 					.replace("{price}", data[i].price);		
			test.innerHTML = resultHTML;
			
		});
		
	</script>
</body>
</html>