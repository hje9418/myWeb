<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="auth.jsp" %>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 memberUpdateProc.jsp -->
<h3> * 회원수정 결과 * </h3>
<%
	String passwd 	= request.getParameter("passwd").trim();
	String mname 	= request.getParameter("mname").trim();
	String tel  	= request.getParameter("tel").trim();
	String email 	= request.getParameter("email").trim();
	String zipcode  = request.getParameter("zipcode").trim();
	String address1 = request.getParameter("address1").trim();
	String address2 = request.getParameter("address2").trim();
	String job  	= request.getParameter("job").trim();
	

	dto.setId(s_id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setTel(tel);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);
	
	
//성공/실패 여부가 반환됨
	int cnt=dao.updateproc(dto);
	if (cnt==0){
		out.println("<br>");
		out.println("<p>회원수정 실패했습니다</p>");
		out.println("<br>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		
	} else {
		out.println("<script>");
		out.println("	alert('회원수정이 완료되었습니다');");
		out.println("	location.href = 'loginForm.jsp';");
		out.println("</script>"); 			
	} //if end	
%>	
	
	
<!-- 본문끝 --> 
<%@ include file="../footer.jsp"%>
