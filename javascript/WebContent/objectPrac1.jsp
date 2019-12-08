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
//숫자 타입으로만 구성된 요소를 뽑아 배열을 만들어보도록 해보세요.

const data = {
    "debug": "on",
    "window": {
        "title": "Sample Konfabulator Widget",
        "name": "main_window",
        "width": 500,
        "height": 500
    },
    "image": { 
        "src": "Images/Sun.png",
        "name": "sun1",
        "hOffset": 250,
        "vOffset": 250,
        "alignment": "center"
    },
    "text": {
        "data": "Click Here",
        "size": 36,
        "style": "bold",
        "name": "text1",
        "hOffset": 250,
        "vOffset": 100,
        "alignment": "center",
        "onMouseUp": "sun1.opacity = (sun1.opacity / 100) * 90;"
    }
}

// data 객체의 key 값들로 구성된 배열
var dataKeys = Object.keys(data);

// data 객체의 value 값의 타입이 string 이 아닌 요소의 key 값들로만으로 구성된 배열 반환
var dataKeysFiltered = dataKeys.filter(function(dataKey) {
	return typeof data[dataKey] != "string";
});

document.write(dataKeysFiltered + "<hr/>");

// value 타입이 숫자인 요소들로만 구성된 배열 선언
var ValuesFiltered = [];

dataKeysFiltered.forEach(function(key) {
	// 각 객체(data[key])의 값들로 구성된 배열
	var values = Object.values(data[key]);
	
	// 타입이 number 인 요소만으로 구성된 배열 봔환
	var numberValues = values.filter(function(value) {
		return typeof value == "number";
	});
	
	ValuesFiltered = ValuesFiltered.concat(numberValues);
});

document.write(ValuesFiltered); // 완성된 배열 출력 !



</script>
</body>
</html>