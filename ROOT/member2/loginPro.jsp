<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 loginPro.jsp -->
<h3> * 로그인 결과 * </h3>

<div align="center">
<c:if test="${res==1 }">
		<c:set var="s_id" value="${sessionScope.s_id }" scope="session" />
		<meta http-equiv="Refresh" content="0;url=/myweb/member2/loginform.do">
</c:if>

<c:if test="${res==0 }">
	아이디/비번 다시 한번 확인해주세요<br><br>
	<a href="javascript:history.go(-1)">[다시시도]</a>
</c:if>
</div>

	
<!-- 본문끝 --> 
<%@ include file="../footer.jsp"%>
