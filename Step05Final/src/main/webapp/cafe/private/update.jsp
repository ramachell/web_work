<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="test.cafe.dto.CafeDto"></jsp:useBean>
<jsp:setProperty property="num" name="dto"/>
<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="content" name="dto"/>

<%
	// jsp useBean setProperty가 해당작업 다 대신해줌
	
// 	int num = Integer.parseInt(request.getParameter("num"));
// 	String title = request.getParameter("title");
// 	String content = request.getParameter("content");
	
// 	dto = new CafeDto();
// 	dto.setNum(num);
// 	dto.setTitle(title);
// 	dto.setContent(content);
	boolean isSuccess = CafeDao.getInstance().update(dto);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
   <%if(isSuccess){ %>
      <p>
         글이 수정되었습니다
         <a href="${pageContext.request.contextPath }/cafe/list.jsp">게시판으로</a>
      </p>
   <%}else{ %>
      <p>
         글 수정에 실패하였습니다
         <a href="${pageContext.request.contextPath }/cafe/private/updateform.jsp?num=<%=dto.getNum()%>">다시 시도</a>
      </p>
   <%} %>
</div>
</body>
</html>