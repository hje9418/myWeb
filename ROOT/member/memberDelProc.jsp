<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="auth.jsp" %>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 memberDelProc.jsp -->
<%
	String passwd   = request.getParameter("passwd").trim();
	
	dto.setId(s_id);
	dto.setPasswd(passwd);
	
	
//성공/실패 여부가 반환됨
	int cnt=dao.deleteproc(dto);
	if (cnt==0){
		out.println("<br>");
		out.println("<p>비밀번호가 일치하지 않습니다</p>");
		out.println("<br>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		
	} else {
		out.println("<script>");
		out.println("	alert('회원탈퇴가 완료되었습니다');");
		out.println("	location.href = 'logout.jsp';");
		out.println("</script>"); 			
	} //if end	
%>	
	
	
<!-- 본문끝 --> 
<%@ include file="../footer.jsp"%>
