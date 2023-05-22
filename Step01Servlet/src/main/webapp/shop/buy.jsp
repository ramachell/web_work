<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 몇번 상품 몇개인지를 HtteServletRequest 객체를 이용해서 얻어낸다음
// 아래의 html 요소에 출력해 보세요.
%>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
int amount = Integer.parseInt(request.getParameter("amount"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title>
</head>
<body>

	<p>
		<strong><%=num%></strong>번 상품 <strong><%=amount%></strong>개를 주문했습니다.
	</p>
</body>
</html>