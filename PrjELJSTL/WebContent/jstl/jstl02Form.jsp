<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  window.onload = function() {
	  var form1   = document.getElementById('form1');
	  
	  var btnJSP  = document.getElementById('btnJSP');
	  btnJSP.onclick = function(){
		  form1.action = 'jstl02_jsp.jsp';
		  form1.submit();
	  };
	  
	  var btnJSTL = document.getElementById('btnJSTL');
	  btnJSTL.onclick = function(){
		  form1.action = 'jstl02_jstl.jsp';		  
		  form1.submit();
	  };
  }
</script>
</head>
<body>
<form id="form1" method="post">
  이름 : <input type="text" name="name" /><br/>
  나이 : <input type="text" name="age" /><br/>  
  <input type="button" value="전송(jsp)" id="btnJSP" /><br/>
  <input type="button" value="전송(jstl)"  id="btnJSTL"/><br/>
</form>
</body>
</html>















