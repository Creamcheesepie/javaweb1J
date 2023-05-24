package javaweb1J.project.calendar;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class calender extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//오늘 날짜 처리
			Calendar calToday = Calendar.getInstance();
			int toYear = calToday.get(Calendar.YEAR);
			int toMonth = calToday.get(Calendar.MONTH);
			int toDay = calToday.get(Calendar.DATE);
			
			//화면에 보여줄 해당 '년/월'세팅
			Calendar calView = Calendar.getInstance();
			int yy = request.getParameter("yy")==null?calView.get(Calendar.YEAR): Integer.parseInt(request.getParameter("yy"));
			int mm = request.getParameter("mm")==null?calView.get(Calendar.MONTH): Integer.parseInt(request.getParameter("mm"));
			
			if(mm<0) {
				yy--;
				mm = 11;
			}
			if(mm>11) {
				yy++;
				mm=0;
			}
			
			//해당 '년/월'의 1일을 기준으로 날짜를 세팅한다.
			calView.set(yy,mm,1);
			
			//앞에서 세팅한 당 (년/월)의 1일에 해당하는 요일값을 숫자로 기억하낟.
			int startWeek = calView.get(Calendar.DAY_OF_WEEK);
			
			//해당 년/월의 마지막 일자를 가져온다
			int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH);
			
//			System.out.println("해당월의 1일의 요일 숫자로 반환 : " + startWeek);
//			System.out.println("해당월의 마지막 날짜 : " + lastDay);
			
			// 화면에 보여줄 달력의 해당 내역(년/월/요일 숫자...)를 저장소에 저장하여 넘겨준다.
			
			request.setAttribute("yy", yy);
			request.setAttribute("mm", mm);
			request.setAttribute("startWeek", startWeek);
			request.setAttribute("lastDay", lastDay);
			
			//오늘 날짜를 저장소에
			request.setAttribute("toYear", toYear);
			request.setAttribute("toMonth", toMonth);
			request.setAttribute("toDay", toDay);
		
	}
}
