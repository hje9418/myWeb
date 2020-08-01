<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- ssi.jsp 공통페이지 --%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="net.utility.*" %>
<%@ page import="net.pds.*" %>

<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>


<jsp:useBean id="dto" class="net.pds.PdsDTO"></jsp:useBean>
<jsp:useBean id="dao" class="net.pds.PdsDAO"></jsp:useBean>

<%
  //ssi.jsp
  //공통으로 사용할 코드를 작성한다
  request.setCharacterEncoding("UTF-8");
%>

<%//검색-------------------------------------
String col=request.getParameter("col");
String word=request.getParameter("word");

//String값이 null이면 공백문자열 반환 (Utilty -> checkNull(String) 활용)
col = Utility.checkNull(col);
word = Utility.checkNull(word);


//현재페이지---------------------------------------------------------
int nowPage=1;
if (request.getParameter("nowPage")!=null) {
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
} //if end
%>
