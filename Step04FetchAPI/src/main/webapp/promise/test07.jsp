<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test07.jsp</title>
</head>
<body>
	<h1>폼에 입력한 내용을 페이지 전환 없이 전송하기</h1>
	<form action="login.jsp" method="post" id="myForm">
		<input type="text" name="id" placeholder="아이디 입력..." />
		<input type="password" name="pwd" placeholder="비밀번호 입력..." />
		<button type="submit">로그인</button>
	</form>

	<h1>gura_util.js 사용해서 전송하기</h1>
	<form action="login.jsp" method="post" id="myForm2">
		<input type="text" name="id" placeholder="아이디 입력..." />
		<input type="password" name="pwd" placeholder="비밀번호 입력..." />
		<button type="submit">로그인2</button>
	</form>
	<!-- 외부 javascript  로딩 -->
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	
	<script>
		
		document.querySelector("#myForm2").addEventListener("submit", (e)=>{
			e.preventDefault();
			// gura_util.js 에 있는 함수 활용하기
			// 함수 호출하며 폼의 참조값 전달
			ajaxFormPromise(e.target)
			.then(res=>res.json())
			.then((data)=>{
				console.log(data);
			});
		});
	
	
		// form 안에 submit 버튼을 누르면 submit 이벤트가 발생함
		// 거기에 addEventLestener submit 을 써서 원하는 기능 추가가능
		
		document.querySelector("#myForm").addEventListener("submit",(e)=>{
			// 기본동작 막기 (login.jsp 로 폼 제출하는것)
			console.log(e)
			console.log(e.target)
			
			
			e.preventDefault();
			
			// fetch 함수를 이용해서 페이지 전환없이 입력한 내용 읽어와서 직접 제출
			
			// 입력한 내용을 query 문자열로 읽어오기
			// id=aaaa&pwd=bbbb 이런식으로 읽어옴
			const data = new FormData(e.target);
			console.log(data);
			const queryString = new URLSearchParams(data).toString();
			console.log(new URLSearchParams(data))
			console.log(new URLSearchParams(data).toString());
			
			// fetch() 함수를 이용해서 post로 전송하기
			fetch("login.jsp", {
				method : "POST",
				headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
				body:queryString
			})
			.then(res=>res.json())
			.then((data)=>{
				console.log(data);
			});
		});
	</script>
</body>
</html>