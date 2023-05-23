package javaweb1J.project.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaweb1J.project.ProjectInterface;

public class BoardWriteOkCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int nowPage = request.getParameter("nowPage")==null?1:Integer.parseInt(request.getParameter("nowPage")); 
		int pageSize = request.getParameter("pageSize")==null?5:Integer.parseInt(request.getParameter("pageSize")); 
		
		
		int idx = (int) session.getAttribute("sMIdx");
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
		vo.setmIdx(idx);
		
		
		
		boolean check = dao.setBoardArticle(vo);
		
		BoardVO nvo = new BoardVO();;
		
		nvo = dao.getBoardArticleBy_Title_And_mIdx(title,idx);
		
		String nickName = (String)session.getAttribute("sNickName");
		if(check) {
			request.setAttribute("msg", nickName+"님 "+title+"글을 작성하였습니다.");
			request.setAttribute("url",request.getContextPath()+"/boardRead.cp?idx="+nvo.getIdx()+"&nowPage="+nowPage+"&pageSize="+pageSize);
			
		}
		else {
			request.setAttribute("msg", nickName+"님, 오류가 발생하여 글이 작성되지 않았습니다.");
			request.setAttribute("url",request.getContextPath()+"/boardWriteFrom.cp?nowPage="+nowPage+"&pageSize="+pageSize);
		}
		
			
		
	}

}
