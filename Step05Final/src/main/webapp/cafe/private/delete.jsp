<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	
	CafeDto dto = CafeDao.getInstance().getData(num);
	String id = (String)session.getAttribute("id");
	
	if(!dto.getWriter().equals(id)){
		// 에러 응답하기
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 글 지우는거 안됨.");
		// 메소드 끝내기
		return;
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/delete.jsp</title>
</head>
<body>
	<script>
		const isconfirm = confirm("삭제하시겠습니까");
		
		
   
   
   		<%CafeDao.getInstance().delete(num);
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/cafe/list.jsp");%>
	 
   
   
   </script>
</body>
</html>



