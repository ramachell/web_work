<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 삭제할 파일번호
	int num = Integer.parseInt(request.getParameter("num"));
	// 그 파일의 정보 dto
	FileDto dto = FileDao.getInstance().getData(num);
	
	// 로그인된 아디랑 글 작성자가 일치하는지 확인
	String id = (String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)){
		// 에러 응답하기
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일 지우는건 안됩니다.");
		// 메소드 끝내기
		return;
	}
	
	// File 이용해서 삭제한다 (실제 폴더에서 삭제)
	String path=application.getRealPath("/upload") + File.separator+dto.getSaveFileName();
	File f = new File(path);
	f.delete();
	// DB에서 삭제
	
	FileDao.getInstance().delete(num);
	
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp");

%>
