<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test06.jsp</title>
</head>
<body>
	<script>
    function openDoor(){
        return new Promise(function(resolve){
           setTimeout(function(){
              console.log("1초를 소모하면서 문을 열었습니다.");
              resolve();
           }, 1000);
        });
     }
     function putElephant(){
        return new Promise(function(resolve){
           setTimeout(function(){
              console.log("3초를 소모하면서 코끼리를 집어 넣었습니다.");
              resolve();
           }, 3000);
        });
     }
     function closeDoor(){
        return new Promise(function(resolve){
           setTimeout(function(){
              console.log("2초를 소모하면서 문을 닫았습니다.");
              resolve();
           }, 2000);
        });
     }
     
     openDoor()
     .then(function(){
    	 return putElephant();
     })
     .then(function(){
    	 return closeDoor();
     })
     .then(function(){
    	 console.log("끝");
     })
	</script>
</body>
</html>