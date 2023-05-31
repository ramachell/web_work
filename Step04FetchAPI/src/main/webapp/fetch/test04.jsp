<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test04.jsp</title>
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
			fetch("get_msg2.jsp")
			.then(res=>res.json())
			.then(data=>{
				// 받는 data가 json형식의 문자열이면 json()로 바로 parse 된걸로 얻어올수있음
				
				// li를 ``으로 만들어서 추가하기
				// 여기서 $는 js에서 읽어야하지만 jsp가 먼저 읽고 다른걸로 바꿔버림
				// 그걸 막기위해 jsp는 저걸 문자열로 처리시키기위해 \ 이스케이프 사용함
				// 그럼 jsp에서 \\z${}를 해석하면 \\${}만 남고 그걸 이제 js 가 해석함
				for(let i = 0 ; i < data.length ; i ++){
					let li = `<li>{data[i]}</li>`;
					document.querySelector("#msgList").insertAdjacentHTML("beforeend",li);
				}
				
				
// 				for(let i = 0 ; i < list.length ; i ++){
// 					// <li> 를 만들어서 그 참조값 li1에
// 		            let li1 = document.createElement("li");
// 		            // li1.innerText에 list의 각 요소
// 		            li1.innerText = list[i];
// 		            // #msgList에 li1 추가
// 		            document.querySelector("#msgList").append(li1);
// 				}
				
				
				
			});
		});
		

	</script>
</body>
</html>