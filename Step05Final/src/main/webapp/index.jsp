<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 "id"라는 키값으로 저장된거 있는지 확인
	String id = (String) session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>index.jsp</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<div class="container">
		<%if(id!=null) {%>
			<p>
				<a href="users/private/info.jsp"><strong><%=id %></strong></a>님 로그인 되어있습니다.
				<a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
			</p>
		<%} %>
		<h1>목록</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입 하러가기</a></li>
			<li><a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인 하러가기</a></li>
			<li><a href="${pageContext.request.contextPath}/private/game.jsp">게임 하러가기</a></li>
			<li><a href="${pageContext.request.contextPath}/private/study.jsp">공부 하러가기</a></li>	
			<li><a href="${pageContext.request.contextPath}/file/list.jsp">자료실</a></li>		
			<li><a href="${pageContext.request.contextPath}/cafe/list.jsp">게시판</a></li>		
			<li><a href="test/signup_form.jsp">form 테스트</a></li>
		</ul>
	</div>	
</body>
</html>