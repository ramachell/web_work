<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
</head>
<body>
	<%
		MemberDto dto = new MemberDto();
	
	List<MemberDto> list = new ArrayList<>();
	
	list.add(new MemberDto(1,"김1번","구로"));
	list.add(new MemberDto(2,"김2번","강남"));
	list.add(new MemberDto(3,"김3번","역삼"));
	
	%>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>	
			<% for(MemberDto tmp : list) { %>
			<tr>
				<td> <%= tmp.getNum() %></td>
				<td> <%= tmp.getName() %></td>
				<td> <%= tmp.getAddr() %></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>