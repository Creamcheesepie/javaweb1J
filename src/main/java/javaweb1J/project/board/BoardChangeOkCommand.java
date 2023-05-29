package javaweb1J.project.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.ProjectInterface;

public class BoardChangeOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nowPage = request.getParameter("nowPage")==null?1:Integer.parseInt(request.getParameter("nowPage")); 
		int pageSize = request.getParameter("pageSize")==null?5:Integer.parseInt(request.getParameter("pageSize"));

		HttpSession session = request.getSession();
		
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		String title = request.getParameter("title")==null?"":request.getParameter("title");
		String article = request.getParameter("article")==null?"":request.getParameter("article");
		String category = request.getParameter("category")==null?"":request.getParameter("category");
		String hostIp = request.getParameter("hostIp")==null?"":request.getParameter("hostIp");
		
		
		BoardVO vo = new BoardVO();
		BoardDAO dao = new BoardDAO();
		
		vo.setTitle(title);
		vo.setArticle(article);
		vo.setCategory(category);
		vo.setHostIp(hostIp);
		vo.setIdx(idx);
		
		
		
		boolean check = dao.setBoardArticleUpdate(vo);
		

		String nickName = (String)session.getAttribute("sNickName");
		if(check) {
			request.setAttribute("msg", nickName+"님이 작성하신 글을 \""+title+"\"(으)로 수정하였습니다.");
			request.setAttribute("url",request.getContextPath()+"/boardRead.cp?idx="+idx+"&nowPage="+nowPage+"&pageSize="+pageSize);
			
		}
		else {
			request.setAttribute("msg", nickName+"님, 오류가 발생하여 글이 수정되지 않았습니다.");
			request.setAttribute("url",request.getContextPath()+"/boardWriteForm.cp?idx="+idx+"&nowPage="+nowPage+"&pageSize="+pageSize);
		}

	}

}
