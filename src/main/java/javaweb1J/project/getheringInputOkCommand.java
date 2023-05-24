package javaweb1J.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class getheringInputOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/gpxFiles/");
		int maxSize = 1024*1024*15;
		String encoding = "UTF-8";
		
		MultipartRequest mpr = new MultipartRequest(request,realPath,maxSize,encoding,new DefaultFileRenamePolicy());
			
			
		

	}

}
