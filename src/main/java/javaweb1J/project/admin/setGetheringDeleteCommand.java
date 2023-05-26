package javaweb1J.project.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;
import javaweb1J.project.gethering.GetheringDAO;
import javaweb1J.project.gethering.GetheringJoinMemberVO;
import javaweb1J.project.gethering.GetheringVO;

public class setGetheringDeleteCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		String file = request.getParameter("file")==null?"":request.getParameter("file");
		
		GetheringDAO dao = new GetheringDAO();
		
		String realPath = request.getServletContext().getRealPath("/images/gpxFiles/");
		
		new File(realPath+file).delete();
		dao.setGetheringMemberDelete(idx);
		dao.setGetheringDelete(idx);
		

	}

}
