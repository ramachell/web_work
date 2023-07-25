<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/hello.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<input type="text" id="inputMsg" placeholder="문자열 입력..." />
		<button id="sendBtn">전송</button>
		<p id="result"></p>
		<div>div1</div>
		<div class="my-class">div2</div>
		<div class="my-class">div3</div>
		<div id="one">div4</div>
	</div>
	<input type="text" id="inputMsg" placeholder="문자열 입력..." />
	<button id="sendBtn">전송</button>
	<p id="result"></p>
	<div>div1</div>
	<div class="my-class">div2</div>
	<div class="my-class">div3</div>
	<div id="one">div4</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
      // 위의 input 요소에 문자열을 입력하고 전송버튼을 누르면 입력한 문자열을 p 요소의 innerText 에
      // 출력되도록 프로그래밍 해 보세요.
      /*
      document.querySelector("#sendBtn").addEventListener("click", ()=>{
         const msg=document.querySelector("#inputMsg").value;
         document.querySelector("#result").innerText=msg;
      });
      */
      $("div").on("click", (e)=>{
         $("div").removeClass("active");
         $(e.target).addClass("active");
        console.log(e);
      });
   </script>
</body>
</html>








