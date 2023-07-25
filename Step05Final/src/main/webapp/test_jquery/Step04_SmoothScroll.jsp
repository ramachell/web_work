<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>jQuery</title>
<style>
body {
	font-family: Consolas, sans-serif;
}

a {
	color: blue;
}

p {
	margin-bottom: 800px;
}
</style>
</head>
<body>
	<ul>
		<li><a href="#ipsum">Ipsum</a></li>
		<li><a href="#dolor">Dolor</a></li>
	</ul>
	<h1>Lorem</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non ipsum massa. Pellentesque vel dapibus elit. Fusce at rhoncus nisl, sit amet facilisis ante. Morbi vestibulum diam ac congue maximus. Nullam quis risus auctor, congue leo quis, pellentesque diam. Morbi scelerisque, odio quis egestas tincidunt, tellus nunc auctor mi, pellentesque sagittis erat felis quis dolor. Integer sit amet velit quis leo placerat imperdiet. Pellentesque tempus nulla nec porttitor rhoncus.</p>
	<h1 id="ipsum">Ipsum</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non ipsum massa. Pellentesque vel dapibus elit. Fusce at rhoncus nisl, sit amet facilisis ante. Morbi vestibulum diam ac congue maximus. Nullam quis risus auctor, congue leo quis, pellentesque diam. Morbi scelerisque, odio quis egestas tincidunt, tellus nunc auctor mi, pellentesque sagittis erat felis quis dolor. Integer sit amet velit quis leo placerat imperdiet. Pellentesque tempus nulla nec porttitor rhoncus.</p>
	<h1 id="dolor">Dolor</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non ipsum massa. Pellentesque vel dapibus elit. Fusce at rhoncus nisl, sit amet facilisis ante. Morbi vestibulum diam ac congue maximus. Nullam quis risus auctor, congue leo quis, pellentesque diam. Morbi scelerisque, odio quis egestas tincidunt, tellus nunc auctor mi, pellentesque sagittis erat felis quis dolor. Integer sit amet velit quis leo placerat imperdiet. Pellentesque tempus nulla nec porttitor rhoncus.</p>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>

	<script src="https://cdn.statically.io/gh/kswedberg/jquery-smooth-scroll/3948290d/jquery.smooth-scroll.min.js"></script>
	<script>
		$(document).ready(function() {
			$('a').smoothScroll();
		});
	</script>
</body>
</html>