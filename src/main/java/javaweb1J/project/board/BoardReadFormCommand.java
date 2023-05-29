package javaweb1J.project.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.ProjectInterface;
import javaweb1J.project.b_Reple.B_RepleDAO;
import javaweb1J.project.b_Reple.B_RepleVO;

public class BoardReadFormCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nowPage = request.getParameter("nowPage")==null?1:Integer.parseInt(request.getParameter("nowPage")); 
		int pageSize = request.getParameter("pageSize")==null?5:Integer.parseInt(request.getParameter("pageSize")); 
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		String category = request.getParameter("category")==null?"":request.getParameter("category");
		request.setAttribute("category", category);
		
		BoardDAO dao = new BoardDAO();
		BoardVO  vo = new BoardVO();
		
		HttpSession session = request.getSession();
		
		//조회수 호그인 1회당 한번
		ArrayList<String> bIdx = (ArrayList<String>) session.getAttribute("sContentIdx");
		if(bIdx == null) {
			bIdx = new ArrayList<>();
		}
		String tempContentIdx = "board" + idx;
		
		session.setAttribute("sContentIdx", tempContentIdx);
		
		if(!bIdx.contains(tempContentIdx)) {
			dao.setViewCntUp(idx);
			bIdx.add(tempContentIdx);
		}
		
		session.setAttribute("sContentIdx", bIdx);
		
		
		
		//이 아래로는 댓글 리스트 가져오는 부분
		int r_nowPage = request.getParameter("r_nowPage")==null?1:Integer.parseInt(request.getParameter("r_nowPage")); 
		int r_pageSize = request.getParameter("r_pageSize")==null?10:Integer.parseInt(request.getParameter("r_pageSize"));
		B_RepleDAO repleDao = new B_RepleDAO();
		
		int trc = repleDao.getTotalRecordCount(idx);
		
		int totalPage = (trc%r_pageSize) == 0 ? (trc/r_pageSize) : (trc/r_pageSize)+1;
		int stIndexNo = (r_nowPage - 1 )*r_pageSize;
		int cSSNo = trc - stIndexNo; //현재 화면 시작 번호수
		//블록페이지 처리
		int blockSize = 5;
		int curBlock = (r_nowPage-1)/blockSize;
		int lastBlock = (totalPage-1)/blockSize;
		
		ArrayList<B_RepleVO> repleVos = new ArrayList<>();
		
		repleVos = repleDao.getRepleList(idx, stIndexNo, r_pageSize);
		
		request.setAttribute("r_nowPage", r_nowPage);
		request.setAttribute("r_pageSize", r_pageSize);
		request.setAttribute("r_totalPage", totalPage);
		request.setAttribute("r_cSSNo", cSSNo);
		request.setAttribute("r_blockSize", blockSize);
		request.setAttribute("r_curBlock", curBlock);
		request.setAttribute("r_lastBlock", lastBlock);
		
		
		vo = dao.getBoardArticleByIdx(idx);
		
		
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("vo", vo);
		request.setAttribute("vos", repleVos);
		
		//현재 사용자가 추천했는지 여부 가져오기
		int sMIdx = session.getAttribute("sMIdx")==null?0:(int)session.getAttribute("sMIdx");
		BoardRecommendVO rvo = new BoardRecommendVO();
		rvo = dao.getBoardRecommended(sMIdx, idx);
		if(sMIdx!=0) {
			if(rvo.getmIdx()==-1) {
				request.setAttribute("sMR", "no");

			}
			else {
				request.setAttribute("sMR", "ok");

			}
		}
		
	}

}
