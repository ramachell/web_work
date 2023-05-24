<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// request 로 값 받아오기
// int num = Integer.parseInt(request.getParameter("num"));
// // getData()로 num에 해당하는 회원 MemberDto 가져와서 dto에 입력
// MemberDto dto = MemberDao.getInstance().getData(num);

int num = Integer.parseInt(request.getParameter("num"));
//2. 번호를 이용해서 DB 에 저장된 수정할 회원의 정보를 얻어낸다.
MemberDto dto = MemberDao.getInstance().getData(num);

%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정 양식</h1>
		<form action="update.jsp" method="post">
			<div class="mb-1">
				<label for="num">번호</label>
				<input type="text" id="num" name="num" value="<%=dto.getNum()%>" readonly />
			</div>
			<div class="mb-1">
				<label for="name">이름</label>
				<input type="text" id="name" name="name" value="<%=dto.getName()%>" />
			</div>
			<div class="mb-1">
				<label for="addr">주소</label>
				<input type="text" id="addr" name="addr" value="<%=dto.getAddr()%>" />
			</div>
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="reset" class="btn btn-warning">취소</button>
		</form>
	</div>

</body>
</html>