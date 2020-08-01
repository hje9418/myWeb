<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 pdsUpdateProc.jsp -->

<%
		//1) 첨부 파일 저장하기
		String saveDirectory = application.getRealPath("/storage").trim();
		int maxPostSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
													new DefaultFileRenamePolicy());
		
		
		//2) storage폴더에 저장된 파일명, 파일크기 가져오기
		String fileName = "";
		long fileSize = 0;
		File fileobj = null;
		String formInput = "";

		Enumeration formInputs = mr.getFileNames(); //<input type =file>
		while (formInputs.hasMoreElements()) {
			formInput = (String) formInputs.nextElement();
			fileName = mr.getFilesystemName(formInput); //파일명
			//파일크기
			if (fileName != null) {//파일명이 있는 경우
				fileobj = mr.getFile(formInput); //mr객체에서 파일 가져와서 담기
				if (fileobj.exists()) {//파일이 존재하는지?
					fileSize = fileobj.length();
				} //if end
			}
		} //while end
		

		//3) tb_pds테이블에 추가하기
		int pdsno = Integer.parseInt(mr.getParameter("pdsno"));

		String wname = mr.getParameter("wname").trim();
		String subject = mr.getParameter("subject").trim();
		String passwd = mr.getParameter("passwd").trim();
		String oldfilename = mr.getParameter("oldfilename").trim();
		
		
		dto.setWname(wname);
	    dto.setSubject(subject);
	    dto.setPasswd(passwd);
	    dto.setFilename(fileName);
	    dto.setFilesize(fileSize);
	    dto.setPdsno(pdsno);

	    boolean flag = dao.updateProc(dto, saveDirectory, oldfilename);
	    if(flag){
	    	out.println("<script>");
			out.println("	alert('사진이 수정되었습니다');");
			out.println("	location.href = 'pdsList.jsp';");
			out.println("</script>");
		} else {
			out.println("<p>사진수정 실패했습니다</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		} //if end

%>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
