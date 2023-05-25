package javaweb1J.project.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;
import javaweb1J.project.member.MemberDAO;

public class SetUserlevelCahngeCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level")==null?0:Integer.parseInt(request.getParameter("level"));
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		MemberDAO dao = new MemberDAO();
		
		dao.setMemberLevel(idx,level);
	}

}
