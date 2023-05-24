<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 어짜피 int만 받아오므로 한글 필요x
	// request.setCharacterEncoding("utf-8");

	// request 로 값 받아오기
	int num = Integer.parseInt(request.getParameter("num"));
	
	TodoDao dao = TodoDao.getInstance();
	// boolean으로 insert 성공 or 실패 받아오기
	boolean isSuccess = dao.delete(num);
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/todo/delete.jsp</title>
</head>
<body>
		<div class="container">
		<h1>알림</h1>
		<%if(isSuccess) {%>
			<p>
				<strong><%= num %></strong>번 할일이 삭제되었습니다.
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				할일 삭제 실패
				<a href="list.jsp">다시 리스트로</a>
			</p>
		<%} %>
	</div>
	
</body>
</html>