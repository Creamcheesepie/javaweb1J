<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <!-- <a class="navbar-brand" href="http://localhost:9090/javaweb/">home</a> -->
	  <a class="navbar-brand" href="http://192.168.50.88:9090/javaweb/">Ride together</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/GuestList.gu">출석 한마디</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/BoardList.bo">게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/BoardList.bo">갤러리</a>
	      </li>
	      <c:if test="${sLoginOK!='ok'}">
	      <li class="nav-item">
	        <a class="nav-link" href="#">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">회원가입</a>
	      </li>
	      </c:if>
	      <c:if test="${sLoginOK=='ok'}">
	      <li class="nav-item">
	        <a class="nav-link" href="#">로그아웃</a>
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
	      </c:if>
	    </ul>
	  </div>
	</nav>