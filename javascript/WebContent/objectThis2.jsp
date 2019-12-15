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
	// ES6 에서는 객체 메소드를 사용할 때 function 키워드 생략 가능 
	var name = null;
	const obj = {
			getName() {
				return this.name;
			},
			setName(name) {
				this.name = name;
			}
	}
	
	obj.setName("youjin");
	const result = obj.getName();
	document.write(result);
	
</script>
</body>
</html>