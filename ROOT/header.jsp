<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <title>TRAVEL RECORD</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!-- 사용자 정의 파일(CSS,JS) import -->
  <link rel="stylesheet" href="../css/mystyle.css">
  <script src="../js/myscript.js"></script>

  <style>


  @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	table, p, body {font-family: 'Jeju Gothic', sans-serif;}


  </style>

</head>
<body>

<!-- 메인 카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>					<!-- /절대경로 -->
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../member/loginForm.jsp">LOGIN</a></li>
        <li><a href="../notice/noticeList.jsp">NOTICE</a></li>
        <li><a href="../bbs/bbsList.jsp">Q&A</a></li>
        <li><a href="../bbs2/bbslist.do">BOARD</a></li>
        <li><a href="../pds/pdsList.jsp">PHOTO</a></li>


          <!-- <li><a href="./mail/mailForm.jsp">메일보내기</a></li>  -->
          <!-- <li><a href="./member2/loginform.do">로그인(MVC)</a></li>  -->
      </ul>
    </div>
  </div>
</nav>
<!-- 메인카테고리 끝 -->

<!-- Container 시작 -->
<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">
  <div class="row">
    <div class="col-sm-12">
