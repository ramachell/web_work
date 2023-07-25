<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Step02_ajax.jsp</title>
</head>
<body>
	<h1>ajax 요청</h1>
	<button id="requestBtn">요청</button>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$("#requestBtn").on("click",()=>{
			$.ajax({
				url:"${pageContext.request.contextPath}/cafe/json_list.jsp",
				method:"get",
				data:{},
				success:(data)=>{
					
					console.log(data)
					
				}
			})
		})
	</script>
</body>
</html>