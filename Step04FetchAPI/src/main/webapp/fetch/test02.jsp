<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test03.jsp</title>
</head>
<body>
	
	<button id="moreBtn">더보기</button>
	<ul id="msgList">
		<li>하나</li>
		<li>두울</li>
		<li>세엣</li>
	</ul>
	
	<script>
		//문자열을 입력하고 전송 버튼을 눌렀을때 입력한 문자열을 읽어와서 send.jsp 페이지로 전송이 되도록 하기
		document.querySelector("#moreBtn").addEventListener("click", ()=>{
			fetch("get_msg.jsp")
			.then(res=>res.text())
			.then(data=>{
				//data는 get_msg.jsp가 출력한 <li> 요소 3개
				//	<li>1번메시지</li>....
				console.log(data);
				document.querySelector("#msgList").insertAdjacentHTML("beforeend",data);
			});
		});
	</script>
</body>
</html>