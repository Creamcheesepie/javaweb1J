package javaweb1J.project;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.board.BoardDAO;
import javaweb1J.project.board.BoardVO;
import javaweb1J.project.gethering.GetheringDAO;
import javaweb1J.project.gethering.GetheringVO;
import javaweb1J.project.member.MemberDAO;
import javaweb1J.project.member.MemberVO;

public class frontPageCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전면페이지에 뿌려줄 정보 모음집
		ArrayList<BoardVO> bvos = new ArrayList<>();
		ArrayList<BoardVO> bestbvos = new ArrayList<>();
		ArrayList<GetheringVO> gvos = new ArrayList<>();
		HttpSession session = request.getSession();
		int sMidx = session.getAttribute("sMIdx")==null?0:(int)session.getAttribute("sMIdx");
		BoardDAO bdao = new BoardDAO();
		
		GetheringVO gvo = new GetheringVO();
		GetheringDAO gdao = new GetheringDAO();
		
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
		
		//최신글, 우수글,최근 모임, 우수회원
		gvos = gdao.getGetheringList(0, 4, sMidx);
		
		bvos = bdao.getBoardList(0, 7);//최신글 5개
		bestbvos = bdao.getBoardBestList(0, 7);//조회>댓글순 5개
		
		
		request.setAttribute("bvos", bvos);
		request.setAttribute("bestbvos", bestbvos);
		request.setAttribute("gvos", gvos);
		
		
	}

}
