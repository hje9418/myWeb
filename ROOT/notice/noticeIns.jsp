<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 noticeIns.jsp -->


<%
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();

	dto.setSubject(subject);
	dto.setContent(content);

//성공/실패 여부가 반환됨
	int cnt=dao.insert(dto);
	if (cnt==0){
		out.println("<p>글추가 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		
	} else {
		out.println("<script>");
		out.println("	alert('글이 입력되었습니다');");
		out.println("	location.href = 'noticeList.jsp';");
		out.println("</script>"); 			
	} //if end	
%>	
	
	
<!-- 본문끝 --> 
<%@ include file="../footer.jsp"%>
