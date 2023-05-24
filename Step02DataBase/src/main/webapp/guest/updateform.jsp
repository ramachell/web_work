<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// request 로 값 받아오기
// int num = Integer.parseInt(request.getParameter("num"));
// // getData()로 num에 해당하는 회원 GuestDto 가져와서 dto에 입력
// GuestDto dto = GuestDao.getInstance().getData(num);

int num = Integer.parseInt(request.getParameter("num"));
//2. 번호를 이용해서 DB 에 저장된 수정할 회원의 정보를 얻어낸다.
GuestDto dto = GuestDao.getInstance().getData(num);

%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1>방명록 수정</h1>
		<form action="update.jsp" method="post">
			<div class="mb-1">
				<label for="num">번호</label>
				<input type="text" id="num" name="num" value="<%=dto.getNum()%>" readonly />
			</div>
			<div class="mb-1">
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer" value="<%=dto.getWriter()%>" />
			</div>
			<div class="mb-1">
				<label for="content">글내용</label>
				<textarea name="content" id="content" cols="70" rows="1" ><%=dto.getContent()%></textarea>
			</div>
			<div>
				<label for="regdate">글 작성날짜 <%=dto.getRegdate()%></label>
			</div>
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="reset" class="btn btn-warning">취소</button>
		</form>
	</div>

</body>
</html>