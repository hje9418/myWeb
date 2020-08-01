<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<h3> P H O T O </h3>
<P><input type="button" class="btn btn-default btn-sm" value="사진올리기" onClick="location.href='pdsForm.jsp'"></P>
<%int totalRecord = dao.count(col, word); %>
전체 글 갯수 : <%=totalRecord%>
<br>
<br>
<head>
<style>


div.thumb {
	display: block;
	overflow: hidden;
	height: 200px;
	width: 200px;
}


div.thumb img {
	display: block;
	min-width: 100%;
	min-height: 100%;
	-ms-interpolation-mode: bicubic;

}



div.gallery {
    margin: 5%;
    border: 1px solid white;
    float: left;
    width: 150px;
    position: relative;
   	left: 4%;
   	right: 4%;

}


/* div.gallery:hover {
    border: 1px solid #777;
} */


div.gallery img {
    width: 100%;
    height: auto;

}

div.desc {
    padding: 15px;
    text-align: left;
}
</style>
</head>
<body>


<%
//한페이지당 출력할 글의 줄수
int recordPerPage=4;

	ArrayList<PdsDTO> list=dao.list2(col, word, nowPage, recordPerPage);
	if(list==null) {
		out.println("관련 자료 없음");
	} else {

	for(int i=0; i<list.size(); i++){
		dto=list.get(i);
%>


	<div class="gallery">
	<div class="thumb">
	<a href="pdsRead.jsp?pdsno=<%=dto.getPdsno()%>">
    <img src="../storage/<%=dto.getFilename()%>"  alt="images"
    onMouseOver="this.style.opacity='.5'; this.style.filter='alpha(opacity=50)'
    "onMouseOut="this.style.opacity='1.0'; this.style.filter='alpha(opacity=100)'">
    </a>
    </div>
    	<div class="desc">
    	<%=dto.getSubject()%>
    	<br>
  		<br>
  		<%=dto.getWname()%>
  		<br>
  		<br>
  		<%=dto.getRegdate().substring(0, 10)%>

 </div>
</div>

<%

	} //for end

%>
	<!-- 페이지 리스트 시작 -->
<table style="width:100%">
<tr>
<td>
<%
String paging=new Paging().paging3(totalRecord, nowPage, recordPerPage, col, word, "pdsList.jsp");
out.print(paging);
%>
</td>
</tr>
</table>
<!-- 페이지 리스트 끝 -->



<%

} //if end

%>


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
