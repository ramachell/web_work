<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8");
    String msg = request.getParameter("msg");
    // 이클립스 버그때문에 jsp에선 콘솔출력불가
    
    System.out.println("msg : " + msg);

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send.jsp/title></title>
</head>
<body>
	

</body>
</html>