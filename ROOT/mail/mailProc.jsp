<%@page import="net.utility.Utility"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@page import="net.utility.MyAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 mailProc.jsp -->
<h3> * 메일 보내기 결과 * </h3>
<%
	//1) 메일서버(POP3/SMTP)지정하기
	String mailServer="mw-002.cafe24.com";
	Properties props=new Properties();
	props.put("mail.smtp.host", mailServer);
	props.put("mail.smtp.auth","true");
	 
	//2) 메일서버에서 인증받은 계정 + 비번
	Authenticator myAuth=new MyAuthenticator();
	


	//3) 1번과 2번이 유효한지 검증
	Session sess=Session.getInstance(props, myAuth);
	//out.print("메일 서버 인증 성공");

	//4) 메일보내기
	try {
		request.setCharacterEncoding("UTF-8");
		String to 		=request.getParameter("to").trim();
		String from 	=request.getParameter("from").trim();
		String subject 	=request.getParameter("subject").trim();
		String content 	=request.getParameter("content").trim();
		
		content=Utility.convertChar(content);
		
		//테이블 작성
		content += "<hr>";
		content += "<table border='1'>";
		content += "<tr>";
		content += "	<th>상품명</th>";
		content += "	<th>상품가격</th>";
		content += "</tr>";
		content += "<tr>";
		content += "	<td>운동화</td>";
		content += "	<td><span style='color:red;font-weight:bold'>15,000원</span></td>";
		content += "</tr>";
		content += "</table>";
		
		//이미지 보여주기
		content += "<p>";
		content += "<img src='http://172.16.82.15:9090/myweb/images/apeaches.png'>";
		content += "</p>";
		
		//받는사람 이메일주소
		InternetAddress[] address={
			new InternetAddress(to)
		};
		
		/* 수신인 여러명
		InternetAddress[] address={
				new InternetAddress(to1)
				new InternetAddress(to2)
				new InternetAddress(to3)
		};
		*/
			
		//Message.RecipientType.TO 받는 이메일 주소 (1명)
		//Message.RecipientType.CC 받는 이메일 주소 여러개 (참조)
		//Message.RecipientType.BCC 숨은참조
		//메일관련 메세지 작성
		Message msg=new MimeMessage(sess);
		//받는 사람
		msg.setRecipients(Message.RecipientType.TO, address);
		
		//보내는 사람
		msg.setFrom(new InternetAddress(from));
		
		//메일 제목
		msg.setSubject(subject);
		
		//메일 내용
		msg.setContent(content, "text/html; charset=UTF-8");
		
		//보낸 날짜
		msg.setSentDate(new Date());
		
		//메일 전송
		Transport.send(msg);
		
		out.print(to+"님에게 메일이 발송되었습니다");
		
	} catch (Exception e) {
		out.print("<p>메일 전송 실패 : " + e + "</p>");
		out.print("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} //try end



%>
	
	
<!-- 본문끝 --> 
<%@ include file="../footer.jsp"%>
