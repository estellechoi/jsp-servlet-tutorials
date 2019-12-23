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
			name: "유진",
			lastTime: "PM 10:12",
			showHealth: function() {
				document.write(this.name + "님, 오늘은 " + this.lastTime + "에 운동을 하셨네요. <br />");
			}
	}
	
	healthObj.showHealth();
	
	// 객체를 동적으로 생성하는 법
	function health(name, lastTime) {
		this.name = name;
		this.lastTime = lastTime;
		this.showHealth = function() {
			return this.name + "님, 오늘은 " + this.lastTime + "에 운동을 하셨네요. <br />";			
		}
	}
	
	// 그냥 호출
	// health 는 리턴 함수가 아니므로 반환값은 undefined
	var h = health("보민", "AM 08:00");
	// h = undefined 이므로 당연히 메소드를 호출할 수 없다. 
// 	document.write(h.showHealth("용기", "AM 10:15") + "<br />");
	
	// new 연산자를 사용하여 health 의 인스턴스(객체 리터럴 패턴으로) 생성
	var obj = new health("보민", "AM 08:00");
	document.write(obj.showHealth());
</script>

</body>
</html>