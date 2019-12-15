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
	// bind() 메서드는 새로운 함수를 생성합니다.
	// bind() 가 호출된 함수의 this 키워드를 주어진 값으로 설정한다.
	const module = {
  		x: 42,
  		getX: function() {
    		return this.x;
  		}
	}
	// unbound
	const unboundGetX = module.getX;
	document.write(unboundGetX() + "<br />");
	// bound
	// unboundGetX 함수의 this 를 module 로 설정한다.
	const boundGetX = unboundGetX.bind(module);
	document.write(boundGetX() + "<br />");
	
	// bind(this) : this 를 바인딩하는 (참조 객체를 this 로 하는) 새로운 함수를 반환한다.
	var newfunc = function(){
		document.write("함수 호출 <br />");
	}.bind(this); // 여기서 this 는 window...
	
	newfunc();
	
	// 함수.함수 : 함수 뒤에 . 을 붙여 메소드를 호출하면, 해당함수는 객체가 된다.
	// function native object
	// 함수를 객체로 만들고, function native object 의 내장 메소드를 사용할 수 있다.
	// 그 중 하나가 bind(object);
	var heathObj = {
			name : "유진",
			lastTime : "PM 10:12",
			showHealth : function() {
				// 콜백함수는 스택큐에 보관되어 있다가, heathObj.showHealth() 메소드 반환/종료 후 실행된다.
				// 따라서, 여기에서 콜백함수의 this 는 window 가 된다. heathObj.showHealth()는 이미 메모리에서 사라졌기 때문 !
				setTimeout(function() {
					document.write(this.name + "님, 오늘은 " + this.lastTime + " 에 운동을 하셨네요. <br />");					
				}.bind(this), 500);
				// bind(this) : 콜백함수는 this를 바인딩 한다. (참조객체를 this로 한다.)
				// 여기에서 bind(this) 의 인자로 들어온 this 는 객체 heathObj 이다.
				// 콜백함수 {} 외부에 정의된 내용은 콜백함수 실행 전부터 유효하기 때문이다.
				
			}			
	}
	heathObj.showHealth();
	
	// arrow 함수는 context 를 유지하는 특성이 있다 !
	// 콜백함수가 arrow 함수이면, bind() 메소드 없이도 이전의 thisBinding 유지한다.
	var heathObj2 = {
			name : "유진",
			lastTime : "PM 10:12",
			showHealth : function() {
				// arrow function
				setTimeout(()=> {
					document.write(this.name + "님, 오늘은 " + this.lastTime + " 에 운동을 하셨네요. <br />");					
				}, 500);		
			}			
	}
	heathObj2.showHealth();
	
	
	
</script>
</body>
</html>