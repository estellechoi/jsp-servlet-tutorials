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
			<input type="file" name="reviewImg" id="inputReviewImg" required>
		</div>
		<input type="submit" value="submit">
	</form>
	<div></div>
	
	<!-- script -->
	<script>
		// 파일 확장자 유효성검사
		const inputFile = document.querySelector("#inputReviewImg");
		inputFile.addEventListener("change", function(evt) {
			// File 객체 반환 (name, size, type, lastModifiedDate 등의 키 값을 갖고 있음)
			const image = evt.target.files[0];
			if (!validImageType(image)) {
				alert("jpeg, jpg, png 형식의 이미지 파일만 업로드할 수 있습니다.");
				return; // ?
			}
		});
		
		function validImageType(image) {
			// File 객체의 type 값이 허용범위에 있는지 확인
			// indexOf()는 일치하는 인덱스가 없으면 -1 반환
			const result = (['image/jpeg', 'image/png', 'image/jpg'].indexOf(image.type) > -1);
			// 확장자가 허용범위에 있으면 true, 없으면 false 반환
			return result;
		}
	</script>
</body>
</html>