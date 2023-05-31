<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// DB에서 읽어온 더보기 메시지 목록이라고 가정
	List<String> list = new ArrayList<>();
	list.add("1번메시지");
	list.add("2번메시지");
	list.add("3번메시지");
	
%>
[
	<%for(int i = 0 ; i < list.size();i++){ %>
		"<%=list.get(i) %>"
		<%if(i < list.size() - 1){%>
		,
		<%} %>
	<%}%>
]

