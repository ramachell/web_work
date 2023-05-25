<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	boolean isSuc= false;
	GuestDao dao = GuestDao.getInstance();
	if(dao.getData(num)!=null){
		String dbPwd = dao.getData(num).getPwd();
	
		if(pwd.equals(dbPwd)){
			isSuc = dao.delete(num);
		}
	}
	
	
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
	<% if(!isSuc) {%>
	
		<div class="container col-6 mt-5" >
			<form method = "post" action = "delete.jsp">
				<input type = "hidden" name = "num" value = "<%=num %>">
				<p>비밀번호를 입력해주세요</p>
				<table>
					<tr>
						<td>비밀번호</td>
						<td><input type = "password" name = "pwd"></td>
						<td><input type = "submit" value = "확인"></td>
					</tr>
				</table>
			</form>
		
	<% }%>
	
	<% if(isSuc) {%>
		<div class="container col-6 mt-5" >
			<p>삭제가 완료되었습니다.</p>
		
	<% }%>
	<a href = "list.jsp">방명록으로 돌아가기</a>
	</div>
	
	
</body>
</html>