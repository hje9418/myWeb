<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 noticeRead.jsp -->
<h3> 공지사항 상세보기 </h3>
 <p>
 	<!-- <input type="button" class="btn btn-default btn-sm" value="공지사항쓰기" onClick="location.href='noticeForm.jsp'">-->
 	<input type="button" class="btn btn-default btn-sm" value="공지사항목록" onClick="location.href='noticeList.jsp'">
 </p>
 <%
	int noticeno=Integer.parseInt(request.getParameter("noticeno"));
	dto=dao.read(noticeno);
	if (dto==null) {
		out.println("글없음");
	} else {

%>
	<table class="table">
	<tr>
		<th>제목</th>
		<td><%=dto.getSubject()%></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
<%
		//사용자가 입력한 문자 그대로 출력하기 위해
		//특수문자로 변환
		String content=dto.getContent();
		content=content.replaceAll("'", "&apos;");
		content=content.replaceAll("\"", "&quot;");
		content=content.replaceAll("<", "&lt;");
		content=content.replaceAll(">", "&gt;");
		content=content.replaceAll("\r\n", "<br>");
		out.print(content);

%>
		</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=dto.getRegdt()%></td>
	</tr>
    </table>
    <br>
<%
	if(session.getAttribute("s_id")!=null &&
	   session.getAttribute("s_passwd")!=null &&
	   session.getAttribute("s_mlevel")!=null ) {
%>
	<input type="button" class="btn btn-default" value="수정"
 		   onclick="location.href='noticeUpdate.jsp?noticeno=<%=noticeno%>'">
    <input type="button" class="btn btn-default" value="삭제"
  		   onclick="location.href='noticeDel.jsp?noticeno=<%=noticeno%>'">


<%
		}//if end
	} //if end
%>



<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
