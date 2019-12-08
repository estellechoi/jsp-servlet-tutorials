<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
		// 객체 기본구조 {key : value}
		var obj = {
			name : "youjin",
			age : 27
		};
		document.write(obj.name + "<br/>"); // object.key : value 반환
		document.write(obj["name"] + "<br/>");
		
		// 객체의 value 로 객체가 들어갈 수 있다 !
		var objInObj = {
			color : "red",
			wheels : 4,
			engine: [{cylinders : 4}, {size: 2.2}]		
		};
		document.write(objInObj.engine[0].cylinders);
		
	</script>
</body>
</html>