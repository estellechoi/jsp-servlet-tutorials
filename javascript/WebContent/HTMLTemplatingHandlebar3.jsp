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
		border: 1px solid grey;
		margin: 5px;
		padding: 5px;
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
        <div>좋아요<span> {{like}} </span></div>
        <div class="comment">
        <h4>댓글목록</h4>
		{{#if comment}}
	        {{#each comment}}
    	        <div>{{@index}}번째 : {{this}}</div>
        	{{/each}}
		{{else}}
			<div>댓글이 아직 없군요 :)</div>
		{{/if}}
        </div>
    </li>
</script>	
<!-- javaScript -->
<!-- handlebar library 다운로드 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.5.3/handlebars.min.js" integrity="sha256-GwjGuGudzIwyNtTEBZuBYYPDvNlSMSKEDwECr6x6H9c=" crossorigin="anonymous"></script>
<script>
	var show = document.querySelector(".show");
	var template = document.querySelector("#listTemplate").innerText;
	var bindTemplate = Handlebars.compile(template);
	// Handlebars.compile(template) : 인자값이 들어오면 template {{}} 에 맞추어 넣어주고 결과를 반환하는 함수를 반환한다.
	
	// 데이터 자체가 배열인 경우 처리
	var data = [
		{"id" : 88, "name" : "crong", "content" : "새로운글을 올렸어요", "like" : 5, "comment" : ["댓글이다", "잘했어요"]},
		{"id" : 28, "name" : "hary", "content" : "전 오늘도 노래를 불렀어요", "like" : 0, "comment" : ["제발고만..","듣고싶네요 그노래"]},
		{"id" : 23, "name" : "pororo", "content" : "크롱이 항상 말썽을 피워서 행복해~", "like" : 4, "comment" : []},
		{"id" : 5, "name" : "pobi", "content" : "물고기를 한마리도 잡지 못하다니..", "like" : 5, "comment" : ["댓글이다", "멋진글이네요", "잘봤습니다"]}
	];
	
	// forEach() 사용
// 	var html = "";
// 	data.forEach(function(obj) {
// 		var resultHTML = bindTemplate(obj);
// 		html +=	resultHTML;	
// 	});
	
	// array.reduce() 사용
	var html = data.reduce(function(pre, obj) {
					return pre + bindTemplate(obj);
				}, "");
	// (initial value + 각 요소의 값 누적) 값을 반환
		
	show.innerHTML = html;
</script>
</body>
</html>