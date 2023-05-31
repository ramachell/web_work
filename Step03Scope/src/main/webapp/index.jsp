<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<ul>
			<li><a href="${pageContext.request.contextPath}/fortune">오늘의 운세</a> </li>
			<li><a href="${pageContext.request.contextPath}/test/fortune.jsp">테스트</a> </li>
			<li><a href="${pageContext.request.contextPath}/member">회원 1명 정보</a> </li>
	
			<li><a href="${pageContext.request.contextPath}/friend/list">친구 이름 목록</a> </li>
			
			<li><a href="${pageContext.request.contextPath}/member/list">회원 목록</a> </li>
			<li><a href="${pageContext.request.contextPath}/test/play.jsp">놀러가보기(로그인 됐을때만 가능))</a> </li>
		</ul>
		<form action="${pageContext.request.contextPath}/test/save.jsp" method="post">
			<input type="text" name="nick" placeholder="닉네임 입력..." />
			<button type="submit">기억하기</button>
			
		</form>
		
		<%
			//session scope 에 "nick"라는 키값으로 저장된 문자열이 있는지 읽어와봄
			String nick = (String)session.getAttribute("nick");
		%>
		<%if(nick != null) {%>
		<p>
			<strong><%= nick %></strong>님 반갑습니다.
			<a href="${pageContext.request.contextPath}/users/logout.jsp"> 로그아웃</a>
		</p>
		<%} %>
		
		
	</div>
</body>
</html>