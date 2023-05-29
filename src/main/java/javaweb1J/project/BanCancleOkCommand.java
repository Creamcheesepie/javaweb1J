package javaweb1J.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.member.MemberDAO;

public class BanCancleOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mIdx = request.getParameter("mIdx")==null?0:Integer.parseInt(request.getParameter("mIdx"));
		int fIdx = request.getParameter("fIdx")==null?0:Integer.parseInt(request.getParameter("fIdx"));
		
		System.out.println(mIdx);
		System.out.println(fIdx);
		MemberDAO dao = new MemberDAO();
		
		dao.setDeleteBanMember(mIdx,fIdx);
		
	}

}
