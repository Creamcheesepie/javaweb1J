package javaweb1J.project.gethering;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class getheringGPXFileDownloadCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/gpxFiles/");
		String fName = request.getParameter("file")==null?"":request.getParameter("file");
		
		File file = new File(realPath+fName);
		
		String mimeType = request.getServletContext().getMimeType(file.toString());
		
		if(mimeType==null) {
			response.setContentType("application/octet-stream");
		}
		String downLoadName="";
		
		if(request.getHeader("user-agent").indexOf("MSIE")==-1) {
			downLoadName = new String(fName.getBytes("UTF-8"),"8859_1");
		}
		else {
			downLoadName = new String(fName.getBytes("EUC-KR"),"8859_1");
		}
		
		response.setHeader("content-Disposition", "attacnment;filename="+downLoadName);
		
		FileInputStream fis = new FileInputStream(file);
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] b = new byte[2048];
		int data = 0;
		
		while((data=fis.read(b,0,b.length))!=-1) {
			sos.write(b,0,data);
		}
		sos.flush();
		
		sos.close();
		fis.close();
		
	}

}
