<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 noticeUpdateForm.jsp -->
<h3> 공지사항 수정 </h3>
 <p>
 	<input type="button" class="btn btn-default btn-sm" value="공지사항쓰기" onClick="location.href='noticeForm.jsp'">
 	<input type="button" class="btn btn-default btn-sm" value="공지사항목록" onClick="location.href='noticeList.jsp'">
 </p>
 <%
 	int noticeno	 =Integer.parseInt(request.getParameter("noticeno"));
 	dto.setNoticeno(noticeno);

	dto=dao.updateform(dto);
	if (dto==null) {
		out.println("글없음");
	} else {
%>
	<form name="noticefrm"
      method="post"
      action="noticeUpdateProc.jsp"
      onsubmit="return noticeCheck(this)">
    <input type="hidden" name="noticeno" value="<%=noticeno %>">
	<table class="table">
	<tr>
  		<th>제목</th>
  		<td><input type="text" name="subject" value="<%=dto.getSubject() %>" size="30" required class="form-control"></td>
	</tr>
	<tr>
  		<th>내용</th>
  		<td><textarea rows="5" cols="30" name="content" class="form-control"><%=dto.getContent() %></textarea> </td>
	</tr>
	<tr>
   		<td colspan="2" align="center">
      	<input type="submit" value="수정" class="btn btn-default">
      	<input type="reset"  value="취소"  class="btn btn-default">
    	</td>
	</tr>
</table>
</form>

<%

	}//if end
%>


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
