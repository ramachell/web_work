<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/member.jsp</title>
</head>
<body>

	<% MemberDto dto = (MemberDto) request.getAttribute("dto"); %>
	
	<h1>회원 한명의 정보입니다</h1>
	<p>번호 : <%=dto.getNum() %></p>
	<p>이름 : <%=dto.getName() %></p>
	<p>주소 : <%=dto.getAddr() %></p>
</body>
</html>