<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/view/color.jspf" %>

<!-- 본문 시작 bbsContent.jsp-->
<h3>글 상세보기</h3>
<br>
<br>

<table class="table table-bordered" style="width:80%; margin:auto; text-align:center">
<tr>
	<th class="active" style="text-align:center">글번호</th>
	<td style="width:250px">${article.num }</td>
	<th class="active" style="text-align:center">조회수</th>
	<td>${article.readcount }</td>
</tr>
<tr>
	<th class="active" style="text-align:center">작성자</th>
	<td colspan=3>${article.writer }</td>
</tr>
<tr>
	<th class="active" style="text-align:center">작성일</th>
	<td colspan=3>${article.reg_date }</td>
</tr>
<tr>
	<th class="active" style="text-align:center">글제목</th>
	<td colspan=3>${article.subject }</td>
</tr>
<tr>
	<th class="active" style="text-align:center">글내용</th>
	<td colspan=3>
	<%
		//치환 변수 선언 -> enter가 나오기위해
		pageContext.setAttribute("cn","Wn"); //enter
		pageContext.setAttribute("br","<br/>"); //<br>태그
	%>
		<%-- ${article.content --%>
		<!-- Wn값이 <br/>값으로 바꿔서 출력하게 함 -->
		${fn:replace(article.content, cn, '<br>') }
	</td>
</tr>
</table>
<br>
<br>

<input type="button" class="btn btn-default" value="글수정" onclick="location.href='./bbsupdateform.do?num=${article.num}&pageNum=${pageNum }'">
<input type="button" class="btn btn-default" value="글삭제" onclick="location.href='./bbsdeleteform.do?num=${article.num}&pageNum=${pageNum }'">
<!-- <input type="button" class="btn btn-default" value="답변" onclick="location.href='./bbsform.do?num=${article.num}&ref=${article.ref }&re_step=${article.re_step }&re_level=${article.re_level }'"> -->
<input type="button" class="btn btn-default" value="목록" onclick="location.href='./bbslist.do?pagenum=${pageNum }'">




<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>
