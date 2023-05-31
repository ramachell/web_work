<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test05.jsp</title>
</head>
<body>
	<script>
	
// 		new Promise().then().catch();
		
		new Promise(function(resolve){
			resolve();
			console.log("resolve");
		})
		.then(function(result){
			console.log("첫번째 then");
			//여기서 다시 Promise 객체 리턴하게되면 뒤에 다시 .then() 호출 가능
			return new Promise(function(resolve){
				resolve();
			});
		}).then(function(result){
			console.log("두번째 then");
		});
	</script>
	
</body>
</html>