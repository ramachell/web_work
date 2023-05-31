<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
/*
	HttpSession 객체의 setAttribute() 메소드를 이용해서 담은 데이터는
	1. 강제로 삭제하거나
	2. 웹브라우저를 닫거나
	3. 웹브라우저를 닫지 않았지만 30분(조절가능) 동안 유지됨
*/



request.setCharacterEncoding("utf-8");
// request 로 값 받아오기
String nick = request.getParameter("nick");
session.setAttribute("nick", nick);
%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/save.jsp</title>
</head>
<body>
	<p>
		<storng><%=nick%></storng>
		이라는 닉네임을 기억하겠습니다.
	</p>
	<p>30분동안 아무런 요청이 없으면 삭제됩니다.</p>
	<a href="${pageContext.request.contextPath}/">돌아가기</a>

</body>
</html>