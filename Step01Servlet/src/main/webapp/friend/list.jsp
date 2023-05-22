<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	List<String> names = new ArrayList<>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	%>

	<h1>친구 목록 입니다</h1>
	<ul>
		<% for (int i = 0 ; i < names.size(); i++){ 
			out.println("<li>" + names.get(i) + "</li>");
		}
		%>
		
		
		<% for(String tmp : names) { %>
		<li> <%= tmp %> </li>
		<%} %>
		    			
		
							
	</ul>
	

</body>
</html>