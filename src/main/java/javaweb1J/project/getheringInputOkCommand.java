package javaweb1J.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javaweb1J.project.gethering.GetheringDAO;
import javaweb1J.project.gethering.GetheringVO;

public class getheringInputOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/gpxFiles/");
		int maxSize = 1024*1024*15;
		String encoding = "UTF-8";
		
		MultipartRequest mpr = new MultipartRequest(request,realPath,maxSize,encoding,new DefaultFileRenamePolicy());
			
		int mIdx = mpr.getParameter("mIdx")==null?0:Integer.parseInt(mpr.getParameter("mIdx"));
		String title = mpr.getParameter("title")==null?"":mpr.getParameter("title");
		String content = mpr.getParameter("content")==null?"":mpr.getParameter("content");
		String getheringType = mpr.getParameter("getheringType")==null?"":mpr.getParameter("getheringType");
		String location = mpr.getParameter("location")==null?"":mpr.getParameter("location");
		int totalGetherMember = mpr.getParameter("totalGetherMember")==null?0:Integer.parseInt(mpr.getParameter("totalGetherMember"));
		int distance = mpr.getParameter("distance")==null?0:Integer.parseInt(mpr.getParameter("distance"));
		int getHeight = mpr.getParameter("getHeight")==null?0:Integer.parseInt(mpr.getParameter("getHeight"));
		String getherTime = mpr.getParameter("getherTime")==null?"":mpr.getParameter("getherTime");
		String hostIp = mpr.getParameter("hostIp")==null?"":mpr.getParameter("hostIp");
		String detailCourse = mpr.getParameter("detailCourse")==null?"":mpr.getParameter("detailCourse");
		String gpxFileName = mpr.getFilesystemName("gpxFileName")==null?"":mpr.getFilesystemName("gpxFileName");
		
		GetheringDAO dao = new GetheringDAO();
		GetheringVO vo = new GetheringVO();
		
		vo.setmIdx(mIdx);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setGetHeight(getHeight);
		vo.setGetheringType(getheringType);
		vo.setLocation(location);
		vo.setTotalGetherMember(totalGetherMember);
		vo.setDistance(distance);
		vo.setGetherTime(getherTime);
		vo.setHostIp(hostIp);
		vo.setDetailCourse(detailCourse);
		vo.setGpxFileName(gpxFileName);
		
		boolean check = dao.setGetheringInsert(vo);
		
		if(check) {
			request.setAttribute("msg", "모임글을 작성하였습니다.");
			request.setAttribute("url",request.getContextPath()+"/getheringList.cp");
		}
		else {
			request.setAttribute("msg", "죄송합니다. 오류가 발생하여 회원 정보가 수정되지 않았습니다.동일한 오류가 반복되면 운영자 또는 관리자에게 문의 주시기 바랍니다.");
			request.setAttribute("url",request.getContextPath()+"/setGetheringPlan.cp");
		}

	}

}
