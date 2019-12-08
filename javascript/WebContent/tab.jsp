<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h4 {
		text-align: center;
		margin: 0px;
	}

	.tab {
		width: 600px;
		margin: 0px auto;
	}
	.tab-menu {
		background: pink;
	}
	.tab-menu > div {
		display: inline-block;
		width: 146px;
		height: 50px;
		line-height: 50px;
		text-align: center;
/* 		margin: auto; */
		cursor: pointer;
	}
	
	.tab-content {
		background: antiquewhite;
		padding: 5%;
	}
</style>
</head>
<body>
	<div class="tab">
		<div class="tab-menu">
			<div>youjin</div>
			<div>bomin</div>
			<div>donghyun</div>
			<div>jinhong</div>
		</div>
		<section class="tab-content">
			<h4>hello bomin</h4>
			<p>golf, facebook</p>
		</section>
	</div>
	
	<script>
		// 3)
		function makeTemplate(data, clickedName) {
			var html = document.querySelector("#tab-content-template").innerHTML;
			var resultHTML = "";
			data.forEach(function(obj) {
				if (obj.name == clickedName) {
					resultHTML += html.replace("{name}", obj.name)
						 			 .replace("{favorites}", obj.favorites);					
					break;
				}
			});
			 
			document.querySelector(".tab-content").innerHTML = resultHTML;
		}
		
		// 2)
		function sendAjax(url, clickedName) {
			var oReq = new XMLHttpReqeust();
			oReq.addEventListener("load", function() {
				// json 데이터를 문자열로 파싱
				var data = JSON.parse(oReq.responseText);
				makeTemplate(data, clickedName);
			});
			oReq.open("GET", url);
			oReq.send();	
		}
		
		// 1)
		var tabmenu = document.querySelector(".tab-menu");
		tabmenu.addEventListener("click", function(evt) {
			// (요청 데이터를 가진 url, 클릭된 요소)
			sendAjax("./json.txt", evt.target.innerText);
		});
		
// 		같은 Tab 메뉴를 다시 누를 때 또 Ajax 통신을 해야 할까요?
// 		이미 가져온 데이터를 보관하고 재사용하는 건 어떨까요? 
	</script>
	<!-- html template -->
	<script id="tab-content-template" type="template">
		<h4>hello {name}</h4>
		<p>{favorites}</p>
	</script>
</body>
</html>