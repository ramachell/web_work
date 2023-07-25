<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/plugin.jsp</title>
</head>
<body>
	<p id="one"></p>
	<p id="two"></p>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script src="js/jquery.gura.js"></script>
	<script>
		// jquery 의 기능을 확장하기 (plugin)
		(function($){
			$.fn.gura=function(options){
				//default 값 정의
				let settings=$.extend({
					msg : "나는 플러그인이다",
					color : "#ff00ff"
				},options);
				//this 는 $()로 선택된 객체
				this.text(settings.msg).css("color",settings.color);
				// chain 형태로 동작 가능하도록 this 다시 리턴
				return this;
			};
			
			
		})(jQuery);
		
		$("#two").gura()
	</script>
</body>
</html>