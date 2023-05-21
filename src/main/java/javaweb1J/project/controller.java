package javaweb1J.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.member.MemberPwdResetCheckCommand;
import javaweb1J.project.member.MidFinderCommand;
import javaweb1J.project.member.SignInCheckCommand;
import javaweb1J.project.member.loginCheckCommand;
import javaweb1J.project.member.memberIdCheckCommand;
import javaweb1J.project.member.memberLogoutCommand;
import javaweb1J.project.member.memberNickNameCheckCommand;
import javaweb1J.project.member.memberPwdResetOkCommand;

@SuppressWarnings("serial")
@WebServlet("*.cp")
public class controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		projectInterface command = null;
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
			command = new loginCheckCommand();
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
		else if(com.equals("/memberIdFind")) {
			viewPage +="/memberInfo/memberMidFind.jsp";
		}
		else if(com.equals("/memberPwdFind")) {
			viewPage +="/memberInfo/memberPwdFind.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
