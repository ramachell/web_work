<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jstl/test01.jsp</title>
</head>
<body>
	<h1>jstl 활용</h1>
	<c:forEach var="i" begin="1" end="10">
		${i}
	</c:forEach>
	</body>
</html>