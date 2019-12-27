<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1, .formWrap {
		width: 400px;
		margin: 0 auto;
	}
	
	.inputWrap {
		display: inline-block;
		width: 300px;
	}
	
	.inputWrap span {
		/* width 가 왜 안되지 ? ㅠ */
		width: 100px;
		border: 1px solid green;
		margin: 0 10px;
	}
	
	.result {
		margin: 50px auto;
		width: 400px;
		text-align: center;
		color: red;
		font-size: 25px;
	}
</style>
</head>
<body>
	<h1>Join My Website !</h1>
	<div class="formWrap">
		<form action="/join" method="post" id="joinForm">
			<div class="inputWrap">
				<div class="email">
					<span>Email</span><input type="text" name="email">
				</div>
				<div class="password">
					<span>Password</span><input type="password" name="password">
				</div>
			</div>
			<input class="submitBtn" type="submit">
		</form>
	</div>
	<section class="result">
	</section>
	<script>
		var submitBtn = document.querySelector(".submitBtn");
		var result = document.querySelector(".result");
		submitBtn.addEventListener("click", function(evt) {
			// 디폴트 기능을 막기 
			evt.preventDefault();
			
			// property 로 요소 선택하기
			var emailValue = document.querySelector("[name='email']").value;
			
			// 정규표현식으로 검증하기
			// \w : word
			// + : 1자 이상
			// \. : .
			// ^[양식] : 시작 -> ^[\w+_] : 시작값은 word 와 under bar 만 가능  
			// $ : 끝			// 
			// test() : 정규표현식과 일치여부 리턴 true/false		
			var checkValue = (/^[\w+_]\w+@\w+\.\w+$/).test(emailValue);
			if(!checkValue) {
				result.innerHTML = "올바르지 않은 이메일 입니다.";
			}
			else {
				result.innerHTML = "이메일 정보가 좋네요.";
				// 서버로 데이터 전송하기
				document.querySelector("#joinForm").submit();
			}
		});
	
	</script>
</body>
</html>