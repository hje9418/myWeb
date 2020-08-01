<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 bbsRead.jsp -->
<h3> 글 상세보기 </h3>
 <p>
 	<input type="button" class="btn btn-default btn-sm" value="글쓰기" onClick="location.href='bbsForm.jsp'">
 	<input type="button" class="btn btn-default btn-sm" value="글목록" onClick="location.href='bbsList.jsp'">
 </p>
 <%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	dto=dao.read(bbsno);
	if (dto==null) {
		out.println("글없음");
	} else {
	//조회수 증가
		dao.incrementCnt(bbsno);
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
		<th>조회수</th>
		<td><%=dto.getReadcnt()%></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=dto.getWname()%></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=dto.getRegdt()%></td>
	</tr>
	<tr>
		<th>IP</th>
		<td><%=dto.getIp()%></td>
	</tr>
    </table>
    <br>
    <input type="button" class="btn btn-default" value="답변"
   		   onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno%>'">
	<input type="button" class="btn btn-default" value="수정"
 		   onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>'">
    <input type="button" class="btn btn-default" value="삭제"
  		   onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">


<%
	}//if end

%>



<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
