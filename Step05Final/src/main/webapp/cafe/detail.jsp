<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	CafeDto dto = CafeDao.getInstance().getData(num);
	
	CafeDao.getInstance().addViewCount(num);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1>게시판 글 보기</h1>
		
		<div>
			<p><strong>글 제목 : </strong><%= dto.getTitle() %></p>
			<p>조회수 : <%=dto.getViewCount() %></p>
		</div>
		<br />
		<div>
			<p><strong>글 내용</strong></p>
			<p><%= dto.getContent() %></p>
		</div>
		<div>
			<p><a href="${pageContext.request.contextPath}/cafe/list.jsp">게시판으로</a></p>
		</div>
	</div>


</body>
</html>







