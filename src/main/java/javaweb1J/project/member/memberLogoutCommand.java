package javaweb1J.project.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.projectInterface;

public class memberLogoutCommand implements projectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		
		String nickName = (String) session.getAttribute("sNickName");
		String mid = (String) session.getAttribute("sMid");
		session.invalidate();
		request.setAttribute("msg", nickName+"("+mid+")님 로그아웃 되었습니다. 다음에 또 봐요.");
		request.setAttribute("url",request.getContextPath()+"/");
		
	}

}
