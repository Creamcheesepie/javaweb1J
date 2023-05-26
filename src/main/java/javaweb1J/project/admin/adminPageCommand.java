package javaweb1J.project.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;
import javaweb1J.project.b_Reple.B_RepleDAO;
import javaweb1J.project.board.BoardDAO;
import javaweb1J.project.board.BoardVO;
import javaweb1J.project.gethering.GetheringDAO;
import javaweb1J.project.gethering.GetheringVO;
import javaweb1J.project.member.MemberDAO;
import javaweb1J.project.todayAttendMent.TodayAttendMentDAO;

public class adminPageCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mdao = new MemberDAO();
		BoardDAO bdao = new BoardDAO();
		B_RepleDAO rdao = new B_RepleDAO();
		TodayAttendMentDAO tdao = new TodayAttendMentDAO();
		GetheringDAO gdao = new GetheringDAO();
		
		//멤버 불러오는 영역
		ArrayList<AdminVO> anmvos = new ArrayList<>();
		anmvos = mdao.getAdminNewMemberInfo();
		AdminVO avo = new AdminVO(); // 회원 정보 불러오기용 vo
		avo = mdao.getAdminMemberInfo();
		
		//한마디 정보 불러오는 영역
		AdminVO tamavo = new AdminVO();//오늘 한마디 정보 불러오기용 vo
		tamavo = tdao.getAdminTAMcntInfo();
		ArrayList<AdminVO> vos2 =  new ArrayList<>();
		vos2 = tdao.getAdminTAMnwcntInfo();
		
		
		AdminVO bavo = new AdminVO();
		bavo = bdao.getAdminBInfoCnt();
		ArrayList<BoardVO> bavos = bdao.getBoardList(0, 5);
		
		AdminVO gavo = new AdminVO();
		gavo = gdao.getAdminGInfoCnt();
		ArrayList<GetheringVO> gavos = gdao.getAdminGetheringList();
		
		request.setAttribute("avo", avo);
		request.setAttribute("anmvos", anmvos);
		request.setAttribute("tamavo", tamavo);
		request.setAttribute("vos2", vos2);
		request.setAttribute("bavo", bavo);
		request.setAttribute("bavos", bavos);
		request.setAttribute("gavo", gavo);
		request.setAttribute("gavos", gavos);

	}

}
