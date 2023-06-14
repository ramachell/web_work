<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   //sample 데이터
   request.setAttribute("msg", "abcde구라1234");
   request.setAttribute("str", "<div></div> 는 문단을 나타내는 요소 입니다.");
   request.setAttribute("content", "하나\n두울\n세엣");
   request.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test_jstl/test07.jsp</title>
</head>
<body>
	<h1>JSTL function (EL 코드 블럭 안에서 사용하는 함수) 활용</h1>
	<p>"구라"가 포함되있는지 여부 : ${fn:contains(msg,'구라') }</p>
	
	<c:if test="${fn:contains(msg,'구라') }">
		<p>msg에 '구라' 가 포함되있네요</p>
	</c:if>
	
	<%-- str을 그대로 쓰면 <div>같은 html 요소가 출력이 제대로 안됨 --%>
	<p>${str }</p>
	<%-- fn:escapeXml 을 활용해서 문자 그대로 출력가능 --%>
	<p>${fn:escapeXml(str) }</p>
	
	<p>${content }</p>
	<%-- content 문자열에서 개행 기호를 찾아서 <br>로 바꿔서 출력 --%>
	<p>${fn:replace(content, newLine ,'<br>') }</p>
	<%-- "하나" 라는 문자를 찾아서 <br>로 바꿔서출력하는거 테스트해봄 --%>
	<p>${fn:replace(content, "하나" ,'<br>') }</p>
</body>
</html>