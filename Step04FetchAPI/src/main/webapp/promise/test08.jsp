<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Step02_Form3.html</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1>회원가입폼</h1>
		<form action="">
			<div class="mb-2">
				<label class="form-label" for="id">아이디</label>
				<input class="form-control" type="text" id="id" name="id">
				<div class="invalid-feedback">5 글자 이상 입력하세요!</div>
			</div>
			<div class="mb-2">
				<label class="form-label" for="email">이메일</label>
				<input class="form-control" type="text" id="email" name="email">
				<div class="invalid-feedback">이메일 형식에 맞게 입력해 주세요!</div>
			</div>
			<button class="btn btn-primary btn-sm" type="submit" disabled="disabled">가입</button>
		</form>
	</div>
	<script>
        //페이지 로딩 시점에 상태값을 관리할 변수를 만들고 초기값을 부여한다.
        let isFormValid=false;
        let isIdValid=false;
        let isEmailValid=false;

        //아이디 입력란에 입력을 할때마다 호출되는 콜백함수 등록하기 
        document.querySelector("#id").addEventListener("input", (e)=>{
            //1. 입력한 아이디를 읽어온다
            const inputId=e.target.value;
            //2. fetch() 로 서버에 보냄
            fetch("checkid.jsp?inputId="+inputId)
            .then(res=>res.json())
            .then((data)=>{
            	isIdValid = data.CanUse;
            	console.log(isIdValid);
            	if(isIdValid){
                    e.target.classList.add("is-valid");
                    e.target.classList.remove("is-invalid");
                }else{
                    e.target.classList.add("is-invalid");
                    e.target.classList.remove("is-valid");
                }
            	buttonChange();
            })
		});

        document.querySelector("#email").addEventListener("input", (e)=>{
            //1. 입력한 이메일 주소를 읽어온다
            const inputEmail=e.target.value;
            //2. 이메일을 검증할 정규표현식 객체 생성
            let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
            //3. 이메일 형식에 부합하는지 확인
            isEmailValid=regex.test(inputEmail);
            //4. 부합하는지 여부에 따라서 is-valid 와 is-invalid 클래스를 추가 혹은 제거 하기 
            if(isEmailValid){
                e.target.classList.add("is-valid");
                e.target.classList.remove("is-invalid");
            }else{
                e.target.classList.add("is-invalid");
                e.target.classList.remove("is-valid");
            }
            buttonChange();
        });

        //버튼의 상태를 바꾸는 함수 
        function buttonChange(){
            //폼 전체가 유효한지 여부
            isFormValid = isIdValid && isEmailValid;
            if(isFormValid){
                document.querySelector("button[type=submit]").removeAttribute("disabled");
            }else{
                document.querySelector("button[type=submit]").setAttribute("disabled", "disabled");
            }
        }
    </script>
</body>
</html>