<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="BoardSystem.*"%>
<%@ page import="java.io.File"%>
<jsp:useBean id="dao" class="BoardSystem.BoardDAO">
	<!-- BoardDAO dao = new BoardDAO(); -->
	<%
	String uploadPath = request.getRealPath("/file");
	int size = 10 * 1024 * 1024;
	Board b = new Board();
	String filename = "";
	String origfilename = "";

	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

		b.setBid(Integer.parseInt(multi.getParameter("bid")));
		b.setPname(multi.getParameter("pname"));
		b.setContent(multi.getParameter("content"));
		b.setUid((String) session.getAttribute("userID"));

		Enumeration files = multi.getFileNames();

		String file = (String) files.nextElement();
		filename = multi.getFilesystemName(file);
		origfilename = multi.getOriginalFileName(file);

		
		b.setFile(origfilename);

	} catch (Exception e) {
		e.printStackTrace();
	}

	//정보를 저장해 DB처리하기 위한 Board 객체 b 생성

	dao.createPost(b);

	//작성완료되면 게시판 메인 페이지로 돌아갑니다.
	response.sendRedirect("board.jsp");
	%>
</jsp:useBean>