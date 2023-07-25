<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	request.setAttribute("size", 123456789);
	request.setAttribute("price", 2500000);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jstl/test05.jsp</title>
</head>
<body>
	<p>
		파일의 크기는
		<fmt:formatNumber value="123456789" pattern="#,###"/>
		byte 입니다.
	</p>
	
	<p>
		파일의 크기는
		<fmt:formatNumber value="${size }" pattern="#,###"></fmt:formatNumber>
	</p>
		
	<p>
		가격은
		<fmt:formatNumber value="2500000" type="currency"></fmt:formatNumber>
	</p>
	
	<p>
		가격은
		<fmt:formatNumber value="${price }" type="currency"></fmt:formatNumber>
	</p>
	
	<p>
		가격은
		<fmt:formatNumber value="${price }" type="currency" currencySymbol="$"></fmt:formatNumber>
	</p>
	
	
</body>
</html>