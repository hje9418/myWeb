<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="auth.jsp"%>
<jsp:include page="../header.jsp"></jsp:include>
<!-- 본문 시작 -->
<h3>ID/PASSWORD 찾기</h3>
<br>

<style>
input[type=text], input[type=password] {
	width: 340px;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #f0f0f5;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 170px;
}

button:hover {
	opacity: 0.8;
}

</style>

<form name="idpwInquiry" method="post" action="idpwInquiryProc.jsp"
	onsubmit="return idpwCheck(this)">

	<div style='padding: 16px;'>
		<input type="text" name="mname" class="signUpInput" placeholder="이름" required> <br> 
		<input type="text" name="email" class="signUpInput" placeholder="이메일" required><br>
		<button type="submit" class="btn btn-default">확인</button>
		<button type="reset" class="btn btn-default">취소</button>
	</div>

</form>




<!-- 본문 끝 -->
<jsp:include page="../footer.jsp"></jsp:include>