<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function getName() {
		var name = "youjin";
		var age = "";
		
		// 왼쪽 값이 없으면 오른쪽 값을 할당한다.
		var myName = name || "default name";
		var myAge = age || "default age";
		alert(myName + " " + myAge);
	}
	
	function getOk() {
		var data = 9;
		// 조건의 결과가 true 이면 : 의 왼쪽 값을, false 이면 : 의 오른쪽 값을 할당한다.
		var result = (data > 10) ? "ok" : "fail";
		alert(result);
	}
	
	function equals() {
		document.write(0 == false);
		document.write("<br>");
		document.write("" == false);
		document.write("<br>");
		document.write(null == false);
		document.write("<br>");
		document.write(0 == "0");
		document.write("<br>");
		document.write(null == undefined);
	}
	
	function equals2() {
		document.write(0 === false);
		document.write("<br>");
		document.write("" === false);
		document.write("<br>");
		document.write(null === false);
		document.write("<br>");
		document.write(0 === "0");
		document.write("<br>");
		document.write(null === undefined);
	}

	</script>
</head>
<body>

<input type="button" value="getName" onclick="getName()">
<input type="button" value="getOk" onclick="getOk()">
<input type="button" value="equals" onclick="equals()">
<input type="button" value="equals2" onclick="equals2()">
</body>
</html>