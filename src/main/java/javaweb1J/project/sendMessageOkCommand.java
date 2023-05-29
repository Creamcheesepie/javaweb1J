package javaweb1J.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.member.MemberDAO;
import javaweb1J.project.member.MemberVO;
import javaweb1J.project.message.MessageDAO;
import javaweb1J.project.message.MessageVO;

public class sendMessageOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sNick = request.getParameter("sNick")==null?"":request.getParameter("sNick");
		String content = request.getParameter("content")==null?"": request.getParameter("content");
		String title = request.getParameter("title")==null?"":request.getParameter("title");
		int mType = request.getParameter("mType")==null?0:Integer.parseInt(request.getParameter("mType"));
		int sIdx = request.getParameter("sIdx")==null?0:Integer.parseInt(request.getParameter("sIdx"));
		
		
		MemberDAO mdao = new MemberDAO();
		
		MemberVO mvo = mdao.getNickNameCheckAllInfo(sNick);
		
		int rIdx= mvo.getIdx();
		
		MessageVO vo = new MessageVO();
		MessageDAO dao = new MessageDAO();
		
		vo.setrIdx(rIdx);
		vo.setsIdx(sIdx);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setMessageType(mType);
		
		dao.setSendMessage(vo);
		
		
				
	}

}
