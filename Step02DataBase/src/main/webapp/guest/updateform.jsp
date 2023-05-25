<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// num 읽어오기
int num = Integer.parseInt(request.getParameter("num"));
// dto dao이용해서 num에맞는 dto 가져오기
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
	<div class="container" style="margin-top:200px;">
		<h1>방명록 수정</h1>
		<form action="update.jsp" method="post">
			<div class="mb-1">
				<label for="num">글번호</label>
				<input type="text" id="num" name="num" value="<%=dto.getNum()%>" readonly class="form-control-plaintext" />
			</div>
			<div class="mb-1">
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer" class="form-control" value="<%=dto.getWriter()%>" />
			</div>
			<div class="mb-1">
				<label for="content">글내용</label>
				<textarea name="content" id="content" class="form-control" cols="70" rows="1" ><%=dto.getContent()%></textarea>
			</div>
			<div class="mb-1 col-1">
				<label for="pwd">비밀번호</label>
				<input type="password" id="pwd" name="pwd" class="form-control" />
			</div>
			<div class="mb-3">
				<label for="regdate">글 작성날짜 <%=dto.getRegdate()%></label>
			</div>
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='list.jsp' ">다시 방명록으로</button>
		</form>
	</div>

</body>
</html>