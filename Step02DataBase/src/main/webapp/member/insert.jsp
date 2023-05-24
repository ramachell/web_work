<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
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
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	// 2
	// dto 객체 하나 만들기 + 생성자로 바로 데이터입력
	MemberDto dto = new MemberDto(name,addr);
	// dao 객체 얻어오기
	MemberDao dao = MemberDao.getInstance();
	// boolean으로 insert 성공 or 실패 받아오기
	boolean isSuccess = dao.insert(dto);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/insert.jsp</title>
</head>
<body>

	<!-- 3 -->
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess) {%>
			<p>
				<strong><%= name %></strong> 님의 정보가 저장되었습니다.
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				회원정보 저장 실패
				<a href="insertform.jsp">다시 작성</a>
			</p>
		<%} %>
	</div>
	

	
</body>
</html>