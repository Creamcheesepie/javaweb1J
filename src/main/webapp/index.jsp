<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Ride together</title>
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/include/cssInitialize.jsp"/>
	<style>	
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>	
	<div class="container">
		<div class="row" style="height:475px">
			<div class="col-sm-3"> <!-- 왼쪽 회원정보 표시기 // 로그인 안한 상태에선 뭐 띄움? -->
				<c:if test="${sMid==null}">
					<div></div>
				</c:if>
				<c:if test="">
					로그인 후 멤버 정보 올리기
				</c:if>
			</div>
			<div class="col-sm-9" > <!-- 오른쪽 자전거 이미지 표시기 -->
			<div id="demo" class="carousel slide" data-ride="carousel">
			  <!-- 아래 항목 표시기 -->
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			    <li data-target="#demo" data-slide-to="2"></li>
			  </ul>
			  <!-- 슬라이드 쇼 이미지 -->
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="${ctp}/images/mainSlides/resized1.jpg" alt="MTB" >
			    </div>
			    <div class="carousel-item">
			      <img src="${ctp}/images/mainSlides/resized2.jpg" alt="하이브리드" >
			    </div>
			    <div class="carousel-item">
			      <img src="${ctp}/images/mainSlides/resized3.jpg" alt="로드바이크" >
			    </div>
			  </div>
			  
			  <!-- 왼쪽 오른쪽 버튼 -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			</div>
			</div>
		</div>
		<div>최신글</div>
	</div>
	
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>