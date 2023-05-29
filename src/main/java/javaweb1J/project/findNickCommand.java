package javaweb1J.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.member.MemberDAO;
import javaweb1J.project.member.MemberVO;
import javaweb1J.project.member.memberIdCheckCommand;

public class findNickCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fNick = request.getParameter("fNick")==null?"":request.getParameter("fNick");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getNickNameCheckAllInfo(fNick);
		String res = "";
		
		if(vo.getNickName()!=null) {
			res="1";
		}
		else {
			res="0";
		}
		
		response.getWriter().write(res);

	}

}
