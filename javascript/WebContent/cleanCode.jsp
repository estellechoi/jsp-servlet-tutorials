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
	function checkMember(pobi,crong) {
		if(pobi) { 
			if(crong) {
		    	return true;
		    }
		}
	}
	
	// 개선하기 
	function checkMemberRev(pobi,crong) {
		if (!pobi) return;
		if (crong) {
			return true;
		}
	}
</script>
</body>
</html>