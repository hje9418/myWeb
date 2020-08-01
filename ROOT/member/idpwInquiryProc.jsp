<%@page import="java.util.Date"%>
<%@page import="com.sun.mail.handlers.message_rfc822"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@include file="auth.jsp" %>
<%@include file="ssi.jsp" %>
<%@page import="java.util.*" %>
<%@page import="net.utility.*" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>
<jsp:include page="../header.jsp"></jsp:include>
  <!-- 본문시작 mailProc.jsp-->
<h3> 결과 </h3>
<%

//1) 카페24의 메일서버(POP3/SMTP서버)
String mailServer="mw-002.cafe24.com";
Properties props= new Properties();
props.put("mail.smtp.host", mailServer);
props.put("mail.smtp.auth", "true");

//2)메일 서버에서 인증받은 아이디/비번
Authenticator myAuth = new MyAuthenticator();

//3) 1)과 2)를 검증
Session sess = Session.getInstance(props, myAuth);
//out.print("메일 인증 성공 !!");

String email = request.getParameter("email").trim();
String mname = request.getParameter("mname");

dto.setEmail(email);
dto.setMname(mname);

String id = dao.idpwInquiry(dto);  


//4) 메일 보내기 (받는사람(to),보내는사람(from), 참조(cc), 숨은참조(bcc), 메일보내기)
if(id==null){
   out.println("등록된 이메일이 아닙니다.");   
}else{
   
   request.setCharacterEncoding("UTF-8");
   String to    = request.getParameter("email"); //받는사람
   String from       = "soldesk@soldesk.com"; //보내는사람
   String subject    = "임시패스워드";
   String msgText  = "";
   //엔터,특수문자 변경
   msgText = Utility.convertChar(msgText);
   String passwd = "";
   for (int i = 0; i < 10; i++) {
   int wd=(int)(Math.random() * 3) ;
   if(wd==0){
     char ch =(char)((Math.random() * 26) + 65);
     passwd+=ch;
   }else if(wd==1){
     char ch1 =(char)((Math.random() * 26) + 97);
     passwd+=ch1;
   }else if(wd==2){
   int word1=(int)(Math.random() * 9) ;
   passwd+=word1;
   }
 } 
   
   //HTML태그
   msgText += "<br><br>";
   msgText += "아이디 : " +id;
   msgText += "<br>";
   msgText += "비밀번호 : "+passwd;
   msgText += "<br><br>";
   msgText += "<br><br>";
   msgText += "임시 비밀번호가 발급되었습니다.";
   msgText += "<br>";
   msgText += "회원정보수정에서 비밀번호 변경후 이용해주시기 바랍니다."; 
   
  
   
   //받는사람
   InternetAddress[] address= { new InternetAddress(to)};
   
   /*수신인 여러명 
   InternetAddress[] address ={ new InternetAddress(to1),
                                 new InternetAddress(to2),
                                 new InternetAddress(to3),
                              };
   */
   Message msg = new MimeMessage(sess);
   //받는사람
   msg.setRecipients(Message.RecipientType.TO, address);
   //보내는사람
   msg.setFrom(new InternetAddress(from));
   //보내는사람(한글)
   // msg.setFrom(new InternetAddress(new InternetAddress(from).getAddress(),new InternetAddress(from).getPersonal(),"UTF-8"));
   //메일제목
   msg.setSubject(subject);
   //메일 내용
   msg.setContent(msgText, "text/html; charset=UTF-8"); 
   // 보낸 날짜
   msg.setSentDate(new Date());
   
   //메일 전송
   Transport.send(msg);
   out.print(to + "님에게 메일이 발송되었습니다.");
   
   //임시비밀번호 로그인
   dto.setId(id);    
   dao.idpwproc(id,passwd);
}
%>



 <!-- 본문 끝 -->   
 <jsp:include page="../footer.jsp"></jsp:include>