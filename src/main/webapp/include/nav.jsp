<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%-- <jsp:include page="/include/bs4.jsp"/> --%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<script>
	'use strict';
	
	
	function loginCheck(){
		let mid = $("#mid").val();
		let pwd = $("#pwd").val();
		
		if(mid.trim()==""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		if(pwd.trim()==""){
			alert("비밀번호를 입력해주세요.")
			return false;
		}

		
		$.ajax({
			type:"post",
			url:"${ctp}/loginCheck.cp",
			data:{mid:mid,pwd:pwd},
			success : function(res){
				if(res=="1"){
					alert("로그인에 성공하였습니다.");
					location.reload();
				}
				else{
					alert("로그인에 실패하였습니다. 아이디나 비밀번호를 확인해주세요.");
				}
			},
			error : function(){
				alert("전송오류가 발생하였습니다.");
			}
		})
	}
</script>

	  <!-- <a class="navbar-brand" href="http://localhost:9090/javaweb/">home</a> -->
	  <a class="navbar-brand" href="${ctp}/">Ride together</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/todayAttendMentList.cp">출석 한마디</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/boardList.cp">게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/getheringList.cp">모임일정</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/BoardList.bo">갤러리</a>
	      </li>
	      <c:if test="${sLoginOK!='ok'}">
	      <li class="nav-item">
	        <a class="nav-link"  data-toggle="modal" data-target="#loginModal">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/signInPage.cp">회원가입</a>
	      </li>
	      </c:if>
	      <c:if test="${sLoginOK=='ok'}">
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/memberLogout.cp">로그아웃</a>
	      </li>
	      <li class="nav-item dropdown" >
			  <div class="dropdown">
			  	<button type="button" class="btn nav-link text-light dropdown-toggle" id="navbardrop" data-toggle="dropdown">개인정보</button>
			   	<div class="dropdown-menu">
			      <a class="dropdown-item" href="${ctp}/myInfoView.cp">내 정보</a>
			      <a class="dropdown-item" href="#">친구목록</a>
			      <a class="dropdown-item" href="#">쪽지함</a>
			      <a class="dropdown-item" href="#">내 글 관리</a>
			    </div>
			  </div>  
	      </li>
	      </c:if>
	    </ul>
	  </div>
	</nav>
<c:if test="${sLoginOK!='ok'}">	
<div><!-- 모달 영역 div -->
<div class="modal fade" id="loginModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- 모달 헤더 -->
      <div class="modal-header">
        <h4 class="modal-title">로그인</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- 모달 바디 -->
      <div class="modal-body">
        아이디 <br/>
        <input type="text" name="mid" id="mid" placeholder="아이디를 입력하세요." class="form-control mt-2 mb-2"/>
        비밀번호<br/>
        <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요." class="form-control mt-2 mb-2"/>
        <div>
        <a href="${ctp}/memberIdFind.cp"><font size="2">아이디 찾기</font></a>&nbsp;/&nbsp;
        <a href="${ctp}/memberPwdFind.cp"><font size="2">비밀번호 찾기</font></a>
        </div>
      </div>

      <!-- 모달 푸터 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="loginCheck()">로그인</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
</div><!-- 모달 영역 div 끝 -->
</c:if>