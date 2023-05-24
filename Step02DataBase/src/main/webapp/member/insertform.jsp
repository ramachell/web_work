<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>/member/insertform.jsp</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		<div class="mb-1">
			<label class="form-lable" for="name">이름</label>
			<input class="form-control" type="text" name="name" id="name" placeholder="이름..." />
		</div>
		<div class="mb-1">
			<label for="addr" class="form-lable">주소</label>
			<input type="text" class="form-control" name="addr" id="addr" placeholder="주소..." />
		</div>
		<button type="submit" class="btn btn-success mt-5" style="margin-top: 10px">추가</button>
	</form>


</body>
</html>