<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// test를 위해 sample data request담기
	request.setAttribute("jumsu",86);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jstl/test04.jsp</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/index.jsp">처음으로</a>
	
	
	
	<c:if test="${10%2 eq 0 }">
		<p>10은 짝수입니다</p>
	</c:if>

	<c:if test="${11%2 eq 0 }">
		<p>11은 짝수입니다</p>
	</c:if>
	
	<c:if test="${jumsu%2 eq 0 }">
		<p>${jumsu } 은 짝수입니다</p>
	</c:if>
	
	<p>획득한 점수는 <strong>${jumsu }</strong>입니다</p>
	<p>
		따라서 이번학기 학점은
		<c:choose>
			<c:when test="${jumsu ge 90 }">A</c:when>
			<c:when test="${jumsu ge 80 }">B</c:when>
			<c:when test="${jumsu ge 70 }">C</c:when>
			<c:when test="${jumsu ge 60 }">D</c:when>
			<c:otherwise>F</c:otherwise>
		</c:choose>
		입니다
	</p>
	
	<%
		String id = (String)session.getAttribute("id");
	%>
	
	<%if(id == null) { %>
		<p>로그인이 필요함</p>
	<%} else { %>
		<p><strong><%= id %></strong>님 로그인중</p>
	<%} %>
	
	<c:choose>
		<c:when test="${ empty id }">
			<p>로그인이 필요함2</p>
		</c:when>
		<c:otherwise><p><strong>${id }님</strong> 로그인중2</p></c:otherwise>
	</c:choose>
	
</body>
</html>