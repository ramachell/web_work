<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Random ran = new Random();
	int ranNum = ran.nextInt(5);
	String[] fortunes = { "동쪽으로 가면 귀인", "오늘은 집에만 있기", "너무 멀리가지 않기", "다되는날", "로또됨" };
	%>
	
	<p><% out.print(fortunes[ranNum]); %></p>
	<p><%=fortunes[ranNum]%></p>
	<p><%=11 %></p>
	<p><%="dda" %></p>
	<p><%="awdawdawd" %></p>
	<p><%="adsdasads" %></p>
	
	
	<p>동쪽 어쩌구 저쩌구</p>
</body>
</html>