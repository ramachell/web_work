<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% List<String> list = (List<String>) request.getAttribute("list"); %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/friend.jsp</title>
</head>
<body>
	<%=list.get(0) %>
	<%=list.get(1) %>
	<%=list.get(2) %>
	<%=list.get(3) %>
	<%=list.get(4) %>
</body>
</html>