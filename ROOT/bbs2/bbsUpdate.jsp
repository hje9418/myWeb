<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/view/color.jspf" %>

<!-- 본문 시작 bbsUpdate.jsp-->
<h3>글 수정</h3>
<br>
<br>
<input type="button" class="btn btn-default btn-sm" value="글목록" onclick="location.href='/myweb/bbs2/bbslist.do'">
<form method="post" name="writeform" action="./bbsupdateproc.do?pageNum=${pageNum }">
<input type="hidden" name="num" value="${requestScope.num }">
<input type="hidden" name="pageNum" value="${requestScope.pageNum }">
<br>
<table class="table">
<tr>
  <td>이름</td>
  <td><input type="text" name="writer" size="40" value=${article.writer }></td>
</tr>
<tr>
  <td>제목</td>
  <td><input type="text" name="subject" size="40" value=${article.subject }></td>
</tr>
<tr>
  <td>이메일</td>
  <td><input type="text" name="email" size="40" value=${article.email }></td>
</tr>
<tr>
  <td>내용</td>
  <td><textarea name="content" rows="5" cols="40">${article.content }
  	  </textarea>
  </td>
</tr>
<tr>
  <td>비밀번호</td>
  <td style = "font-family:gothic"><input type="password" name="passwd" size="40" value=${article.passwd }>

  </td>
</tr>
<tr>
  <td colspan="2" align="center">
  <input type="submit" class="btn btn-default" value="글수정">
  <input type="reset" class="btn btn-default"  value="취소">
  <input type="button" class="btn btn-default" value="목록" onClick="location.href='./bbslist.do'">
  </td>
</tr>
</table>
</form>




<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>
