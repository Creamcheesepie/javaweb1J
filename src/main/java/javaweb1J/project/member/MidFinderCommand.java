package javaweb1J.project.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class MidFinderCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email")==null?"":request.getParameter("email");
		response.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = new MemberDAO();
		
		String mid = dao.getMidByEmail(email);
		
		String res ="";
		
		if(!mid.equals("")) {
			res = mid;
		}
		
		response.getWriter().write(res);
	}

}
