<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
// 테스트를 위해 sample data를 request scope에 담는다
List<String> names = new ArrayList<>();
names.add("김1번");
names.add("김2번");
names.add("김3번");
// list 라는 키값으로 names 담기
request.setAttribute("list", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jsts/test02.jsp</title>
</head>
<body>
	<%
	// request "list" 키값 읽어오기
	List<String> list = (List<String>) request.getAttribute("list");
	%>
	<h1>친구 목록</h1>
	<ul>
		<%
		for (int i = 0; i < list.size(); i++) {
		%>
		<li><%=list.get(i)%></li>
		<%
		}
		%>
		<li>-- foreach --</li>
		<%
		for (String tmp : list) {
		%>
		<li><%=tmp%></li>
		<%
		}
		%>
		<li>-- EL,jstl 활용 --</li>
		<c:forEach var="tmp" items="${list }" varStatus="status">
			<li>${tmp}</li>
			<li>${status.index}</li>


		</c:forEach>

		<c:forEach items="${list }" var="tmp" varStatus="status">
			<li>${tmp}</li> 
			<li>${status.current}</li> 
		   	<li>${status.index}</li>
		  	<li>${status.count}</li> 
		  	<li>${status.first}</li> 
		  	<li>${status.last} </li>
		</c:forEach>
		
	
		
	</ul>




</body>
</html>