package javaweb1J.project.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.projectInterface;

public class memberIdCheckCommand implements projectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo =  new MemberVO();
		vo = dao.getMidCheckAllInfo(mid);
		
		String res="0";
		
		if(vo.getMid()==null) res="1";
		
		
		response.getWriter().write(res);
	}

}
