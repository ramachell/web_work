<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<FileDto> list = FileDao.getInstance().getList();
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/file/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<div class="container col-9">
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
		<br />
		<a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp">업로드 하기</a>
		<h1>자료실 목록입니다.</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>파일사이즈</th>
					<th>등록일</th>
				</tr>
			</thead>
				
			<tbody>
			<% for(FileDto tmp : list) { %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td><a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a></td>
					<td><%
					if(tmp.getFileSize() < 1024){
						out.print(tmp.getFileSize() + " B");
					} else if (tmp.getFileSize() < 1024*1024 ){
						out.print(tmp.getFileSize()/(double)1024 + " KB");						
					} else {
						out.print(tmp.getFileSize()/(double)1024/1024 + " MB");
					}
					%></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
						<%-- 작성자와 아이디가 같을때만 삭제 링크출력 --%>
						<%if (tmp.getWriter().equals(id)) {%>
							<a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
						<%} %>
					</td>
				</tr>
			<% }%>
			</tbody>
			
			
		</table>
	</div>
</body>
</html>