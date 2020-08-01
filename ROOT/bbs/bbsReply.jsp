<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 bbsReply.jsp-->
<h3> 답변쓰기 </h3>
<p><input type="button" class="btn btn-default btn-sm" value="글목록" onClick="location.href='bbsList.jsp'"></p>
<form name="bbsfrm"
      method="post"
      action="bbsReplyProc.jsp"
      onsubmit="return bbsCheck(this)">
<!-- 부모글 정보 -->
<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">

<table class="table">
<tr>
  <th>작성자</th>
  <td><input type="text" name="wname" size="10" maxlength="20" required class="form-control"></td>
</tr>
<tr>
  <th>제목</th>
  <td><input type="text" name="subject" size="30" maxlength="100" required class="form-control"></td>
</tr>
<tr>
  <th>내용</th>
  <td><textarea rows="5" cols="30" name="content"  class="form-control"></textarea> </td>
</tr>
<tr style = "font-family:gothic">
  <th>비밀번호</th>
  <td><input type="password" name="passwd" size="10" maxlength="10" required  class="form-control"></td>
</tr>
<tr>
    <td colspan="2" align="center">
      <input type="submit" value="등록" class="btn btn-default">
      <input type="reset"  value="취소"  class="btn btn-default">
    </td>
</tr>
</table>
</form>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
