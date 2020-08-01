<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 pdsDel.jsp -->
<!--  비밀번호가 일치하면 글 삭제 -->
<h3>  사진 삭제  </h3>  
<p><input type="button" class="btn btn-default btn-sm" value="갤러리목록" onClick="location.href='pdsList.jsp'"></p>
<form method="post" action="pdsDelProc.jsp" onsubmit="return pwCheck(this)">
<input type="hidden" name="pdsno" value="<%=request.getParameter("pdsno")%>">
<table class="table">
<tr style = "font-family:gothic">
	<th>비밀번호</th>
	<td><input type="password" name="passwd" required>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="확인" class="btn btn">
	</td>
</tr>
</table>
</form>



<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
