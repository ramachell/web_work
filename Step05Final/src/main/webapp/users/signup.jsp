<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청 인코딩 설정
	// filter 추가했으니 없어도됨 
	// request.setCharacterEncoding("utf-8");
	// 폼 전송되는 회원 가입정보를 읽어와서
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	// Dto에 담아서
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	dto.setPwd(pwd);
	// Dao이용해서 DB에 저장
	boolean isSuccess = UsersDao.getInstance().insert(dto);
	// 응답
%>
