<%@page import="net.notice.noticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<h3> N O T I C E </h3>

<%
	if(session.getAttribute("s_id")!=null &&
	   session.getAttribute("s_passwd")!=null &&
	   session.getAttribute("s_mlevel")!=null ) {
%>
<P><input type="button" class="btn btn-default btn-sm" value="공지사항 쓰기" onClick="location.href='noticeForm.jsp'"></P>
<%

		}//if end

%>

<table class="table">
<thead>
	<tr class="active" style="height: 50px;">
		<th style="text-align:left; vertical-align:middle">번호</th>
		<th style="text-align:center; vertical-align:middle">제목</th>
		<th style="text-align:center; vertical-align:middle">작성일</th>
	</tr>
</thead>
<tbody>

<%
ArrayList<noticeDTO> list=dao.list();
if(list==null){
	out.println("<tr>");
	out.println("	<td colspan='4'>");
	out.println("		<strong>관련자료 없음</strong>");
	out.println("	</td>");
	out.println("</tr>");
} else {


		for(int i=0; i<list.size(); i++){
			dto=list.get(i);
%>

	<tr>
		<td style="text-align:Left"><%=dto.getNoticeno()%></td>
		<td><a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno()%>"><%=dto.getSubject()%></a></td>
		<td><%=dto.getRegdt()%></td>
	</tr>

<%
		} //for end

	} //if end
%>
</tbody>
</table>


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
