
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
import javaweb1J.project.admin.adminPageCommand;
import javaweb1J.project.b_Reple.repleChangeOkCommand;
import javaweb1J.project.b_Reple.repleDeleteOkCommand;
import javaweb1J.project.b_Reple.repleWriteOkCommand;
import javaweb1J.project.board.BoardChagneFormCommand;
import javaweb1J.project.board.BoardChangeOkCommand;
import javaweb1J.project.board.BoardListCommand;
import javaweb1J.project.board.BoardReadFormCommand;
import javaweb1J.project.board.BoardWriteFormCommand;
import javaweb1J.project.board.BoardWriteOkCommand;
import javaweb1J.project.board.boardAticleDeleteCommand;
import javaweb1J.project.board.boardRecommendUpdateCommand;
import javaweb1J.project.friend.FriendListCommand;
import javaweb1J.project.gethering.GetheringInputOkCommand;
import javaweb1J.project.gethering.GetheringmemberJoinOkCommand;
import javaweb1J.project.gethering.SetGetheringPlanCommand;
import javaweb1J.project.gethering.getherChangeOkCommand;
import javaweb1J.project.gethering.getherMemberCheckListCommand;
import javaweb1J.project.gethering.getheringGPXFileDownloadCommand;
import javaweb1J.project.gethering.getheringListCommand;
import javaweb1J.project.gethering.myGetheringListCommand;
import javaweb1J.project.member.LoginCheckCommand;
import javaweb1J.project.member.memberIdCheckCommand;
import javaweb1J.project.member.memberLogoutCommand;
import javaweb1J.project.member.memberMyInfoUpdateCommand;
import javaweb1J.project.member.memberNickNameCheckCommand;
import javaweb1J.project.member.memberPwdResetOkCommand;
import javaweb1J.project.member.myInfoUpdatePwdCheckCommand;
import javaweb1J.project.message.MessageListCommand;
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
		
		if(com.equals("/frontPage")) {
			command = new frontPageCommand();
			command.execute(request, response);
			viewPage +="/frontPage/frontPage.jsp";
		}
		else if(com.equals("/signInPage")) {
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
		else if(com.equals("/boardList")) { 
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage +="/board/boardList.jsp";
		}
		else if(com.equals("/boardWriteFrom")) { //게시판 글 쓰는 폼
			command = new BoardWriteFormCommand();
			command.execute(request, response);
			viewPage +="/board/boardWrite.jsp";
		}
		else if(com.equals("/boardWriteOk")) { //게시판 글 업로드
			command = new BoardWriteOkCommand();
			command.execute(request, response);
			viewPage ="/include/message.jsp";
		}
		else if(com.equals("/boardRead")) { 
			command = new BoardReadFormCommand();
			command.execute(request, response);
			viewPage +="/board/boardRead.jsp";
		}
		else if(com.equals("/repleWriteOk")) {
			command = new repleWriteOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/boardChagneForm")) { 
			command = new BoardChagneFormCommand();
			command.execute(request, response);
			viewPage +="/board/boardChangeForm.jsp";
		}
		else if(com.equals("/boardChangeOk")) { //게시판 글 수정
			command = new BoardChangeOkCommand();
			command.execute(request, response);
			viewPage ="/include/message.jsp";
		}
		else if(com.equals("/boardAticleDelete")) {//게시판 글 삭제
			command = new boardAticleDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/repleChangeOk")) {//댓글 수정
			command = new repleChangeOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/repleDeleteOk")) {//댓글 삭제
			command = new repleDeleteOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/boardRecommendUpdate")) {//게시글 추천/취소
			command = new boardRecommendUpdateCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/getheringList")) { //모임 리스트 페이지
			command = new getheringListCommand();
			command.execute(request, response);
			viewPage +="/gethering/getheringList.jsp";
		}
		else if(com.equals("/myGetheringList")) { //내 모임 리스트 페이지
			command = new myGetheringListCommand();
			command.execute(request, response);
			viewPage +="/gethering/myGetheringList.jsp";
		}
		else if(com.equals("/getherChangeOk")) { //내 모임창에서 모임 정보 수정하기.
			command = new getherChangeOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/setGetheringPlan")) { //모임 등록페이지
			command = new SetGetheringPlanCommand();
			command.execute(request, response);
			viewPage +="/gethering/setGetheringPlanForm.jsp";
		}
		else if(com.equals("/getheringInputOk")) { //모임등록
			command = new GetheringInputOkCommand();
			command.execute(request, response);
			viewPage ="/include/message.jsp";
		}
		else if(com.equals("/getheringmemberJoinOk")) {//모임참석
			command = new GetheringmemberJoinOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/getherMemberCheckList")) {//모임참석회원 조회
			command = new getherMemberCheckListCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/getheringGPXFileDownload")) {//모임gpx파일 다운로드
			command = new getheringGPXFileDownloadCommand();
			command.execute(request, response);
			viewPage +="/gethering/myGetheringList.jsp";
		}
		else if(com.equals("/friendList")) {//친구목록 관리
			command = new FriendListCommand();
			command.execute(request, response);
			viewPage +="/friend/friendList.jsp";
		}
		else if(com.equals("/BanList")) {//차단목록 관리
			command = new BanListCommand();
			command.execute(request, response);
			viewPage +="/friend/banList.jsp";
		}
		else if(com.equals("/banCancleOk")) {//차단목록 관리
			command = new BanCancleOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/messageList")) {//내쪽지목록
			command = new MessageListCommand();
			command.execute(request, response);
			viewPage +="/message/messageList.jsp";
		}
		else if(com.equals("/findNick")) {//닉네임 검색
			command = new findNickCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/sendMessageOk")) {//닉네임 검색
			command = new sendMessageOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/sMessageList")) {//닉네임 검색
			command = new SMessageListCommand();
			command.execute(request, response);
			viewPage +="/message/sMessageList.jsp";
		}
		
		
		
				
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
