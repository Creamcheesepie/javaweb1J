package javaweb1J.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.member.SignInCheckCommand;

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
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
