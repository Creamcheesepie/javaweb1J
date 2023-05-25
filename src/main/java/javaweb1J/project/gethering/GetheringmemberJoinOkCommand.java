package javaweb1J.project.gethering;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class GetheringmemberJoinOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gIdx = request.getParameter("gIdx")==null?0:Integer.parseInt(request.getParameter("gIdx"));
		int mIdx = request.getParameter("mIdx")==null?0:Integer.parseInt(request.getParameter("mIdx"));
		System.out.println(gIdx+""+mIdx);
		GetheringVO gvo = new GetheringVO();
		GetheringJoinMemberVO gjvo = new GetheringJoinMemberVO();
		GetheringDAO dao = new GetheringDAO();
		
		gvo = dao.getTotalgetherMember(gIdx);
		String res = "";
		gjvo = dao.getGetheringJoinMemberBygIdxmIdx(gIdx,mIdx);
		
		if(gvo.getTotalGetherMember()>gvo.getGetherJoinMember()) {
			if(gjvo.getjDate()!=null) {
				dao.setGetheringJoinMemberDeleteBygIdxmIdx(gIdx, mIdx);
				dao.setGetheringJoinMemeberUpsdate(gIdx,-1);
				res="2";
			}
			else if(gjvo.getjDate()==null) {
				dao.setGetheringJoinMemberInsertBygIdxmIdx(gIdx, mIdx);
				dao.setGetheringJoinMemeberUpsdate(gIdx,1);
				res="1";
			}
		}
		else if(gvo.getTotalGetherMember()==gvo.getGetherJoinMember() && gjvo.getjDate()!=null) {
			dao.setGetheringJoinMemberDeleteBygIdxmIdx(gIdx, mIdx);
			dao.setGetheringJoinMemeberUpsdate(gIdx,-1);
			res="2";
		}
		else {
			res = "3";
		}
		
		response.getWriter().write(res);

	}

}
