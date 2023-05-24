<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.net.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	// request 로 값 받아오기
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	
	// 2
	// dto 객체 하나 만들기 + 생성자로 바로 데이터입력
	GuestDto dto = new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);
	
	// dao 객체 얻어오기
	GuestDao dao = GuestDao.getInstance();
	// boolean으로 insert 성공 or 실패 받아오기
	boolean isSuccess = dao.insert(dto);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insert.jsp</title>
</head>
<body>

	<!-- 3 -->
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess) {%>
			<p>
				<strong><%= writer %></strong> 님이 쓴 방명록이 저장되었습니다.
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				방명록 작성 실패
				<a href="insertform.jsp">다시 작성</a>
			</p>
		<%} %>
	</div>
	

	
</body>
</html>