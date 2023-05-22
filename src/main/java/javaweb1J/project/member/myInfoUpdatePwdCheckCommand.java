package javaweb1J.project.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;
import javaweb1J.project.ProjectInterface;

public class myInfoUpdatePwdCheckCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null?"":request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMidCheckAllInfo(mid);
		SecurityUtil security = new SecurityUtil();
		
		String salt = vo.getSalt();
		
		pwd = salt+pwd;
		pwd = security.encryptSHA256(pwd);
		
		String res= "0";
		if(pwd.equals(vo.getPwd())) {
			res="1";
		}
		
		response.getWriter().write(res);
				
		
	}

}
