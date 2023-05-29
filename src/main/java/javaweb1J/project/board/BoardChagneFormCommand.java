package javaweb1J.project.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.ProjectInterface;

public class BoardChagneFormCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		int nowPage = request.getParameter("nowPage")==null?1:Integer.parseInt(request.getParameter("nowPage")); 
		int pageSize = request.getParameter("pageSize")==null?5:Integer.parseInt(request.getParameter("pageSize"));
		String category = request.getParameter("category")==null?"":request.getParameter("category");
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoardArticleByIdx(idx);
		
		request.setAttribute("category", category);
		request.setAttribute("idx", idx);
		request.setAttribute("vo", vo);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("pageSize", pageSize);
	}

}
