<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	// utf-8 인코딩
	request.setCharacterEncoding("utf-8");
	// 전달받은 id pwd 파라미터추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// 아디비번 맞는지 체크용
	boolean isValid = false;
	// 아이디는 gura 비번은 1234가 유효한 정보라고 가정 맞으면 true로 바꿈
	if(id.equals("gura") && pwd.equals("1234")){
		isValid = true;
	}
%>
{"isSuccess" : <%= isValid %>}