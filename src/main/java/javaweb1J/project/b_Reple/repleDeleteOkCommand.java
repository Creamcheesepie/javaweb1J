package javaweb1J.project.b_Reple;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class repleDeleteOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		B_RepleDAO dao = new B_RepleDAO();
		
		String res= dao.setRepleDelete(idx);
		
		response.getWriter().write(res);

	}

}
