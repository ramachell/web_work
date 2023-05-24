<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// DB 연동 가능한지 테스트
	new DbcpBean(); // 객체 생성했을때 예외 없이 잘되면 성공
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<ul>
		<li><a href="member/list.jsp">member 보기</a></li>
		<li><a href="member/list.jsp">member 보기</a></li>
	</ul>
	<br />
	<ul>
		<li><a href="todo/list.jsp">todo 할일 보기</a></li>
	</ul>
	
</body>
</html>