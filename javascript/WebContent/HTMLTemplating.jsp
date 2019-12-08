<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="test"></section>
	<input type="button" value="click" id="btn" />
	<script>
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
		var html = "<li><h4>{title}</h4><p>{content}</p><div>{price}</div></li>";
		
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