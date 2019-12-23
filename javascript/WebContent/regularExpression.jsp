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
		// 정규표현식 (Regular Expression)
		// * 사용법 : / 로 시작, / 로 끝
		// match(r); 문자열에서 정규표현식 r 에 해당하는 문자열만 잘라서 리턴

		// 특정 숫자 찾기
		document.write("1".match(/1/)[0] + "<br />");

		// 모든 두자리 숫자 찾기 
		// \d\d
		var target = "a99b";
		var r = /\d\d/;
		document.write(target.match(r)[0] + "<br />");

		// 예제 

		// 우편번호 
		var post = "02-445";
		var postB = "523-333";
		// \d : one digit
		// * {} : 수량자 (자릿수 지정)
		// {n} : n 자리
		// {n,m} : n 자리 또는 m 자리
		// * () : 하위 표현식 (sub expression)
		// (a|b) : a 또는 b
		// [abcdefg] : abcdefg 중 하나
		// [0-8] : 연속된 숫자/문자는 - 로 표시하여 해당 범위의 숫자를 모두 의미할 수 있다.
		// [a-zA-Z] : 범위를 여러개 지정할 수 있다.
		var result = postB.match(/(\d{2}-\d{3}|[0-46-8]\d{2}-\d{3})/)[0];
		document.write(result + "<br />");
		
		// 휴대폰번호
		var cell1 = "010-1111-2233";
		var cell2 = "011-334-4343";
		var regexCell = /01[01789]-\d{3,4}-\d{4}/;
		var result2 = cell1.match(regexCell)[0];
		document.write(result2 + "<br />");
		
		// 치환
		// $n : n번째 부분을 유지한다. (인덱스 1 부터 시작)
		// $1a : 1번째 부분을 유지하고 다음 부분은 "a" 로 치환
		var result3 = cell2.replace(/(\d{2})\d/, "$10");
		document.write(result3 + "<br />");
		
		// 하위 표현식 () 로 나누어 필요한 부분을 치환하기
		// $0hi : 0번 부분을 "hi" 로 치환
		var youjin = "let youjin";
		var r3 = /(\s?)(let)(\s+[a-zA-Z_$]+)/;
		var result5 = youjin.replace(r3, "$1const$3");
		document.write(result5 + "<br />");
		
		// 특수문자 지우기
		var str = "$$$iloveyou###";
		var r4 = /.*([a-zA-Z]{8}).*/;
		document.write(str.replace(r4, "$1") + "<br />");

		// 함수 이름을 가진 함수 찾기 (즉시실행 함수 포함)
		// \( : "("
		// ? : 있거나 없거나
		// \s : one space
		// \s+ : one space or more than
		// => \s{1,} 같은 의미이다.
		// \w : a-z(대소문자 무관) 과 _
// 		(function sayHello() {
// 			document.write("hello <br />");
// 		})();
// 		var r2 = /\(?function\s+[a-zA-Z_$]+/;
// 		var result4 = document.match(r2)[0];
// 		document.write(result4 + "<br />");
		
		
	</script>
</body>
</html>