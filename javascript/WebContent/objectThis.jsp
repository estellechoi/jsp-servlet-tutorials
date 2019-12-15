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
	var healthObj = {
			name : "최유진",
			lastTime : "PM 10:12",
			showHealth : function() {
				document.write(this.name + "님, 오늘은 " + this.lastTime + " 에 운동을 하셨네요. <br />");
				// 함수 내에서 this 는 ? 함수가 참조하고 있는 객체
				// this === healthObj
			}
	}
	
	healthObj.showHealth();
	
	var todo = {
			todos : [],
			addTodo : function(newTodo) {
				this.todos.push(newTodo);
			},
			showTodo : function() {
				return this.todos;
			}
	}
	
	todo.addTodo("공부");
	todo.addTodo("댄스");
	document.write(todo.showTodo());
</script>
</body>
</html>