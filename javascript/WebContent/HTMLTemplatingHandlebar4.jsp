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
	
	span {
		color: lightblue;
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
        <div>
		{{#likes like}}
			{{like}}
		{{/likes}}
		</div>
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
	// handlebar helper 등록하기
	Handlebars.registerHelper("likes", function(like) {
		if (like > 4) {
			return "<span>축하해요, 좋아요가 " + like + " 개 이상입니다 !</span>";
		}
		else if (like < 1) {
			return "<span>아직 아무도 좋아하지 않아요 ... :(</span>";
		}
		else {
			return "<span>" + like + " 개의 좋아요가 있네요 !</span>";
		}
	});
	
	var show = document.querySelector(".show");
	var template = document.querySelector("#listTemplate").innerText;
	var bindTemplate = Handlebars.compile(template);
	
	var data = [
		{"id" : 88, "name" : "crong", "content" : "새로운글을 올렸어요", "like" : 5, "comment" : ["댓글이다", "잘했어요"]},
		{"id" : 28, "name" : "hary", "content" : "전 오늘도 노래를 불렀어요", "like" : 0, "comment" : ["제발고만..","듣고싶네요 그노래"]},
		{"id" : 23, "name" : "pororo", "content" : "크롱이 항상 말썽을 피워서 행복해~", "like" : 4, "comment" : []},
		{"id" : 5, "name" : "pobi", "content" : "물고기를 한마리도 잡지 못하다니..", "like" : 5, "comment" : ["댓글이다", "멋진글이네요", "잘봤습니다"]}
	];
	
	var html = data.reduce(function(pre, obj) {
					return pre + bindTemplate(obj);
				}, "");
		
	show.innerHTML = html;
</script>
</body>
</html>