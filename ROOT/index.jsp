<%@ page contentType="text/html; charset=UTF-8"%>
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
  <link rel="stylesheet" href="css/mystyle.css">
  <script src="js/myscript.js"></script>

  <style>

	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	table, p, body {font-family: 'Jeju Gothic', sans-serif;}

  .time{margin:auto 0;
  		background-color:white;
		width:100%; height:50px;
		color:black;
		font-size:16px;
		text-align:center; }
  </style>
  <script>
  function showtime() {
	  var today=new Date();

	  /* ex) 2020.03.30 (월) AM12:59:07 */
	  var str="";

	  str += today.getFullYear() + "."; //몇년

	  if (today.getMonth()+1<10) { //몇월
		  str += "0";
	  }
    str += (today.getMonth()+1) + ".";

    if (today.getDate() + 1 < 10) {
    str += "0";
  } // if
  str += (today.getDate());

	  switch(today.getDay()) { //요일
		  case 0: str += " (일) " ; break;
		  case 1: str += " (월) " ; break;
		  case 2: str += " (화) " ; break;
		  case 3: str += " (수) " ; break;
		  case 4: str += " (목) " ; break;
		  case 5: str += " (금) " ; break;
		  case 6: str += " (토) " ; break;
	  } //switch end

	  if(today.getHours()<12) {	//AM/PM
		  str += "AM ";
	  } else {
		  str += "PM ";
	  } //if end

	  if(today.getHours()>=13) { //몇시
		  str += (today.getHours() - 12 + ":");
	  }else{
		  str += (today.getHours() + ":");
	  } //if end

	  if (today.getMinutes()<10) { //몇분
		  str += "0";
	  }
    str += (today.getMinutes()) + ":";

	  if (today.getSeconds()<10) { //몇초
		  str += "0";
	  }
    str += (today.getSeconds());


	  document.getElementById('clock').innerHTML=str;

	  //1초후에 showtime함수 호출
	  timer = setTimeout(showtime, 1000);
	  } //showtime() end

	 //JavaScript 전역변수 : function이외의 지역에 선언된 변수
	 var timer;


	function killtime() {
		clearTimeout(timer); //시간해제
	} //killtime() end

  </script>

 </head>

 <body onload="showtime()" onunload="killtime()">

<!-- 메인 카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>					<!-- /절대경로 -->
      <a class="navbar-brand" href="index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="./member/loginForm.jsp">LOGIN</a></li>
      <li><a href="./notice/noticeList.jsp">NOTICE</a></li>
      <li><a href="./bbs/bbsList.jsp">Q&A</a></li>
      <li><a href="./bbs2/bbslist.do">BOARD</a></li>
      <li><a href="./pds/pdsList.jsp">PHOTO</a></li>


        <!-- <li><a href="./mail/mailForm.jsp">메일보내기</a></li>  -->
        <!-- <li><a href="./member2/loginform.do">로그인(MVC)</a></li>  -->
      </ul>
    </div>
  </div>
</nav>
<!-- 메인카테고리 끝 -->

<!-- Container 시작 -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin"><i>TRAVEL RECORD</i></h3>
  <img src="./images/DSC_1083.jpg" class="img-responsive margin" style="display:inline" alt="image" width="650" height="650">
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">
  <div class="row">
    <div class="col-sm-12">
    	<!-- 디지털 시계 -->
    	<div id="clock" class="time"></div>

    </div>
  </div>
</div>
<!-- Container 끝 -->

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  copyright &copy; 2020 MyWeb
</footer>

</body>
</html>
