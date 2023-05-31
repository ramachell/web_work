<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 인코딩 설정 한글안깨지게 utf-8
request.setCharacterEncoding("utf-8");
// request 로 값 받아오기
String msg = request.getParameter("msg"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<p>전송된 메시지 : <%=msg %></p>
</body>
</html>