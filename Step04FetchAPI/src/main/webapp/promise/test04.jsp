<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test04.jsp</title>
</head>
<body>
	<script>
	
// 		new Promise().then().catch();
		
		new Promise(function(resolve,reject){
			// 무언가 작업하고 결과 데이터가있다면
			let data = {num:1,name:"김구라"};
			// resolve or reject 호출하며 전달가능
			
			resolve(data);
			console.log("resolve");
		})
		.then(function(result){
			console.log(result);
			console.log("then");
		})
		.catch(function(){
			console.log("catch");
		});
	</script>
	
</body>
</html>