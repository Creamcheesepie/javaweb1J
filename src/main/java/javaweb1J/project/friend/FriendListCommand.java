package javaweb1J.project.friend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.ProjectInterface;
import javaweb1J.project.member.MemberDAO;
import javaweb1J.project.member.MemberVO;

public class FriendListCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int idx = session.getAttribute("sMIdx")==null?0: (int)session.getAttribute("sMIdx");
		
		MemberDAO dao = new MemberDAO();
		
		
		int nowPage = request.getParameter("nowPage")==null?1:Integer.parseInt(request.getParameter("nowPage")); 
		int pageSize = request.getParameter("pageSize")==null?30:Integer.parseInt(request.getParameter("pageSize"));
		
		int trc= dao.getFriendTotalRecordCount(idx);
		
		int totalPage =(trc%pageSize)==0?(trc/pageSize) : (trc/pageSize)+1;
		int stIndexNo = (nowPage - 1 )*pageSize;
		int cSSNo = trc - stIndexNo; //현재 화면 시작 번호수
		//블록페이지 처리
		int blockSize = 5;
		int curBlock = (nowPage-1)/blockSize;
		int lastBlock = (totalPage-1)/blockSize;
		
		ArrayList<MemberVO> vos = dao.getfriendList(idx ,stIndexNo,pageSize );
		
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
