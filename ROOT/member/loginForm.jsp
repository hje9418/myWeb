<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="auth.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 loginForm.jsp -->
<h3>L O G I N</h3>
<%
	if(s_id.equals("guest") ||
	   s_passwd.equals("guest") ||
	   s_mlevel.equals("guest"))	{
		//로그인을 하지 않은 경우
		//쿠키-----------------------------------------
		//myweb서버에 의해 사용자PC에 저장된 모든 쿠키값 가져오기
		Cookie cookies[]=request.getCookies();
		String c_id="";
		if(cookies!=null) { //쿠키가 존재하는지?
			for(int i=0; i<cookies.length; i++) {
				Cookie cookie=cookies[i];
				//쿠키변수 c_id 인지?
				if(cookie.getName().equals("c_id")==true) {
					c_id=cookie.getValue();
				} //if end
			} //for end
		} //if end


		//--------------------------------------------


%>
	<form name="loginfrm"
	      method="post"
	      action="loginProc.jsp"
	      onsubmit="return loginCheck(this)">

	 <div class="container">
   	  <form action="/action_page.php" class="was-validated">
     	<div class="form-group" style="width:30%; margin:auto">
      	<input type="text" class="form-control" name="id" value="<%=c_id%>" placeholder="ID" required>
    	</div>
    	<br>
    	<div class="form-group" style="width:30%; margin:auto; font-family:gothic">
      	<input type="password" class="form-control" name="passwd" placeholder="PASSWORD" required>
    	</div>
    	<br>
    <button type="submit" class="btn btn-info btn-block" style="width:30%; margin:auto">로 그 인</button>
  	 </form>
	</div>
	<br>
	<input type="checkbox" name="c_id" value="SAVE"
	<% if(!(c_id.isEmpty())) {out.print("checked");} %> >아이디저장
	&nbsp;&nbsp;
	<a href="agreement.jsp">회원가입</a>
	&nbsp;&nbsp;
	<a href="idpwInquiry.jsp"> 아이디/비번찾기 </a>
	</form>

<%

	}else{
		//로그인 성공했다면
		out.println("<strong>" + s_id + "</strong>님");
		out.println("<a href='logout.jsp'>[로그아웃]</a>");
		out.println("<br><br>");
		out.println("<a href='memberUpdate.jsp'>[회원정보수정]</a>");
		out.println("<a href='memberDel.jsp'>[회원탈퇴]</a>");

	} //if end


%>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
