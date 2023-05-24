<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>/guest/insertform.jsp</title>
</head>
<body>
	<form action="insert.jsp" method="get">
		<div class="mb-1">
			<label class="form-lable" for="writer">이름</label>
			<input class="form-control" type="text" name="writer" id="writer" placeholder="이름..." />
		</div>
		<div class="mb-1">
			<label for="content" class="form-lable">내용</label>
			<textarea name="content" id="content" cols="70" rows="1"></textarea>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호.."/>
		</div>
		<button type="submit" class="btn btn-success mt-5" style="margin-top: 10px">추가</button>
	</form>


</body>
</html>