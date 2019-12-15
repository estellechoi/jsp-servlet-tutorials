<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li {
		list-style: none;
	}
</style>
</head>
<body>
<h1>Template Using Handlebar</h1>
<section class="show">


</section>

<!-- html template -->
<script type="myTemplate" id="listTemplate">
	<li>
     <div>게시자 : {{name}}</div>
     <div class="content">{{content}}</div>
     <div>좋아요 갯수 <span> {{like}} </span></div>
     <div class="comment">
       <div>{{comment}}</div>
     </div>
  </li>
</script>

<!-- javaScript -->
<!-- handlebar library 다운로드 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.5.3/handlebars.min.js" integrity="sha256-GwjGuGudzIwyNtTEBZuBYYPDvNlSMSKEDwECr6x6H9c=" crossorigin="anonymous"></script>
<script>
	var template = document.querySelector("#listTemplate").innerText;
	//  * pre compile
	// Handlebars.compile(template) : 인자값이 들어오면 template {{}} 에 맞추어 넣어주고 결과를 반환하는 함수를 반환한다.
	var bindTemplate = Handlebars.compile(template);
	
	var data = {
		  	"id" : 88,
		    "name" : "crong",
		    "content" : "새로운글을 올렸어요",
		    "like" : 5, 
		    "comment" : "댓글이다"
		};
	
	var resultHTML = bindTemplate(data);
	
	var show = document.querySelector(".show");
	show.innerHTML = resultHTML;
</script>
</body>
</html>