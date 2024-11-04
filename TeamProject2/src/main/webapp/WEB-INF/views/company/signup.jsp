<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 회원가입</title>
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #F5F6F8; 
        }
        .container {
            background-color: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            padding: 20px;
            width: 90%;
            max-width: 500px; 
        }
        img {
            height: 200px; 
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        td {
            padding: 10px;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"],
        input[type="button"] {
            background-color: #2759FF;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 49%; 
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #405DAB;
        }
        .red { color: red; }
        .green { color: green; }
    </style>
</head>
<body>
	<img src="/img/로고.png"  alt=회사로고 onclick="location.href='/'"/>
    <div class="container">
        <h2>기업 회원 가입</h2>
        <input type="button" onclick="location.href='/Individual/Signup'" value="개인회원가입" style="width: 190px; background-color: #405DAB;"/>
        <input type="button" onclick="location.href='/Company/Signup'" value="기업회원가입" style="width: 300px;" />
        <form action="/Company/SignupForm" method="POST">
            <table>
                <tr>
                    <td colspan="2">
                    <input type="text" name="user_id" placeholder="*아이디" required />
                    <input type="button"  id="dupCheck"   value="중복확인" style="width: 100%;"/>
                    <span id="dupResult"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <input type="password" name="password" id="password" placeholder="*비밀번호" required />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <input type="password" id="passwordCheck" placeholder="*비밀번호 확인" required />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <input type="text" name="username" placeholder="*이름" required />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <input type="text" name="compname" placeholder="*기업명" required />
                	<input type="button" value="기업 등록" 
                    	   onclick="location.href='/Company/CompanySignup'" />
                    <input type="button"  id="dupCheck2"   value="기업확인" />
                    </td>   	
                </tr>
                <tr>
                	<td colspan="2">
                	<span id="dupResult2"></span>
                	</td>
                </tr>
                <tr>
					<td colspan="2">
                    <input type="email" name="email" placeholder="*이메일" />
                    <span id="dupResultEmail"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <input type="text" name="phone_number" placeholder="전화번호"  />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="가입하기" id=""/>
                        <input type="button" value="돌아가기" id="goLogin" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script>
       let   dupCheckClicked = false;     
       let   dupCheck2Clicked = false;     
       
       document.getElementById('goLogin').onclick = function() {
	        location.href = '/Company/Login';
	    };
	    
       const  formEl          = document.querySelector('form');
       const  user_idEl       = document.querySelector('[name=user_id]');
       const  compnameEl      = document.querySelector('[name=compname]');
       const  passwordEl   	  = document.querySelector('#password');
       const  passwordCheckEl = document.querySelector('#passwordCheck');
       const  usernameEl   	  = document.querySelector('[name=username]');
       const  emailEl		  = document.querySelector('[name=email]');
       const  dupCheckEl      = document.querySelector('#dupCheck');
       const  dupCheck2El     = document.querySelector('#dupCheck2');
       

       dupCheckEl.onclick = function() {
    	   dupCheckClicked = true;  
       }
       dupCheck2El.onclick = function() {
    	   dupCheck2Clicked = true;  
       }
       
       formEl.onsubmit = function() {
    	   
           if (user_idEl.value.trim() === '') {
               alert('아이디를 입력하세요');
               user_idEl.focus();
               return false;
           } 
           if (passwordEl.value.trim() === '') {
               alert('비밀번호를 입력하세요');
               passwordEl.focus();
               return false;
           }
           if (passwordCheckEl.value.trim() === '') {
               alert('비밀번호 확인을 입력하세요');
               passwordCheckEl.focus();
               return false;
           }          
           if (passwordEl.value !== passwordCheckEl.value) {
               alert('비밀번호가 일치하지 않습니다');
               passwordCheckEl.focus();
               return false;
           }
           if (usernameEl.value.trim().length < 2) {
               alert('이름은 두자 이상 입력하세요');
               usernameEl.focus();
               return false;
           }	
           if (dupCheckClicked === false) {
               alert('중복확인을 해주세요');
               return false;
           }           
           if (dupCheck2Clicked === false) {
               alert('기업확인을 해주세요');
               return false;
           }
           alert('회원가입이 완료되었습니다. 로그인을 해주세요.');
           return true;           
       };
   </script> 
    <script>
       $( function() {
           $('#dupCheck').on('click', function() {
        	   
        	   const user_id = $('[name=user_id]').val().trim();
               if (user_id === '') {
                   alert('아이디를 입력하세요'); 
                   $('[name=user_id]').focus(); 
                   return; 
               }
               
        	   $.ajax({
                   url  : '/Company/IdDupCheck', 
                   data : { user_id : $('[name=user_id]').val()  }  
               })
               .done( function( data ) {   
                   console.log(data)
                   if( data === '' ) {
                     let html = '사용가능한 아이디입니다'; 
                     dupCheckClicked = true;
                     $('#dupResult').html(html).addClass('green')
                   }  else  {  
                     let html = '사용할수 없는 아이디입니다'
                     dupCheckClicked = false;
                   	 $('#dupResult').html(html).addClass('red')
                   }
               })
               .fail( function(err) {
                   console.log(err)
                   alert('오류:다시 시도해주세요.');
               })
           })
       });    
    </script>
    <script>
       $( function() {
    	  $('#dupCheck2').on('click', function() {  	   
    	   const compname = $('[name=compname]').val().trim();
           if (compname === '') {
               alert('기업명을 입력하세요'); 
               $('[name=compname]').focus(); 
               return; 
           })
    	  })
    	});
    </script>
    <script>
       $( function() {      
           $('#dupCheck2').on('click', function() {
        	   $.ajax({
                   url  : '/Company/CompDupCheck', 
                   data : { compname : $('[name=compname]').val()  }  
               })
               .done( function( data ) {   
                   console.log(data)
                   if( data == '' ) {
                     let html = '존재하지 않는 기업입니다. 기업등록을 해주세요'; 
                     dupCheck2Clicked = false;
                     $('#dupResult2').html(html).addClass('red')
                   }  else  {  
                     let html = '기업확인이 완료되었습니다.'
                     dupCheck2Clicked = true;
                   	 $('#dupResult2').html(html).addClass('green')
                   }
               })
               .fail( function(err) {
                   console.log(err)
                   alert('오류:다시 시도해주세요.');
               })
           })
       });  
    </script>
    <script>
    $(function() {
        emailEl.addEventListener('blur', function() { 
            const email = emailEl.value.trim();
            if (email === '') return; 

            $.ajax({
                url: '/Company/EmailDupCheck',
                data: { email: email }, 
                method: 'GET' 
            })
            .done(function(data) {
                console.log(data);
                if (data == null || data == '') { 
                    $('#dupResultEmail').html('사용 가능한 이메일입니다').addClass('green');
                } else { 
                    $('#dupResultEmail').html('중복된 이메일입니다').addClass('red');
                    alert('중복된 이메일입니다'); 
                }
            })
            .fail(function(err) {
                console.log(err);
                alert('오류: 다시 시도해주세요.');
            })
        })
    });
</script>
</body>
</html>
