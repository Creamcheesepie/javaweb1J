package javaweb1J.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.member.MemberMyInfoCommand;
import javaweb1J.project.member.MemberMyInfoUpdateFormCommand;
import javaweb1J.project.member.MemberPwdResetCheckCommand;
import javaweb1J.project.member.MidFinderCommand;
import javaweb1J.project.member.SignInCheckCommand;
import javaweb1J.project.board.BoardListCommand;
import javaweb1J.project.member.LoginCheckCommand;
import javaweb1J.project.member.memberIdCheckCommand;
import javaweb1J.project.member.memberLogoutCommand;
import javaweb1J.project.member.memberMyInfoUpdateCommand;
import javaweb1J.project.member.memberNickNameCheckCommand;
import javaweb1J.project.member.memberPwdResetOkCommand;
import javaweb1J.project.member.myInfoUpdatePwdCheckCommand;
import javaweb1J.project.todayAttendMent.TodayArticleWriteCommand;
import javaweb1J.project.todayAttendMent.TodayAttendMentChangeCommand;
import javaweb1J.project.todayAttendMent.TodayAttendMentDeleteCommand;
import javaweb1J.project.todayAttendMent.TodayAttendMentListCommand;

@SuppressWarnings("serial")
@WebServlet("*.cp")
public class Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProjectInterface command = null;
		String viewPage = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		//회원가입창 이동
		if(com.equals("/signInPage")) {
			viewPage +="/signIn/signIn.jsp";
		}
		else if(com.equals("/signInCheck")) {
			command = new SignInCheckCommand();
			command.execute(request, response);
			viewPage ="/include/message.jsp";
		}
		else if(com.equals("/memberIdCheck")) {
			command = new memberIdCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/memberNickNameCheck")) {
			command = new memberNickNameCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/loginCheck")) {
			command = new LoginCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/midFinder")) {
			command = new MidFinderCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/memberPwdResetCheck")) {
			command = new MemberPwdResetCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/memberPwdResetOk")) {
			command = new memberPwdResetOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/memberLogout")) {
			command = new memberLogoutCommand();
			command.execute(request, response);
			viewPage ="/include/message.jsp";
		}
		else if(com.equals("/memberIdFind")) { //아이디 찾기 창으로 이동
			viewPage +="/memberInfo/memberMidFind.jsp";
		}
		else if(com.equals("/memberPwdFind")) { //비밀번호 찾기 창으로 이통
			viewPage +="/memberInfo/memberPwdFind.jsp";
		}
		else if(com.equals("/myInfoView")) { //내 정보 보여주는 폼
			command = new MemberMyInfoCommand();
			command.execute(request, response);
			viewPage +="/memberInfo/memberMyInfo.jsp";
		}
		else if(com.equals("/myInfoUpdatePwdCheck")) {
			command = new myInfoUpdatePwdCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/memberMyInfoUpdateForm")) { //내 정보 수정하는 폼 에 데이터 츌력
			command = new MemberMyInfoUpdateFormCommand();
			command.execute(request, response);
			viewPage +="/memberInfo/memberMyInfoUpdateForm.jsp";
		}
		else if(com.equals("/memberMyInfoUpdate")) { //내 정보 수정하는 폼
			command = new memberMyInfoUpdateCommand();
			command.execute(request, response);
			viewPage ="/include/message.jsp";
		}
		else if(com.equals("/todayAttendMentList")) { //내 정보 수정하는 폼 에 데이터 츌력
			command = new TodayAttendMentListCommand();
			command.execute(request, response);
			viewPage +="/todayAttendMent/todayAttendMentList.jsp";
		}
		else if(com.equals("/todayArticleWrite")) {
			command = new TodayArticleWriteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/todayAttendMentChange")) {
			command = new TodayAttendMentChangeCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/todayAttendMentDelete")) {
			command = new TodayAttendMentDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/boardList")) { //내 정보 수정하는 폼 에 데이터 츌력
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage +="/board/boardList.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
