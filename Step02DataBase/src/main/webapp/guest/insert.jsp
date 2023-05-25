<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.net.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
// request 로 값 받아오기
String writer = request.getParameter("writer");
String content = request.getParameter("content");
String pwd = request.getParameter("pwd");

// 2
// dto 객체 하나 만들기 + 생성자로 바로 데이터입력
GuestDto dto = new GuestDto();
dto.setWriter(writer);
dto.setContent(content);
dto.setPwd(pwd);

// dao 객체 얻어오기
GuestDao dao = GuestDao.getInstance();
// boolean으로 insert 성공 or 실패 받아오기
boolean isSuccess = dao.insert(dto);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insert.jsp</title>
</head>
<body>

	<!-- 3 -->
	<script>
	
	<%if (isSuccess) {%>
		//alert
		alert("방명록이 성공적으로 등록되었습니다.")
		location.href="list.jsp";
		
		<%}else{%>
		// 등록 실패시
		alert("방명록 등록이 실패하였습니다.")
		location.href="${pageContext.request.contextPath}/guest/list.jsp"
		<%}%>
		
	</script>


</body>
</html>