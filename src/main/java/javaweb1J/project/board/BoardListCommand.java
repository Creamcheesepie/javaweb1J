package javaweb1J.project.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale.Category;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.ProjectInterface;

public class BoardListCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao =  new BoardDAO();
		
		int nowPage = request.getParameter("nowPage")==null?1:Integer.parseInt(request.getParameter("nowPage"));
		int pageSize = request.getParameter("pageSize")==null?10:Integer.parseInt(request.getParameter("pageSize"));
		int trc = dao.getTotalRecordCount();
		String category = request.getParameter("category")==null?"":request.getParameter("category");
		
		int totalPage =(trc%pageSize)==0?(trc/pageSize) : (trc/pageSize)+1;
		int stIndexNo = (nowPage - 1 )*pageSize;
		int cSSNo = trc - stIndexNo; //현재 화면 시작 번호수
		//블록페이지 처리
		int blockSize = 5;
		int curBlock = (nowPage-1)/blockSize;
		int lastBlock = (totalPage-1)/blockSize;
		
		ArrayList<BoardVO> vos = new ArrayList<>();
		
		if(!category.equals("")) {
			vos = dao.getBoardCatrgoryList(category,stIndexNo, pageSize);
			
		}
		else {
			vos = dao.getBoardList(stIndexNo, pageSize);
		}

		request.setAttribute("category", category);
		request.setAttribute("vos", vos);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("cSSNo", cSSNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);		
		
	}

}
