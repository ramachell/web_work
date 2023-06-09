<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// num 읽어오기
	int num = Integer.parseInt(request.getParameter("num"));
	// dto dao이용해서 num에맞는 dto 가져오기
	CafeDto dto = CafeDao.getInstance().getData(num);
	// dtowriter 랑 id 맞나 확인
	String id = (String)session.getAttribute("id");
	boolean isMatch = dto.getWriter().equals(id); 


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insertform.jsp</title>
</head>
<body>
	
	
   <div class="container">
   	
      <h1>글 수정 하기</h1>
      <%if(isMatch) {%>
      <form action="update.jsp" method="post">
      		<input type="hidden" name="num" value="<%=num %>"/>
         <div>
            <label for="title">제목</label>
            <input type="text" value="<%=dto.getTitle() %>" name="title" id="title"/>
         </div>
         <div>
            <label for="content">내용</label>
            <textarea name="content" id="content" rows="10"><%=dto.getContent() %></textarea>
         </div>
         <button type="submit">저장</button>
      </form>
      <%} else {%>
      	<p>남의 글은 수정할 수 없습니다.</p>
      	<a href="${pageContext.request.contextPath}/cafe/list.jsp">게시판으로 돌아가기</a>
      <%} %>
   </div>
   
   
</body>
</html>







