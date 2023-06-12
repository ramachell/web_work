<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer=(String)session.getAttribute("id");
	
	boolean isSuccess = false;
	
	if(content !="" && title != ""){
	CafeDto dto = new CafeDto();
	dto.setTitle(title);
	dto.setWriter(writer);
	dto.setContent(content);
	
	isSuccess = CafeDao.getInstance().insert(dto);
	}
	
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
		<%if(isSuccess){ %>
		<p>
			<%=writer %> 님의 글이 저장되었습니다
			<a href="${pageContext.request.contextPath}/cafe/list.jsp">게시판보기</a>
		</p>
	<%}else{ %>
		<p>
			글작성 실패!
			<a href="insertform.jsp">다시 쓰기</a>
		</p>
	<%} %>
	
	<script>
		console.log("<%=content %>");
		console.log("<%=title%>")
	</script>
</body>
</html>