package javaweb1J.project.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;
import javaweb1J.project.todayAttendMent.TodayAttendMentDAO;

public class SetDeleteTAMCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		TodayAttendMentDAO dao = new TodayAttendMentDAO();
		
		String res = dao.setTodayAttendMentDelete(idx);

 }

}
