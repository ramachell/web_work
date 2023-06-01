<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// form 전송된 id, pwd 읽고
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// url도 가져옴
	String url = request.getParameter("url");
	// UsersDto 담고
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	// UsersDao에 전달해서 유효한 정보인지 확인 (select로 존재하는지 확인)
	boolean isValid = UsersDao.getInstance().isValid(dto);
	
	// 유효한 정보이면 로그인, 아니면 아디 혹은 비밀번호가 틀리다고 응답
	// 로그인처리 session scope 에 id라는 키값으로 로그인된 아이디 저장함
	// 여기서 session scope 는 HttpSession setAttribute() 이용해서 값 저장하는영역을 말함
	String encodedUrl=URLEncoder.encode(url);
	if(isValid){
		session.setAttribute("id", id);
		
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/login.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<%=url %>
		<%if(isValid) {%>
		<p class="alert alert-success">
			<strong><%=dto.getId() %></strong> 님 로그인 되었습니다. <a href="<%=url%>">확인</a>
		</p>
		<%}else{ %>
		<p class="alert alert-danger">
			아이디 혹은 비밀번호가 잘못되었습니다. 
			<a href="${pageContext.request.contextPath}/users/loginform.jsp?url=<%=encodedUrl%>">다시시도</a>
		</p>
		<%} %>
	</div>
</body>
</html>