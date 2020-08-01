<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- ssi.jsp 공통페이지 --%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="net.utility.*" %>
<%@ page import="net.member.*" %>


<jsp:useBean id="dto" class="net.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="dao" class="net.member.MemberDAO"></jsp:useBean>

<%
  //ssi.jsp
  //공통으로 사용할 코드를 작성한다
  request.setCharacterEncoding("UTF-8");
%>

