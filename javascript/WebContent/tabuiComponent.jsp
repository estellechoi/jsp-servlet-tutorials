<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 {
		text-align: center;
	}
	.tab {
		border: 1px solid #eeeeee;
		padding: 10px 20px;
	}
	.tabmenu > div {
		display: inline-block;
		text-align: center;
		margin: 15px auto;
		cursor: pointer;
	}
	
	.content {
		border: 1px solid #eeeeee;
		padding: 10px;	
	}
	
	.content h4 {
		margin: 0;
	}
</style>
</head>
<body>
<h2>Tab UI Practice</h2>
<section class="tab">
	<div class="tabmenu">
		<div>youjin</div>
		<div>bomin</div>
		<div>donghyun</div>
		<div>yongki</div>
	</div>
	<article class="content">
		<h4>hello youjin</h4>
		<p>ocean swimming , travel</p>
	</article>
</section>
<script type="text/template" id="contentTempl">
	<h4>hello {name}</h4>
	<p>{hobby}</p>
</script>

<script>

	// prototype 기반 클래스 코드
	function Tab() {
		// this -> prototype 의 메소드를 가리킨다.
		this.registerEvents();
	}
	
	// prototype 객체 오버라이드
	Tab.prototype = {
		registerEvents: function() {
			var tabmenu = document.querySelector(".tabmenu");
			tabmenu.addEventListener("click", function(evt) {
				this.sendAjax("./json.txt", evt.target.innerText);
			}.bind(this));				
		},
		sendAjax: function(url, clickedName) {
			var oReq = new XMLHttpRequest;
			var data = [];
			if (url === "./json.txt") {
				data = [{
					name: "youjin",
					hobby: ["ocean swimming", "travel"]
				},
				{
					name: "bomin",
					hobby: ["listening to Changmo's music", "dancing"]
				},
				{
					name: "donghyun",
					hobby: ["riding motorcycle", "shopping"]
				},
				{
					name: "yongki",
					hobby: ["tattoo", "ju-jitsu"]
				}]
				this.getTemplate(data, clickedName);			
			}
			else {
				oReq.open("GET", url);
				oReq.send();			
				oReq.addEventListener("load", function() {
					data = JSON.parse(oReq.responseText);
					this.getTemplate(data, clickedName);
				}.bind(this));
			}			
		},
		getTemplate: function(data, clickedName) {
			var html = document.querySelector("#contentTempl").innerHTML;
			var resultHTML = "";
			data.forEach(function(obj) {
				if (obj.name === clickedName) {
					resultHTML = html.replace("{name}", obj.name).replace("{hobby}", obj.hobby.join(" , "));
				}
				
			});
			document.querySelector(".content").innerHTML = resultHTML;			
		}
	}
	
	// Tab 인스턴스 생성
	var tabObj = new Tab();
	
	/*
	function getTemplate(data, clickedName) {
		var html = document.querySelector("#contentTempl").innerHTML;
		var resultHTML = "";
		data.forEach(function(obj) {
			if (obj.name === clickedName) {
				resultHTML = html.replace("{name}", obj.name).replace("{hobby}", obj.hobby.join(" , "));
			}
			
		});
		document.querySelector(".content").innerHTML = resultHTML;
	}
	
	function sendAjax (url, clickedName) {
		var oReq = new XMLHttpRequest;
		var data = [];
		if (url === "./json.txt") {
			data = [{
				name: "youjin",
				hobby: ["ocean swimming", "travel"]
			},
			{
				name: "bomin",
				hobby: ["listening to Changmo's music", "dancing"]
			},
			{
				name: "donghyun",
				hobby: ["riding motorcycle", "shopping"]
			},
			{
				name: "yongki",
				hobby: ["tatto", "ju-jitsu"]
			}]
			getTemplate(data, clickedName);			
		}
		else {
			oReq.open("GET", url);
			oReq.send();			
			oReq.addEventListener("load", function() {
				data = JSON.parse(oReq.responseText);
				getTemplate(data, clickedName);
			});
		}
	}
	
	var tabmenu = document.querySelector(".tabmenu");
	tabmenu.addEventListener("click", function(evt) {
		sendAjax("./json.txt", evt.target.innerText);
	});
	*/
</script>
</body>
</html>