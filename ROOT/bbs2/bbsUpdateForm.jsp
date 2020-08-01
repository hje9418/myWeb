<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 bbsUpdateForm.jsp -->
<h3>글 수정</h3>
<br>
<br>
	<form method="post"
		  name="updateform"
		  action="./bbsupdate.do?pageNum=${pageNum }">
	<input type="hidden" name="num" value="${requestScope.num }">
	<input type="hidden" name="pageNum" value="${requestScope.pageNum }">

	<table class="table table-bordered" id="customers" style="width:300px; margin:auto; text-align:center" >
	<tr height="30">
		<th class="active" style="text-align:center">비밀번호</th>
	</tr>
	<tr height="30">
		<td style = "font-family:gothic; align:center">
	    <input type="password" name="passwd" size="20" required>

	    </td>
	</tr>
	<tr height="30">
	    <td align="center">
	<input type="submit" class="btn btn-default" value="글수정">
	<input type="button" class="btn btn-default" value="글목록" onclick="location.href='./bbslist.do?pageNum=${pageNum}'">
		</td>
	</tr>
	</table>
</form>



<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
