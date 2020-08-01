<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>

      <c:if test="${check==1 }">
         <meta http-equiv="Refresh" content="0;url=/bbs2/bbslist.do?pageNum=${pageNum }">
      </c:if>

      <c:if test="${check==0 }">
      <br>
      <p>비밀번호를 다시 입력해주세요</p>
      <a href="javascript:history.go(-1)">[다시시도]</a>
      </c:if>

<%@ include file="../footer.jsp" %>
