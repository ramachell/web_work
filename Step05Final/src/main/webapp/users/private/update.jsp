<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 수정할 회원의 정보 읽어와서
	String id = (String) session.getAttribute("id");
	String email = request.getParameter("email");
	// 프로필 이미지의 경로 읽어오기
	String profile = request.getParameter("profile");
	
	// dto 
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	
	// 만일 profile 이미지를 등록했다면 (value = "empty" 아니라면)
	if(!profile.equals("empty")){
		//dto 에 전송된 프로필 이미지 경로를 담아줌
		dto.setProfile(profile);
	}
	
	// 2. DB에 수정 반영하기
	boolean isSuccess = UsersDao.getInstance().update(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/private/update.jsp</title>
</head>
<body>
	<script>
		<% if(isSuccess) { %>
			alert("수정 완료");
			location.href="info.jsp";
		<%}else {%>
			alert("수정 실패");
			location.href="updateform.jsp"
		<%}%>
		
	</script>
</body>
</html>