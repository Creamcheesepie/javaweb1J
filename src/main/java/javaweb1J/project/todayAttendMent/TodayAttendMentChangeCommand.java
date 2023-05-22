package javaweb1J.project.todayAttendMent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaweb1J.project.ProjectInterface;

public class TodayAttendMentChangeCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int midx = request.getParameter("midx")==null?0:Integer.parseInt(request.getParameter("midx"));
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		String title = request.getParameter("title")==null?"":request.getParameter("title");
		String article = request.getParameter("article")==null?"":request.getParameter("article");
		
		TodayAttendMentDAO dao = new TodayAttendMentDAO();
		TodayAttendMentVO vo = new TodayAttendMentVO();
		
		vo.setIdx(idx);
		vo.setTitle(title);
		vo.setArticle(article);
		vo.setmIdx(midx);
		
		boolean check= dao.setTodayAttendMentChange(vo);
		String res="0";
		if(check) res="1";
		
		response.getWriter().write(res);
		
		
	}

}
