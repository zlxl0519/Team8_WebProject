<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//업로드 설정
	final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	//최대 업로드 사이즈 설정
	final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	//최대 요청 사이즈 설정(최대 업로드 사이즈보다 크게 설정해야한다.)
	final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	
    //실제로 업로드한 파일이 있는지 체크 한다.
    if (!ServletFileUpload.isMultipartContent(request)) {
        //업로드한 파일이 없다면 예외 처리를 한다. ===> 파일 업로드가 되지 않았을 때 에러 처리를 여기서 한다. 상황에 맞게 응답하기
        PrintWriter writer = response.getWriter();
        writer.println("Error: Form must has enctype=multipart/form-data.");
        writer.flush();
        return;
    }

    // configures upload settings
    DiskFileItemFactory factory = new DiskFileItemFactory();
    // sets memory threshold - beyond which files are stored in disk
    factory.setSizeThreshold(MEMORY_THRESHOLD);
    // sets temporary location to store files
    factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
    ServletFileUpload upload = new ServletFileUpload(factory);
    // sets maximum size of upload file
    upload.setFileSizeMax(MAX_FILE_SIZE);
    // sets maximum size of request (include file + form data)
    upload.setSizeMax(MAX_REQUEST_SIZE);

    //WebContent 하위의 upload 폴더 절대 경로 얻어오기 - 저장될 폴더명 명시
    String uploadPath = application.getRealPath("/upload");
    //업로드 경로를 서버측 콘솔에 출력하기
    System.out.println(uploadPath);
    //전송된 파라미터의 한글 인코딩 설정 
    upload.setHeaderEncoding("utf-8");
  
    
    // 폼 전송된 title 
    String caption="";
    // 폼 전송된 content
    String content="";
    //WebContent 안에서 이미지 파일이 저장된 경로
    String imagePath="";
    //작업의 성공 여부
    boolean isSuccess = false;
    
    try {
        //폼전송된 아이템 목록 얻어오기 
        List<FileItem> formItems = upload.parseRequest(request);
        //폼전송된 아이템이 존재 한다면 
        if (formItems != null && formItems.size() > 0) {

            //반복문 돌면서 FileItem 객체를 불러온다. 
            for (FileItem item : formItems) {
            	
                //아이템이 폼 필드인지 아닌지에 따라 선택적인 처리를 한다.
                if (!item.isFormField()) {//만일 파일 필드라면...
                	//전송된 원본 파일명을 얻어온다. 
                    String orgFileName = new File(item.getName()).getName();
                	//저장할 파일명 구성 (파일명 앞에 time stamp를 출력해서 겹치지 않게한다.) 
                	String saveFileName = System.currentTimeMillis()+orgFileName;
                	//파일 시스템에 저장할 전체 경로를 구성한다.
                    String filePath = 
                    	uploadPath + File.separator + saveFileName;
                	//파일을 파일시스템에 저장한다.
                    File storeFile = new File(filePath);
                    item.write(storeFile);
                    //원본 파일명과 저장된 파일명을 FileDto 객체에 담는다.
                   	
                   	//이미지 경로
					imagePath = "/upload/"+saveFileName;                   	
                    
                }else{//폼 필드라면 
                	if(item.getFieldName().equals("caption")){ 
                		//제목 읽어오기
                		caption=item.getString("utf-8");
                	}if(item.getFieldName().equals("content")){
                		//내용 읽어오기
                		content=item.getString("utf-8");
                	}
                }//if
            }//for  
        }//if
        
        //작성자를 세션에서 얻어오기 (현재 로그인 되어있는 아이디)
        String writer = (String)session.getAttribute("id");
        
        //dto에 삽입    		
        GalleryDto dto = new GalleryDto();
        dto.setId(writer);
        dto.setCaption(caption);
        dto.setContent(content);
        dto.setImagePath(imagePath);
        
        //DB에 저장하기
        isSuccess = GalleryDao.getInstance().insert(dto);
        
    } catch (Exception ex) {
     
        System.out.println(ex.getMessage());
    }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>upload</title>
</head>
<body>
<div class="container">
	<%if(isSuccess){ %>
		<script>
			location.href="list_admin.jsp"
		</script>
	<%}else{ %>
		<p>업로드를 실패했습니다. 다시 시도해주세요<a href="upload_form.jsp">다시시도</a></p>
	<%} %>
</div>
</body>
</html>