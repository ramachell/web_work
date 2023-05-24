<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
// request 로 값 받아오기
int num = Integer.parseInt(request.getParameter("num"));
String writer = request.getParameter("writer");
String content = request.getParameter("content");
String pwd = request.getParameter("pwd");


// dto 객체 하나 만들기 + 생성자로 바로 데이터입력
GuestDto dto = new GuestDto();
dto.setNum(num);
dto.setWriter(writer);
dto.setContent(content);
// dao 객체 얻어오기
GuestDao dao = GuestDao.getInstance();
boolean isSuccess;
boolean pwdck = dao.getData(num).getPwd().equals(pwd);
if (pwdck){
isSuccess = dao.update(dto);
} else {
	isSuccess = false;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/update.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuccess){%>
		<p class="alert alert-success">
			<strong><%=num%></strong> 번 회원의 정보를 수정했습니다. <a href="list.jsp">목록보기</a>
		</p>
		<%} else if(!pwdck){ %>
		<p class="alert alert-success">
			<strong></strong> 비밀번호가 틀렸습니다. <a href="list.jsp">목록보기</a>
		</p>
		
		
		<%} else {%>
		<p class="alert alert-warning">
			수정실패! <a href="updateform.jsp?num=<%=num%>">다시 수정</a>
		</p>
		<%}%>
	</div>

</body>
</html>