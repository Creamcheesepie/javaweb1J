package javaweb1J.project.member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;
import javaweb1J.project.projectInterface;

public class SignInCheckCommand implements projectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/memberProfile/");
		int maxSize = 1024*1024*10;
		String encoding = "UTF-8";
		
		MultipartRequest mpr = new MultipartRequest(request,realPath,maxSize, encoding,new DefaultFileRenamePolicy());
		
		String mid = mpr.getParameter("mid")==null?"":mpr.getParameter("mid");
		String pwd = mpr.getParameter("pwd")==null?"":mpr.getParameter("pwd");
		String nickName = mpr.getParameter("nickName")==null?"":mpr.getParameter("nickName");
		String name = mpr.getParameter("name")==null?"":mpr.getParameter("name");
		String email = mpr.getParameter("email")==null?"":mpr.getParameter("email");
		String tel = mpr.getParameter("tel")==null?"":mpr.getParameter("tel");
		String birthday = mpr.getParameter("birthday")==null?"":mpr.getParameter("birthday");
		int age = mpr.getParameter("age")==null?0:Integer.parseInt(mpr.getParameter("age")); 
		String gender = mpr.getParameter("gender")==null?"":mpr.getParameter("gender");
		String address = mpr.getParameter("address")==null?"":mpr.getParameter("address");
		String rideInfo = mpr.getParameter("rideInfo")==null?"":mpr.getParameter("rideInfo");
		String inst = mpr.getParameter("inst")==null?"":mpr.getParameter("inst");
		String photo = mpr.getParameter("photo")==null?"":mpr.getParameter("photo");
		
		SecurityUtil security = new SecurityUtil();
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo = dao.getMidCheckAllInfo(mid);
		
		//
		if(vo.getMid()!=null) {
			request.setAttribute("msg", "이미 사용중인 아이디입니다.");
			request.setAttribute("url", request.getContextPath()+"/signInPage.sc");
			return;
		}
		
		vo = dao.getNickNameCheckAllInfo(nickName);
		
		if(vo.getNickName()!=null) {
			request.setAttribute("msg", "이미 사용중인 닉네임입니다.");
			request.setAttribute("url", request.getContextPath()+"/signInPage.sc");
			return;
		}
		
		//비밀번호 암호화
		UUID uid =UUID.randomUUID();
		String salt = uid.toString().substring(0,8);
		pwd = salt+pwd;
		pwd = security.encryptSHA256(pwd);
		
		
		
	}

}
