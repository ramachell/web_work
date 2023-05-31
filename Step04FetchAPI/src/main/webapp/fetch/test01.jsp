<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test01.jsp</title>
</head>
<body>
	<h1>fetch 함수 테스트</h1>
	<button id="myBtn">눌러주세요</button>
	<a href="${pageContext.request.contextPath}/index.jsp">눌러보기</a>
	<script>
		document.querySelector("#myBtn").addEventListener("click",e=>{
			
			const msg = prompt("메시지 입력");
			
			console.log("입력완료");
			
			console.log("--------");
			
			// prompt는 저거 완료될때까지 멈춰있음 (동기처리)
			// 이 fetch는 요청 한번하고 그후 뒤에꺼(console.log("요청했음")) 실행하고
			// 요청에 대한 응답이 들어오면 그후 then이 수행됨
			
			
			// fetch 함수가 뭘 하는 함수인지 테스트
			// 링크와의 차이점
			// 다른 사이트의 정보를 가져와야할때 fetch로 가져옴
			fetch("${pageContext.request.contextPath}/promise/test01.jsp")
			.then(function(response){
				console.log(response);
				return response.text();
				
			})
			.then(function(data){
				console.log(data);
			});
			
			console.log("요청했음");
			
		})
	</script>
	
	
</body>
</html>