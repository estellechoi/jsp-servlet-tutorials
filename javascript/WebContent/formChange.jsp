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
	
	.inputWrap input {
		margin: 10px auto;
		width: 200px;
		height: 30px;
		padding: 0 10px;
	}
	
	.inputWrap span {
		color: #ED5F3F;
		/* span 태그는 width 값을 지정할 수 없구..  */
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
					<input type="text" name="email" placeholder="Email"><br />
					<span></span>
				</div>
				<div class="password">
					<input type="password" name="password" placeholder="Password, length more than 9"><br />
					<span></span>
				</div>
			</div>
			<input class="submitBtn" type="submit">
		</form>
	</div>
	<section class="result">
	</section>
	<script>
// 		submitBtn.addEventListener("click", function(evt) {
// 			// 디폴트 기능을 막기 
// 			evt.preventDefault();			
// 			if(!checkValue) {
// 				result.innerHTML = "올바르지 않은 이메일 입니다.";
// 			}
// 			else {
// 				result.innerHTML = "이메일 정보가 좋네요.";
// 				document.querySelector("#joinForm").submit();
// 			}
// 		});

		var submitBtn = document.querySelector(".submitBtn");
		var result = document.querySelector(".result");
		// property 로 요소 선택하기
		var emailValue = document.querySelector("[name='email']");			
		var passwordValue = document.querySelector("[name='password']");
		
		// * change : form 데이터 관련해서 input 값이 변경되면 발생하는 이벤트 (값 변경 후 커서가 blur 되면 발생)
		emailValue.addEventListener("change", function(evt) {
		// 정규표현식으로 검증하기 (일치여부 리턴)
		var checkValue = (/^[\w]\w+_?\.?\w+@\w+\.\w+$/).test(evt.target.value);
			if (!checkValue) {
				document.querySelector(".email > span").innerText = "올바르지 않은 이메일 주소";
				document.querySelector(".email > span").style.color = "#ED5F3F";				
			}
			else {
				document.querySelector(".email > span").innerText = "OK";
				document.querySelector(".email > span").style.color = "lightblue";				
			}
		});
		
		passwordValue.addEventListener("change", function(evt) {
			if (evt.target.value.length < 10) {
				document.querySelector(".password > span").innerHTML = 	"비밀번호는 10자 이상이어야 합니다.";				
				document.querySelector(".password > span").style.color = "#ED5F3F";				
			}
			else if (evt.target.value.length >= 10){
				document.querySelector(".password > span").innerHTML = 	"OK";				
				document.querySelector(".password > span").style.color = "lightblue";				
			}
		});
	</script>
</body>
</html>