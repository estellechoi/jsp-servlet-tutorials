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
	
	var others = {
			todos : "아무 것도 하지 않는다"
	}
	
	var todo = {
			todos : ["개발"],
			addTodo : function(newTodo) {
				this.todos.push(newTodo);
			},
			showTodo : function() {
				return this.todos;
			}
	}
	
	todo.addTodo("공부");
	todo.addTodo("댄스");
	document.write(todo.showTodo() + "<br />");
	// call() 메소드 : showTodo 가 참조하는 객체가 todo 가 아닌 others 가 된다.
	document.write(todo.showTodo.call(others) + "<br />");
	
	// 함수가 실행될때 함수에서 가리키는 this 키워드를 출력해보면 context가 참조하고 있는 객체를 알 수 있습니다.
	// JavaScript에는 전역스크립트나 함수가 실행될 때 실행문맥(Execution context)이 생성됩니다.
	// (참고로 실제 실행은 브라우저내에 stack 이라는 메모리 공간에 올라가서 실행됩니다)
	// 모든 context에는 참조하고 있는 객체(thisBinding이라 함)가 존재하는데,
	// 현재 context가 참조하고 있는 객체를 알기 위해서는 this를 사용할 수 있습니다.
	function get() {
		return this;
	}
	//window. 함수가 실행될때의 컨텍스트는 window를 참조한다.
	document.write(get() + "<br />");
	//object. new키워드를 쓰면 새로운 object context가 생성된다.
	document.write(new get());

</script>
</body>
</html>