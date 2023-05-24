package javaweb1J.project.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class boardRecommendUpdateCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mIdx = request.getParameter("mIdx")==null?0:Integer.parseInt(request.getParameter("mIdx"));
		int bIdx = request.getParameter("bIdx")==null?0:Integer.parseInt(request.getParameter("bIdx"));
		int temp = 0;
		BoardDAO dao = new BoardDAO();
		
		BoardRecommendVO rvo = new BoardRecommendVO();
		
		rvo = dao.getBoardRecommended(mIdx, bIdx);
		String res= "0";
		
		if(rvo.getmIdx()==-1) {
			dao.setRecommendUserUpdate(mIdx, bIdx);
			dao.setBoardRecommendUpdate(bIdx,1);
			res="1";
		}
		else {
			dao.setRecommendUserDelete(mIdx, bIdx);
			dao.setBoardRecommendUpdate(bIdx,-1);
			res="2";
		}
		response.getWriter().write(res);

	}

}
