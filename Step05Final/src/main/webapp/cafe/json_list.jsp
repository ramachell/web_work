<%@page import="org.json.JSONObject"%>
<%@page import="org.apache.tomcat.util.json.JSONFilter"%>
<%@page import="org.json.JSONWriter"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

	
	
	CafeDto dto = new CafeDto();
	dto.setStartRowNum(5);
	dto.setEndRowNum(17);
	
	
	
	List<CafeDto> list = CafeDao.getInstance().getList(dto);
	String json = JSONWriter.valueToString(list);
%>
<%=json %>

