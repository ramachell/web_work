<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
	// session scope에 "nick" 이라는 키값으로 저장된 문자열이 있는지 읽어와본다.
	String nick = (String)session.getAttribute("nick");
	// 만일 저장된값이 없다면
	if(nick==null){
		// 로그인 페이지로 리다일렉트 이동
		String cPath=request.getContextPath();
		response.sendRedirect(cPath+"/index.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/play.jsp</title>
</head>
<body>
	<p><strong><%= nick %></strong>야 신나게 놀아보자</p>
	<a href="${pageContext.request.contextPath}/index.jsp">인덱스로 돌아가기</a>

</body>
</html>