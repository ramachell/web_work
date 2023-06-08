<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//아이디
	String id=request.getParameter("id");
	//비밀번호
	String pwd=request.getParameter("pwd");
	//직업
	String job=request.getParameter("job");
	//성별
	String gender=request.getParameter("gender");
	//취미
	String[] hobby=request.getParameterValues("hobby");
	String hobbyResult="";
	if(hobby!=null){

	for(String tmp : hobby){
		hobbyResult += tmp + "/";	
	}
	}
	
	String allowAll=request.getParameter("allowAll");
	String allowEmail=request.getParameter("allowEmail");
	String allowMessage=request.getParameter("allowMessage");

	 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>회원가입 결과</h1>
		<p>회원님의 정보를 성공적으로 저장했습니다.</p>
        <form action="signup.jsp" method="post">
            <div class="form-floating mb-2">
                <input class="form-control" value="<%=id %>" type="text" name="id" id="id" placeholder="아이디 입력">
                <label for="id">아이디</label>
            </div>
            <div class="form-floating mb-2">
                <input class="form-control" value="<%=pwd %>" type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
                <label for="pwd">비밀번호</label>
            </div>
            <select class="form-select mb-2" id="job" name="job">
                <option value="">직업 선택</option>
                <option value="programmer" <%=job.equals("programmer") ? "selected":"" %>>프로그래머</option>
                <option value="doctor" <%=job.equals("doctor") ? "selected":"" %>>의사</option>
            </select>
            <fieldset>
                <legend>성별 체크</legend>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" value="man" type="radio" id="one" name="gender" 
                    <% if(gender.equals("man"))out.print("checked"); %>> 
                    <label class="form-check-label" for="one">남자</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" value="woman" type="radio" id="two" name="gender"
                    <% if(gender.equals("woman"))out.print("checked"); %>> 
                    <label class="form-check-label" for="two">여자</label>
                </div>
            </fieldset>
            <fieldset>
                <legend>취미 체크</legend>
                <div class="form-check">
                    <input type="checkbox" value="piano" name="hobby" class="form-check-input" id="piano"
                    <%= hobbyResult.contains("piano") ? "checked" : "" %> disabled>
                    <label class="form-check-label" for="piano">피아노</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" value="game" name="hobby" class="form-check-input" id="game" 
                    <%= hobbyResult.contains("game") ? "checked" : "" %> disabled>
                    <label class="form-check-label" for="game">게임</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" value="etc" name="hobby" class="form-check-input" id="etc"
                    <%= hobbyResult.contains("etc") ? "checked" : "" %> disabled>
                    <label class="form-check-label" for="etc">기타</label>
                </div>
            </fieldset>
            <fieldset>
                <legend>개인정보 활용 동의</legend>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox"  id="allowAll"
                    <%= allowAll!=null ? "checked" : "" %> disabled>
                    <label class="form-check-label" for="allowAll">전체 동의</label>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input allow" type="checkbox" value="email" name="allowEmail" id="allowEmail"
                    <%= allowEmail!=null ? "checked" : "" %> disabled>
                    <label class="form-check-label" for="allowEmail">이메일 수신여부</label>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input allow" type="checkbox" value="message" name="allowMessage" id="allowMessage"
                    <%= allowMessage != null ? "checked" : "" %> disabled>
                    <label class="form-check-label" for="allowMessage">광고성 문자 수신여부</label>
                </div>
            </fieldset>
            <button class="btn btn-outline-primary" type="submit">가입</button>
        </form>		
	</div>
</body>
</html>



