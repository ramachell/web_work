<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/logout.jsp</title>
</head>
<body>
	
	<%
		session.removeAttribute("id");
	%>
	
	
	<script>
	alert("로그아웃 되었습니다.");
	location.href="${pageContext.request.contextPath}/index.jsp"
	
	 </script>
</body>
</html>