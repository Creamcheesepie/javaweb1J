package javaweb1J.project.todayAttendMent;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.ProjectInterface;

public class TodayArticleWriteCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String midx = String.valueOf(session.getAttribute("sMIdx")); 
		String title = request.getParameter("title")==null?"":request.getParameter("title");
		String article = request.getParameter("article")==null?"":request.getParameter("article");
		String hostIp = request.getParameter("hostIp")==null?"":request.getParameter("hostIp");
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strNow = sdf.format(now);
		
		TodayAttendMentDAO dao = new TodayAttendMentDAO();
		TodayAttendMentVO vo = new TodayAttendMentVO();
		
		boolean writed = dao.getTAMWritedTodayByMidx(midx,strNow);
		System.out.println(writed);
		int intMidx = Integer.parseInt(midx);
		vo.setmIdx(intMidx);
		vo.setArticle(article);
		vo.setTitle(title);
		vo.setHostIp(hostIp);
		
		String res = "0";
		if(!writed) {
			res="1";
			dao.setTodayAttendMentWrite(vo);
		}
		else {
			res="2";
		}
		
		response.getWriter().write(res);
		
	}

}
