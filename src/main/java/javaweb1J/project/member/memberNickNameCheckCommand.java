package javaweb1J.project.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class memberNickNameCheckCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null?"":request.getParameter("nickName");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo =  new MemberVO();
		vo = dao.getNickNameCheckAllInfo(nickName);
		
		String res="0";
		
		if(vo.getNickName()==null) res="1";
		
		
		response.getWriter().write(res);

	}

}
