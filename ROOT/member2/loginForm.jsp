<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 loginForm.jsp -->
<h3>* 로 그 인 *</h3>

	<c:if test="${empty sessionScope.s_id }">
	<%
		//사용자 pc에 저장된 쿠키값 가져오기------------------
		Cookie[] cookies=request.getCookies();
		String c_id="";
		if(cookies!=null) { //쿠키가 존재하는지?
			for(int idx=0; idx<cookies.length; idx++) {
				Cookie item=cookies[idx];
				//쿠키변수 c_id 인지?
				if(item.getName().equals("c_id")==true) {
					c_id=item.getValue();					
				} //if end
			} //for end
		} //if end
%>		

	<form name="loginfrm"
	      method="post"
	      action="loginpro.do"
	      onsubmit="return loginCheck(this)">
	           
	 <div class="container">
   	  <form action="/action_page.php" class="was-validated">
     	<div class="form-group" style="width:60%; margin:auto">
      	<input type="text" class="form-control" name="id" value="<%=c_id%>" placeholder="아이디" required>
    	</div>
    	<br>
    	<div class="form-group" style="width:60%; margin:auto; font-family:gothic">
      	<input type="password" class="form-control" name="passwd" placeholder="비밀번호" required>
    	</div>
    	<br>
    <button type="submit" class="btn btn-info btn-block" style="width:60%; margin:auto">로 그 인</button>
  	 </form>
	</div>
	<br>      
	<input type="checkbox" name="c_id" value="SAVE" 
	<% if(!(c_id.isEmpty())) {out.print("checked");} %> >아이디저장
	&nbsp;&nbsp;
	<a href="agreement.jsp">회원가입</a>
	&nbsp;&nbsp;
	아이디/비번찾기
	</form>
	</c:if>
	

		<!-- 로그인 성공했다면 -->
		<c:if test="${sessionScope.s_id !=null }">
		
		<strong>${sessionScope.s_id }</strong>님
		<a href="./logout.do">[로그아웃]</a>
		<br><br>
		<input type="hidden" name="id" value="${sessionScope.s_id }"><a href="./modifyForm.do">[회원정보수정]</a>
		<a href="./withdrawForm.do">[회원탈퇴]</a>
		
		
		</c:if>


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>