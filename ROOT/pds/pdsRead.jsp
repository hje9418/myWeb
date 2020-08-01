<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 pdsRead.jsp -->
<h3> 사진 상세보기 </h3>
 <p>
 	<input type="button" class="btn btn-default btn-sm" value="사진올리기" onClick="location.href='pdsForm.jsp'">
 	<input type="button" class="btn btn-default btn-sm" value="갤러리목록" onClick="location.href='pdsList.jsp'">
 </p>
 <%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	dto=dao.read(pdsno);
	if (dto==null) {
		out.print("글없음");
	} else {
	//조회수 증가
		dao.incrementCnt(pdsno);
%>
	<table class="table">
	<tr>
		<th>제목</th>
		<td><%=dto.getSubject()%></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=dto.getWname()%></td>
	</tr>
	<tr>
		<th>사진</th>
		<td><img src="../storage/<%=dto.getFilename()%>" width="350">
		</td>
	</tr>
	<tr>
	    <th>파일크기</th>
	    <td><%=Utility.toUnitStr(dto.getFilesize())%></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=dto.getReadcnt()%></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=dto.getRegdate().substring(0,19)%></td>
	</tr>
    </table>
    <br><!-- 로그인한 경우만 수정/삭제 가능 -->

<%
	if(session.getAttribute("s_id")!=null &&
	   session.getAttribute("s_passwd")!=null &&
	   session.getAttribute("s_mlevel")!=null ) {
%>
	<input type="button" class="btn btn-default" value="수정"
 		   onclick="location.href='pdsUpdate.jsp?pdsno=<%=pdsno%>'">
    <input type="button" class="btn btn-default" value="삭제"
  		   onclick="location.href='pdsDel.jsp?pdsno=<%=pdsno%>'">

<%
		} //if end
	}//if end

%>


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
