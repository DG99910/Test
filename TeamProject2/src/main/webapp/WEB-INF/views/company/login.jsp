<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 회원 로그인</title>
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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            margin-bottom: 20px;
        }
        td {
            padding: 10px;
        }
        input[type="text"],
        input[type="password"] {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"],
        input[type="button"] {
            width: 100%; 
            padding: 10px;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #2759FF;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #405DAB; 
        }
    </style>
</head>
<body>
	<img src="/img/로고.png"  alt=회사로고 onclick="location.href='/'"/>
    <div class="container">
        <h2>기업 로그인</h2>
        <form action="/Company/Login" method="post">
            <table>
                <tr>
                    <td>
                    <input type="text" name="user_id" placeholder="아이디" required />
                    </td>
                </tr>
                <tr>
                    <td>
                    <input type="password" name="password" placeholder="비밀번호"required />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="로그인" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                            <input type="button" value="회원가입" onclick="location.href='/Company/Signup'" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script>
        $(document).ready(function() {
        	var errorMessage = 
            "<%= request.getAttribute("errorMessage") != null ? 
            	request.getAttribute("errorMessage") : "" %>";
            if (errorMessage) {
                alert(errorMessage);
            }
        });
    </script>
</body>
</html>
