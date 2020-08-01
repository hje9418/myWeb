<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 memberDel.jsp -->
<h4> * 회원탈퇴 * </h4>
	<br>

	<form method="post" action="memberDelProc.jsp" onsubmit="return pwCheck(this)">

	
	<table class="table">
	<tr>
 	 <th style= text-align:right>비밀번호</th>
    <td style = "font-family:gothic">
       <input type="password" name="passwd" required>
   	 </td>
    </tr>
    <tr>
    <td colspan="2">
    	<input type="submit" value="회원탈퇴" class="btn-default btn">       
   	</td>
    </tr>
</table>
</form>
	

<!-- 본문끝 --> 
<%@ include file="../footer.jsp"%>
