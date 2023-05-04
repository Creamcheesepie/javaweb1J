<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <!-- <a class="navbar-brand" href="http://localhost:9090/javaweb/">home</a> -->
	  <a class="navbar-brand" href="http://192.168.50.88:9090/javaweb/">home</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/GuestList.gu">guest</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/BoardList.bo">board</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">PDS</a>
	      </li>
	      <li>
			  <div class="dropdown">
			  	<button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">study1</button>
			   	<div class="dropdown-menu">
			      <a class="dropdown-item" href="${ctp}/mapping/Test1">url 매핑(디렉토리패턴)</a>
			      <a class="dropdown-item" href="${ctp}/mapping/Test5.do">url 매핑(확장자패턴1)</a>
			      <a class="dropdown-item" href="${ctp}/mapping/Test5.mi">url 매핑(확장자패턴2)</a>
			      <a class="dropdown-item" href="${ctp}/mapping/JoinSecure.re">회원가입(암호화)</a>
			      <a class="dropdown-item" href="${ctp}/mapping/LoginSecure.re">로그인(암호화)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/study/0428_database/Login.re">로그인 연습1(매핑)</a>
			      <a class="dropdown-item" href="#">Link 3</a>
			    </div>
			  </div>  
	      </li>
	      <li>
			  <div class="dropdown">
			  	<button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">study2</button>
			   	<div class="dropdown-menu">
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/study/0428_database/login.jsp">로그인 연습2</a>
			      <a class="dropdown-item" href="#">로그인 연습3</a>
			      <a class="dropdown-item" href="${ctp}/mapping/Test1">url 매핑</a>
			      <a class="dropdown-item" href="Password.st">암호화연습</a>
			    </div>
			  </div>  
	      </li>
	      <li>
			  <div class="dropdown">
			  	<button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">homeStudy</button>
			   	<div class="dropdown-menu">
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/hsLogin.hs">로그인연습(집)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/hsLogout.hs">로그아웃(집)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/hsMyInfo.hs">내정보(집)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/hsGoSigninPage.hs">회원가입(집)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/hsBoardList.pp">게시판(집)</a>
			    </div>
			  </div>  
	      </li>
	      <li>
			  <div class="dropdown">
			  	<button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">개인정보</button>
			   	<div class="dropdown-menu">
			      <a class="dropdown-item" href="#">회원정보수정</a>
			      <a class="dropdown-item" href="#">회원목록</a>
			      <a class="dropdown-item" href="#">회원탈퇴</a>
			    </div>
			  </div>  
	      </li>
	    </ul>
	  </div>
	</nav>