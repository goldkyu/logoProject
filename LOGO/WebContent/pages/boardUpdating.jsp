<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="BoardSystem.*" %>
<%@ page import="java.io.File" %>
<jsp:useBean id="dao" class="BoardSystem.BoardDAO">
<!-- BoardDAO dao = new BoardDAO(); -->
<% 

        String uploadPath = request.getRealPath("/file");
        int size = 10*1024*1024;
        String filename = "";
    	String origfilename = "";
        

        Board b = new Board();
        

        try{
            MultipartRequest multi = new MultipartRequest(request,
                                uploadPath,
                                size, 
                                "UTF-8",
                    new DefaultFileRenamePolicy());
    
            

            int pid = Integer.parseInt(multi.getParameter("pid"));
            b.setBid(Integer.parseInt(multi.getParameter("bid")));
            b.setPname(multi.getParameter("pname"));
            b.setContent(multi.getParameter("content"));
            b.setUid((String)session.getAttribute("userID"));
            b.setPid(pid);
            
            Enumeration files = multi.getFileNames();

    		String file = (String) files.nextElement();
    		filename = multi.getFilesystemName(file);
    		origfilename = multi.getOriginalFileName(file);
    		
            b.setFile(origfilename);
            
            
            dao.updatePost(b);

            response.sendRedirect("boardPost.jsp?pid="+pid);
    
            
        }catch(Exception e){
            e.printStackTrace();
        }

        
    %>
</jsp:useBean>