<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작 bbsList.jsp -->

<h3> Q & A </h3>
<p><input type="button" class="btn btn-default btn-sm" value="글쓰기" onClick="location.href='bbsForm.jsp'"></p>
<table class="table">
<thead>
	<tr class="active" style="height: 50px;">
		<th style="vertical-align:middle; ">번호</th>
		<th style="vertical-align:middle; ">제목</th>
		<th style="text-align:center; vertical-align:middle">조회수</th>
		<th style="text-align:center; vertical-align:middle">작성자</th>
		<th style="text-align:center; vertical-align:middle">작성일</th>
	</tr>
</thead>
<tbody>
<%
//한페이지당 출력할 글의 줄수
int recordPerPage=10;
ArrayList<BbsDTO> list=dao.list3(col, word, nowPage, recordPerPage);
if(list==null){
	out.println("<tr>");
	out.println("	<td colspan='5'>");
	out.println("		<strong>관련자료 없음</strong>");
	out.println("	</td>");
	out.println("</tr>");
} else {

	//오늘날짜 문자열"2020-04-13" 만들기
	String today=Utility.getDate();


	for(int i=0; i<list.size(); i++){
		dto=list.get(i);
%>

	<tr>
		<td style="text-align:Left"><%=dto.getBbsno()%></td>
		<td style="text-align:Left">
<%
		//답변 이미지 출력
		for (int n=1; n<=dto.getIndent(); n++) {
			out.println("<img src='../images/reply.gif'>");
		} //for end

%>
		<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a>
<%
		//조회수가 10이상이면 hot이미지 출력
		if (dto.getReadcnt()>=10) {
			out.println("<img src='../images/hot.gif'>");
		} //if end

		//오늘 작성한 글제목 뒤에 new이미지 출력
		//regdt에서 "년월일"만 자르기
		//-> 2020-04-13
		String regdt=dto.getRegdt().substring(0, 10);
		if (regdt.equals(today)) {
			out.println("<img src='../images/new.gif'>");
		} //if end

%>
		</td>
		<td><%=dto.getReadcnt()%></td>
		<td><%=dto.getWname()%></td>
		<td><%=dto.getRegdt().substring(0,10)%></td>
	</tr>
<%
	} //for end

	//글갯수
		int totalRecord=dao.count(col, word);
			out.println("<tr>");
			out.println("	<td colspan='5' syle='text-align: center;'>");
			out.println("	글갯수 : <strong>");
			out.println(totalRecord);
			out.println("		   </strong>");
			out.println("	</td>");
			out.println("</tr>");

%>
	<!-- 페이지 리스트 시작 -->
	<tr>
		<td colspan="5">
<%
	String paging=new Paging().paging3(totalRecord, nowPage, recordPerPage, col, word, "bbsList.jsp");
	out.print(paging);
%>
		</td>
	</tr>
	<!-- 페이지 리스트 끝 -->

	<!-- 검색시작 -->
	<tr>
		<td colspan="5"
			style="text-align: center; height: 50px">
		<form action="bbsList.jsp" onsubmit="return searchCheck(this)" >
		<input type="radio" name="col" value="wname">작성자
		<input type="radio" name="col" value="subject" checked>제목
		<input type="radio" name="col" value="content">내용
		<input type="radio" name="col" value="subject_content">제목+내용
		<input type="text"  name="word">
		<input type="submit" value="검색">


		</form>
	</td>
	</tr>

<%

} //if end

%>
</tbody>
</table>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
