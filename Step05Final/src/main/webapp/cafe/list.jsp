<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//한 페이지에 몇개씩 표시할 것인지
	String strPageRow= request.getParameter("pagerow");
	// pagerow 정보가 null일경우 기본값설정
	if(strPageRow == null ){
		strPageRow = "10";
	}
	int pageRow = Integer.parseInt(strPageRow);
	//하단 페이지를 몇개씩 표시할 것인지
	final int pageCount=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}		

	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*pageRow;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*pageRow;
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/pageCount)*pageCount;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+pageCount-1;
	//전체 글의 갯수
	int totalRow=CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)pageRow);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해 준다. 
	}
		

	//FileDto 에 startRowNum 과 endRowNum 을 담아서 
	CafeDto dto=new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//파일 목록을 얻어온다.
	List<CafeDto> list=CafeDao.getInstance().getList(dto);
	//로그인된 아이디( 로그인이 되어있지 않으면 null 이다)
	String id=(String)session.getAttribute("id");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/index.jsp">젤 처음으로</a>
		<h1>게시글 목록 입니다</h1>
		<div>
			<a href="list.jsp?pageNum=<%=pageNum%>&pagerow=1">1개씩보기</a>
			<a href="list.jsp?pageNum=<%=pageNum%>&pagerow=3">3개씩보기</a>
			<a href="list.jsp?pageNum=<%=pageNum%>&pagerow=5">5개씩보기</a>
			<a href="list.jsp?pageNum=<%=pageNum%>&pagerow=10">10개씩보기</a>
		</div>
		<div>
			<a href="private/insertform.jsp">새글 작성</a>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<%for(CafeDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></td>
					<td><%=tmp.getViewCount() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
						<%-- 글작성자와 로그인된 아이디와 같을때만 삭제 링크 출력하기 --%>
						<%if(tmp.getWriter().equals(id)){ %>							
							<a href="private/updateform.jsp?num=<%=tmp.getNum() %>">수정</a>
							<a href="private/delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
						<%} %>
					</td>
				</tr>
			<%} %>	
			</tbody>
		</table>
		<ul class="pagination">
			<%-- 1페이지 아닐때만 --%>
			<%if(startPageNum != 1){ %>
				<li class="page-item">
					<a href="list.jsp?pageNum=1&pagerow=<%=pageRow%>" class="page-link">1페이지로</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>&pagerow=<%=pageRow%>"><</a>
				</li>
				
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<li class="page-item <%= i==pageNum ? "active":"" %>">
					<a class="page-link" href="list.jsp?pageNum=<%=i %>&pagerow=<%=pageRow%>"><%=i %></a>
				</li>
			<%} %>
			<%--
				마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
			--%>
			<%if(endPageNum < totalPageCount){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>&pagerow=<%=pageRow%>">Next</a>
				</li>
			<%} %>
		</ul>
	</div>

</body>
</html>