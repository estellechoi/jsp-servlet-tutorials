<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Upload Form</h1>
	<br><br>
	<form action="upload" method="post" enctype="multipart/form-data">
		file : <input type="file" name="file"><br>
		<input type="submit" value="submit">
	</form>
</body>
</html>