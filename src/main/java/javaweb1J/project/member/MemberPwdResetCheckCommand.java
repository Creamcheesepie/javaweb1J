package javaweb1J.project.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.projectInterface;

public class MemberPwdResetCheckCommand implements projectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email =  request.getParameter("email")==null?"":request.getParameter("email");
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		System.out.println(email+mid);
		
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		String midByEmail = dao.getMidByEmail(email);
		vo = dao.getMidCheckAllInfo(mid);
		String emailByMid = vo.getEmail();
		
		String res="";
		
		if(email.equals(emailByMid) && mid.equals(midByEmail) ) {
			res="1";
		}
		
		response.getWriter().write(res);

	}

}
