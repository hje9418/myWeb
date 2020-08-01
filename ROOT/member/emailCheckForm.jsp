<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	table, p, body {font-family: 'Jeju Gothic', sans-serif;}
</style>

<meta charset="UTF-8">
<title>emailCheckForm.jsp</title>
</head>
<body>
<div style="text-align:center">
	<h3>* 이메일 중복확인 *</h3>
	<form method="post"
		  action="emailCheckProc.jsp"
		  onsubmit="return blankCheck(this)">
	이메일:
	<input type="text" name="email"
		   maxlength="20" autofocus>
	<input type="submit" value="중복확인">
	</form>
	
	<script>
	function blankCheck(f) {
		var email=f.email.value;
		email=email.trim();
		if (email.length<10){
			alert("이메일은 10글자 이상 입력해 주세요");
			return false;
		} //if end
		return true;
	} //blankCheck(f) end
	
	
	
	</script>
</div>
</body>
</html>