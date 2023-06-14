<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello vue js</h1>
	<div id="app">
		<p>오늘의 운세 : <strong>{{fortune}}</strong></p>
		<p>내이름은 : <strong>{{myName}}</strong></p>
		<button v-on:click="clicked">눌러</button>
		<button v-on:click="clicked2">이름 바꾸기</button>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		// Vue 객체를 생성하면서 object 전달하기
		new Vue({
			el:"#app",
			data:{
				fortune:"동쪽가면 귀인 만남",
				myName:"내 이름이 뭔데 너뭔데"
				
			},
			methods:{
				clicked:function(){
					this.fortune = "남쪽가면 ...  다시 볼수있어";
				},
				clicked2:function(){
					this.myName = "내 이름은....."
				}
			}
		});
		
	</script>
</body>
</html>