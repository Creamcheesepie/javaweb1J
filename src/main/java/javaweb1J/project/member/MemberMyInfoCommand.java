package javaweb1J.project.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.ProjectInterface;

public class MemberMyInfoCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMidCheckAllInfo(mid);
		
		String[] address = vo.getAddress().split("/");
		
		if(address[0].equals(" ")) address[0]="";
		if(address[1].equals(" ")) address[1]="";
		if(address[2].equals(" ")) address[2]="";
		if(address[3].equals(" ")) address[3]="";
		request.setAttribute("postcode", address[0]);
		request.setAttribute("roadAddress", address[1]);
		request.setAttribute("detailAddress", address[2]);
		request.setAttribute("extraAddress", address[3]);
		
		String[] rideInfo = vo.getRideInfo().split("/");
		if(rideInfo[0].equals(" ")) rideInfo[0]="";
		if(rideInfo[1].equals(" ")) rideInfo[1]="";
		if(rideInfo[2].equals(" ")) rideInfo[2]="";
		if(rideInfo[3].equals(" ")) rideInfo[3]="";
		request.setAttribute("speed", rideInfo[0]);
		request.setAttribute("duration", rideInfo[1]);
		request.setAttribute("time", rideInfo[2]);
		request.setAttribute("power", rideInfo[3]);
		
		
		request.setAttribute("vo", vo);
	}

}
