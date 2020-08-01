<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 bbsUpdate.jsp -->
<h3> *글수정* </h3>
<p><input type="button" class="btn btn-default btn-sm" value="글목록" onClick="location.href='bbsList.jsp'"></p>

	<form method="post" action="bbsUpdateForm.jsp" onsubmit="return pwCheck(this)">
	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
	
	<table class="table">
	<tr style = "font-family:gothic">
 	 <th>비밀번호</th>
    <td>
       <input type="password" name="passwd" required>
   	 </td>
    </tr>
    <tr>
    <td colspan="2">
    	<input type="submit" value="확인" class="btn btn-default">          
   	</td>
    </tr>
</table>
</form>
	

<!-- 본문끝 --> 
<%@ include file="../footer.jsp"%>
