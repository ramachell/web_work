<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test03.jsp</title>
</head>
<body>
	<script>
	
// 		new Promise().then().catch();
		
		new Promise(function(resolve,reject){
			resolve();
			console.log("resolve");
		})
		.then(function(){
			console.log("then");
		})
		.catch(function(){
			console.log("catch");
		});
	</script>
	
</body>
</html>