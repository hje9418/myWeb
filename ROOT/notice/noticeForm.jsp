<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 noticeForm.jsp-->
<h3> 공지사항 쓰기 </h3>
<P><input type="button" class="btn btn-default btn-sm" value="공지사항 목록" onClick="location.href='noticeList.jsp'"></P>
<form name="noticefrm"
      method="post"
      action="noticeIns.jsp"
      onsubmit="return noticeCheck(this)">
<table class="table">
<tr>
  <th>제목</th>
  <td><input type="text" name="subject" size="30" maxlength="100" required class="form-control"></td>
</tr>
<tr>
  <th>내용</th>
  <td><textarea rows="5" cols="30" name="content"  class="form-control"></textarea> </td>
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
