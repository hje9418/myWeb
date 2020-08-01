<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 logout.jsp -->
<c:remove var="s_id" scope="session"/>
<meta http-equiv="Refresh" content="0;url=/myweb/member2/loginform.do">



<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>