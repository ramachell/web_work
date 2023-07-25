<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/Step05_example.jsp</title>
<style>
	#dropZone {
		width: 300px;
		height: 300px;
		border: 2px dashed red;
		border-radius: 20px;
		/* 아래는 자식 contents 를 상하 좌우로 가운데 정렬 하기 위한 css */
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>
</head>
<body>
	<div class="container">
		<div id="dropZone">
			<p>파일 끌어놓기</p>
		</div>
	</div>
	<ul id="infoList">
		
	</ul>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$("#dropZone").on("dragover",(e)=>{
			e.preventDefault();
		}).on("drop",(e)=>{
			e.preventDefault();
			// 한번에 여러개 드롭했을시
			for(let i = 0 ; i <e.originalEvent.dataTransfer.files.length ; i++ ){
				const file = e.originalEvent.dataTransfer.files[i];
				const fileName = file.name;
				const mimeType = file.type;
				const info = `파일명 : \${fileName} 파일 type : \${mimeType}`;
				$("<li>").text(info).prependTo("#infoList");
			}
			
// 			const file = e.originalEvent.dataTransfer.files[0];
// 			const fileName = file.name;
// 			const mimeType = file.type;
// 			const info = `파일명 : \${fileName} 파일 type : \${mimeType}`;
// 			$("<li>").text(info).prependTo("#infoList");
		})
	</script>
</body>
</html>