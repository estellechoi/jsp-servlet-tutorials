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

const data = [{
	"id": 1,
	"name": "Yong",
	"phone": "010-0000-0000",
	"type": "sk",
	"childnode": [{
		"id": 11,
		"name": "echo",
		"phone": "010-0000-1111",
		"type": "kt",
		"childnode": [{
				"id": 115,
				"name": "hary",
				"phone": "211-1111-0000",
				"type": "sk",
				"childnode": [{
					"id": 1159,
					"name": "pobi",
					"phone": "010-444-000",
					"type": "kt",
					"childnode": [{
							"id": 11592,
							"name": "cherry",
							"phone": "111-222-0000",
							"type": "lg",
							"childnode": []
						},
						{
							"id": 11595,
							"name": "solvin",
							"phone": "010-000-3333",
							"type": "sk",
							"childnode": []
						}
					]
				}]
			},
			{
				"id": 116,
				"name": "kim",
				"phone": "444-111-0200",
				"type": "kt",
				"childnode": [{
					"id": 1168,
					"name": "hani",
					"phone": "010-222-0000",
					"type": "sk",
					"childnode": [{
						"id": 11689,
						"name": "ho",
						"phone": "010-000-0000",
						"type": "kt",
						"childnode": [{
								"id": 116890,
								"name": "wonsuk",
								"phone": "010-000-0000",
								"type": "kt",
								"childnode": []
							},
							{
								"id": 1168901,
								"name": "chulsu",
								"phone": "010-0000-0000",
								"type": "sk",
								"childnode": []
							}
						]
					}]
				}]
			},
			{
				"id": 117,
				"name": "hong",
				"phone": "010-0000-0000",
				"type": "lg",
				"childnode": []
			}
		]
	}]
}]

// type이 sk인, name으로 구성된 배열만 출력해봅니다.
var nameValues = [];

// data 는 객체 1 개로 이루어진 배열임을 확인한다.
// document.write(data.length + "<hr/>");

// name 추가
data.forEach(function(obj) {
	if(obj.type == "sk") nameValues.push(obj.name);
	getChildnode(obj);
});


// childnode 는 객체를 요소로하는 배열
// childnode 각 요소의 값은 객체이다
function getChildnode(obj) {
	obj.childnode.forEach(function(obj2) {
		// 타입이 sk 이면 name 값을 최종배열에 추가
		if(obj2.type == "sk") nameValues.push(obj2.name);
		
		// childenode (배열)의 값이 있을 때만 함수 반복
		if(obj2.childnode.length > 0) {
			getChildnode(obj2);	
		}
	});
}

document.write(nameValues);

</script>
</body>
</html>