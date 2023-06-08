<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.swing.plaf.multi.MultiOptionPaneUI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/file/private/upload_form2.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h3>파일 업로드 폼2 입니다.</h3>
		<!-- 
			파일 업로드 폼 작성법
			1. method="post"
			2. enctype="multipart/form-data"
			3. <input type="file"/>
				- enctype="multipart/form-data" 가 설정된 폼을 전송하면
				폼전송된 내용을 추출할때 HttpServletRequest 객체로 추출할 수 없다
				MultipartRequest 객체를 이용해서 추출해야한다
			
		-->
		
		<form action="upload2.jsp" method="post" enctype="multipart/form-data" id="myForm">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" />
			</div>
			<div>
				<label for="myFile">첨부파일</label>
				<input type="file" name="myFile" id="myFile" />
			</div>
			<button type="submit">업로드</button>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
		// submit 이벤트리스너
		document.querySelector("#myForm").addEventListener("submit", e=>{
			// 기본 동작 막고
			e.preventDefault();
			// 폼전송을 직접 js로 만들기
			// 폼 데이터를 담는다
			let data = new FormData(e.target);
			
// 			// fetch로 보내기
// 			fetch("upload2.jsp",{
// 				method : "post",
// 				body : data
// 			})
// 			.then(res=>res.text())
// 			.then(data=>{
// 				//data는 upload2.jsp가 응답한 문자열임 위에서의 data랑 전혀 다른거
// 				const data2 = JSON.parse(data);
				
// 			}))
			
			// gura util 사용하기
	
			ajaxFormPromise(e.target)
			.then(res=>res.json())
			.then((data)=>{
				//data object 이다 
				console.log(data);
			});
		
			
		})
	</script>
</body>
</html>