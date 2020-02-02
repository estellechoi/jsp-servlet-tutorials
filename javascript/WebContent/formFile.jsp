<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- file 전송시, enctype 지정 필수 -->
	<form action="/write" method="post" enctype="multipart/form-data" name="fileForm">
		<div class='inputWrap'>
			<div class='email'>
				<span>Email</span> <input type="text" name="email">
			</div>
			<div class="password">
				<span>Password</span> <input type="password" name="password">
			</div>
			<!-- file 업로드 -->
			<!-- 
				* accept 속성 : 허용되는 file type 을 지정할 수 있다.
				* image/* : 모든 타입의 img 파일만 업로드 허용
			 -->		
			<input type="file" name="reviewImg" accept="image/png, image/jpeg" required>
		</div>
		<input type="submit" value="submit">
	</form>
	<div></div>
	
	
	<!-- FormData 객체를 사용하여 Ajax 로 file 제출하기 (학습중 ;;;;)-->
	<script>
		var output = document.querySelector('div');
		var form = document.forms.namedItem('fileForm');
		form.addEventListener('submit', function(evt) {
			evt.preventDefault();
			// form 의 모든 데이터를 변수에 할당
			var data = new FormData(form);
			data.append('CustomField', 'This is some extra data');
			
			sendAjax(data);
			// false 는 무슨 역할 ?
		}, false);
		
		function sendAjax(data) {
			var oReq = new XMLHttpRequest();
			// true 인자는 무슨 역할 ?
			oReq.open('post', './json/write_comment_ok', true);
			oReq.onload = function(evt) {
				output.innerText = 'Uploaded!';
			};
			
			oReq.send(data);
		}
	</script>
</body>
</html>