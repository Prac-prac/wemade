<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>wemade Login</title>
	
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Song+Myung&display=swap" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#fffcf7), to(#e8dbc3));
      background: -webkit-linear-gradient(bottom left, #fffcf7 0%, #e8dbc3 100%);
      background: -moz-linear-gradient(bottom left, #fffcf7 0%, #e8dbc3 100%);
      background: -o-linear-gradient(bottom left, #fffcf7 0%, #e8dbc3 100%);
      background: linear-gradient(to top right, #fffcf7 0%, #e8dbc3 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">로그인</h4>
        
        <form class="validation-form" name="loginForm" method="post" novalidate>
         
         
            <div class="mb-3">
              <label for="name">아이디</label>
              <input type="text" class="form-control" name="id" id="id"  placeholder="아이디" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            
          
            <div class="mb-3">
              <label for="nickname">비밀번호</label>
              <input type="password" class="form-control" name="pwd"  id="pwd" placeholder="비밀번호" value="" required >
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>

<c:if test="${message == 'error'}">
 <div class="mb-3" style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
 </div>
</c:if>
<c:if test="${message == 'logout'}">
 <div class="mb-3" style="color:red;"> 로그아웃되었습니다.
 </div>
</c:if>

          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">remember id</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block"  id="btnLogin">로그인</button>
          <div class="mb-4"></div>
          <button class="btn btn-secondary btn-lg btn-block" id="btnJoin" type="button">회원가입</button>
          <div class="mb-4"></div>
          <button class="btn btn-info btn-lg btn-block" id="toHome" type="button">홈으로 돌아가기</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; wemade</p>
    </footer>
  </div>
  </body>

<script>
$(function(){
	console.log('실행되는가');
	
$("#btnLogin").click(function(){
	 var id=$("#id").val();
	 var pwd=$("#pwd").val(); 
	 if(id == ""){
	  alert("아이디를 입력하세요");
	  $("#id").focus(); //입력포커스 이동
	  return; //함수 종료
	}
	if(pwd==""){
	 alert("비밀번호를 입력하세요"); 
	 $("#pwd").focus();
	  return;
	}
	//폼 내부의 데이터를 전송할 주소
	document.loginForm.action= "/my/logincheck";
	 document.loginForm.submit(); //제출
 }); //end btnLogin click
 
 
 $("#btnJoin").click(function(){
	 self.location ="/my/join";
 }); //end btnJoin click

 $("#toHome").click(function(){
	 self.location ="/";
 }); //end toHome click
});
</script>