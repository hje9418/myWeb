<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 noticeUpdateProc.jsp -->

 <%
	int noticeno=Integer.parseInt(request.getParameter("noticeno"));
 	String subject  = request.getParameter("subject").trim();
 	String content  = request.getParameter("content").trim();
 	
 	dto.setNoticeno(noticeno);
 	dto.setSubject(subject);
 	dto.setContent(content);
 	
 	int cnt=dao.updateproc(dto);
 	if(cnt==0) {
 		out.println("<p>공지사항수정 실패했습니다</p>");
 		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
 		} else {
 			out.println("<script>");
 			out.println("	alert('공지사항이 수정되었습니다');");
 			out.println("	location.href = 'noticeList.jsp';");
 			out.println("</script>"); 			
 		} //if end
 	
%>

<!-- 본문끝 --> 
<%@ include file="../footer.jsp"%>
