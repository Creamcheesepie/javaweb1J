package javaweb1J.project.b_Reple;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class repleWriteOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bIdx = request.getParameter("bIdx")==null?0:Integer.parseInt(request.getParameter("bIdx"));
		int mIdx = request.getParameter("mIdx")==null?0:Integer.parseInt(request.getParameter("mIdx"));
		String reple = request.getParameter("reple")==null?"":request.getParameter("reple");
		
		B_RepleDAO dao = new B_RepleDAO();
		B_RepleVO vo = new B_RepleVO();
		
		vo.setmIdx(mIdx);
		vo.setbIdx(bIdx);
		vo.setReple(reple);
		
		String res = dao.setRepleWrite(vo);
		
		response.getWriter().write(res);

	}

}
