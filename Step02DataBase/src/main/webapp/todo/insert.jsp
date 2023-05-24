<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="java.net.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1 post 방식으로 전송된 이름 주소 추출
	
	// 2 db에 저장
	
	// 3 응답
	
	// 1
	request.setCharacterEncoding("utf-8");
	// request 로 값 받아오기
	String work = request.getParameter("work");
	String etc = request.getParameter("etc");
	
	// 2
	// dto 객체 하나 만들기 + 생성자로 바로 데이터입력
	TodoDto dto = new TodoDto(work,etc);
	// dao 객체 얻어오기
	TodoDao dao = TodoDao.getInstance();
	// boolean으로 insert 성공 or 실패 받아오기
	boolean isSuccess = dao.insert(dto);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/todo/insert.jsp</title>
</head>
<body>

	<!-- 3 -->
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess) {%>
			<p>
				<strong><%= work %></strong> 할일이 저장되었습니다.
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				할일 저장 실패
				<a href="insertform.jsp">다시 작성</a>
			</p>
		<%} %>
	</div>
	

	
</body>
</html>