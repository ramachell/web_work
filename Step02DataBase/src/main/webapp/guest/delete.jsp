<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 어짜피 int만 받아오므로 한글 필요x
	// request.setCharacterEncoding("utf-8");

	// request 로 값 받아오기
	int num = Integer.parseInt(request.getParameter("num"));
	
	GuestDao dao = GuestDao.getInstance();
	// boolean으로 insert 성공 or 실패 받아오기
	boolean isSuccess = dao.delete(num);
	
	/*
		[리다일렉트 응답]
		클라이언트에게 특정 경로로 요청을 다시 하라고 응답하는것
		다시 요청할 경로를 전달하면 클라이언트가 해당 경로로 요청을 다시함
		따라서 순간적으로 페이지가 이동되게 됨
		HttpServletResponse 객체의 기능을 활용하면 된다
		요청을 다시할 경로를 전달할때는 반드시 절대경로로 해야함
		새로운 경로로 요청을 다시 하는것도 응답임
	*/
	
	// context 경로 얻기(context 경로는 추후에 수정되거나 제거될예정이기 때문에 메소드로 얻어냄)
// 	String cPath = request.getContextPath();
	// 리다일렉트 응답하기
// 	response.sendRedirect(cPath+"/guest/list.jsp");
	//이렇게 하면 삭제는 수행하고 페이지 따로 만들필요없이 바로 리스트로 돌아감
%>


    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/delete.jsp</title>
</head>
<body>
		<div class="container">
		<h1>알림</h1>
		<%if(isSuccess) {%>
			<p>
				<strong><%= num %></strong>번 방명록이 삭제되었습니다.
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				방명록 삭제 실패
				<a href="list.jsp">다시 방명록으로</a>
			</p>
		<%} %>
	</div>
	
</body>
</html>