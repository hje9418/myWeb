<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 noticeDel.jsp -->
<h3>공지사항 삭제</h3>
<br>
<%
	int noticeno 	  =Integer.parseInt(request.getParameter("noticeno"));

	dto.setNoticeno(noticeno);

	int cnt=dao.delete(dto);
	if(cnt==0){
		out.println("<p>공지사항삭제 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		} else {
			out.println("<script>");
			out.println("	alert('공지사항이 삭제되었습니다');");
			out.println("	location.href = 'noticeList.jsp';");
			out.println("</script>");
		} //if end



%>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
