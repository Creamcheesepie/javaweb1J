package javaweb1J.project.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class BoardWriteFormCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nowPage = request.getParameter("nowPage")==null?1:Integer.parseInt(request.getParameter("nowPage")); 
		int pageSize = request.getParameter("pageSize")==null?5:Integer.parseInt(request.getParameter("pageSize")); 
		
		
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("pageSize", pageSize);
	}

}
