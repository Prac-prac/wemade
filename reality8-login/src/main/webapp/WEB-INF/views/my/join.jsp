<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>wemade Join</title>

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
        <h4 class="mb-3">회원가입</h4>
        
        <form class="validation-form" method="post" novalidate>
         
         
            <div>
              <label for="name">아이디</label>
              <input type="text" class="form-control" name="id" placeholder="영문자 또는 숫자만 입력이 가능합니다." value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            
           <div class="mb-1"></div>
          <button type="button" class="btn btn-secondary"  id="checkDuplicateId">아이디 중복확인</button>
          
          
            <div class="mt-3 mb-3">
              <label for="nickname">비밀번호</label>
              <input type="password" class="form-control" name="pwd" placeholder="영문자 또는 숫자만 입력이 가능합니다." value="" required >
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>

	   		<div class="mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" id="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
			 </div>
			 
          <div>
            <label for="email">이메일</label>
            <input type="email" class="form-control" name="email"  id="email" placeholder="이메일 형식이 아닐 시 수정되지 않습니다. 올바른 예)wemade@google.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>


          <div class="mt-3 mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" name="address"  id="address"placeholder="ex) 서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

    

          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; wemade</p>
    </footer>
  </div>
  </body>
  <script>
  window.addEventListener('load', () => {
	  
	  $("input[name='id'], input[name='pwd']").keyup(function(event){    
		  if (!(event.keyCode >=37 && event.keyCode<=40)) {    
			  $(this).val($(this).val().replace(/[^a-z0-9]/gi,''));   
			  }  
		  });

	  var checkDuplicateId = false;
	  $("#checkDuplicateId").on("click", function(){
		  console.log("아이디 중복체크");
		  $.ajax({
				url: '/checkDuplicateId',
				data: {id: $("input[name='id']").val()},
				dataType: 'text',
				type: 'POST',
				success: function(result){
					if(result === "<Integer>1</Integer>"){
						alert("이미 중복된 아이디가 있습니다. 다른 아이디를 입력해주세요.");
					} else if(result === "<Integer>0</Integer>") {
						checkDuplicateId = true;
						alert("입력하신 아이디 사용이 가능합니다.");
					}
				}
			});
	  });
	  

	  
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
        	  
        	if (form.checkValidity() === false) {
                  event.preventDefault();
                  event.stopPropagation();
                  if(!checkDuplicateId){
            		  event.preventDefault();
            		  alert("아이디 중복확인이 필요합니다.");
            	  }  else{
                 	 alert("회원가입 폼을 다시 한 번 확인해주세요.");
            	  }
                } else{
					form.classList.add('was-validated');
              		 alert("회원가입이 완료되었습니다.");
                	 forms.action= "/my/join";
        	  } 
        }, false);
        });
    
    }, false);

  </script>
</html>

