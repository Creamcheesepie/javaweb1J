package javaweb1J.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.b_Reple.B_RepleDAO;
import javaweb1J.project.board.BoardDAO;
import javaweb1J.project.board.BoardVO;

public class boardAticleDeleteCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		B_RepleDAO repleDao = new B_RepleDAO();
		
		repleDao.setBoardRepleDelete(idx);//글에 달린 댓글 먼저 삭제

		dao.setBoardArticle(idx);

	}

}
