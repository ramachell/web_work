<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>/todo/insertform.jsp</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		<div class="mb-1">
			<label class="form-lable" for="work">할일</label>
			<input class="form-control" type="text" name="work" id="work" placeholder="할일..." />
		</div>
		<div class="mb-1">
			<label for="etc" class="form-lable">기타</label>
			<input type="text" class="form-control" name="etc" id="etc" placeholder="기타 사유..." />
		</div>
		<button type="submit" class="btn btn-success mt-5" style="margin-top: 10px">추가</button>
	</form>


</body>
</html>