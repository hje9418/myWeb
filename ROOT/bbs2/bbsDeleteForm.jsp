<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="/view/color.jspf" %>

<!-- 본문 시작 bbsDeleteForm.jsp -->
<h3>글 삭제</h3>
<br>
<br>
	<form method="post"
          name="delForm"
          action="./bbsdeleteproc.do?pageNum=${pageNum }">
    <input type="hidden" name="num" value="${requestScope.num }">
	<input type="hidden" name="pageNum" value="${requestScope.pageNum }">

<table class="table table-bordered" id="customers" style="width:300px; margin:auto; text-align:center" >
<tr height="30">
	<th class="active" style="text-align:center">비밀번호</th>
</tr>
<tr height="30">
	<td style = "font-family:gothic; align:center">
    <input type="password" name="passwd" size="20" required>
    <input type="hidden" name="num" value="${num }">
    </td>
</tr>
<tr height="30">
    <td align="center">
<input type="submit" class="btn btn-default" value="글삭제">
<input type="button" class="btn btn-default" value="글목록" onclick="location.href='./bbslist.do?pageNum=${pageNum}'">
	</td>
</tr>
</table>
</form>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>
