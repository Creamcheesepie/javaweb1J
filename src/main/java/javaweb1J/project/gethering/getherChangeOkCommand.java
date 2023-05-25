package javaweb1J.project.gethering;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class getherChangeOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gIdx = request.getParameter("gIdx")==null?0:Integer.parseInt(request.getParameter("gIdx"));
		int mIdx = request.getParameter("mIdx")==null?0:Integer.parseInt(request.getParameter("mIdx"));
		String location = request.getParameter("location")==null?"":request.getParameter("location");
		int distance = request.getParameter("loacation")==null?0:Integer.parseInt(request.getParameter("loacation"));
		int getHeight = request.getParameter("getHeight")==null?0:Integer.parseInt(request.getParameter("getHeight"));
		String detailCourse = request.getParameter("detailCourse")==null?"":request.getParameter("detailCourse");
		
		GetheringVO vo = new GetheringVO();
		GetheringDAO dao = new GetheringDAO();
		
		vo.setIdx(gIdx);
		vo.setmIdx(mIdx);
		vo.setLocation(location);
		vo.setDistance(distance);
		vo.setGetHeight(getHeight);
		vo.setDetailCourse(detailCourse);
		
		dao.setGetheringUpdate(vo);
	}

}
