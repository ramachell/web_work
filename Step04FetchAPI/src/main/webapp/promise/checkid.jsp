<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//인코딩 설정 한글안깨지게 utf-8
request.setCharacterEncoding("utf-8");
//request 로 값 받아오기
String inputId = request.getParameter("inputId");


	boolean canUse = true;
	
	if (inputId.equals("monkey")){
		canUse = false;
	}
		
%>

{
"CanUse" : <%=canUse %>
}