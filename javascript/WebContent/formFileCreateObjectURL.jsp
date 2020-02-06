<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.thumb-img {
		display: none;
	}
</style>
</head>
<body>
<!-- 
	createObjectURL를 사용한 썸네일 노출하기
 -->
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
			<input type="file" name="reviewImg" id="inputReviewImg" required>
		</div>
		<input type="submit" value="submit">
	</form>
	<div><img src="" alt="no image" class="thumb-img"></div>
 	<script>
 		const inputFile = document.querySelector("#inputReviewImg");
 		inputFile.addEventListener("change", function(evt) {
 			// File 객체 반환
 			const image = evt.target.files[0];
 			// 썸네일 이미지가 들어갈 img 태그
 			const thumbImg = document.querySelector(".thumb-img");
 			thumbImg.style.display = "inline-block";
 			// URL 객체의 createObjectURL 메소드를 이용하여 객체의 url을 생성
 			// <img> 태그의 src 속성에 File 객체의 url 값을 할당한다.
 			thumbImg.src = window.URL.createObjectURL(image);
 		});
 	</script>
</body>
</html>