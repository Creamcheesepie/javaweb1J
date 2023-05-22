package javaweb1J.project.member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;
import javaweb1J.project.ProjectInterface;

public class memberPwdResetOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		String resetPwd = request.getParameter("resetPwd")==null?"":request.getParameter("resetPwd");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		SecurityUtil security = new SecurityUtil();
		
		vo = dao.getMidCheckAllInfo(mid);
		int idx = vo.getIdx();
		
		String oldPwd = vo.getPwd();
		String oldSalt = vo.getSalt();
		
		String _resetPwd = oldSalt+resetPwd;
		
		String res="";
		
		_resetPwd = security.encryptSHA256(_resetPwd);
		if(!oldPwd.equals(_resetPwd)) {
			UUID uid =UUID.randomUUID();
			String salt = uid.toString().substring(0,8);
			
			resetPwd = salt+resetPwd;
			resetPwd = security.encryptSHA256(resetPwd);
			
			vo = new MemberVO();
			
			vo.setPwd(resetPwd);
			vo.setSalt(salt);
			vo.setIdx(idx);
			
			res = dao.setPwdSaltReset(vo);
		}
		else {
			res="2";
		}
		
		response.getWriter().write(res);
		

	}

}
