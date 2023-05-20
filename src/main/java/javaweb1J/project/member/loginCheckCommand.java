package javaweb1J.project.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;
import javaweb1J.project.projectInterface;

public class loginCheckCommand implements projectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null?"":request.getParameter("pwd");
		
		String res = "0";
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		SecurityUtil security = new SecurityUtil();
		HttpSession session = request.getSession();
		
		vo = dao.getMidCheckAllInfo(mid);
		
		if(vo.getMid()!=null) {
			String salt = vo.getSalt();
			pwd = salt+pwd;
			pwd = security.encryptSHA256(pwd);
			
			if(pwd.equals(vo.getPwd())) { //비밀번호가 같으니 로그인 성공함.
				int idx = vo.getIdx();
				
				
				//최종접속시간 세팅, 오늘 방문횟수 업, 총 방문횟수 업 
				Date now = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String strNow = sdf.format(now);
				
				//최초 로그인시 
				if(!vo.getLastVisit().substring(0,10).equals(strNow)) {
					dao.setInitializationTodayCnt(idx);
					vo.setTodayCnt(0);
					vo.setTotCnt(vo.getTotCnt()+1);
				}
				dao.setTodayLoginUpdate(idx);
				//데이터 베이스에는 횟수를 갱신하였으나, 불러온 vo 안의 값은 갱신되지 않았기 때문에 +1을 하여 갱신해줌.
				vo.setTodayCnt(vo.getTodayCnt()+1);
				
				int level = vo.getLevel();
				String grade = "";
				switch (level) {
					case 0: 
						grade="준회원"; //회원 가입 신청
						break;
					case 1: 
						grade="정회원"; // 출석 5일 이상 // 출석 한마디 5회 이상
						break;
					case 2: 
						grade="중급회원"; //출석 45일 이상, 출석 한마디 30개 이상, 게시글 15개 이상 작성시 
						break;
					case 3: 
						grade="모임장"; // 출석 90일 이상, 출석 한마디 70개 이상, 게시글 50개 이상일때, 운영자/관리자의 승인 요구
						break;
					case 4: 
						grade="운영자"; //관리자가 선임
						break;
					case 5: 
						grade="관리자"; //DB를 통해서만 지정가능.
						break;
						
					default:
						break;
				}
				
				session.setAttribute("sMid", mid);
				session.setAttribute("sNickName", vo.getNickName());
				session.setAttribute("sLevel", vo.getLevel());
				session.setAttribute("sMemberGrade", grade);
				session.setAttribute("sTotCnt", vo.getTotCnt());
				session.setAttribute("sTodayCnt", vo.getTodayCnt());
				session.setAttribute("sLastVisit", vo.getLastVisit());
				session.setAttribute("sLoginOK", "ok");
				res="1";
			}//로그인 성공 끝
		}//아이디 체크 끝
		
		
		response.getWriter().write(res);
		
		

	}

}
