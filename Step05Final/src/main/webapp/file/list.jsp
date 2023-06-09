<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	
	// 전송된 파라미터 row pageNum2 가져오기
	String sRow = request.getParameter("row");
	String sPageNum2 =request.getParameter("pageNum2");
	
	// null일경우 기본값 설정
	if( sRow == null ){
		sRow = "10";
	}
	if(sPageNum2==null){
		sPageNum2= "1";
	}
	// 형변환
	int row = Integer.parseInt(sRow);
	int pageNum2 = Integer.parseInt(sPageNum2);
	// 파일리스트 출력
	List<FileDto> list = FileDao.getInstance().getList2(row,pageNum2);
	String id = (String) session.getAttribute("id");
	// 페이지 10단위용 변수
	int pageNum = (pageNum2-1)/10+1;
	// 마지막 글수가 몇인지
	int count = FileDao.getInstance().getCount();
	
	// 종료페이지 (10개단위) 
	int endRowNum = (int)Math.ceil((double)count/row);

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
		<a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax  업로드 하기</a>
		<h1>자료실 목록입니다.</h1>
		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum2 %>&row=1">1개씩보기</a>
		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum2 %>&row=3">3개씩보기</a>
		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum2 %>&row=5">5개씩보기</a>
		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum2 %>&row=10">10개씩보기</a>
		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum2 %>&row=15">15개씩보기</a>
		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum2 %>&row=20">20개씩보기</a>
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
		
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=1&row=<%=row%>">1페이지로</a></li>
		<%if (pageNum!=1){ %>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum2-10%>&row=<%=row%>"><</a></li>
		<%} %>
		<%for(int i = pageNum*10-9 ; i <= pageNum*10 ; i++) {%>
			<%if( endRowNum >= i ) {%>
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=i %>&row=<%=row%>"><%=i %></a></li>
				<%} %>
			
		<%} %>
			<%if(pageNum*10*row < count){%>
			
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum2+10%>&row=<%=row%>">></a></li>
			<%} %>
		</ul>	
			
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+1 %>&row=<%=row%>"><%=pageNum*10+1 %></a> --%>
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+2 %>&row=<%=row%>"><%=pageNum*10+2 %></a> --%>
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+3 %>&row=<%=row%>"><%=pageNum*10+3 %></a> --%>
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+4 %>&row=<%=row%>"><%=pageNum*10+4 %></a> --%>
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+5 %>&row=<%=row%>"><%=pageNum*10+5 %></a> --%>
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+6 %>&row=<%=row%>"><%=pageNum*10+6 %></a> --%>
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+7 %>&row=<%=row%>"><%=pageNum*10+7 %></a> --%>
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+8 %>&row=<%=row%>"><%=pageNum*10+8 %></a> --%>
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+9 %>&row=<%=row%>"><%=pageNum*10+9 %></a> --%>
<%-- 		<a href="${pageContext.request.contextPath}/file/list.jsp?pageNum2=<%=pageNum*10+10 %>&row=<%=row%>"><%=pageNum*10+10 %></a> --%>
		 
		
	</div>
</body>
</html>