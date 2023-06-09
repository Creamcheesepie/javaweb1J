package javaweb1J.project.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.ProjectInterface;
import javaweb1J.project.frontPageCommand;
import javaweb1J.project.todayAttendMent.TodayAttendMentListCommand;

@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			ProjectInterface command = null;
			String viewPage = "/WEB-INF";
			
			String uri = request.getRequestURI();
			String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
			HttpSession session = request.getSession();
			int sLevel=session.getAttribute("sLevel")==null?0:(int)session.getAttribute("sLevel");
			
			if(sLevel<4) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/");
				dispatcher.forward(request, response);
			}
			else if(com.equals("/adminPage")) {//운영자 페이지 프론트 이동
				command = new adminPageCommand();
				command.execute(request, response);
				viewPage +="/admin/admin.jsp";
			}
			else if(com.equals("/memberManagement")) { //
				command = new MemberManagementCommand();
				command.execute(request, response);
				viewPage +="/admin/memberManagement.jsp";
			}
			else if(com.equals("/TAMManagement")) { //
				command = new TAMManagementCommand();
				command.execute(request, response);
				viewPage +="/admin/TAMManagement.jsp";
			}
			else if(com.equals("/boardMangement")) { //
				command = new BoardMangementCommand();
				command.execute(request, response);
				viewPage +="/admin/boardMangement.jsp";
			}
			else if(com.equals("/setUserlevelCahnge")) { //
				command = new SetUserlevelCahngeCommand();
				command.execute(request, response);
				return;
			}
			else if(com.equals("/setDeleteTAM")) { //
				command = new SetDeleteTAMCommand();
				command.execute(request, response);
				return;
			}
			else if(com.equals("/getheringManagement")) { //
				command = new GetheringMangementCommand();
				command.execute(request, response);
				viewPage +="/admin/getheringManagement.jsp";
			}
			else if(com.equals("/setGetheringDelete")) { //
				command = new setGetheringDeleteCommand();
				command.execute(request, response);
				viewPage +="/admin/getheringManagement.jsp";
			}
			else if(com.equals("/boardAdminDelete")) { //
				command = new boardAdminDeleteCommand();
				command.execute(request, response);
				return;
			}
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
	}
}
