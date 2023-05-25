<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	
	GuestDao dao = GuestDao.getInstance();
	GuestDto dto = new GuestDto();
	
	dto.setNum(num);
	dto.setPwd(pwd);
	
	
	boolean isSuccess = dao.delete(dto);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<%if(isSuccess){ 
		// 삭제 성공이면 list.jsp 리다일렉트 이동
		String cPath=request.getContextPath();
		response.sendRedirect(cPath+"/guest/list.jsp");
		
	}else{ %>
		<script>
        	alert("비밀번호가 일치하지 않습니다.");
        	location.href="${pageContext.request.contextPath }/guest/list.jsp";
      	</script>
	<%} %>
	 

	
		 
	
	
</body>
</html>