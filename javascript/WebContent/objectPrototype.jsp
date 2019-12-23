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
		function health(name, lastTime) {
			this.name = name;
			this.lastTime = lastTime;
		}
		
		// health 의 prototype에 showHealth 메소드를 속성으로 추가
		health.prototype.showHealth = function() {
			document.write(this.name + "님, 오늘은 " + this.lastTime + "에 운동을 하셨네요. <br />");
		}
		
		var youjin = new health("유진", "PM 09:40");
		youjin.showHealth();
		
		var yongki = new health("용기", "AM 09:30");
		yongki.showHealth();
		
		// 여러 인스턴스를 만들어도 prototype안의 showHealth 메소드를 호출하면 같은 참조점을 바라보고 있다.
		// 장점 : 메모리 효율성이 좋다.
		if (youjin.showHealth === yongki.showHealth) {
			document.write("prototype의 같은 메소드를 참조하고 있습니다.");
		}
		
		
	</script>
</body>
</html>