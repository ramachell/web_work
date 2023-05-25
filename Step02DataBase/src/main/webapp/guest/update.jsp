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


// dto 객체 하나 만들기 + setter 값입력
GuestDto dto = new GuestDto();
dto.setNum(num);
dto.setWriter(writer);
dto.setContent(content);
// dao 객체 얻어오기
GuestDao dao = GuestDao.getInstance();
boolean isSuccess = false;
boolean pwdck = dao.getData(num).getPwd().equals(pwd);
if (pwdck){
isSuccess = dao.update(dto);
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
			<strong>방명록이 수정되었습니다.</strong>  <a href="list.jsp">방명록으로 돌아가기</a>
		</p>
		<%} else if(!pwdck){ %>
		<p class="alert alert-warning">
			<strong>비밀번호가 틀렸습니다.</strong>  <a href="updateform.jsp?num=<%=num%>">다시 수정하러가기</a>
		</p>
		
		
		<%} else {%>
		<p class="alert alert-warning">
			방명록 수정 실패 <a href="updateform.jsp?num=<%=num%>">다시 수정 하러가기</a>
		</p>
		<%}%>
	</div>

</body>
</html>