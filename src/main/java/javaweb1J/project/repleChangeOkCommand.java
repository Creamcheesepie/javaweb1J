package javaweb1J.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.b_Reple.B_RepleDAO;

public class repleChangeOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		String reple = request.getParameter("reple")==null?"":request.getParameter("reple");
		
		B_RepleDAO dao = new B_RepleDAO();
		
		String res= dao.setRepleUpdate(idx,reple);
		
		response.getWriter().write(res);
	}

}
