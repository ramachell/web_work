<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/fortune.jsp</title>

</head>
<body>
	<div>
		<p>오늘의 운세 <% String a = (String) request.getAttribute("fortuneToday");  out.print(a); %></p>
	</div>
</body>
</html>