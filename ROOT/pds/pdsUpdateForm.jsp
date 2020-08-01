<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 pdsUpdateForm.jsp-->
<h3> 사진 수정 </h3>
<p>
<input type="button" class="btn btn-default btn-sm" value="사진올리기" onClick="location.href='pdsForm.jsp'">
<input type="button" class="btn btn-default btn-sm" value="갤러리목록" onClick="location.href='pdsList.jsp'">
</p>

<%
	String passwd=request.getParameter("passwd").trim();
 	int pdsno	 =Integer.parseInt(request.getParameter("pdsno"));

 	dto.setPasswd(passwd);
 	dto.setPdsno(pdsno);

	dto=dao.updateform(dto);
	if (dto==null) {
		out.println("<br>");
		out.println("비밀번호가 일치하지 않습니다");
		out.println("<br>");
		out.println("<br>");
		out.println("<br>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
%>

<form name="photoForm"
      method="post"
      enctype="multipart/form-data"
      action="pdsUpdateProc.jsp"
      onsubmit="return pdsCheck(this)">
      <input type="hidden" name="pdsno" value="<%=pdsno %>">
      <input type="hidden" name="oldfilename" value="<%=request.getParameter("filename") %>">

<table class="table">
<tr>
    <th>성명</th>
    <td><input type="text" name="wname" value="<%=dto.getWname() %>" size="30" required autofocus></td>
</tr>
<tr>
    <th>제목</th>
    <td>
    <textarea rows="5" cols="30" name="subject"><%=dto.getSubject() %></textarea>
    </td>
</tr>
<tr style = "font-family:gothic">
    <th>비밀번호</th>
    <td><input type="password" size="30" name="passwd" value="<%=dto.getPasswd() %>"></td>
</tr>
<tr>
    <th>첨부파일</th>
    <td><input type="file" name="filename">
    </td>
</tr>
<tr>
    <td colspan="2">
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
