<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 확인
	String id = (String)session.getAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/private/game.jsp</title>
</head>
<body>
	<h1>게임 페이지 입니다</h1>
	<p><%= id %> 님 열심히 게임해요</p>
</body>
</html>