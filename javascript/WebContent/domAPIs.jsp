<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<caption>table</caption>
		<tr>
			<td id="first" class="column">
				<div>a</div>
			</td>
			<td class="column">b</td>
			<td class="column">c</td>
			<td class="column">d</td>
			<td class="column">e</td>
		</tr>
		<tr>
			<td class="column">f</td>
			<td class="column">g</td>
			<td class="column">h</td>
			<td class="column">i</td>
			<td class="column">j</td>
		</tr>
	</table>
	<script>
		// document
		var columns = document.querySelector(".column");
		var first = document.querySelector("#first");
		columns.textContent;
		document.write("<hr/>")
		document.write(first.tagName + "<hr/>");
		document.write(first.innerHTML + "<hr/>");
		document.write(first.firstChild + "<hr/>"); // 공백, text 포함
		document.write(first.firstElementChild + "<hr/>"); // element 만 
		first.remove(); // 노드 삭제
		
		// textContent;
		// nodeType;
		// childNodes;
		// firstChild;
		// firstElementChild;
		// parentElement;
		// nextSibling;
		// nextElementSibling;
		// removeChild();
		// appendChild();
		var div = document.createElement("div");
		var str = document.createTextNode("hello");
		div.appendChild(str);
		// insertBefore();
		// cloneNode();
		// replaceChild();
		// closest(); // 상위로 올라가면서 근접 노드 찾기
		
		// element
	</script>
</body>
</html>